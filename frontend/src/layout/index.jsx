import Home from '../component/Home';  
import Header from '../component/Header';
import Footer from '../component/Footer';
import Category from '../component/Category';
import Service from '../component/Service';
import Produk from '../component/Produk';

export default function Layout() {
   return (
      <div>
         <Header />
         <Home />
         <Category />
         <Produk />
         <Service />
         <Footer />
      </div>
   );
}
