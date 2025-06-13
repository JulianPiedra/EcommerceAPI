import Navbar from "@/components/navbar";
import '../styles/global.css';
import { AuthProvider } from "@/context/context";
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
          <Navbar />
          <main>
            {children}
          </main>
        </AuthProvider>
      </body>
    </html>
  );
}

