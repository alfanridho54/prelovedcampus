import styles from '../assets/css/Service.module.css'
import delivery from '../assets/img/delivery.png'
import service from '../assets/img/service.png'
import security from '../assets/img/security.png'

function Service() {
    return (
    <section className={styles.service}>
  <div className={styles.serviceItem}>
    <div className={styles.iconContainer}>
      <img src={delivery} alt="Fast Delivery Icon" />
    </div>
    <h3>Fast Delivery</h3>
    <p>Fast and reliable delivery</p>
  </div>
  <div className={styles.serviceItem}>
    <div className={styles.iconContainer}>
      <img src={service} alt="Good Service Icon" />
    </div>
    <h3>Good Service</h3>
    <p>Ensuring customer satisfaction</p>
  </div>
  <div className={styles.serviceItem}>
    <div className={styles.iconContainer}>
      <img src={security} alt="Security Guarantee Icon" />
    </div>
    <h3>Security Guarantee</h3>
    <p>Ensuring security is fulfilled</p>
  </div>
</section>

    
    )
}


export default Service;