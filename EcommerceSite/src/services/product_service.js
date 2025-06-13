// services/productService.js
import api from '../lib/api';

// Para subir imagen en BLOB necesitas FormData
export function createProduct(formData) {
  // body será un FormData, así que le quitamos JSON header
  return api.post('/products', formData);
}

export function updateProduct(id, formData) {
  return api.put(`/products/${id}`, formData);
}

export const getAllProducts = (filters = {}) => api.get('/products', filters);
export const getProductById = (id) => api.get(`/products/${id}`);
export const deleteProduct = (id) => api.delete(`/products/${id}`);
