import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/user/css/Produk.module.css";

export default function ProdukList() {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [produk, setProduk] = useState([]);

  // Fetch data produk
  const fetchProduk = async () => {
    try {
      const response = await axios.get("http://127.0.0.1:8000/api/produk");
      if (response.data.success) {
        setProduk(response.data.data);
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
    fetchProduk();
  }, []);

  return (
    <div className={styles.container}>
      {/* Header */}
      <div className={styles.header}>
        <div className={styles.dot}></div>
        <h2 className={styles.headerTitle}>Our Products</h2>
      </div>
      <h1 className={styles.mainTitle}>Explore Our Products</h1>

      {/* Grid Product */}
      <div className={styles.grid}>
        {loading ? (
          <p>Loading...</p>
        ) : error ? (
          <p className={styles.errorText}>{error}</p>
        ) : (
          produk.map((product) => (
            <div key={product.id} className={styles.card}>
              <Link to={`/PesanProduk/${product.id}`}>
                <img
                  src={product.img}
                  alt={product.name}
                  className={styles.productImage}
                />
                <h3>{product.name}</h3>
                <p>{product.price}</p>
              </Link>
            </div>
          ))
        )}
      </div>

      {/* Button to Navigate to All Products */}
      <div className={styles.buttonContainer}>
        <Link to="/all-products">
          <button className={styles.button}>View All Products</button>
        </Link>
      </div>
    </div>
  );
}
