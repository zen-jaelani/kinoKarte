const helperWrapper = require("../../helpers/wrapper");
const bookingModel = require("./bookingModel");

module.exports = {
  //
  createBooking: async (request, response) => {
    try {
      const {
        scheduleId,
        dateBooking,
        timeBooking,
        paymentMethod,
        totalPayment,
        seat,
      } = request.body;

      const bookingData = {
        scheduleId,
        dateBooking,
        timeBooking,
        totalTicket: seat.length,
        totalPayment,
        paymentMethod,
        statusPayment: "Success!",
      };

      const createBooking = await bookingModel.createBooking(bookingData);

      seat.map(async (x) => {
        const bookingSeatData = {
          bookingId: createBooking.id,
          seat: x,
        };
        await bookingModel.createBookingSeat(bookingSeatData);
      });

      return helperWrapper.response(response, 200, "create booking data!", {
        id: createBooking.id,
        ...bookingData,
        seat,
      });
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getBookingById: async (request, response) => {
    try {
      const { id } = request.params;
      console.log(id);
      const getBooking = await bookingModel.getBookingById(id);
      const getSeat = await bookingModel.getSeatById(id);

      const result = { ...getBooking[0], ...getSeat[0] };
      console.log(result);
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
      scheduleId = scheduleId || "1";
      dateBooking = dateBooking || "2022-01-01";
      timeBooking = timeBooking || "09:00";

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
