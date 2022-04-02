const express = require("express");

const Router = express.Router();

const bookingController = require("./bookingController");
const middlewareAuth = require("../../middleware/auth");

Router.post(
  "/",
  middlewareAuth.authentication,
  middlewareAuth.isActive,
  bookingController.createBooking
);
Router.get("/id/:id", bookingController.getBookingById);
Router.get("/user/:id", bookingController.getBookingByUserId);
Router.get("/seat", bookingController.getSeatBooking);
Router.get("/dashboard", bookingController.getDashboard);
Router.patch("/ticket/:id", bookingController.updateStatus);

module.exports = Router;
