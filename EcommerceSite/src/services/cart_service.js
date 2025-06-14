// services/cartService.js
import api from '../lib/api';

export const getCart = () => api.get('/cart');
export const addToCart = ( product_id, quantity ) =>
  api.post('/cart/', { product_id, quantity });
export const removeFromCart = (product_id) =>
  api.delete(`/cart/${product_id}`);
export const deleteCart = () => api.delete('/cart');

