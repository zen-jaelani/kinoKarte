const path = require("path");

const render = (request, response) => {
  response.sendFile(
    path.resolve(`${__dirname}/../templates/email/response.html`),
    (err) => {
      if (err) {
        console.log(err);
      }
    }
  );
};

module.exports = render;
