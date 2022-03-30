const cloudinary = require("cloudinary").v2;

cloudinary.config({
  cloud_name: "qxtlp",
  api_key: "723754997757988",
  api_secret: "ydNwJdqbE5mtstrrir4WfZE47vE",
});

module.exports = cloudinary;
