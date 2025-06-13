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
