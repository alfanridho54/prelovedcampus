import styles from '../assets/css/Container.css'
function Container({ children }) {
    return (
        <div className={styles.container}>
            {children}
        </div>
    );
}

export default Container;