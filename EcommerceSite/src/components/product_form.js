'use client';

import React, { useEffect, useState } from 'react';
import { createProduct, getProductById, updateProduct } from '@/services/product_service';
import { showToast } from '@/utils/show_message';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/context/auth_context';

export default function ProductForm({ productId }) {
  const router = useRouter();
  const [product, setProduct] = useState(null);
  const { user, isLoggedIn, authLoading } = useAuth();
  
    useEffect(() => {
      if (authLoading) return; // Espera a que termine de cargar
  
      if (!isLoggedIn || user?.role !== 'admin') {
        showToast('error', 'No tienes permisos para acceder a esta página');
        router.replace('/');
      }
    }, [authLoading, isLoggedIn, user]);
  useEffect(() => {
    if (productId) {
      getProductById(productId)
        .then(setProduct)
        .catch(() => showToast('error', 'Error al cargar producto'));
    }
  }, [productId]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    const formData = new FormData(event.target);

    const data = Object.fromEntries(formData);
    const file = formData.get('image');
    if (!file || file.size === 0) formData.delete('image');

    try {
      if (productId) {
        await updateProduct(productId, formData);
        showToast('success', 'Producto actualizado exitosamente');
      } else {
        await createProduct(formData);
        showToast('success', 'Producto creado exitosamente');
      }
      router.push('/cruds');
    } catch (error) {
      showToast('error', error.message);
    }
  };

  return (
    <>
      <h1 className='title'>
        {productId ? 'Editar Producto' : 'Crear Producto'}
      </h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="name">Nombre del Producto:</label>
          <input
            type="text"
            id="name"
            name="name"
            required
            defaultValue={product?.name || ''}
          />
        </div>
        <div className="form-group">
          <label htmlFor="description">Descripción:</label>
          <textarea
            id="description"
            name="description"
            required
            defaultValue={product?.description || ''}
          ></textarea>
        </div>
        <div className="form-group">
          <label htmlFor="price">Precio:</label>
          <input
            type="number"
            id="price"
            name="price"
            required
            defaultValue={product?.price || ''}
          />
        </div>
        <div className="form-group">
          <label htmlFor="image">Imagen:</label>
          <input
            type="file"
            id="image"
            name="image"
            accept="image/*"
            {...(productId ? {} : { required: true })}
          />
        </div>
        <button type="submit">
          {productId ? 'Actualizar Producto' : 'Guardar Producto'}
        </button>
      </form>
    </>
  );
}
