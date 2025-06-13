import Navbar from "@/components/navbar";
import '../styles/global.css';
export const metadata = {
  title: 'E-Commerce',
  description: 'Tienda en línea con Next.js',
};
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <Navbar />
        <main >{children}</main>
      </body>
    </html>
  )
}
