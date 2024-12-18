import { Link } from 'react-router-dom';
import styles from '../assets/css/SignUp.module.css';

export default function SignUpPage() {
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
            <main className={styles.signUpContent}>
                <h1>Create an Account</h1>
                <p>Join our community and start shopping for your favorite preloved items today!</p>
                
                <form className={styles.signUpForm}>
                    <div className={styles.formGroup}>
                        <label htmlFor="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="Enter your username" required />
                    </div>
                    <div className={styles.formGroup}>
                        <label htmlFor="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required />
                    </div>
                    <div className={styles.formGroup}>
                        <label htmlFor="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required />
                    </div>
                    <div className={styles.formGroup}>
                        <label htmlFor="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required />
                    </div>
                    <button type="submit" className={styles.submitButton}>Sign Up</button>
                </form>

                <p className={styles.signInLink}>
                    Already have an account? <Link to="/login">Sign In</Link>
                </p>
            </main>
        </>
    );
}
