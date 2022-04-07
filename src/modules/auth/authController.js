/* eslint-disable no-param-reassign */
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const fs = require("fs");
const path = require("path");
const redis = require("../../config/redis");
const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");
const { sendMail } = require("../../helpers/mail");
const render = require("../../helpers/renderHtml");

require("dotenv").config();

module.exports = {
  register: async (request, response) => {
    try {
      const { firstName, lastName, noTelp, email, password } = request.body;

      // cek email yang sudah ada
      const chekEmailExists = await authModel.checkEmail(email);
      if (chekEmailExists > 0) {
        return helperWrapper.response(
          response,
          400,
          "email already exists",
          null
        );
      }

      const setData = {
        firstName,
        lastName,
        noTelp,
        email,
        password: bcrypt.hashSync(password, 10),
        role: "user",
        status: "notActive",
      };
      const result = await authModel.register(setData);

      const { id } = result;
      console.log(id);
      const token = jwt.sign({ id }, process.env.TOKENSECRET, {
        expiresIn: "6h",
      });
      const setMail = {
        to: email,
        subject: "Email Verification",
        template: "verification.html",
        link: `http://localhost:3003/auth/verify/${token}`,
      };

      sendMail(setMail);
      return helperWrapper.response(response, 200, "account created!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "register failed", null);
    }
  },

  login: async (request, response) => {
    try {
      const { email, password } = request.body;

      const checkUser = await authModel.getUserByEmail(email);
      if (!checkUser[0]) {
        return helperWrapper.response(
          response,
          400,
          "Email not registered",
          null
        );
      }

      if (!bcrypt.compareSync(password, checkUser[0].password)) {
        return helperWrapper.response(response, 400, "Wrong Password", null);
      }

      const payload = {
        id: checkUser[0].id,
        role: checkUser[0].role,
        status: checkUser[0].status,
      };
      delete payload.password;

      const token = jwt.sign({ ...payload }, process.env.TOKENSECRET, {
        expiresIn: "1h",
      });

      const refreshToken = jwt.sign({ ...payload }, process.env.TOKENSECRET, {
        expiresIn: "1d",
      });

      return helperWrapper.response(response, 200, "success login!", {
        id: payload.id,
        token,
        refreshToken,
      });
    } catch (error) {
      return helperWrapper.response(response, 400, "login failed", null);
    }
  },

  verifyEmail: async (request, response) => {
    try {
      const { token } = request.params;
      const data = jwt.decode(
        token.trim(),
        process.env.TOKENSECRET,
        // prettier-ignore
        (error) => { //eslint-disable-line
          if (error) {
            return helperWrapper.response(response, 400, "token invalid", null);
          }
        }
      );

      const result = await authModel.verifyEmail(data.id);

      response.sendFile(
        path.resolve(`${__dirname}/../../templates/email/response.html`)
      );

      // return helperWrapper.response(response, 200, "account verified!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "failed verify email", null);
    }
  },

  refresh: async (request, response) => {
    try {
      const { refreshToken } = request.body;

      const checkToken = await redis.get(`refreshToken:${refreshToken}`);
      if (checkToken) {
        return helperWrapper.response(
          response,
          403,
          "Your refresh token cannot be use",
          null
        );
      }
      console.log(checkToken);

      jwt.verify(
        refreshToken,
        process.env.TOKENSECRET,
        async (error, result) => {
          console.log(result);
          delete result.iat;
          delete result.exp;
          const token = jwt.sign(result, process.env.TOKENSECRET, {
            expiresIn: "1h",
          });

          const newRefreshToken = jwt.sign(result, process.env.TOKENSECRET, {
            expiresIn: "24h",
          });

          await redis.setEx(
            `refreshToken:${refreshToken}`,
            3600 * 48,
            refreshToken
          );
          return helperWrapper.response(response, 200, "token refresh!", {
            id: result.id,
            token,
            newRefreshToken,
          });
        }
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "failed verify email", null);
    }
  },

  logout: async (request, response) => {
    try {
      let token = request.headers.authorization;
      const { refreshToken } = request.body;
      [, token] = token.split(" ");
      redis.setEx(`accessToken:${token}`, 3600 * 24, token);
      redis.setEx(`refreshToken:${refreshToken}`, 3600 * 24, token);

      return helperWrapper.response(response, 200, "logout success", null);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "logout failed", null);
    }
  },
};
