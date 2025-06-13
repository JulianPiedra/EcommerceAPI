// services/authService.js
import api from '../lib/api';

export function register({ username, email, password }) {
  return api.post('/auth/register', { username, email, password });
}

export async function login({ email, password }) {
  return api.post('/auth/login', { email, password });;
}
