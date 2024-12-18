import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import '@fortawesome/fontawesome-free/css/all.min.css';
import './assets/css/global.css';
import About from './pages/About';
import Contact from './pages/Contact';
import AllProduk from './components/ProdukList';
import PesanProduk from './components/PesanProduk';
import Home from './pages/Home';
import SignUp from './pages/SignUp';


function App() {
  return (
    <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/contact" element={<Contact />} />
          <Route path='/SignUp' element={<SignUp/>}/>
          <Route path="/all-products" element={<AllProduk />} />
          <Route path="/PesanProduk/:id" element={<PesanProduk />} />
        </Routes>
    </Router>
  );
}

export default App;
