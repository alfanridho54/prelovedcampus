import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/user/css/Produk.module.css";

export default function ProdukList({ selectedCategory }) {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [produk, setProduk] = useState([]);

  const fetchProduk = async (categoryId) => {
    try {
      const url = categoryId
        ? `http://127.0.0.1:8000/api/produk?kategori=${categoryId}` // Jika kategori dipilih, tampilkan produk berdasarkan kategori
        : "http://127.0.0.1:8000/api/produk"; // Jika tidak ada kategori, tampilkan semua produk
      const response = await axios.get(url);
  
      if (response.data.success) {
        setProduk(response.data.data); // Menyimpan data produk
      } else {
        setError("Data produk tidak ditemukan.");
      }
    } catch (error) {
      setError("Gagal memuat data produk.");
    } finally {
      setLoading(false);
    }
  };
  

  useEffect(() => {
    // Jika kategori belum dipilih (null), muat semua produk
    if (selectedCategory !== null) {
      fetchProduk(selectedCategory); // Muat produk berdasarkan kategori yang dipilih
    } else {
      fetchProduk(); // Muat semua produk jika tidak ada kategori yang dipilih
    }
  }, [selectedCategory]); // Efek ini dipicu setiap kali selectedCategory berubah
  

  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div className={styles.dot}></div>
        <h2 className={styles.headerTitle}>Our Products</h2>
      </div>
      <h1 className={styles.mainTitle}>Explore Our Products</h1>

      <div className={styles.grid}>
        {loading ? (
          <p>Loading...</p>
        ) : error ? (
          <p className={styles.errorText}>{error}</p>
        ) : (
          produk.map((product) => (
            <div key={product.id} className={styles.card}>
              <Link to={`/detail-produk/${product.id}`}>
                <img
                  src={product.lokasi_gambar || "https://via.placeholder.com/150"}
                  alt={product.nama}
                  className="img-thumbnail"
                />
                <h3>{product.nama}</h3>
                <p>{product.harga}</p>
              </Link>
            </div>
          ))
        )}
      </div>
    </div>
  );
}
