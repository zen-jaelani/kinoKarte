const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: "localhost",
  user: "debian-sys-maint",
  password: "jEQ825ugCpaAWOZe",
  database: "kinokarte",
});

connection.connect((error) => {
  if (error) {
    throw error;
  }
  console.log("you're now connected db mysql...");
});

module.exports = connection;
