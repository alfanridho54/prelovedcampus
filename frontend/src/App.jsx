
import Layout from './layout/admin/Index'
import Dashboard from './pages/admin/Dashboard'
// import './App.css'
import { Routes, Route } from 'react-router-dom'
import Produk from './pages/admin/produk/Produk'
import AddProduk from './pages/admin/produk/AddProduk'
import EditProduk from './pages/admin/produk/EditProduk'
import Login from './pages/admin/Login'
import Register from './pages/admin/Register'
import Kategori from './pages/admin/kategori/Kategori'
import AddKategori from './pages/admin/kategori/AddKategori'
import EditKategori from './pages/admin/kategori/EditKategori'
function App() {
  return (
  <>
    <Routes>
      <Route path='/'element={<Login/>}></Route>
      <Route path='/register'element={<Register />}></Route>

      <Route element={<Layout />}>
      <Route path='/dashboard' element={<Dashboard/>}></Route>
      <Route path='/produk' element={<Produk/>}></Route>
      <Route path='/produk/edit/:id' element={<EditProduk/>}></Route>
      <Route path='/produk/create' element={<AddProduk/>}></Route>

      <Route path='/kategori' element={<Kategori/>}></Route>
      <Route path='/kategori/create' element={<AddKategori/>}></Route>
      <Route path='/kategori/edit/:id' element={<EditKategori/>}></Route>
      </Route>
      


    </Routes>
    </>
  )
}

export default App
