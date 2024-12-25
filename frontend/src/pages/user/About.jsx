import { Link } from 'react-router-dom';
import styles from '../../assets/user/css/About.module.css';

export default function About() {
  return (
    <>
      {/* Header */}
      <header>
        <nav className={styles.navbar}>
          <div className={styles.logo}>
            <Link to="/">PRELOVED</Link>
          </div>
          <ul className={styles.navLinks}>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <li><Link to="/SignUp">Sign Up</Link></li>
          </ul>
          <div className={styles.container}>
            {/* Search Bar */}
            <div className={styles.searchBar}>
              <input type="text" placeholder="What are you looking for?" />
              <i className="fas fa-search"></i>
            </div>
            {/* Icons */}
            <div className={styles.icons}>
              <i className="far fa-heart" title="Favorite"></i>
              <i className="fas fa-shopping-cart" title="Cart"></i>
            </div>
          </div>
        </nav>
        <hr />
      </header>

      {/* Konten About */}
      <main className={styles.aboutContent}>
        <h1>About Us</h1>
        <p>
          Welcome to <strong>PRELOVED</strong>Pasar tepercaya Anda untuk barang bekas berkualitas tinggi. Kami berkomitmen untuk menyediakan platform yang menghubungkan pembeli dan penjual yang menghargai keberlanjutan, keterjangkauan, dan gaya.
Di PRELOVED, kami percaya pada kekuatan penggunaan kembali dan daur ulang untuk menciptakan masa depan yang lebih berkelanjutan. Jelajahi berbagai kategori kami, mulai dari fashion dan aksesoris hingga dekorasi rumah dan gadget, dan temukan barang-barang unik yang sesuai dengan kebutuhan dan preferensi Anda.
        </p>
        <p>
        Di PRELOVED, kami percaya pada kekuatan penggunaan ulang dan daur ulang untuk menciptakan masa depan yang lebih berkelanjutan. 
          Jelajahi berbagai kategori kami, mulai dari mode dan aksesori hingga dekorasi rumah dan gadget, 
          dan temukan barang-barang unik yang sesuai dengan kebutuhan dan preferensi Anda.
        </p>
        <h2>Our Mission</h2>
        <p>
        Misi kami adalah membuat belanja berkelanjutan dapat diakses oleh semua orang. Dengan mempromosikan penggunaan kembali barang-barang bekas, kami bertujuan untuk mengurangi limbah dan mendukung gaya hidup ramah lingkungan.
        </p>
        <h2>Contact Us</h2>
        <p>
        Ada pertanyaan atau masukan? Hubungi tim kami melalui halaman <Link to="/contact">Contact</Link> page. 
        Kami di sini untuk membantu!
        </p>
      </main>
    </>
  );
}
