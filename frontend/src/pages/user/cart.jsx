import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/css/Cart.module.css";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";

export default function Cart() {
  const [cartItems, setCartItems] = useState([]); // Data keranjang
  const [loading, setLoading] = useState(true); // State untuk loading
  const navigate = useNavigate();

  // Fungsi untuk mengambil data keranjang
  const fetchCart = async () => {
    const token = localStorage.getItem("token");
    const user = JSON.parse(localStorage.getItem("user")); // Ambil data user dari localStorage

    if (!token || !user) {
      alert("Anda harus login untuk melihat keranjang.");
      navigate("/login");
      return;
    }

    try {
      const response = await axios.get(`http://127.0.0.1:8000/api/cart/${user.id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      setCartItems(response.data.data); // Simpan data keranjang ke state
    } catch (error) {
      console.error("Error fetching cart:", error);
      alert("Gagal memuat keranjang.");
    } finally {
      setLoading(false);
    }
  };

  // Fungsi untuk menghapus produk dari keranjang
  const handleRemove = async (id) => {
    const token = localStorage.getItem("token");
    try {
      await axios.delete(`http://127.0.0.1:8000/api/cart/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      setCartItems(cartItems.filter((item) => item.id !== id)); // Hapus item dari state
      alert("Produk berhasil dihapus dari keranjang.");
    } catch (error) {
      console.error("Error removing item from cart:", error);
      alert("Gagal menghapus produk dari keranjang.");
    }
  };

  useEffect(() => {
    fetchCart();
  }, []);

  // Menghitung subtotal
  const calculateSubtotal = () => {
    return cartItems.reduce((total, item) => total + item.harga * item.jumlah, 0);
  };

  return (
    <>
      <Header />
      <div className={`${styles.cartContainer} page-content`}>
        {loading ? (
          <p>Loading...</p>
        ) : cartItems.length === 0 ? (
          <div className={styles.emptyCart}>
            <p>Keranjang kosong. </p>
            <Link to="/" className={styles.shopLink}>
              Belanja Sekarang
            </Link>
          </div>
        ) : (
          <>
            <div className="overflow-x-auto">
              <table className="min-w-full bg-white">
                <thead>
                  <tr>
                    <th className="py-2 px-4 border-b">Product</th>
                    <th className="py-2 px-4 border-b">Price</th>
                    <th className="py-2 px-4 border-b">Quantity</th>
                    <th className="py-2 px-4 border-b">Subtotal</th>
                    <th className="py-2 px-4 border-b">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {cartItems.map((item) => (
                    <tr key={item.id}>
                      <td className="py-2 px-4 border-b flex items-center">
                        <img
                          src={item.image || "https://via.placeholder.com/100"}
                          alt={item.nama || "Unknown"}
                          className="w-16 h-16 mr-4"
                        />
                        <span>{item.nama || "No Name"}</span>
                      </td>
                      <td className="py-2 px-4 border-b">Rp.{item.harga.toLocaleString()}</td>
                      <td className="py-2 px-4 border-b">{item.jumlah}</td>
                      <td className="py-2 px-4 border-b">
                        Rp.{(item.harga * item.jumlah).toLocaleString()}
                      </td>
                      <td className="py-2 px-4 border-b">
                        <button
                          onClick={() => handleRemove(item.id)}
                          className="bg-red-500 text-white px-2 py-1 rounded"
                        >
                          Remove
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="mt-8 border-t border-b border-black p-4">
              <div className="flex justify-between py-2">
                <span>Subtotal:</span>
                <span>Rp.{calculateSubtotal().toLocaleString()}</span>
              </div>
              <div className="flex justify-between py-2">
                <span>Shipping:</span>
                <span>Free</span>
              </div>
              <div className="flex justify-between py-2 font-bold">
                <span>Total:</span>
                <span>Rp.{calculateSubtotal().toLocaleString()}</span>
              </div>
            </div>

            <div className="mt-4 text-center">
              <button className={styles.button}>Checkout</button>
            </div>
          </>
        )}
      </div>
      <Footer />
    </>
  );
}
