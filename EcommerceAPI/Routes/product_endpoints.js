const express = require('express');
const router = express.Router();
const upload = require('../Middlewares/upload'); 
const productController = require('../Controllers/product_controller');
const { verifyToken, isAdmin } = require('../Middlewares/verify_token');

// Pública
router.get('/', productController.getAllProducts);
router.get('/:id', productController.getProductById);

// Solo admin
router.post('/', verifyToken, isAdmin, upload.single('image'), productController.createProduct);
router.put('/:id', verifyToken, isAdmin,upload.single('image'), productController.updateProduct);
router.delete('/:id', verifyToken, isAdmin, productController.deleteProduct);

module.exports = router;
