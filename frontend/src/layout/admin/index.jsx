import { Fragment } from 'react';
import Header from '../../components/admin/Header';
import Sidebar from '../../components/admin/Sidebar';
import Footer from '../../components/admin/Footer';

function LayoutAdmin({ children }) {
  return (
    <Fragment>
      <Header />
      <div id="layoutSidenav">
          <Sidebar />
       
        <div id="layoutSidenav_content">
          <main>
            
              {children}
          </main>
          <Footer />
          </div>
        </div>
      
    </Fragment>
  );
}

export default LayoutAdmin;
