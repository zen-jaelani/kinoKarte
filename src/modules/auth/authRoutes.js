const express = require("express");

const Router = express.Router();

const authController = require("./authController");
const render = require("../../helpers/renderHtml");

Router.post("/register", authController.register);
Router.post("/login", authController.login);
Router.get("/verify/:token", authController.verifyEmail);
Router.post("/refresh", authController.refresh);
Router.post("/logout", authController.logout);

module.exports = Router;
