'use client';

import Link from 'next/link';
import { useCart } from '@/context/cart_context';
import { useAuth } from '@/context/auth_context';
import { ShoppingCart } from 'lucide-react';
import { useState } from 'react';
import CartDrawer from './cart';

export default function Navbar() {

  const { user, logout } = useAuth();
  const { cart } = useCart();
  const [open, setOpen] = useState(false);

  const totalItems = cart.reduce((acc, item) => acc + item.quantity, 0);



  return (
    <nav className="navbar">
      <div className="navbar-links">
        <Link href="/">Productos</Link>
        {user?.role === 'admin' && (
          <Link href="/cruds" className="admin-link">
            Cruds
          </Link>
        )}
        {user?.role === 'user' && (
          <>
            <div className="cart-icon" onClick={() => setOpen(!open)}>
              <ShoppingCart color='white' />
              {totalItems > 0 && <span className="cart-count">{totalItems}</span>}
            </div>
            <CartDrawer open={open} onClose={() => setOpen(false)} cart={cart} />
          </>
        )}

        {user ? (
          <>
            <div className="user-dropdown">
              <img
                src="/user.svg"
                alt="User"
                className="user-avatar"
              />

              <span className="user-name">{user?.username}</span>
              <div className="dropdown-menu">
                <button onClick={logout}>Cerrar sesión</button>
              </div>
            </div>
          </>

        ) : (
          <Link href="/login">Login</Link>
        )}
      </div>
    </nav>
  );
}
