import { Navigate, Outlet } from "react-router-dom";

// Fungsi untuk memeriksa role dan mengarahkan berdasarkan role
const PrivateRoute = ({ children, token, userRole }) => {
    if (!token) {
        return <Navigate to="/" />;
    }

    // Mengarahkan berdasarkan role
    if (userRole === "admin") {
        return <Navigate to="/dashboard" />;
    } else if (userRole === "penjual" || userRole === "customer" || userRole === "guest") {
        return <Navigate to="/home" />; // Ganti '/home' dengan rute yang sesuai
    }

    return children;
};

const Protected = () => {
    const token = localStorage.getItem("token");
    const userRole = JSON.parse(localStorage.getItem("userRole")); // Mendapatkan role pengguna dari localStorage

    return (
        <PrivateRoute token={token} userRole={userRole}>
            <Outlet />
        </PrivateRoute>
    );
};

export default Protected;
