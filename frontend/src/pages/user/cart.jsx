import { useEffect, useState } from "react";
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
          <h1>Daftar Belanja</h1>
          <table>
            <thead>
              <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
                  {cartItems.map((item) => (
                    <tr key={item.id}>
                      <td>
                        <img
                          src={item.lokasi_gambar || "https://via.placeholder.com/100"}
                           />
                       <span>{item.produk_nama || "No Name"}</span>
                      </td>
                      <td>Rp.{item.harga.toLocaleString()}</td>
                      <td>{item.jumlah}</td>                      
                      <td>
                        Rp.{(item.harga * item.jumlah).toLocaleString()}
                      </td>
                      <td>
                         <button
                            onClick={() => handleRemove(item.id)}
                            className={styles.btnDanger}>
                            Remove
                        </button>
                      </td>
                      </tr>
                  ))}
              </tbody>
          </table>
          <div className={styles.orderTotal}>Order Total: Rp.{calculateSubtotal().toLocaleString()} </div>
          <div className={styles.btn}>
                   <button className={styles.btnPrimary}>Check Out</button>
          </div>
           
          </>
          )}
        </div>
      <Footer />
    </>
  );
}