const connection = require("../../config/mysql");

module.exports = {
  //
  register: (data) =>
    new Promise((resolve, reject) => {
      const q = connection.query(
        "INSERT INTO user SET ?",
        data,
        (error, result) => {
          if (!error) {
            const newResult = { id: result.insertId, ...data };
            // delete newResult.password;
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
      console.log(q.sql);
    }),

  checkEmail: (data) =>
    new Promise((resolve, reject) => {
      const q = connection.query(
        `SELECT COUNT(email) AS total 
        FROM user
        WHERE email = ? `,
        data,
        (error, result) => {
          if (!error) {
            resolve(result[0].total);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
      console.log(q.sql);
    }),

  getUserByEmail: (email) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM user WHERE email = ?",
        email,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
};
