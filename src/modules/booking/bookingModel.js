const connection = require("../../config/mysql");

module.exports = {
  createBooking: (data) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        "INSERT INTO booking SET ?",
        data,
        (error, result) => {
          if (!error) {
            const newResult = { id: result.insertId, ...data };
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
      console.log(query.sql);
    }),
  createBookingSeat: (data) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        "INSERT INTO bookingSeat SET ?",
        data,
        (error, result) => {
          if (!error) {
            const newResult = { id: result.insertId, ...data };
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
      console.log(query.sql);
    }),
  getBookingById: (id) =>
    new Promise((resolve, reject) => {
      const q = connection.query(
        `
      SELECT b.*, bs.seat, m.name,m.category
      FROM booking b
      JOIN bookingSeat bs on b.id = bs.bookingId
      JOIN schedule sc on b.scheduleId = sc.id
      JOIN movie m on sc.movieId = m.id 
      WHERE b.id = ?`,
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error));
          }
        }
      );
      console.log(q.sql);
    }),
};
