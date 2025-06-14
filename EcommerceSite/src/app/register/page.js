'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { register } from '@/services/auth_service';
import { useAuth } from '@/context/auth_context';
import Link from 'next/link';
import { showToast } from '@/utils/show_message';

export default function RegisterPage() {
    const router = useRouter();
    const [error, setError] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();

        const formData = new FormData(e.target);
        const email = formData.get('email');
        const password = formData.get('password');
        const confirmPassword = formData.get('confirmPassword');
        const username = formData.get('username');

        if (password !== confirmPassword) {
            setError('Las contraseñas no coinciden');
            return;
        }

        try {
            await register({ username, email, password });
            showToast('success', 'Cuenta creada exitosamente');
            router.replace('/login');
        } catch (err) {
            setError(err.message || 'Error al registrar');
        }
    };

    return (
        <>
            <form onSubmit={handleSubmit}>
                <div className="form__title">Registrar nueva cuenta</div>

                <label className="form__input-label">Nombre</label>
                <div className="form__input-wrapper">
                    <input
                        name="username"
                        type="text"
                        placeholder="Nombre de usuario"
                        className="form__input"
                        required
                    />
                </div>

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

                <label className="form__input-label">Confirmar Contraseña</label>
                <div className="form__input-wrapper">
                    <input
                        name="confirmPassword"
                        type="password"
                        placeholder="Confirmar Contraseña"
                        className="form__input"
                        required
                    />
                </div>

                {error && <p className="text-red-500 text-sm mt-2">{error}</p>}

                <button className="form__submit-btn" type="submit">Crear Cuenta</button>
                <Link href="/login" className="form__sign-up">Iniciar Sesión</Link>
            </form>
        </>
    );
}
