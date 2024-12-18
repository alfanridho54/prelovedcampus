import allProdukStyles from '../assets/css/All-produk.module.css'; // Alias untuk All-produk styles
import footerStyles from '../assets/css/Footer.module.css'; // Alias untuk Footer styles
import Produk from '../utils/AllProduk';
import { Link } from 'react-router-dom';

export default function ProdukList() {
  const products = Produk; // Menyimpan data produk

  return (
    <>
      {/* Header Navigasi */}
      <header>
        <nav className={allProdukStyles.navbar}>
          <div className={allProdukStyles.logo}>
            <Link to="/">PRELOVED</Link>
          </div>
          <ul className={allProdukStyles.navLinks}>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <li><Link to="/SignUp">Sign Up</Link></li>
          </ul>
          <div className={allProdukStyles.container}>
            <div className={allProdukStyles.icons}>
              <input
                className={allProdukStyles.placeholder}
                type="text"
                placeholder="What are you looking for?"
              />
              <i className="fas fa-search"></i>
              <i className="far fa-heart" title="Favorite"></i>
              <i className="fas fa-shopping-cart" title="Cart"></i>
            </div>
          </div>
        </nav>
        <hr />
      </header>

      {/* Konten Utama */}
      <div className={allProdukStyles.container}>
        <div className={allProdukStyles.grid}>
          {products.map((product, index) => (
            <div key={index} className={allProdukStyles.card}>
              <Link to={`/PesanProduk/${product.id}`}>
                <img src={product.img} alt={product.name} />
                <h3>{product.name}</h3>
                <p>{product.price}</p>
              </Link>
            </div>
          ))}
        </div>

        {/* Tombol View All Product */}
        <div className={allProdukStyles.buttonContainer}>
          <Link to="/">
            <button className={allProdukStyles.button}>Kembali ke HomePage</button>
          </Link>
        </div>
      </div>

      {/* Footer */}
      <footer className={footerStyles.footer}>
        <div className={footerStyles.footerContent}>
          <div className={footerStyles.footerSection}>
            <h3>Our Products</h3>
            <ul>
              <li><a href="#">Menswear</a></li>
              <li><a href="#">Womenswear</a></li>
              <li><a href="#">Electronics</a></li>
              <li><a href="#">Furniture</a></li>
              <li><a href="#">Books & Stationery</a></li>
            </ul>
          </div>

          <div className={footerStyles.footerSection}>
            <h3>Quick Links</h3>
            <ul>
              <li><Link to="/">Home</Link></li>
              <li><Link to="/about">About</Link></li>
              <li><Link to="/contact">Contact</Link></li>
              <li><Link to="/SignUp">Sign Up</Link></li>
            </ul>
          </div>

          <div className={footerStyles.footerSection}>
            <h3>Follow Us</h3>
            <div className={footerStyles.socialIcons}>
              <a href="#" className={footerStyles.socialIcon}>Facebook</a>
              <a href="#" className={footerStyles.socialIcon}>Instagram</a>
              <a href="#" className={footerStyles.socialIcon}>Twitter</a>
            </div>
          </div>

          <div className={footerStyles.footerSection}>
            <h3>Contact Us</h3>
            <p>Email: support@prelovedcampus.com</p>
            <h5>
              Jln. Lenteng Agung Raya no.20 RT.5/RW.1 Lenteng Agung Srengseng Sawah, 
              Kecematan Jagakarsa, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta
            </h5>
          </div>
        </div>

        <div className={footerStyles.footerBottom}>
          <p>&copy; 2024 PrelovedCampus. All rights reserved.</p>
        </div>
      </footer>
    </>
  );
}
