import Navbar from "@/components/navbar";
import '@/styles/global.css';
import '@/styles/navbar.css';
import '@/styles/product_cards.css';
import '@/styles/form.css';
import '@/styles/table.css';
import '@/styles/cart.css';
import '@/styles/login.css'; 



import { AuthProvider } from "@/context/auth_context";
import { CartProvider } from "@/context/cart_context";
export const metadata = {
  title: 'E-Commerce',
  description: 'Tienda en línea con Next.js',
};
// src/app/layout.js
export default function RootLayout({ children }) {
  return (
    <html lang="en" suppressHydrationWarning={true} data-lt-installed="true">
      <body suppressHydrationWarning={true}>
        <AuthProvider>
          <CartProvider>
          <Navbar />
          <main>
            {children}
          </main>
          </CartProvider>
        </AuthProvider>
      </body>
    </html>
  );
}

