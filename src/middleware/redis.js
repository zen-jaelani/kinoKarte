const redis = require("../config/redis");
const helperWrapper = require("../helpers/wrapper");

module.exports = {
  // eslint-disable-next-line consistent-return
  getMovieByIdRedis: async (request, response, next) => {
    try {
      const { id } = request.params;
      let result = await redis.get(`getMovie:${id}`);
      if (result !== null) {
        // console.log("data ada di dalam redis");
        result = JSON.parse(result);
        return helperWrapper.response(
          response,
          200,
          "Success get data !",
          result
        );
      }
      // console.log("data tidak ada di dalam redis");
      next();
    } catch (error) {
      return helperWrapper.response(response, 400, error.message, null);
    }
  },
};
