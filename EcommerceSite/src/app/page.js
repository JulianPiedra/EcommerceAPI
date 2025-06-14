'use client';

import React, { useState, useEffect } from 'react';
import { getAllProducts } from '../services/product_service';
import ProductCard from '@/components/product_cards';
import Pagination from '@/components/pagination';

export default function ProductosPage() {
  const [products, setProducts] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [filteredProducts, setFilteredProducts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const productsPerPage = 10;

  useEffect(() => {
    async function fetchProducts() {
      const data = await getAllProducts();
      setProducts(data);
    }
    fetchProducts();
  }, []);

  // Filtrar productos cuando cambie products o searchTerm
  useEffect(() => {
    const filtered = products.filter(product =>
      product.name.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setFilteredProducts(filtered);
    setCurrentPage(1); // resetear página al cambiar búsqueda
  }, [products, searchTerm]);

  // Paginación lógica
  const indexOfLast = currentPage * productsPerPage;
  const indexOfFirst = indexOfLast - productsPerPage;
  const currentProducts = filteredProducts.slice(indexOfFirst, indexOfLast);
  const totalPages = Math.ceil(filteredProducts.length / productsPerPage);

  return (
    <div className="product-page">
      <input
        type="text"
        placeholder="Buscar productos..."
        className="search-input"
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
      />

      <div className="product-list">
        {currentProducts.map(product => (
          <ProductCard key={product.id} product={product} />
        ))}
      </div>

      {currentProducts.length === 0 && (
        <p className="no-products">No hay productos disponibles</p>
      )}

      {totalPages > 1 && (
        <>
          <div className="pagination-container">
            <p className="pagination-info">
              Página {currentPage} de {totalPages}
            </p>
          </div>
          <Pagination
            currentPage={currentPage}
            totalPages={totalPages}
            onPageChange={page => setCurrentPage(page)}
          />
        </>
      )}
    </div>
  );
}
