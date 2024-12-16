import LayoutAdmin from './layout/admin/index.jsx'
import Dashboard from './pages/admin/Dashboard.jsx'
import { Route, Routes } from 'react-router-dom'
import UserTable from './pages/admin/UserTable.jsx'
import Kesatuan from './pages/admin/kesatuan/Kesatuan.jsx'
import Personel from './pages/admin/personel/Personel.jsx'
import Produk from './pages/admin/produk/Produk.jsx'
import AddProduk from './pages/admin/produk/AddProduk.jsx'
import EditProduk from './pages/admin/produk/UpdateProduk.jsx'

function App() {
  return (
    
    <LayoutAdmin>
    <Routes>
      <Route path="/" element={<Dashboard />} />
      <Route path="/produk" element={<Produk />}></Route>
      <Route path="/produk/create" element={<AddProduk />}></Route>
      <Route path='/produk/update/:id' element={<EditProduk />}></Route>
      <Route path='/user' element={<UserTable />}></Route>
      <Route path='/kesatuan' element={<Kesatuan />}></Route>
      <Route path='/personel' element={<Personel />}></Route>
    </Routes>
    </LayoutAdmin>

  )
}

export default App
