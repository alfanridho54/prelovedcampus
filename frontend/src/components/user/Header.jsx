import { Link, useNavigate } from 'react-router-dom'; 
import styles from '../../assets/user/css/Header.module.css';

function Header() {
  const navigate = useNavigate();

  const logout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    localStorage.removeItem('role');

    navigate('/login');
  }

  return (
    <header>
      <nav className={styles.navbar}>
        <div className={styles.logo}>
          <a><Link to="/">PRELOVED</Link></a>
        </div>
        <ul className={styles.navLinks}>
          <li><Link to="/">Home</Link></li>
          <li><Link to="/about">About</Link></li>
          <li><Link to="/contact">Contact</Link></li>
          {
            localStorage.getItem('token') ? (
              <>
                <li><Link to="/profile">Profile</Link></li>
                <li><button onClick={logout}>Logout</button></li>
              </>
            ) : (
              <>
                <li><Link to="/login">Login</Link></li>
                <li><Link to="/register">Sign Up</Link></li>
              </>
            )
          }
        </ul>
        <div className={styles.container}>
          <div className={styles.searchBar}>
            <input type="text" placeholder="What are you looking for?" />
            <i className="fas fa-search"></i>
          </div>
          <div className={styles.icons}>
            <i className="far fa-heart" title="Favorite"></i>
            <Link to="/cart">
                <i className="fas fa-shopping-cart" title="Cart" aria-hidden="true"></i>
              </Link>
          </div>
        </div>
      </nav>
      <hr />
    </header>
  );
}

export default Header;

