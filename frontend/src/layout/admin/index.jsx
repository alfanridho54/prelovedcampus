import { Fragment } from 'react';
import Header from '../../components/admin/Header';
import Sidebar from '../../components/admin/Sidebar';
import Footer from '../../components/admin/Footer';
import Protected from '../../pages/admin/ProtectedRoute';

function Layout({ children }) {
  return (
    <Fragment>
      <div id="wrapper">
        <Sidebar />
        <div id="content-wrapper" className="d-flex flex-column">
          <div id="content" >
            <Header />
            <Protected>
              {children}
            </Protected>
          </div>
          <Footer />
        </div>
      </div>
    </Fragment>
  );
}

export default Layout;
