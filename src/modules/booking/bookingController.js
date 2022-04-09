const { v4: uuidv4 } = require("uuid");
const helperWrapper = require("../../helpers/wrapper");
const bookingModel = require("./bookingModel");
const helperMidtrans = require("../../helpers/midtrans");

module.exports = {
  //
  createBooking: async (request, response) => {
    try {
      const {
        userId,
        scheduleId,
        dateBooking,
        timeBooking,
        paymentMethod,
        totalPayment,
        seat,
      } = request.body;

      const bookingData = {
        id: uuidv4(),
        userId,
        scheduleId,
        dateBooking,
        timeBooking,
        totalTicket: seat.length,
        totalPayment,
        paymentMethod,
      };

      const createBooking = await bookingModel.createBooking(bookingData);
      console.log(createBooking);
      seat.map(async (x) => {
        const bookingSeatData = {
          bookingId: createBooking.id,
          seat: x,
        };
        await bookingModel.createBookingSeat(bookingSeatData);
      });
      const setDataMidtrans = {
        id: createBooking.id,
        totalPayment,
      };
      const resultMidtrans = await helperMidtrans.post(setDataMidtrans);

      return helperWrapper.response(response, 200, "create booking data!", {
        id: createBooking.id,
        ...bookingData,
        seat,
        redirectUrl: resultMidtrans.redirect_url,
      });
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  postMidtransNotification: async (request, response) => {
    try {
      console.log(request.body);
      const result = await helperMidtrans.notif(request.body);
      const orderId = result.order_id;
      const transactionStatus = result.transaction_status;
      const fraudStatus = result.fraud_status;

      console.log(
        `Transaction notification received. Order ID: ${orderId}. Transaction status: ${transactionStatus}. Fraud status: ${fraudStatus}`
      );
    } catch (error) {
      //   console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getBookingByUserId: async (request, response) => {
    try {
      const { id } = request.params;
      const getBooking = await bookingModel.getBookingById("b.userId", id);

      const result = await Promise.all(
        getBooking.map(async (value) => {
          const seat = await bookingModel.getSeatById(value.id);
          const temp = { ...value, ...seat[0] };
          return temp;
        })
      );

      return helperWrapper.response(
        response,
        200,
        "Booking by user id data!",
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
      const getBooking = await bookingModel.getBookingById("b.id", id);
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
      return helperWrapper.response(
        response,
        400,
        "Update Status failed! try checking the id",
        null
      );
    }
  },
};
