import { Link } from 'react-router-dom'; // Ensure you are importing Link
import Produk from '../utils/Produk'; 
import styles from '../assets/css/Produk.module.css';

export default function ProdukList() {
  const products = Produk; 

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
          {products.map((product, index) => (
            <div key={index} className={styles.card}>
              <Link to={`/PesanProduk/${product.id}`}>
                <img src={product.img} alt={product.name} />
                <h3>{product.name}</h3>
                <p>{product.price}</p>
              </Link>
            </div>
        ))}
      </div>

      {/* Button to Navigate to All Products */}
      <div className={styles.buttonContainer}>
        <Link to="/all-products">
          <button className={styles.button}>View All Product</button>
        </Link>
      </div>
    </div>
  );
}
