import './App.css';
import Home from './component/Home';
import About from './component/About';
import Header from './component/Header';
import Footer from './component/Footer';
import Produk from './component/Produk';


function App() {
  return (
    <>
    <div>
      Hallo ini tampilan website pertama kita
    </div>
      <div>
        <Header />
        <Home />
        <About />
        <Produk />
        <Footer />
      </div>
      
    </>
  );
}

export default App;
