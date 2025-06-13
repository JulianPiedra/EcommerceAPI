import ProductForm from '@/components/product_form';

export default function EditProductPage({ params }) {
  return <ProductForm productId={params.id} />;
}
