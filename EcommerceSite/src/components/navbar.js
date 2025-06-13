'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect, useState } from 'react';
import '../styles/navbar.css';

export default function Navbar() {
  const pathname = usePathname();
  const router = useRouter();
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [isInProductsPage, setIsInProductsPage] = useState(false);

  useEffect(() => {
    const token = localStorage.getItem('token');
    setIsLoggedIn(!!token);
    setIsInProductsPage(pathname === '/');
  }, [pathname]);

  const handleLogout = () => {
    localStorage.removeItem('token');
    setIsLoggedIn(false);
    router.refresh(); 
  };


  return (
    <nav className="navbar">

      <div className="navbar-links">
        <Link href="/">Productos</Link>
        {isInProductsPage && (
          <input
            type="text"
            placeholder="Buscar productos..."
            className="search-input"
            onKeyDown={(e) => {
              if (e.key === 'Enter') {
                const query = e.target.value.trim();
                if (query) {
                  router.push(`/productos?search=${encodeURIComponent(query)}`);
                }
              }
            }}></input>
        )}
        {isLoggedIn ? (
          <>
            <Link href="/admin/productos" >Admin</Link>
            <button onClick={handleLogout} >Logout</button>
          </>
        ) : (
          <Link href="/login" >Login</Link>
        )}
      </div>
    </nav>
  );
}
