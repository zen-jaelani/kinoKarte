const connection = require("../../config/mysql");

module.exports = {
  //
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

  getSeatBooking: (scheduleId, dateBooking, timeBooking) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        `
      SELECT bs.seat
      FROM bookingSeat bs
      JOIN booking b on b.id = bs.bookingId
      WHERE b.scheduleId LIKE ?
      AND b.dateBooking LIKE ?
      AND b.timeBooking LIKE ?`,
        [`%${scheduleId}%`, `%${dateBooking}%`, `%${timeBooking}%`],
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error));
          }
        }
      );
      console.log(query.sql);
    }),

  getDashboard: (scheduleId, movieId, location) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        `
      SELECT b.createdAt Month,totalPayment Total
      FROM schedule s
      JOIN booking b on b.scheduleId = s.id
      WHERE b.scheduleId LIKE ?
      AND s.movieId LIKE ?
      AND s.location LIKE ?`,
        [`%${scheduleId}%`, `%${movieId}%`, `%${location}%`],
        (error, result) => {
          if (!error) {
            const newResult = result.map((value) => ({
              Month: value.Month.toISOString().split("-")[1],
              Total: value.Total,
            }));
            console.log(newResult);

            resolve(newResult);
          } else {
            reject(new Error(error));
          }
        }
      );
      //   console.log(query.sql);
    }),

  updateStatus: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE booking SET statusUsed = 'notActive' WHERE id = ?",
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(error);
          }
        }
      );
    }),
};
