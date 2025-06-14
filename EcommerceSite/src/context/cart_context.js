'use client';
import { createContext, useContext, useEffect, useState } from 'react';
import * as cartService from '@/services/cart_service';
import { showToast } from '@/utils/show_message';

const CartContext = createContext();

export function CartProvider({ children }) {
  const [cart, setCart] = useState([]);

  const loadCart = async () => {
    try {
      const data = await cartService.getCart();
      setCart(data);
    } catch (error) {
      setCart([]);
    }
  };

  const addToCart = async (productId, quantity = 1) => {
    await cartService.addToCart(productId, quantity);
    showToast('success', 'Producto agregado al carrito');
    loadCart();
  };

  const removeFromCart = async (productId) => {
    await cartService.removeFromCart(productId);
    showToast('success', 'Producto eliminado del carrito');
    loadCart();
  };
  const deleteCart = async () => {
    await cartService.deleteCart();
    showToast('success', 'Carrito eliminado');
    loadCart();
  };

  useEffect(() => {
    loadCart();
  }, []);

  return (
    <CartContext.Provider value={{ cart, addToCart, removeFromCart, deleteCart }}>
      {children}
    </CartContext.Provider>
  );
}

export const useCart = () => useContext(CartContext);
