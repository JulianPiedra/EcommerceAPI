const express = require('express');
const app = express();
const cors = require('cors');
const { sequelize } = require('./Database/Models');

require('dotenv').config();

app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/auth', require('./Routes/auth_endpoints'));
app.use('/api/users', require('./Routes/user_endpoints'));
app.use('/api/products', require('./Routes/product_endpoints'));
app.use('/api/cart', require('./Routes/cart_endpoints'));

sequelize.authenticate()
  .then(() => console.log('Conectado a la base de datos'))
  .catch(err => console.error('DB error:', err));

app.listen(3001, () => console.log(`Servidor corriendo en el puerto 3001`));
