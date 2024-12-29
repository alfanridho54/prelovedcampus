import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";
import styles from "../../assets/user/css/DetailProduk.module.css"; // CSS module untuk styling

function DetailProduk() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [produk, setProduk] = useState(null);
  const [jumlah, setJumlah] = useState(1); // Jumlah produk yang ingin ditambahkan ke keranjang
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchProduk = async () => {
      try {
        const response = await axios.get(`http://127.0.0.1:8000/api/produk/${id}`);
        if (response.data.success) {
          setProduk(response.data.data);
        } else {
          alert("Produk tidak ditemukan.");
          navigate("/");
        }
      } catch (error) {
        console.error("Error fetching product:", error);
        alert("Gagal memuat data produk.");
      } finally {
        setLoading(false);
      }
    };

    fetchProduk();
  }, [id, navigate]);

  const handleAddToCart = async () => {
    const token = localStorage.getItem("token");
    const userString = localStorage.getItem("user");

    if (!token || !userString) {
      alert("Anda harus login untuk menambahkan ke keranjang.");
      navigate("/login");
      return;
    }

    let user;
    try {
      user = JSON.parse(userString);
    } catch (error) {
      alert("Data user tidak valid. Silakan login ulang.");
      navigate("/login");
      return;
    }

    try {
      await axios.post(
        "http://127.0.0.1:8000/api/cart",
        {
          user_id: user.id,
          produk_id: produk.id,
          jumlah: jumlah,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      alert("Produk berhasil ditambahkan ke keranjang!");
      navigate("/cart");
    } catch (error) {
      alert("Gagal menambahkan produk ke keranjang.");
    }
  };

  const handleBuyNow = async () => {
    const token = localStorage.getItem("token");
    const userString = localStorage.getItem("user");

    if (!token || !userString) {
      alert("Anda harus login untuk melakukan checkout.");
      navigate("/login");
      return;
    }

    let user;
    try {
      user = JSON.parse(userString);
    } catch (error) {
      alert("Data user tidak valid. Silakan login ulang.");
      navigate("/login");
      return;
    }

    try {
      // Kirim data untuk checkout
      const response = await axios.post(
        "http://127.0.0.1:8000/api/checkout", // Sesuaikan dengan endpoint checkout
        {
          user_id: user.id,
          produk_id: produk.id,
          jumlah: jumlah,
          metode_pembayaran: "Cash on Delivery", // Sesuaikan dengan metode pembayaran yang Anda pilih
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (response.data.success) {
        alert("Checkout berhasil!");
        navigate("/checkout"); // Redirect ke halaman checkout
      } else {
        alert("Gagal melakukan checkout.");
      }
    } catch (error) {
      console.error("Error during checkout:", error);
      alert("Terjadi kesalahan saat checkout.");
    }
  };

  if (loading) {
    return <p>Loading...</p>;
  }

  if (!produk) {
    return <p>Produk tidak ditemukan.</p>;
  }

  return (
    <>
      <Header />

      <div className={styles.cardContainer}>
        <div className={styles.breadcrump}>Home / Product</div>
        <div className={styles.card}>
          <div className={styles.cardImage}>
            <img src={produk.lokasi_gambar} alt={produk.nama} className={styles.cardImage} />
          </div>
          <div className={styles.cardContent}>
            <h2 className={styles.cardTitle}>{produk.nama}</h2>
            <p className={styles.cardPrice}>Rp.{produk.harga.toLocaleString()}</p>
            <p className={styles.cardDescription}>{produk.deskripsi}</p>
            <p className={styles.cardPenjual}>Dijual oleh: {produk.penjual_nama}</p>

            {/* Tombol Buy Now (langsung ke checkout) */}
            <button className={styles.btnBuy} onClick={handleBuyNow}>Buy Now</button>

            <div className={styles.quantity}>
              <label>
                Jumlah:
                <input
                  type="number"
                  value={jumlah}
                  onChange={(e) => setJumlah(Number(e.target.value))}
                  min="1"
                  max={produk.stok}
                />
              </label>
            </div>

            <div className={styles.cardIcons}>
              {/* Tombol cart untuk menambahkan produk ke keranjang */}
              <button className={styles.btnBuy} onClick={handleAddToCart}>
                <i className="fa fa-shopping-cart"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </>
  );
}

export default DetailProduk;

