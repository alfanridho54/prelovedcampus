import { Link } from 'react-router-dom';
import styles from '../../assets/user/css/About.module.css';
import Header from '../../components/user/Header';
import Footer from '../../components/user/Footer';

export default function About() {
  return (
    <>
      
      <Header />
      {/* Konten About */}
      <main className={styles.aboutContent} role="main">
        <h1>About Us</h1>
        <p>
          Welcome to <strong>PRELOVED</strong> - your trusted marketplace for high-quality second-hand items. We are committed to providing a platform that connects buyers and sellers who value sustainability, affordability, and style.
          At PRELOVED, we believe in the power of reuse and recycling to create a more sustainable future. Explore our wide range of categories, from fashion and accessories to home decor and gadgets, and discover unique items that fit your needs and preferences.
        </p>
        <p>
          At PRELOVED, we believe in the power of reuse and recycling to create a more sustainable future. 
          Explore our wide range of categories, from fashion and accessories to home decor and gadgets, 
          and find unique items that suit your needs and preferences.
        </p>
        <h2>Our Mission</h2>
        <p>
          Our mission is to make sustainable shopping accessible to everyone. By promoting the reuse of second-hand goods, we aim to reduce waste and support an eco-friendly lifestyle.
        </p>
        <h2>Contact Us</h2>
        <p>
          Have questions or feedback? Get in touch with our team through the <Link to="/contact">Contact</Link> page. 
          We’re here to help!
        </p>
      </main>

      <Footer />
    </>
  );
}
