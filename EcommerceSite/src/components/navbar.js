'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import '../styles/navbar.css';
import { useAuth } from '@/context/context';

export default function Navbar() {
  const pathname = usePathname();
  const router = useRouter();
  const {user, logout} = useAuth();




  return (
    <nav className="navbar">
      <div className="navbar-links">
        <Link href="/">Productos</Link>
        {user?.role === 'admin' && (
          <Link href="/cruds" className="admin-link">
            Cruds
          </Link>
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
