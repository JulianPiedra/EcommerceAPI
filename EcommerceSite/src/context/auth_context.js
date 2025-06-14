'use client';
import { createContext, useContext, useState, useEffect } from 'react';
import { jwtDecode } from 'jwt-decode';
import { showToast } from '@/utils/show_message';
import { useRouter } from 'next/navigation';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [authLoading, setAuthLoading] = useState(true); 
  const router = useRouter();

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      try {
        const decoded = jwtDecode(token);
        setUser(decoded);
        setIsLoggedIn(true);
      } catch (err) {
        console.error('Token inválido:', err);
        localStorage.removeItem('token');
        setUser(null);
        setIsLoggedIn(false);
      }
    }
    setAuthLoading(false); 
  }, []);

  const login = (token) => {
    localStorage.setItem('token', token);
    setIsLoggedIn(true);
    setUser(jwtDecode(token));
    showToast('info', 'Bienvenido', 'Sesión iniciada correctamente');
  };

  const logout = () => {
    showToast('success', 'Logout', 'Sesión cerrada');
    localStorage.removeItem('token');
    setIsLoggedIn(false);
    setUser(null);
    router.replace('/');
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, isLoggedIn, authLoading }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
