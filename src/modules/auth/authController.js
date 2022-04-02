const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");
require("dotenv").config();

function sendEmail(email) {
  const transporter = nodemailer.createTransport({
    host: "smtp.zoho.jp",
    secure: true,
    port: 465,
    auth: {
      user: process.env.AUTHMAIL,
      pass: process.env.AUTHPASS,
    },
  });

  const token = jwt.sign({ email }, "SECRET", { expiresIn: "2h" });
  const link = `http://localhost:3003/auth/verify/${token.trim()}`;
  console.log(link);

  const mailOption = {
    from: process.env.AUTHMAIL,
    to: email,
    subject: "email verification",
    // prettier-ignore
    html: "Copy link below to postman verify your email: <br> "+link, //eslint-disable-line
  };

  transporter.sendMail(mailOption, (error) => {
    if (error) {
      console.log(error);
    } else {
      console.log("email send success");
    }
  });
}

module.exports = {
  register: async (request, response) => {
    try {
      const { firstName, lastName, noTelp, email, password } = request.body;

      // cek email yang sudah ada
      console.log(request.body);
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
      console.log(setData);
      const result = await authModel.register(setData);

      sendEmail(email);

      return helperWrapper.response(response, 200, "account created!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "register failed", null);
    }
  },

  login: async (request, response) => {
    try {
      const { email, password } = request.body;

      //   const setData = { email, password };
      const checkUser = await authModel.getUserByEmail(email);

      if (checkUser.lenght < 1) {
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

      const payload = checkUser[0];
      delete payload.password;

      const token = jwt.sign({ ...payload }, "RAHASIA", { expiresIn: "24h" });

      return helperWrapper.response(response, 200, "success login!", {
        id: payload.id,
        token,
      });
    } catch (error) {
      return helperWrapper.response(response, 400, "login failed", null);
    }
  },

  verifyEmail: async (request, response) => {
    try {
      const { token } = request.params;
      // eslint-disable-next-line consistent-return
      const data = jwt.decode(token.trim(), "SECRET", (error) => {
        if (error) {
          return helperWrapper.response(response, 400, "token invalid", null);
        }
      });

      const result = await authModel.verifyEmail(data.email);

      return helperWrapper.response(response, 200, "account verified!", result);
    } catch (error) {
      return helperWrapper.response(response, 400, "failed verify email", null);
    }
  },
};
