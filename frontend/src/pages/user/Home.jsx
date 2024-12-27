import Header from "../../components/user/Header";
import Home from "../../components/user/Home";
import Service from "../../components/user/Service";
import Footer from "../../components/user/Footer";
import ProdukPage from "../../components/user/ProdukPage";



export default function Homepage() {
   return (
      <div>
         <Header/>
         <Home />
         <ProdukPage />
         <Service />
         <Footer />
      </div>
   );
}