import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/css/SignUp.module.css";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    if (!email || !password) {
      setError("Email and password are required!");
      return;
    }
    setError("");
    setLoading(true);
  
    try {
      const response = await axios.post("http://127.0.0.1:8000/api/login", {
        email,
        password,
      });
  
      console.log("Login Response:", response.data); // Debugging respons API
  
      if (response.data.success) {
        const { role, token, user } = response.data;
  
        // Validasi role
        if (!role || !user) {
          setError("Role atau user tidak ditemukan. Silakan hubungi admin.");
          setLoading(false);
          return;
        }
  
        // Simpan token, role, dan user ke localStorage
        localStorage.setItem("token", token);
        localStorage.setItem("role", role);
        localStorage.setItem("user", JSON.stringify(user));
  
        // Navigasi berdasarkan role
        switch (role) {
          case "admin":
            navigate("/dashboard");
            break;
          case "penjual":
          case "customer":
          case "guest":
            navigate("/");
            break;
          default:
            setError("Role tidak valid.");
        }
  
        alert("Login successful!");
      } else {
        setError(response.data.message || "Login failed.");
      }
    } catch (error) {
      console.error("Login error:", error);
      setError("Login error. Please try again.");
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
            {loading ? "Logging in..." : "Login"}
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
