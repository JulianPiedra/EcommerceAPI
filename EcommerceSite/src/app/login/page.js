'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { login } from '@/services/auth_service';

export default function LoginPage() {
    const router = useRouter();
    const [error, setError] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();

        const formData = new FormData(e.target);
        const email = formData.get('email');
        const password = formData.get('password');

        try {
            const res = await login({ email, password });
            localStorage.setItem('token', res.token);
            if (res.token) {
                router.replace('/');
            }
        } catch (err) {
            setError(err.message || 'Error al iniciar sesión');
        }
    };

    return (
        <div className="max-w-md mx-auto mt-20 p-6 bg-white rounded shadow">
            <h2 className="text-2xl font-bold mb-4 text-center">Iniciar Sesión</h2>

            <form onSubmit={handleSubmit} className="space-y-4">
                <input
                    name="email"
                    type="email"
                    placeholder="Correo electrónico"
                    className="w-full border px-4 py-2 rounded"
                    required
                />

                <input
                    name="password"
                    type="password"
                    placeholder="Contraseña"
                    className="w-full border px-4 py-2 rounded"
                    required
                />

                {error && <p className="text-red-500 text-sm">{error}</p>}

                <button
                    type="submit"
                    className="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700"
                >
                    Entrar
                </button>
            </form>
        </div>
    );
}
