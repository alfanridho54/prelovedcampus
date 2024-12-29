import React from "react";
import { Routes, Route } from "react-router-dom"; // Tambahkan ini
import Layout from './layout/admin/Index';
import Dashboard from './pages/admin/Dashboard';
import Produk from './pages/admin/produk/Produk';
import AddProduk from './pages/admin/produk/AddProduk';
import EditProduk from './pages/admin/produk/EditProduk';
import Login from './pages/user/Login';
import Register from './pages/user/Register';
import Cart from './pages/user/Cart';
import Kategori from './pages/admin/kategori/Kategori';
import AddKategori from './pages/admin/kategori/AddKategori';
import EditKategori from './pages/admin/kategori/EditKategori';
import Transaksi from './pages/admin/transaksi/Transaksi';
import Protected from './pages/admin/ProtectedRoute';
import About from './pages/user/About';
import Contact from './pages/user/Contact';
import Home from './pages/user/Home';
import DetailProduk from './pages/user/DetailProduk';
import Profile from "./pages/user/Profile";
import Checkout from "./pages/user/Checkout";
import Unauthorized from "./pages/admin/Unauthorized";
import CheckoutSuccess from "./pages/user/CheckoutSuccess";

function App() {
  return (
    <Routes>
      {/* Rute Publik */}
      <Route path="/" element={<Home />} />
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />
      <Route path="/cart" element={<Cart />} />
      <Route path="/about" element={<About />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="/detail-produk/:id" element={<DetailProduk />} />
      <Route path="/profile" element={<Profile />} />
      <Route path="/checkout" element={<Checkout />} />
      <Route path="/checkout-success" element={<CheckoutSuccess />} />

      {/* Rute Unauthorized */}
      <Route path="/unauthorized" element={<Unauthorized />} />

      {/* Rute Dashboard untuk Admin dan Penjual */}
      <Route element={<Layout />}>
        <Route element={<Protected allowedRoles={['admin', 'penjual']} />}>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/produk" element={<Produk />} />
          <Route path="/produk/edit/:id" element={<EditProduk />} />
          <Route path="/produk/create" element={<AddProduk />} />
          <Route path="/kategori" element={<Kategori />} />
          <Route path="/kategori/create" element={<AddKategori />} />
          <Route path="/kategori/edit/:id" element={<EditKategori />} />
          <Route path="/transaksi" element={<Transaksi />} />
        </Route>
      </Route>
    </Routes>
  );
}

export default App;
