import { deleteCart } from '@/services/cart_service';
import { useCart } from '../context/cart_context';

export default function CartDrawer({ open, onClose, cart = [] }) {
  if (!open) return null;



  const { removeFromCart, deleteCart } = useCart();

  return (
    <div className="cart-drawer">
      <h2 className="cart-header">Tu carrito</h2>
      {cart.length === 0 ? (
        <p>El carrito está vacío.</p>
      ) : (
        <ul>
          {cart.map(item => (
            <li key={item.id} className="cart-item">
              <div className="cart-item-name">{item.name}</div>
              <div className="cart-item-quantity">
                <span>
                  Cantidad: {item.quantity}
                </span>
                <span>
                  Precio: ${item.price}
                </span>
              </div>

              <button
                onClick={() => removeFromCart(item.product_id)}
                className="remove-button"
              >
                Eliminar
              </button>

            </li>
          ))}
          <li className="cart-total">
            <strong>Total:</strong> ${cart.reduce((total, item) => total + item.price * item.quantity, 0).toFixed(2)}
          </li>
        </ul>
      )}
      { cart.length > 0 && ( 
              <button className="close-button" onClick={() => deleteCart()}>Borrar carrito</button>
      )}
      <button onClick={onClose} >Cerrar</button>
    </div>
  );
}
