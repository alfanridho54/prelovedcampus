import styles from "../assets/css/Home.module.css";
import banner from "../assets/img/banner.png";
function Home() {
  return (
    <div className={styles.container}>
      <aside className={styles.sidebar}>
        <ul>
          <li>Menswear</li>
          <li>Womenswear</li>
          <li>Electronics</li>
          <li>Furniture</li>
          <li>Books & Stationery</li>
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
