'use client';

import React, { useState } from 'react';
import ProductosPage from './products';
import UserPage from './users';

export default function CrudPage() {
  const [activeCrud, setActiveCrud] = useState('products');

  return (
    <>
          
    <h1 className='title'>Cruds de administrador</h1>
    <div className="crud-buttons">
        <button
          className={activeCrud === 'products' ? 'active' : ''}
          onClick={() => setActiveCrud('products')}
        >
          Crud Productos
        </button>
        <button
          className={activeCrud === 'users' ? 'active' : ''}
          onClick={() => setActiveCrud('users')}
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
