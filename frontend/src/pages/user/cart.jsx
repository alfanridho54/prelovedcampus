import { Link } from 'react-router-dom';
import styles from '../../assets/css/Cart.module.css';

export default function Cart() {
  return (
    <>
      <header className={styles.cartHeader}>
        <nav className={styles.navbar}>
          <div className={styles.logo}>
            <a href="#">PRELOVED</a>
          </div>
          <ul className={styles.navLinks}>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <li><Link to="/login">Login</Link> / <Link to="/register">Sign Up</Link></li>
          </ul>
          <div className={styles.container}>
            <div className={styles.searchBar}>
              <input type="text" placeholder="What are you looking for?" />
              <i className="fas fa-search"></i>
            </div>
            <div className={styles.icons}>
              <i className="far fa-heart" title="Favorite"></i>
              <i className="fas fa-shopping-cart" title="Cart">
                <Link to="/cart"></Link>
              </i>
            </div>
          </div>
        </nav>
        <hr />
      </header>

      <div className={`${styles.cartContainer} page-content`}>
        <div className="border-b-2 border-blue-500 mb-4">
          <h1 className="text-lg">Home / Cart</h1>
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full bg-white">
            <thead>
              <tr>
                <th className="py-2 px-4 border-b">Product</th>
                <th className="py-2 px-4 border-b">Price</th>
                <th className="py-2 px-4 border-b">Subtotal</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td className="py-2 px-4 border-b flex items-center">
                  <img src="https://placehold.co/100x100" alt="Laptop Asus Second" className="w-16 h-16 mr-4"/>
                  Laptop Asus Second
                </td>
                <td className="py-2 px-4 border-b">Rp.4.650.000</td>
                <td className="py-2 px-4 border-b">Rp.4.650.000</td>
              </tr>
              <tr>
                <td className="py-2 px-4 border-b flex items-center">
                  <img src="https://placehold.co/100x100" alt="Handphone Samsung Second" className="w-16 h-16 mr-4"/>
                  Handphone Samsung Second
                </td>
                <td className="py-2 px-4 border-b">Rp.3.000.000</td>
                <td className="py-2 px-4 border-b">Rp.3.000.000</td>
              </tr>
              <tr>
                <td className="py-2 px-4 border-b flex items-center">
                  <img src="https://placehold.co/100x100" alt="Hoodie H&M Second" className="w-16 h-16 mr-4"/>
                  Hoodie H&M Second
                </td>
                <td className="py-2 px-4 border-b">Rp.60.000</td>
                <td className="py-2 px-4 border-b">Rp.60.000</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div className="mt-8 border-t border-b border-black p-4">
          <div className="flex justify-between py-2">
            <span>Subtotal:</span>
            <span>Rp.7.650.000</span>
          </div>
          <div className="flex justify-between py-2">
            <span>Shipping:</span>
            <span>Free</span>
          </div>
          <div className="flex justify-between py-2 font-bold">
            <span>Total:</span>
            <span>Rp.7.650.000</span>
          </div>
        </div>

        <div className="mt-4 text-center">
          <button className={styles.button}>Checkout</button>
        </div>
      </div>
    </>
  );
}
