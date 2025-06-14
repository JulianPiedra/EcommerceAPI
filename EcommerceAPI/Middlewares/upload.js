const multer = require('multer');
const storage = multer.memoryStorage(); // Almacenamos la imagen en memoria
const upload = multer({ storage });

module.exports = upload;
