const express = require('express');
const router = express.Router();
const cartController = require('../Controllers/cart_controller');
const { verifyToken } = require('../Middlewares/verify_token');

router.use(verifyToken);

// Agregar producto al carrito
router.post('/', cartController.addToCart);

// Obtener el carrito del usuario
router.get('/', cartController.getUserCart);

// Eliminar un producto del carrito
router.delete('/:id', cartController.removeFromCart);

// Vaciar todo el carrito del usuario
router.delete('/', cartController.clearCart);

module.exports = router;
