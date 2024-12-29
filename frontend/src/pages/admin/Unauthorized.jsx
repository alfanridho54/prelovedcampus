import React from "react";
import { Link } from "react-router-dom";

const Unauthorized = () => {
    return (
        <div className="container text-center">
            <h1>Akses Ditolak</h1>
            <p>Anda tidak memiliki izin untuk mengakses halaman ini.</p>
            <Link to="/" className="btn btn-primary">
                Kembali ke Beranda
            </Link>
        </div>
    );
};

export default Unauthorized;
