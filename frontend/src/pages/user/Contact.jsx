import { Link } from 'react-router-dom';
import styles from '../../assets/user/css/Contact.module.css';

export default function ContactPage() {
    return (
        <>
            <header>
                <nav className={styles.navbar}>
                    <div className={styles.logo}>
                        <a href="#">PRELOVED</a>
                    </div>
                    <ul className={styles.navLinks}>
                        <li><Link to="/">Home</Link></li>
                        <li><Link to="/about">About</Link></li>
                        <li><Link to="/contact">Contact</Link></li>
                        <li><Link to="/SignUp">Sign Up</Link></li>
                    </ul>
                    <div className={styles.container}>
                        <div className={styles.searchBar}>
                            <input type="text" placeholder="What are you looking for?" />
                            <i className="fas fa-search"></i>
                        </div>
                        <div className={styles.icons}>
                            <i className="far fa-heart" title="Favorite"></i>
                            <i className="fas fa-shopping-cart" title="Cart"></i>
                        </div>
                    </div>
                </nav>
                <hr />
            </header>

            <main className={styles.contactContent}>
                <h1>Contact Us</h1>
                <p>
                Ada pertanyaan atau butuh bantuan? Jangan ragu untuk menghubungi kami. Tim kami siap membantu Anda.
                </p>
                <h2>Contact Information</h2>
                <p><strong>Email:</strong>  support@prelovedcampus.com</p>
                <p><strong>Phone:</strong> 089238472023</p>
                <h2>Office Address</h2>
                <p>Jln. Lenteng Agung Raya no.20 RT.5/RW.1 Lenteng agung srengseng sawah, kecematan.jagakarsa, kota Jakarta Selatan, Daerah khusus ibukota jakarta selatan</p>
                <h2>Operating Hours</h2>
                <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                <p>Saturday - Sunday: Closed</p>
                <h2>Contact Form</h2>
                <form className={styles.contactForm}>
                    <div className={styles.formGroup}>
                        <label htmlFor="name">Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter your name" required />
                    </div>
                    <div className={styles.formGroup}>
                        <label htmlFor="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required />
                    </div>
                    <div className={styles.formGroup}>
                        <label htmlFor="message">Message</label>
                        <textarea id="message" name="message" rows="4" placeholder="Enter your message" required></textarea>
                    </div>
                    <button type="submit" className={styles.submitButton}>Send Message</button>
                </form>
            </main>
        </>
    );
}
