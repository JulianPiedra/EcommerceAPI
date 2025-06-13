'use client';

import Image from 'next/image';


export default function ProductCard({ product }) {
    const { name, description, price, category, image } = product;

    // Convertir base64 en imagen si es tipo blob
    const imageSrc = image?.startsWith('data:image') ? image : '/default.png';

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
            <div>
                <span className="product-price">${price}</span>
                <span className="product-category">{category}</span>
            </div>
        </div>
    );
}
