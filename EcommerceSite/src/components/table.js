'use client';

import React, { useEffect } from 'react';
import Link from "next/link";
import '@/styles/table.css';
import { useAuth } from '@/context/context';
import { showToast } from '@/utils/show_message';
import { useRouter } from 'next/navigation';

export default function Table({ data, headers, createLink, editLink, deleteItem }) {
  const router = useRouter();
  const { user, isLoggedIn, authLoading } = useAuth();

  useEffect(() => {
    if (authLoading) return; // Espera a que termine de cargar

    if (!isLoggedIn || user?.role !== 'admin') {
      showToast('error', 'No tienes permisos para acceder a esta página');
      router.replace('/');
    }
  }, [authLoading, isLoggedIn, user]);
  return (
    <>
      <Link href={createLink} className="create-button">
        Crear nuevo
      </Link>
      <table className="custom-table">
        <thead>
          <tr>
            {headers.map(({ label }, index) => (
              <th key={index}>{label}</th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id}>
              {headers.map(({ key }, index) => {
                const value = item[key];
                const displayValue =
                  key === 'price' && typeof value === 'number'
                    ? `$${value.toFixed(2)}`
                    : value;

                return <td key={index}>{displayValue}</td>;
              })}
              <td>
                <button className="delete-button" onClick={() => deleteItem(item.id)}> <img src="/delete.png" alt="Delete" /></button>
              </td>
              <td>

                <button className="edit-button">
                  <Link href={editLink.replace('[id]', item.id)}>
                    <img src="/edit.png" alt="Edit" />
                  </Link>
                </button>
              </td>
            </tr>
          ))}

        </tbody>
      </table>
    </>
  );
}
