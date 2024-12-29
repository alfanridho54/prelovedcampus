import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/user/css/Checkout.module.css";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";

export default function Checkout() {
  const [cartItems, setCartItems] = useState([]); // Data keranjang
  const [loading, setLoading] = useState(true); // State untuk loading
  const [metodePembayaran, setMetodePembayaran] = useState(""); // Metode pembayaran
  const [subtotal, setSubtotal] = useState(0); // Subtotal
  const navigate = useNavigate();

  // Ambil data keranjang
  const fetchCart = async () => {
    const token = localStorage.getItem("token");
    const user = JSON.parse(localStorage.getItem("user")); // Data user dari localStorage

    if (!token || !user) {
      alert("Anda harus login untuk melakukan checkout.");
      navigate("/login");
      return;
    }

    try {
      const response = await axios.get(`http://127.0.0.1:8000/api/cart/${user.id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      const items = response.data.data;
      setCartItems(items);
      const total = items.reduce((acc, item) => acc + item.harga * item.jumlah, 0);
      setSubtotal(total);
    } catch (error) {
      console.error("Error fetching cart:", error);
      alert("Gagal memuat keranjang.");
    } finally {
      setLoading(false);
    }
  };

  // Kirim transaksi
  const handleCheckout = async () => {
    const token = localStorage.getItem("token");
    const user = JSON.parse(localStorage.getItem("user")); // Data user dari localStorage
  
    if (!metodePembayaran) {
      alert("Pilih metode pembayaran terlebih dahulu.");
      return;
    }

    try {
      // Cek data profil user
      const response = await axios.get("http://127.0.0.1:8000/api/user/me", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
  
      console.log("Profil User:", response.data);
  
      const userProfile = response.data.data;
  
      if (!userProfile.alamat || userProfile.alamat.trim() === "") {
        alert("Anda harus mengisi alamat terlebih dahulu sebelum checkout.");
        navigate("/profile"); // Arahkan ke halaman pengaturan profil
        return;
      }
    } catch (error) {
      console.error("Error fetching user profile:", error);
      alert("Gagal memuat profil user.");
      return;
    }
  
    try {
      const response = await axios.post(
        "http://127.0.0.1:8000/api/cart/checkout",
        {
          user_id: user.id,
          metode_pembayaran: metodePembayaran,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
  
      if (response.data.success) {
        // Menyimpan data transaksi
        const orderDetails = response.data.data; // Misalnya, respons berisi informasi transaksi
        alert("Checkout berhasil!");
        navigate("/checkout-success", { state: { orderDetails } }); // Mengirimkan data transaksi ke halaman checkout-success
      } else {
        alert(response.data.message || "Checkout gagal.");
      }
    } catch (error) {
      console.error("Error during checkout:", error);
      alert("Gagal melakukan checkout.");
    }
  };
  

  useEffect(() => {
    fetchCart();
  }, []);

  return (
    <>
      <Header />
      <div className={`${styles.checkoutContainer} page-content`}>
        {loading ? (
          <p>Loading...</p>
        ) : cartItems.length === 0 ? (
          <div className={styles.emptyCart}>
            <p>Keranjang kosong. </p>
            <button onClick={() => navigate("/")} className={styles.shopLink}>
              Belanja Sekarang
            </button>
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
                  </tr>
                </thead>
                <tbody>
                  {cartItems.map((item) => (
                    <tr key={item.id}>
                      <td className="py-2 px-4 border-b flex items-center">
                        <img
                          src={item.lokasi_gambar || "https://via.placeholder.com/100"}
                          alt={item.produk_nama || "Unknown"}
                          className="w-16 h-16 mr-4"
                        />
                        <span>{item.produk_nama || "No Name"}</span>
                      </td>
                      <td className="py-2 px-4 border-b">Rp.{item.harga.toLocaleString()}</td>
                      <td className="py-2 px-4 border-b">{item.jumlah}</td>
                      <td className="py-2 px-4 border-b">
                        Rp.{(item.harga * item.jumlah).toLocaleString()}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="mt-8 border-t border-b border-black p-4">
              <div className="flex justify-between py-2">
                <span>Subtotal:</span>
                <span>Rp.{subtotal.toLocaleString()}</span>
              </div>
              <div className="flex flex-col py-2">
                <label htmlFor="metodePembayaran" className="font-bold mb-2">
                  Pilih Metode Pembayaran:
                </label>
                <select
                  id="metodePembayaran"
                  value={metodePembayaran}
                  onChange={(e) => setMetodePembayaran(e.target.value)}
                  className="border p-2 rounded"
                >
                  <option value="">Pilih</option>
                  <option value="Transfer Bank">Transfer Bank</option>
                  <option value="COD">Cash On Delivery (COD)</option>
                </select>
              </div>
              <button
                className={`${styles.button} mt-4`}
                onClick={handleCheckout}
              >
                Checkout
              </button>
            </div>
          </>
        )}
      </div>
      <Footer />
    </>
  );
}
