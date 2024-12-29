import { Navigate, Outlet } from "react-router-dom";

const ProtectedRoute = () => {
    const token = localStorage.getItem("token");
    const userRole = localStorage.getItem("role");

    // Log untuk debugging
    console.log("Token:", token);
    console.log("Role:", userRole);

    // Validasi token
    if (!token) {
        console.warn("Token tidak ditemukan. Arahkan ke login.");
        return <Navigate to="/login" />;
    }

    // Validasi role manual (Admin dan Penjual diizinkan)
    if (userRole === "admin" || userRole === "penjual") {
        return <Outlet />;
    }

    // Role tidak valid, arahkan ke halaman Unauthorized
    console.warn(`Akses ditolak untuk role: ${userRole}`);
    return <Navigate to="/unauthorized" />;
};

export default ProtectedRoute;
