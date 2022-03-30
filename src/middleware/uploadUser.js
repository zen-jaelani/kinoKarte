const multer = require("multer");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const cloudinary = require("../config/cloudinary");

const storage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "kinoKarte/user",
  },
});

const upload = multer({ storage }).single("image");
module.exports = upload;
