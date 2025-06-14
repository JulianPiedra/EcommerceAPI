const bcrypt = require('bcrypt');

require('dotenv').config();
const {
  sequelize,
  User,
  Product,
  Cart,
} = require('../Models');

async function seedDatabase() {
  try {
    await sequelize.sync({ force: true }); // Elimina y recrea las tablas
    // Crear usuarios
    const users = await User.bulkCreate([
      {
        username: 'admin',
        email: 'admin@example.com',
        password: await bcrypt.hash("123456", 10),
        role: 'admin'
      },
      {
        username: 'johndoe',
        email: 'john@example.com',
        password: await bcrypt.hash("123456", 10),
        role: 'user'
      }
    ]);

    // Crear productos
    const products = await Product.bulkCreate([
      {
        name: 'Laptop Gamer',
        description: 'Laptop de alto rendimiento para gaming.',
        price: 1200.00,
      },
      {
        name: 'Mouse Inalámbrico',
        description: 'Mouse ergonómico inalámbrico.',
        price: 25.99,
      },
      {
        name: 'Smartphone Galaxy S22',
        description: 'Teléfono inteligente con cámara de alta calidad.',
        price: 999.99,
      },
      {
        name: 'Teclado Mecánico RGB',
        description: 'Teclado gamer con retroiluminación RGB.',
        price: 75.00,
      },
      {
        name: 'Monitor Dell 27"',
        description: 'Monitor Full HD con pantalla IPS.',
        price: 179.90,
      },
      {
        name: 'Audífonos Bluetooth',
        description: 'Audífonos inalámbricos con cancelación de ruido.',
        price: 59.99,
      },
      {
        name: 'Cargador USB-C',
        description: 'Cargador rápido compatible con múltiples dispositivos.',
        price: 19.95,
      },
      {
        name: 'Disco Duro Externo 1TB',
        description: 'Almacenamiento portátil y seguro.',
        price: 89.00,
      },
      {
        name: 'Impresora Multifuncional',
        description: 'Impresora, escáner y copiadora en un solo dispositivo.',
        price: 145.99,
      },
      {
        name: 'Tablet Lenovo 10"',
        description: 'Tablet Android ideal para entretenimiento.',
        price: 199.00,
      }
    ]);


    await Cart.bulkCreate([
      {
        user_id: users[1].id,
        product_id: products[0].id,
        quantity: 1
      },
      {
        user_id: users[1].id,
        product_id: products[1].id,
        quantity: 2
      }
    ]);
    console.log('Base de datos seedeada correctamente.');
  } catch (error) {
    console.error('Error al seedear la base de datos', error);
  } finally {
    await sequelize.close();
  }
}

seedDatabase();
