'use client';

import { useEffect, useState } from 'react';
import { getAllProducts, deleteProduct} from '@/services/product_service';
import '@/styles/product_cards.css';
import Table from '@/components/table';
import { showToast } from '@/utils/show_message';

export default function ProductosPage() {
  const [products, setProducts] = useState([]);

  const handleDeleteProduct = async (id) => {
    const response = await deleteProduct(id);
    showToast('info', response.message);
    setProducts(products.filter((product) => product.id !== id));
  };

  useEffect(() => {
    const fetchData = async () => {
      const data = await getAllProducts();
      setProducts(data);
    };

    fetchData();
  }, []);

  const headers = [
    { label: 'Nombre', key: 'name' },
    { label: 'Descripción', key: 'description' },
    { label: 'Precio', key: 'price' },
  ];

  return (
    <>
      <Table data={products} headers={headers} createLink="/cruds/product-form/new"  editLink="/cruds/product-form/[id]/edit" deleteItem={handleDeleteProduct} />
    </>
  );
}
