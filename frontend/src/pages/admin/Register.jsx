import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import styles from '../../assets/css/SignUp.module.css';

function Register() {
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    confirmPassword: '',
  });

  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    if (formData.password !== formData.confirmPassword) {
      setError('Passwords do not match.');
      return;
    }

    try {
      const response = await axios.post('http://127.0.0.1:8000/api/register', {
        username: formData.username,
        email: formData.email,
        password: formData.password,
      });
      if (response.data.success) {
        alert('Registration successful!');
        navigate('/login');
      } else {
        setError(response.data.message || 'Registration failed');
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
            <li><Link to="/SignUp">Sign Up</Link></li>
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

      <main className={styles.signUpContent}>
        <h1>Create an Account</h1>
        <p>Join our community and start shopping for your favorite preloved items today!</p>

        <form className={styles.signUpForm} onSubmit={handleSubmit}>
          <div className={styles.formGroup}>
            <label htmlFor="username">Username</label>
            <input
              type="text"
              id="username"
              name="username"
              placeholder="Enter your username"
              value={formData.username}
              onChange={handleChange}
              required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Enter your email"
              value={formData.email}
              onChange={handleChange}
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
              value={formData.password}
              onChange={handleChange}
              required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="confirmPassword">Confirm Password</label>
            <input
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              placeholder="Confirm your password"
              value={formData.confirmPassword}
              onChange={handleChange}
              required
            />
          </div>
          {error && <p className={styles.errorText}>{error}</p>}
          <button type="submit" className={styles.submitButton}>Sign Up</button>
        </form>

        <p className={styles.signInLink}>
          Already have an account? <Link to="/login">Sign In</Link>
        </p>
      </main>
    </>
  );
}

export default Register;
