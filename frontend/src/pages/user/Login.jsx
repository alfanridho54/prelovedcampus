import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import styles from '../../assets/css/SignUp.module.css';
import Header from '../../components/user/Header';
import Footer from '../../components/user/Footer';
function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    if (!email || !password) {
      setError('Email and password are required!');
      return;
    }
    setError('');
    setLoading(true);
  
    try {
      const response = await axios.post('http://127.0.0.1:8000/api/login', { email, password });
      console.log('Login Response:', response.data); // Debugging respons API
  
      if (response.data.success) {
        const userRole = response.data.role; // Ambil langsung dari response.data
  
        // Validasi role
        if (!userRole) {
          setError('Role tidak ditemukan. Silakan hubungi admin.');
          setLoading(false);
          return;
        }
  
        // Simpan token dan role ke localStorage
        localStorage.setItem('token', response.data.token);
        localStorage.setItem('role', userRole); // Simpan role untuk akses cepat
  
        // Navigasi berdasarkan role
        switch (userRole) {
          case 'admin':
            navigate('/dashboard');
            break;
          case 'penjual':
          case 'customer':
          case 'guest':
            navigate('/');
            break;
          default:
            setError('Role tidak valid.');
        }
  
        alert('Login successful!');
      } else {
        setError(response.data.message || 'Login failed.');
      }
    } catch (error) {
      setError('Login error. Please try again.');
      console.error('Login error:', error);
    } finally {
      setLoading(false);
    }
  };
  
  

  return (
    <>
      <Header />

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
          <button type="submit" className={styles.submitButton} disabled={loading}>
            {loading ? 'Logging in...' : 'Login'}
          </button>
        </form>

        <p className={styles.signInLink}>
          Don’t have an account? <Link to="/register">Sign Up</Link>
        </p>
      </main>

      <Footer />
    </>
  );
}

export default Login;
