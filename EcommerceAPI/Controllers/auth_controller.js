const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User } = require('../Database/Models');

const JWT_SECRET = process.env.JWT_SECRET;

exports.register = async (req, res) => {
  try {
    const { username, email, password, role } = req.body;

    if (!username || !email || !password) {
      return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    const existing = await User.findOne({ where: { email } });
    if (existing) {
      return res.status(400).json({ message: 'Este email ya está registrado' });
    }

    const hash = await bcrypt.hash(password, 10);
    const user = await User.create({ username, email, password: hash, role });

    res.status(201).json({ message: 'Usuario registrado con éxito' });
  } catch (err) {
    res.status(500).json({ message: 'Error del servidor', error: err.message });
  }
};

exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;
    console.log('Login attempt with email:', email);
    const user = await User.findOne({ where: { email } });
    if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });
    console.log('User found:', user.username);
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(401).json({ message: 'Credenciales inválidas' });
    console.log('Password match for user:', user.username);
    const token = jwt.sign(
      { id: user.id, role: user.role },
      JWT_SECRET,
      { expiresIn: '1d' }
    );
    console.log('JWT token generated for user:', user.username);
    res.status(200).json({
      message: 'Login exitoso',
      token,
      user: { id: user.id, username: user.username, role: user.role }
    });
  } catch (err) {
    res.status(500).json({ message: 'Error del servidor', error: err.message });
  }
};
