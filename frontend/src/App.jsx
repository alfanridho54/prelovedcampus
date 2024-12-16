// import './App.css';
import './assets/css/global.css'
import Home from './component/Home';
import About from './component/About';
import Header from './component/Header';
import Footer from './component/Footer';
import Produk from './component/Produk';
import Service from './component/Service';


function App() {
  return (
    <>
      <div>
        <Header />
        <Home />
        <Service />
        {/* <About /> */}

        <Footer />
      
      </div>
      
    </>
  );
}

export default App;
