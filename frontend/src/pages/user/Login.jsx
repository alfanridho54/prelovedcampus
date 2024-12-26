import  { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import styles from '../../assets/css/SignUp.module.css';

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!email || !password) {
      setError('Email and password are required!');
      return;
    }
    setError('');

    try {
      const response = await axios.post('http://127.0.0.1:8000/api/login', { email, password });
      if (response.data.success) {
        // Menyimpan token dan role ke localStorage
        localStorage.setItem('token', response.data.token);
        localStorage.setItem('role', response.data.role);
        console.log('Role:', response.data.role);

        // Mengarahkan berdasarkan role
        const userRole = response.data.role; // Pastikan role ada di response
        if (userRole === 'admin') {
          navigate('/dashboard'); // Arahkan admin ke dashboard
        } else if (userRole === 'penjual' || userRole === 'customer' || userRole === 'guest') {
          navigate('/home'); // Arahkan penjual atau customer ke home
        }

        alert('Login successful!');
      } else {
        setError(response.data.message || 'Login failed');
      }
    } catch (error) {
      setError('API error. Please try again later.');
    }
  };

  return (
    <>
      <header>
        <nav className={styles.navbar}>
          <div className={styles.logo}>
            <Link to="#">PRELOVED</Link>
          </div>
          <ul className={styles.navLinks}>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <li><Link to="/login">Login</Link>/<Link to="/register">Sign Up</Link></li>
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

      <main className={styles.signUpContent}>
        <h1>Login to Your Account</h1>
        <p>Welcome back! Please login to continue.</p>

        <form className={styles.signUpForm} onSubmit={handleSubmit}>
          <div className={styles.formGroup}>
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Enter your password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          {error && <p className={styles.errorText}>{error}</p>}
          <button type="submit" className={styles.submitButton}>Login</button>
        </form>

        <p className={styles.signInLink}>
          Don’t have an account? <Link to="/register">Sign Up</Link>
        </p>
      </main>
    </>
  );
}

export default Login;
