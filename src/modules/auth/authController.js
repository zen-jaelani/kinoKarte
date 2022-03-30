const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");

module.exports = {
  register: async (request, response) => {
    try {
      const { firstName, lastName, image, noTelp, email, password } =
        request.body;

      // 1. encryp password
      const hash = bcrypt.hashSync(password, 10);

      // 2. cek email yang sudah ada
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
        image,
        noTelp,
        email,
        password: hash,
        role: "user",
        status: "notActive",
      };
      console.log(setData);
      const result = await authModel.register(setData);

      return helperWrapper.response(response, 200, "account created!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },
  login: async (request, response) => {
    try {
      const { email, password } = request.body;

      //   const setData = { email, password };
      const checkUser = await authModel.getUserByEmail(email);

      // 1. jika email tidak ditemukan
      if (checkUser.lenght < 1) {
        return helperWrapper.response(
          response,
          400,
          "Email not registered",
          null
        );
      }

      // 2. jika password di cocokkan salah
      console.log(password, checkUser[0].password);
      if (bcrypt.compareSync(password, checkUser[0].password)) {
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
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },
};