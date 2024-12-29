import styles from "../../assets/user/css/Home.module.css";
import banner from "../../assets/user/img/banner.png";
import { useState, useEffect } from "react";
import axios from "axios";

function Home() {
  const [kategori, setKategori] = useState([]);

  useEffect(() => {
    const fetchKategori = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/kategori-produk");
        if (response.data.success) {
          setKategori(response.data.data);
        } else {
          console.error("Gagal memuat data kategori");
        }
      } catch (error) {
        console.error("Error fetching categories:", error.message);
      }
    };

    fetchKategori();
  }, []);

  return (
    <div className={styles.container}>
      <aside className={styles.sidebar}>
        <ul>
          {kategori.map((item) => (
            <li key={item.id}>{item.kategori}</li>
          ))}
        </ul>
      </aside>

      {/* <!-- Konten Utama --> */}
      <section className={styles.mainContent}>
        <div className={styles.banner}>
          <div className={styles.bannerText}>
            <h1>
              From <span className={styles.highlight}>Students</span>
              <br />
              To <span className={styles.highlight}>Students</span>
            </h1>
            <button className={styles.tryNow}>Try Now!</button>
          </div>
          <div className={styles.bannerImage}>
            <img
              src={banner}
              alt="Transaction Illustration"
            />
          </div>
        </div>
      </section>
    </div>

  );
}

export default Home;

