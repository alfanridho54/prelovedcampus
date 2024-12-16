import styles from '../assets/css/Header.module.css';



function Header(){
       return (
              <header>
                      <nav className={styles.navbar} >
                            <div className={styles.logo}>
                                   <a href="#">PRELOVED</a>
                            </div>
                            <ul className={styles.navLinks}>
                                   <li><a href="">Home</a></li>
                                   <li><a href="">Contact</a></li>
                                   <li><a href="">About</a></li>
                                   <li><a href="">Sign Up</a></li>
                            </ul>
                            <div className={styles.search}>
                                   <input type="text" placeholder='What are you looking for?' />
                                   <button><span>🔍</span></button>
                            </div>
                            {/* <div className={styles.icons}>
                                   <span>♡</span>
                                   <span>🛒</span>
                            </div> */}
                     </nav>
                     <hr />
              </header>
            
             
       )
}

export default Header;