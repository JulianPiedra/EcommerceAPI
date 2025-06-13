'use client';

import { useEffect, useState } from 'react';
import { getAllUsers, deleteUser } from '@/services/user_service';
import '@/styles/product_cards.css';
import Table from '@/components/table';
import { showToast } from '@/utils/show_message';

export default function UserPage() {
  const [users, setUsers] = useState([]);
    const handleDeleteUser = async (id) => {
      console.log('Eliminando usuario con ID:', id);
      const response = await deleteUser(id);
      showToast('info', response.message);
      setUsers(users.filter((user) => user.id !== id));
    };
  useEffect(() => {
    const fetchData = async () => {
      const data = await getAllUsers();
      setUsers(data);
    };

    fetchData();
  }, []);

  const headers = [
    { label: 'ID', key: 'id' },
    { label: 'Nombre', key: 'username' },
    { label: 'Email', key: 'email' },
    { label: 'Rol', key: 'role' },
  ];

  return (
    <>
      <Table data={users} headers={headers} createLink="/cruds/user-form/new" editLink="/cruds/user-form/[id]/edit" deleteItem={handleDeleteUser} />
    </>
  );
}
