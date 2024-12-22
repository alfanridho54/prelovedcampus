import { Fragment } from 'react'
import Header from '../../components/admin/Header'
import Sidebar from '../../components/admin/Sidebar'
import Footer from '../../components/admin/Footer'
import Protected from '../../pages/admin/ProtectedRoute'

function Layout({children}){
    return(
        <Fragment>
        <Header />
        <div id="layoutSidenav" style={{width: '215vh'}} >
            <Sidebar />
            <div id="layoutSidenav_content" style={{height: '100px'}}>
                <main>
                    <Protected>

                    {children}
                    </Protected>
                </main>
                <Footer />
            </div>
        </div>
    </Fragment>
    )
}
export default Layout