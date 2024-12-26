import { Link } from 'react-router-dom';
import styles from '../../assets/user/css/About.module.css';

export default function About() {
  return (
    <>
      {/* Header */}
      <header>
        <nav className={styles.navbar}>
          <div className={styles.logo}>
            <Link to="/">PRELOVED</Link>
          </div>
          <ul className={styles.navLinks}>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <li>
              <Link to="/login">Login</Link> / 
              <Link to="/register">Sign Up</Link>
            </li>
          </ul>
          <div className={styles.container}>
            {/* Search Bar */}
            <div className={styles.searchBar}>
              <input 
                type="text" 
                placeholder="What are you looking for?" 
                aria-label="Search" 
              />
              <i className="fas fa-search" aria-hidden="true"></i>
            </div>
            {/* Icons */}
            <div className={styles.icons}>
              <i className="far fa-heart" title="Favorite" aria-hidden="true"></i>
              <Link to="/cart">
                <i className="fas fa-shopping-cart" title="Cart" aria-hidden="true"></i>
              </Link>
            </div>
          </div>
        </nav>
        <hr />
      </header>

      {/* Konten About */}
      <main className={styles.aboutContent} role="main">
        <h1>About Us</h1>
        <p>
          Welcome to <strong>PRELOVED</strong> - your trusted marketplace for high-quality second-hand items. We are committed to providing a platform that connects buyers and sellers who value sustainability, affordability, and style.
          At PRELOVED, we believe in the power of reuse and recycling to create a more sustainable future. Explore our wide range of categories, from fashion and accessories to home decor and gadgets, and discover unique items that fit your needs and preferences.
        </p>
        <p>
          At PRELOVED, we believe in the power of reuse and recycling to create a more sustainable future. 
          Explore our wide range of categories, from fashion and accessories to home decor and gadgets, 
          and find unique items that suit your needs and preferences.
        </p>
        <h2>Our Mission</h2>
        <p>
          Our mission is to make sustainable shopping accessible to everyone. By promoting the reuse of second-hand goods, we aim to reduce waste and support an eco-friendly lifestyle.
        </p>
        <h2>Contact Us</h2>
        <p>
          Have questions or feedback? Get in touch with our team through the <Link to="/contact">Contact</Link> page. 
          We’re here to help!
        </p>
      </main>
    </>
  );
}
