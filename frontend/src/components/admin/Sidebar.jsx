import React from 'react';
import { Link, useNavigate } from 'react-router-dom';  // Menggunakan useNavigate untuk melakukan redirect

const Sidebar = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    // Menghapus token dari localStorage dan redirect ke halaman login
    localStorage.removeItem("token");
    navigate("/login");  // Ganti "/login" dengan rute halaman login Anda
  };

  return (
    <ul className="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <a className="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div className="sidebar-brand-icon rotate-n-15">
          <i className="fas fa-laugh-wink"></i>
        </div>
        <div className="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
      </a>
      <hr className="sidebar-divider my-0" />

      <li className="nav-item active">
        <Link className="nav-link" to="/dashboard">
          <i className="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </Link>
      </li>

      <hr className="sidebar-divider" />

      <div className="sidebar-heading">Interface</div>

      {/* Add other sidebar items here */}
      <li className="nav-item">
        <Link className="nav-link" to="/produk">
          <i className="fas fa-box"></i>
          <span>Produk</span>
        </Link>
      </li>
      <li className="nav-item">
        <Link className="nav-link" to="/transaksi">
          <i className="fas fa-credit-card"></i>
          <span>Transaksi</span>
        </Link>
      </li>
      <li className="nav-item">
        <Link className="nav-link" to="/kategori">
          <i className="fas fa-tags"></i>
          <span>Kategori</span>
        </Link>
      </li>

      {/* Tombol Logout */}
      <li className="nav-item">
        <button className="nav-link btn btn-link" onClick={handleLogout}>
          <i className="fas fa-sign-out-alt"></i>
          <span>Logout</span>
        </button>
      </li>

    </ul>
  );
};

export default Sidebar;
