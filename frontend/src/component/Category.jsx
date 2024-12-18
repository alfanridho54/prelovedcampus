import features from '../utils/Category';
import styles from '../assets/css/Category.module.css'; 
export default function Category() {
    return (
      <div>
      <div className={styles.header}>
        <div className={styles.dot}></div>
        <h2 className={styles.headerTitle}>Our Products</h2>
      </div>
      <h1 className={styles.mainTitle}>Explore Our Products</h1>
        <div className={styles.featureContainer}>
            {features.map((feature, index) => (
                <div key={index} className={styles.featureItem}>
                    <i className={`${feature.icon} ${styles.icon}`}></i>
                    <p className={styles.featureText}>{feature.text}</p>
                </div>
            ))}
        </div>
      </div>
    );
}
