
const { Product } = require('../Database/Models');

// Obtener todos los productos
exports.getAllProducts = async (req, res) => {
  try {
    const products = await Product.findAll();

    const result = products.map(p => {
      const product = p.toJSON();
      if (product.image) {
        product.image = `data:image/jpeg;base64,${product.image.toString('base64')}`;
      }
      return product;
    });

    res.json(result);
  } catch (error) {
    res.status(500).json({ message: 'Error obteniendo productos', error: error.message });
  }
};

//  Obtener producto por ID
exports.getProductById = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.id);

    if (!product) return res.status(404).json({ message: 'Producto no encontrado' });

    const result = product.toJSON();
    if (result.image) {
      result.image = `data:image/jpeg;base64,${result.image.toString('base64')}`;
    }

    res.json(result);
  } catch (error) {
    res.status(500).json({ message: 'Error obteniendo producto', error: error.message });
  }
};

//  Crear producto (solo admin)
exports.createProduct = async (req, res) => {
  try {
    const { name, description, price, category } = req.body;
    const image = req.file ? req.file.buffer : null;

    if (!name || !price || image === undefined) {
      return res.status(400).json({ message: 'Nombre, precio e imagen son requeridos' });
    }

    const newProduct = await Product.create({
      name,
      description,
      price,
      category,
      image: image ? `data:image/jpeg;base64,${image.toString('base64')}` : null
    });

    res.status(201).json(newProduct);
  } catch (error) {
    res.status(500).json({ message: 'Error creando producto', error: error.message });
  }
};

// Editar producto (solo admin)
exports.updateProduct = async (req, res) => {
  try {
    const { name, description, price, category } = req.body;
    const image = req.file ? req.file.buffer : null;

    const product = await Product.findByPk(req.params.id);
    if (!product) return res.status(404).json({ message: 'Producto no encontrado' });

    product.name = name ?? product.name;
    product.description = description ?? product.description;
    product.price = price ?? product.price;
    product.category = category ?? product.category;
    if (image) product.image = image;

    await product.save();

    if (product.image) {
      product.image = `data:image/jpeg;base64,${product.image.toString('base64')}`;
    }
    res.json({ message: 'Producto actualizado con éxito', product });
  } catch (error) {
    res.status(500).json({ message: 'Error actualizando producto', error: error.message });
  }
};

// Eliminar producto (solo admin)
exports.deleteProduct = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.id);
    if (!product) return res.status(404).json({ message: 'Producto no encontrado' });

    await product.destroy();

    res.json({ message: 'Producto eliminado con éxito' });
  } catch (error) {
    res.status(500).json({ message: 'Error eliminando producto', error: error.message });
  }
};
