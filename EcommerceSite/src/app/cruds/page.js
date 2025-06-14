'use client';

import React, { useState, useEffect } from 'react';
import ProductosPage from './products';
import UserPage from './users';

export default function CrudPage() {
  const [activeCrud, setActiveCrud] = useState('products');

  useEffect(() => {
    const storedCrud = localStorage.getItem('activeCrud');
    if (storedCrud) {
      setActiveCrud(storedCrud);
    }
  }, []);

  const handleCrudChange = (crudType) => {
    setActiveCrud(crudType);
    localStorage.setItem('activeCrud', crudType);
  };

  return (
    <>
      <h1 className='title'>Cruds de administrador</h1>
      <div className="crud-buttons">
        <button
          className={activeCrud === 'products' ? 'active' : ''}
          onClick={() => handleCrudChange('products')}
        >
          Crud Productos
        </button>
        <button
          className={activeCrud === 'users' ? 'active' : ''}
          onClick={() => handleCrudChange('users')}
        >
          Crud Usuarios
        </button>
      </div>
      <div className="crud-page">
        <div className="crud-content">
          {activeCrud === 'products' && <ProductosPage />}
          {activeCrud === 'users' && <UserPage />}
        </div>
      </div>
    </>
  );
}
