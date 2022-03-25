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
        "Schedule data!",
        result
        // pageInfo
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },
};
