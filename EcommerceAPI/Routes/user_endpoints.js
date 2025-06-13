const express = require('express');
const router = express.Router();
const userController = require('../controllers/user_controller');
const { verifyToken, isAdmin } = require('../Middlewares/verify_token');

// Obtener todos los usuarios (admin)
router.get('/', verifyToken, isAdmin, userController.getAllUsers);

// Obtener un solo usuario por ID (admin o self)
router.get('/:id', verifyToken, userController.getUserById);

// Crear nuevo usuario (solo admin, registro público se hace desde /auth/register)
router.post('/', verifyToken, isAdmin, userController.createUser);

// Actualizar usuario (admin o self)
router.put('/:id', verifyToken, userController.updateUser);

// Eliminar usuario (solo admin)
router.delete('/:id', verifyToken, isAdmin, userController.deleteUser);

module.exports = router;
