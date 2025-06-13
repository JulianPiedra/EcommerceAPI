// app/page.js
import React from 'react';
import { getAllProducts } from '../services/product_service';
import ProductCard from '@/components/product_cards';
import '@/styles/product_cards.css';


export default async function ProductosPage() {
    const products = await getAllProducts();

  return (
    <div className="product-list">
      {products.map(product => (
        <ProductCard key={product.id} product={product} />
      ))}
    </div>
  );
}
