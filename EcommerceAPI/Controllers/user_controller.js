const { User } = require('../Database/Models');
const bcrypt = require('bcrypt');

exports.getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    if (users.length === 0) {
      return res.status(404).json({ message: 'No hay usuarios registrados' });
    }
    res.json(users);
  } catch (error) {
    res.status(500).json({ message: 'Error obteniendo usuarios', error: error.message });
  }
};

exports.getUserById = async (req, res) => {
  try {
    const userId = parseInt(req.params.id);

    // Admin or owner only
    if (req.user.role !== 'admin' && req.user.id !== userId) {
      return res.status(403).json({ message: 'Acceso denegado' });
    }

    const user = await User.findByPk(userId, {
      attributes: ['id', 'username', 'email', 'role', 'created_at']
    });

    if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });

    res.json(user);
  } catch (error) {
    res.status(500).json({ message: 'Error obteniendo usuario', error: error.message });
  }
};

exports.createUser = async (req, res) => {
  try {
    const { username, email, password, role } = req.body;
    console.log(req.body);
    if (!username || !email || !password) {
      return res.status(400).json({ message: 'Faltan campos' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await User.create({
      username,
      email,
      password: hashedPassword,
      role
    });

    res.status(201).json({ message: 'Usuario creado', user: { id: newUser.id, username, email, role } });
  } catch (error) {
    res.status(500).json({ message: 'Error creando usuario', error: error.message });
  }
};

exports.updateUser = async (req, res) => {
  try {
    const userId = parseInt(req.params.id);
    const { username, email, password, role } = req.body;

    // Admin or owner
    if (req.user.role !== 'admin' && req.user.id !== userId) {
      return res.status(403).json({ message: 'Acceso denegado' });
    }

    const user = await User.findByPk(userId);
    if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });

    if (username) user.username = username;
    if (email) user.email = email;
    if (password) user.password = await bcrypt.hash(password, 10);
    if (role && req.user.role === 'admin') user.role = role; // solo admin puede cambiar roles

    await user.save();
    res.json({ message: 'Usuario actualizado', user: { id: user.id, username: user.username, email: user.email, role: user.role } });
  } catch (error) {
    res.status(500).json({ message: 'Error actualizando usuario', error: error.message });
  }
};

exports.deleteUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });

    await user.destroy();
    res.json({ message: 'Usuario eliminado' });
  } catch (error) {
    res.status(500).json({ message: 'Error eliminando usuario', error: error.message });
  }
};
