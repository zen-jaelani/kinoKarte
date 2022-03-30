const multer = require("multer");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const cloudinary = require("../config/cloudinary");

// JIKA menyimpan data di cloudinary
const storage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "kinoKarte/movie",
  },
});

// jika menyimpan data di dalam project backend
// const storage = multer.diskStorage({
//   destination(req, file, cb) {
//     cb(null, "public/uploads/movie");
//   },
//   filename(req, file, cb) {
//     cb(null, new Date().toISOString().replace(/:/g, "-") + file.originalname);
//   },
// });

// image itu nama field bukan jenis file
const upload = multer({ storage }).single("image");
module.exports = upload;
