'use client';

import Image from 'next/image';
import { useCart } from '@/context/cart_context';
import { useState } from 'react';
import { useAuth } from '@/context/auth_context';

export default function ProductCard({ product }) {
    const { name, description, price, category, image } = product;
    const { addToCart } = useCart();
    const [quantity, setQuantity] = useState(1);
    const { user } = useAuth();


    const imageSrc = image?.startsWith('data:image') ? image : '/default.png';

    const handleAddToCart = () => {

        if (quantity > 0) {
            addToCart(product.id, parseInt(quantity));
        }
    };

    return (
        <div className="product-card">
            <Image
                src={imageSrc}
                alt={name}
                width={300}
                height={200}
                className="product-image"
            />
            <h2 className="product-name">{name}</h2>
            <p className="product-description">{description}</p>
            <span className="product-price">${price}</span>
            <span className="product-category">{category}</span>
            {user !== null && user.role === 'user' && (
                <div className="quantity-control">
                    <label htmlFor={`qty-${product.id}`}>Cantidad:</label>
                    <input
                        id={`qty-${product.id}`}
                        type="number"
                        min="1"
                        value={quantity}
                        onChange={(e) => setQuantity(e.target.value)}
                        className="quantity-input"
                    />
                    <button className="add-to-cart-button" onClick={handleAddToCart}>
                        +
                    </button>
                </div>
            )}



        </div>
    );
}
