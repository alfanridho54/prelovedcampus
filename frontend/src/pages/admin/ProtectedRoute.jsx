import { Navigate, Outlet } from "react-router-dom";

const Protected = () => {
    const token = localStorage.getItem("token");
    const userRole = localStorage.getItem("role"); // Ambil role dari localStorage

    if (!token) {
        // Jika tidak ada token, arahkan ke halaman login
        return <Navigate to="/login" />;
    }

    if (userRole !== "admin") {
        // Jika bukan admin, arahkan ke halaman utama
        return <Navigate to="/" />;
    }

    // Jika admin, izinkan akses
    return <Outlet />;
};

export default Protected;
