const express = require("express");

const Router = express.Router();

const bookingController = require("./bookingController");

Router.post("/", bookingController.createBooking);
// Router.get("/", bookingController);
// Router.get("/", bookingController);
// Router.get("/", bookingController);
// Router.patch("/", bookingController);

module.exports = Router;
