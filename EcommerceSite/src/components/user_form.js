'use client';

import React, { useEffect, useState } from 'react';
import '@/styles/form.css';
import { createUser, getUserById, updateUser } from '@/services/user_service';
import { showToast } from '@/utils/show_message';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/context/context';

export default function UserForm({ userId }) {
  const router = useRouter();
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    role: '',
    password: '',
    confirmPassword: '',
  });
  const [loading, setLoading] = useState(false);
  const { user, isLoggedIn, authLoading } = useAuth();

  useEffect(() => {
    if (authLoading) return; // Espera a que termine de cargar

    if (!isLoggedIn || user?.role !== 'admin') {
      showToast('error', 'No tienes permisos para acceder a esta página');
      router.replace('/');
    }
  }, [authLoading, isLoggedIn, user]);
  // Si hay userId, cargar datos para editar
  useEffect(() => {
    if (!userId) return;

    setLoading(true);
    getUserById(userId)
      .then(user => {
        setFormData({
          username: user.username || '',
          email: user.email || '',
          role: user.role || '',
          password: '', // Por seguridad, no cargamos contraseña
          confirmPassword: '',
        });
      })
      .catch(() => showToast('error', 'Error cargando datos del usuario'))
      .finally(() => setLoading(false));
  }, [userId]);

  const handleChange = (e) => {
    setFormData(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    if (formData.password !== formData.confirmPassword) {
      showToast('error', 'Las contraseñas no coinciden');
      return;
    }

    const submitData = { ...formData };
    delete submitData.confirmPassword;

    try {
      setLoading(true);
      if (userId) {
        // Editar usuario (no enviar password si está vacío)
        if (!submitData.password) delete submitData.password;
        await updateUser(userId, submitData);
        showToast('success', 'Usuario actualizado exitosamente');
      } else {
        // Crear usuario
        await createUser(submitData);
        showToast('success', 'Usuario creado exitosamente');
      }
      router.push('/cruds');
    } catch (error) {
      showToast('error', error.message);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <p>Cargando...</p>;

  return (
    <>
      <h1 className='title'>{userId ? 'Editar Usuario' : 'Crear Usuario'}</h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="username">Nombre del Usuario:</label>
          <input
            type="text"
            id="username"
            name="username"
            required
            value={formData.username}
            onChange={handleChange}
          />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            required
            value={formData.email}
            onChange={handleChange}
          />
        </div>
        <div className="form-group">
          <label htmlFor="role">Rol:</label>
          <select
            id="role"
            name="role"
            required
            value={formData.role}
            onChange={handleChange}
          >
            <option value="">Seleccione un rol</option>
            <option value="admin">Admin</option>
            <option value="user">Usuario</option>
          </select>
        </div>
        <div className="form-group">
          <label htmlFor="password">
            Contraseña:
            {userId && ' (Opcional)'}
          </label>
          <input
            type="password"
            id="password"
            name="password"
            value={formData.password}
            onChange={handleChange}
            placeholder={userId ? 'Nueva contraseña' : ''}
            {...(!userId && { required: true })}
          />
        </div>
        <div className="form-group">
          <label htmlFor="confirmPassword">Confirmar Contraseña:</label>
          <input
            type="password"
            id="confirmPassword"
            name="confirmPassword"
            value={formData.confirmPassword}
            onChange={handleChange}
            placeholder={userId ? 'Confirmar nueva contraseña' : ''}
            {...(!userId && { required: true })}
          />
        </div>

        <button type="submit" disabled={loading}>
          {userId ? 'Actualizar Usuario' : 'Guardar Usuario'}
        </button>
      </form>
    </>
  );
}
