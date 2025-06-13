import UserForm from '@/components/user_form';

export default function EditUserPage({ params }) {
  return <UserForm userId={params.id} />; 
}
