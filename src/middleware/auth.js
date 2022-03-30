const jwt = require("jsonwebtoken");
const helperWrapper = require("../helpers/wrapper");

module.exports = {
  authentication: (request, response, next) => {
    let token = request.headers.authorization;

    if (!token) {
      return helperWrapper.response(response, 400, "Please login first", null);
    }

    [, token] = token.split(" ");

    console.log(token);

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
    console.log(request.decodeToken);
  },
};
