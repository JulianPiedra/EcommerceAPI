// services/userService.js
import api from '../lib/api';

export const getAllUsers = () => api.get('/users');
export const getUserById = (id) => api.get(`/users/${id}`);
export const createUser = (user) => api.post('/users', user);
export const updateUser = (id, updates) => api.put(`/users/${id}`, updates);
export const deleteUser = (id) => api.delete(`/users/${id}`);
