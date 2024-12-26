import { useState, useEffect } from "react";
import axios from "axios";
import styles from "../../assets/user/css/Category.module.css";

const Category = () => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [kategori, setKategori] = useState([]);

  // Ambil data kategori produk dari API
  const fetchKategori = async () => {
    try {
      const response = await axios.get("http://127.0.0.1:8000/api/kategori-produk");
      if (response.data.success) {
        setKategori(response.data.data);
      } else {
        setError("Data kategori tidak ditemukan.");
      }
    } catch (error) {
      setError("Gagal memuat data kategori.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchKategori();
  }, []);

  return (
    <div className={styles.categoryContainer}>
      <div className={styles.header}>
        <div className={styles.dot}></div>
        <h2 className={styles.headerTitle}>Our Categories</h2>
      </div>
      <h1 className={styles.mainTitle}>Explore Our Categories</h1>
      <div className={styles.featureContainer}>
        {loading ? (
          <p>Loading...</p>
        ) : error ? (
          <p className={styles.errorText}>{error}</p>
        ) : (
          kategori.map((item, index) => (
            <div key={item.id} className={styles.featureItem}>
              <i className={`fas fa-tag ${styles.icon}`}></i>
              <p className={styles.featureText}>{item.kategori}</p>
            </div>
          ))
        )}
      </div>
    </div>
  );
};

export default Category;
