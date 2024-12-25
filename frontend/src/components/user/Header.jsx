import { Link } from 'react-router-dom'; 
import styles from '../../assets/user/css/Header.module.css';

function Header() {
  return (
    <header>
      <nav className={styles.navbar}>
        <div className={styles.logo}>
          <a href="#">PRELOVED</a>
        </div>
        <ul className={styles.navLinks}>
          <li><Link to="/home">Home</Link></li> {/* Gunakan Link untuk navigasi */}
          <li><Link to="/about">About</Link></li> {/* Gunakan Link untuk navigasi */}
          <li><Link to="/contact">Contact</Link></li> {/* Gunakan Link untuk navigasi */}
          <li><Link to="/register">Sign Up</Link></li>
        </ul>
        <div className={styles.container}>
          {/* Search Bar */}
          <div className={styles.searchBar}>
            <input type="text" placeholder="What are you looking for?" />
            <i className="fas fa-search"></i>
          </div>
          {/* Icons (Favorites & Cart) */}
          <div className={styles.icons}>
            <i className="far fa-heart" title="Favorite"></i>
            <i className="fas fa-shopping-cart" title="Cart"></i>
          </div>
        </div>
      </nav>
      <hr />
    </header>
  );
}

export default Header;
