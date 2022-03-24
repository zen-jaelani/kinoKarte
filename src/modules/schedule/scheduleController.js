const helperWrapper = require("../../helpers/wrapper");
const scheduleModel = require("./scheduleModel");

module.exports = {
  //
  getAllSchedule: async (request, response) => {
    try {
      let { page, limit } = request.query;
      page = +page;
      limit = +limit;
      const offset = page * limit - limit;
      const totalData = await scheduleModel.getCountSchedule();
      const totalPage = Math.ceil(totalData / limit);
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
      };
      const result = await scheduleModel.getAllSchedule(limit, offset);

      return helperWrapper.response(
        response,
        200,
        "Schedule data!",
        result,
        pageInfo
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getScheduleById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await scheduleModel.getScheduleById(id);

      return helperWrapper.response(response, 200, "Schedule data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  createSchedule: async (request, response) => {
    try {
      const { movieId, premiere, price, location, dateStart, dateEnd, time } =
        request.body;

      const setData = {
        movieId,
        premiere,
        price,
        location,
        dateStart,
        dateEnd,
        time,
        createdAt: new Date(Date.now()),
      };
      const result = await scheduleModel.createSchedule(setData);

      return helperWrapper.response(
        response,
        200,
        "create Schedule data!",
        result
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  updateSchedule: async (request, response) => {
    try {
      const { id } = request.params;
      const { movieId, premiere, price, location, dateStart, dateEnd, time } =
        request.body;
      const setData = {
        movieId,
        premiere,
        price,
        location,
        dateStart,
        dateEnd,
        time,
        updatedAt: new Date(Date.now()),
      };
      const result = await scheduleModel.updateSchedule(id, setData);

      return helperWrapper.response(
        response,
        200,
        "update Schedule data!",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  deleteSchedule: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await scheduleModel.deleteMovie(id);

      return helperWrapper.response(
        response,
        200,
        "delete Schedule data!",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },
};
