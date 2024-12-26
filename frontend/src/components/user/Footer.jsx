import { Link } from 'react-router-dom'; 
import styles from '../../assets/user/css/Footer.module.css';

function Footer() {
    return (
        <footer className={styles.footer}>
            <div className={styles.footerContent}>
                <div className={styles.footerSection}>
                    <h3>Our Products</h3>
                    <ul>
                        <li><a href="#">Menswear</a></li>
                        <li><a href="#">Womenswear</a></li>
                        <li><a href="#">Electronics</a></li>
                        <li><a href="#">Furniture</a></li>
                        <li><a href="#">Books & Stationery </a></li>
                    </ul>
                </div>
                
                <div className={styles.footerSection}>
                    <h3>Quick Links</h3>
                    <ul>
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/about">About</Link></li>
                    <li><Link to="/contact">Contact</Link></li>
                    <li><Link to="/SignUp">Sign Up</Link></li>
                    </ul>
                </div>

                <div className={styles.footerSection}>
                    <h3>Follow Us</h3>
                    <div className={styles.socialIcons}>
                        <a href="#" className={styles.socialIcon}>Facebook</a>
                        <a href="#" className={styles.socialIcon}>Instagram</a>
                        <a href="#" className={styles.socialIcon}>Twitter</a>
                    </div>
                </div>

                <div className={styles.footerSection}>
                    <h3>Contact Us</h3>
                    <p>Email: support@prelovedcampus.com</p>
                    <h5>Jln. Lenteng Agung Raya no.20 RT.5/RW.1 Lenteng agung srengseng sawah, kecematan.jagakarsa, kota Jakarta Selatan, Daerah khusus ibukota jakarta selatan</h5>
                </div>
            </div>

            <div className={styles.footerBottom}>
                <p>&copy; 2024 PrelovedCampus. All rights reserved.</p>
            </div>
        </footer>
    );
}

export default Footer;
