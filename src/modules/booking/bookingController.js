const helperWrapper = require("../../helpers/wrapper");
const bookingModel = require("./bookingModel");

module.exports = {
  //
  createBooking: async (request, response) => {
    try {
      const data = request.body;

      const bookingData = {
        scheduleId: data.scheduleId,
        dateBooking: data.dateBooking,
        timeBooking: data.timeBooking,
        totalTicket: data.seat.length,
        totalPayment: data.totalPayment,
        paymentMethod: data.paymentMethod,
        statusPayment: "Success!",
      };

      const createBooking = await bookingModel.createBooking(bookingData);

      const bookingSeatData = {
        bookingId: createBooking.id,
        seat: data.seat,
      };

      const createBookingSeat = await bookingModel.createBookingSeat(
        bookingSeatData
      );

      const result = [createBooking, createBookingSeat];

      return helperWrapper.response(
        response,
        200,
        "create booking data!",
        result
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getBookingById: async (request, response) => {
    try {
      const { id } = request.params;
      console.log(id);
      const result = await bookingModel.getBookingById(id);
      return helperWrapper.response(
        response,
        200,
        "Booking by id data!",
        result
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getSeatBooking: async (request, response) => {
    try {
      let { scheduleId, dateBooking, timeBooking } = request.query;
      scheduleId = scheduleId || "";
      dateBooking = dateBooking || "";
      timeBooking = timeBooking || "";

      const result = await bookingModel.getSeatBooking(
        scheduleId,
        dateBooking,
        timeBooking
      );

      return helperWrapper.response(
        response,
        200,
        "Seat Booking data!",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getDashboard: async (request, response) => {
    try {
      let { scheduleId, movieId, location } = request.query;
      scheduleId = scheduleId || "";
      movieId = movieId || "";
      location = location || "";

      const result = await bookingModel.getDashboard(
        scheduleId,
        movieId,
        location
      );

      return helperWrapper.response(response, 200, "Dashboard data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  updateStatus: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await bookingModel.updateStatus(id);

      return helperWrapper.response(response, 200, "Dashboard data!", result);
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },
};
