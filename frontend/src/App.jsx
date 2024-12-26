import Layout from './layout/admin/Index';
import Dashboard from './pages/admin/Dashboard';
import { Routes, Route } from 'react-router-dom';
import Produk from './pages/admin/produk/Produk';
import AddProduk from './pages/admin/produk/AddProduk';
import EditProduk from './pages/admin/produk/EditProduk';
import Login from './pages/user/Login';
import Register from './pages/user/Register';
import Cart from './pages/user/Cart';
import Kategori from './pages/admin/kategori/Kategori';
import AddKategori from './pages/admin/kategori/AddKategori';
import EditKategori from './pages/admin/kategori/EditKategori';
import Transaksi from './pages/admin/transaksi/Transaksi';
import Protected from './pages/admin/ProtectedRoute'; // Import Protected
import About from './pages/user/About';
import Contact from './pages/user/Contact';
import Home from './pages/user/Home';
import DetailProduk from './pages/user/DetailProduk';


function App() {
  return (
    <>
      <Routes>
      
        <Route path='/' element={<Home/>}/>
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/cart" element={<Cart />} />
        <Route path='/about' element={<About/>}></Route>
        <Route path='/contact' element={<Contact/>}></Route>
        <Route path='/detail-produk/:id' element={<DetailProduk/>}></Route>
      

          <Route element={<Layout />}>
        <Route element={<Protected />}>  
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/produk" element={<Produk />} />
            <Route path="/produk/edit/:id" element={<EditProduk />} />
            <Route path="/produk/create" element={<AddProduk />} />
            <Route path="/kategori" element={<Kategori />} />
            <Route path="/kategori/create" element={<AddKategori />} />
            <Route path="/kategori/edit/:id" element={<EditKategori />} />
            <Route path="/transaksi" element={<Transaksi />} />
          </Route>
        </Route>
      </Routes>
    </>
  );
}

export default App;
