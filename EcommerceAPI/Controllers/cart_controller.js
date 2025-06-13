const { Cart, Product } = require('../Database/Models');

// Agregar producto al carrito
exports.addToCart = async (req, res) => {
  try {
    const { product_id, quantity } = req.body;
    const user_id = req.user.id;

    if (!product_id || !quantity || quantity < 1) {
      return res.status(400).json({ message: 'Producto y cantidad válidos requeridos' });
    }

    const existing = await Cart.findOne({ where: { user_id, product_id } });

    if (existing) {
      existing.quantity += quantity;
      await existing.save();
      return res.json({ message: 'Cantidad actualizada', cart: existing });
    }

    const cartItem = await Cart.create({ user_id, product_id, quantity });
    res.status(201).json({ message: 'Agregado al carrito', cart: cartItem });
  } catch (error) {
    res.status(500).json({ message: 'Error al agregar al carrito', error: error.message });
  }
};

// Obtener el carrito del usuario
exports.getUserCart = async (req, res) => {
  try {
    const user_id = req.user.id;

    const cartItems = await Cart.findAll({
      where: { user_id },
      include: [{ model: Product }]
    });
    if (cartItems.length === 0) {
      return res.status(404).json({ message: 'Carrito vacío' });
    }
    const formatted = cartItems.map(item => {
      const p = item.Product;
      return {
        id: item.id,
        product_id: item.product_id,
        name: p.name,
        price: p.price,
        quantity: item.quantity,
        total: item.quantity * p.price,
        image: p.image ? `data:image/jpeg;base64,${p.image.toString('base64')}` : null
      };
    });

    res.json(formatted);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener carrito', error: error.message });
  }
};

// Eliminar un producto del carrito
exports.removeFromCart = async (req, res) => {
  try {
    const cartItem = await Cart.findByPk(req.params.id);

    if (!cartItem) return res.status(404).json({ message: 'Elemento no encontrado' });
    if (cartItem.user_id !== req.user.id) return res.status(403).json({ message: 'No autorizado' });

    await cartItem.destroy();
    res.json({ message: 'Producto eliminado del carrito' });
  } catch (error) {
    res.status(500).json({ message: 'Error al eliminar', error: error.message });
  }
};

// Vaciar todo el carrito
exports.clearCart = async (req, res) => {
  try {
    await Cart.destroy({ where: { user_id: req.user.id } });
    res.json({ message: 'Carrito vaciado' });
  } catch (error) {
    res.status(500).json({ message: 'Error al vaciar carrito', error: error.message });
  }
};
