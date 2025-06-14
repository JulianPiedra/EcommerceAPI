'use client';
import { createContext, useContext, useEffect, useState } from 'react';
import * as cartService from '@/services/cart_service';

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
    loadCart();
  };

  const removeFromCart = async (productId) => {
    await cartService.removeFromCart(productId);
    loadCart();
  };
  const deleteCart = async () => {
    console.log('Borrando carrito...');
    await cartService.deleteCart();
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
