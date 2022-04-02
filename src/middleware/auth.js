/* eslint-disable consistent-return */
const jwt = require("jsonwebtoken");
const helperWrapper = require("../helpers/wrapper");

module.exports = {
  authentication: (request, response, next) => {
    let token = request.headers.authorization;

    if (!token) {
      return helperWrapper.response(response, 400, "Please login first", null);
    }

    [, token] = token.split(" ");

    jwt.verify(token, "RAHASIA", (error, result) => {
      if (error) {
        return helperWrapper.response(
          response,
          400,
          "Please login first",
          null
        );
      }
      // data user login dari token yang sudah di decode
      request.decodeToken = result;
      next();
    });
  },

  isAdmin: (request, response, next) => {
    // proses untuk mengecek role apakah login role admin

    if (request.decodeToken.role !== "admin") {
      return helperWrapper.response(
        response,
        400,
        "Please login with admin account",
        null
      );
    }
    next();
  },

  isActive: (request, response, next) => {
    // proses untuk mengecek role apakah login role admin

    if (request.decodeToken.status !== "active") {
      return helperWrapper.response(
        response,
        400,
        "Please activate your email first",
        null
      );
    }
    next();
  },
};
