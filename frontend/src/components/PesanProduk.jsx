import { useParams } from "react-router-dom";
import Produk from "../utils/AllProduk";
import { Link } from "react-router-dom";
import styles from "../assets/css/PesanProduk.module.css"; // Pastikan menggunakan file CSS yang benar

export default function PesanProduk() {
  const { id } = useParams(); // Ambil ID produk dari URL
  const product = Produk.find((item) => item.id === parseInt(id)); // Cari produk berdasarkan ID

  if (!product) {
    return (
      <>
        <header className={styles.header}>
          <nav className={styles.navbar}>
            <div className={styles.logo}>
              <a href="#">PRELOVED</a>
            </div>
            <ul className={styles.navLinks}>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/about">About</Link>
              </li>
              <li>
                <Link to="/contact">Contact</Link>
              </li>
              <li>
                <Link to="/SignUp">Sign Up</Link>
              </li>
            </ul>
            <div className={styles.container}>
              <div className={styles.searchBar}>
                <input type="text" placeholder="What are you looking for?" />
                <i className="fas fa-search"></i>
              </div>
              <div className={styles.icons}>
                <i className="far fa-heart" title="Favorite"></i>
                <i className="fas fa-shopping-cart" title="Cart"></i>
              </div>
            </div>
          </nav>
          <hr />
        </header>
        <div className={styles.notFoundMessage}>
          <h2>Produk tidak ditemukan!</h2>
        </div>
      </>
    );
  }

  return (
    <div className={styles.productDetail}>
      <header className={styles.header}>
        <nav className={styles.navbar}>
          <div className={styles.logo}>
            <Link to="/">PRELOVED</Link>
          </div>
          <ul className={styles.navLinks}>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/contact">Contact</Link>
            </li>
            <li>
              <Link to="/SignUp">Sign Up</Link>
            </li>
          </ul>
          <div className={styles.container}>
            <div className={styles.searchBar}>
              <input type="text" placeholder="What are you looking for?" />
              <i className="fas fa-search"></i>
            </div>
            <div className={styles.icons}>
              <i className="far fa-heart" title="Favorite"></i>
              <i className="fas fa-shopping-cart" title="Cart"></i>
            </div>
          </div>
        </nav>
        <hr />
      </header>

      <div className={styles.productInfo}>
        <h1>{product.name}</h1>
        <img src={product.img} alt={product.name} className={styles.productImage} />
        <p className={styles.productPrice}>Harga: {product.price}</p>
        <button className={styles.orderButton}>Pesan Sekarang</button>
      </div>
    </div>
  );
}
