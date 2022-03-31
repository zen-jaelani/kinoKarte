const redis = require("../../config/redis");
const helperWrapper = require("../../helpers/wrapper");
const movieModel = require("./movieModel");

module.exports = {
  //
  getAllMovie: async (request, response) => {
    try {
      let { page, limit, sort, searchName, searchRelease } = request.query;

      page = +page || 1;
      limit = +limit || 5;
      sort = sort || "id ASC";
      searchName = searchName || "";
      searchRelease = searchRelease || "";

      const offset = page * limit - limit;
      const totalData = await movieModel.getCountMovie(
        searchName,
        searchRelease
      );
      const totalPage = Math.ceil(totalData / limit);

      const pageInfo = {
        page,
        totalPage,
        limit,
        movieShown: totalData,
        allMovie: await movieModel.getCountMovie("", ""),
      };

      const result = await movieModel.getAllMovie(
        limit,
        offset,
        sort,
        searchName,
        searchRelease
      );

      redis.setEx(
        `getMovie:${JSON.stringify(request.query)}`,
        3600,
        JSON.stringify({ result, pageInfo })
      );

      return helperWrapper.response(
        response,
        200,
        "Success get all data !",
        result,
        pageInfo
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  getMovieById: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await movieModel.getMovieById(id);

      if (result.length <= 0) {
        return helperWrapper.response(
          response,
          "404",
          `Data by id ${id} not found`
        );
      }

      // simpan data ke redis as cache
      redis.setEx(`getMovie:${id}`, 3600, JSON.stringify(result));

      return helperWrapper.response(
        response,
        200,
        "Success get data !",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  createMovie: async (request, response) => {
    console.log(request.file);
    try {
      const {
        name,
        category,
        director,
        casts,
        releaseDate,
        duration,
        synopsis,
      } = request.body;

      const setData = {
        name,
        category,
        director,
        casts,
        releaseDate,
        duration,
        synopsis,
        createdAt: new Date(Date.now()),
      };

      const result = await movieModel.createMovie(setData);
      return helperWrapper.response(
        response,
        200,
        "Success create data !",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "Bad Request", null);
    }
  },

  updateMovie: async (request, response) => {
    try {
      const { id } = request.params;
      const {
        name,
        category,
        director,
        casts,
        releaseDate,
        duration,
        synopsis,
      } = request.body;
      const setData = {
        name,
        category,
        director,
        casts,
        releaseDate,
        duration,
        synopsis,
        updatedAt: new Date(Date.now()),
      };

      Object.keys(setData).forEach((value) => {
        if (!setData[value]) {
          delete setData[value];
        }
      });

      const result = await movieModel.updateMovie(id, setData);
      return helperWrapper.response(
        response,
        200,
        "Success update data !",
        result
      );
    } catch (error) {
      return helperWrapper.response(response, 400, "update gagal", null);
    }
  },

  deleteMovie: async (request, response) => {
    try {
      const { id } = request.params;
      const result = await movieModel.deleteMovie(id);
      return helperWrapper.response(response, 200, "data deleted !", result);
    } catch (error) {
      return helperWrapper.response(response, 400, `data id not found`, null);
    }
  },
};
