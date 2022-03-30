const express = require("express");

const Router = express.Router();

const authController = require("./authController");
const middlewareUpload = require("../../middleware/uploadUser");

Router.post("/register", middlewareUpload, authController.register);
Router.post("/login", authController.login);

module.exports = Router;
