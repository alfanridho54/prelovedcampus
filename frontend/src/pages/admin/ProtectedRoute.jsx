import { Navigate, Outlet } from "react-router-dom";

const PrivateRoute = ({ children, token }) => {
    
    return token ? children : <Navigate to="/" />
}

const Protected = () => {
    const token = localStorage.getItem("token");
    return(
        <PrivateRoute token={token}>
            <Outlet />
        </PrivateRoute>
    )
}

export default Protected