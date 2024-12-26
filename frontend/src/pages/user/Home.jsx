import Header from "../../components/user/Header";
import Home from "../../components/user/Home";
import Category from "../../components/user/Category";
import Produk from "../../components/user/Produk";
import Service from "../../components/user/Service";
import Footer from "../../components/user/Footer";



export default function Homepage() {
   return (
      <div>
         <Header/>
         <Home />
         <Category />
         <Produk />
         <Service />
         <Footer />
      </div>
   );
}