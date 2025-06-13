'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { login } from '@/services/auth_service';
import { useAuth } from '@/context/context';
import '@/styles/login.css'; 
export default function LoginPage() {
    const router = useRouter();
    const [error, setError] = useState('');
    const { login: loginUser } = useAuth();

    const handleSubmit = async (e) => {
        e.preventDefault();

        const formData = new FormData(e.target);
        const email = formData.get('email');
        const password = formData.get('password');

        try {
            const res = await login({ email, password });
            loginUser(res.token);
            if (res.token) {
                router.replace('/');
            }
        } catch (err) {
            setError(err.message || 'Error al iniciar sesión');
        }
    };

    return (
        <>

            <form onSubmit={handleSubmit} >
                <div className="form__title">Login</div>
                <div className="form__sub-title">Por favor inicia sesión para comenzar</div>
                <label className="form__input-label">Correo</label>
                <div className="form__input-wrapper">
                    <input
                        name="email"
                        type="email"
                        placeholder="Correo electrónico"
                        className="form__input"
                        required
                    />
                </div>
                <label className="form__input-label">Contraseña</label>
                <div className="form__input-wrapper">
                    <input
                        name="password"
                        type="password"
                        placeholder="Contraseña"
                        className="form__input"
                        required
                    />
                    
                </div>
                {error && <p className="text-red-500 text-sm">{error}</p>}

                <button className="form__submit-btn" type='submit'>Ingresar</button>
                <a href="#" className="form__sign-up">Crear una Nueva Cuenta</a>
            </form>
        </>
    );





}
