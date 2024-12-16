import React, { useEffect, useRef, useState } from "react";
import $ from "jquery";
import "datatables.net-dt";
import "datatables.net-dt/css/dataTables.dataTables.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function Produk() {
  const tableRef = useRef(null);
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [produk, setProduk] = useState([]);

  // Fetch data produk
  useEffect(() => {
    const fetchProduk = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/produk");
        if (response.data.success) {
          setProduk(response.data.data);
        } else {
          setError("Data not found");
        }
      } catch (error) {
        setError(error.message);
      } finally {
        setLoading(false);
      }
    };
    fetchProduk();
  }, []);

  // Inisialisasi DataTables
  useEffect(() => {
    if (!loading && !error) {
      const table = $(tableRef.current).DataTable({
        destroy: true // Hapus DataTables sebelum inisialisasi ulang
      });
      return () => {
        table.destroy(false); // Bersihkan DataTables saat komponen di-unmount
      };
    }
  }, [loading, error]);

  // Handle delete produk
  const handleDelete = async (id) => {
    if (window.confirm("Anda yakin ingin menghapus produk ini?")) {
      try {
        await axios.delete(`http://127.0.0.1:8000/api/produk/delete/${id}`);
        setProduk(produk.filter((item) => item.id !== id));
        alert("Produk berhasil dihapus!");
      } catch (error) {
        alert("Gagal menghapus produk");
      }
    }
  };

  return (
    <div className="container-fluid px-4">
      <h1 className="mt-4">Tables</h1>
      <ol className="breadcrumb mb-4">
        <li className="breadcrumb-item">
          <a href="index.html">Dashboard</a>
        </li>
        <li className="breadcrumb-item active">Tables</li>
      </ol>
      <div className="card mb-4">
        <div className="card-body">
          DataTables is a third party plugin that is used to generate the demo
          table below. For more information about DataTables, please visit the
          <a target="_blank" href="https://datatables.net/">
            official DataTables documentation
          </a>
          .
        </div>
      </div>
      <div className="card mb-4">
        <div className="card-header">
        <h2>Daftar Produk</h2>
      <button className="btn btn-primary mb-3" onClick={() => navigate("/produk/create")}>
        Tambah Produk
      </button>
        </div>
        <div className="card-body">
          {loading ? (
            <p>Loading...</p>
          ) : error ? (
            <p>{error}</p>
          ) : (
            <table ref={tableRef} className="table">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Nama</th>
                  <th>Harga</th>
                  <th>Stok</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>No</th>
                  <th>Nama</th>
                  <th>Harga</th>
                  <th>Stok</th>
                  <th>Aksi</th>
                </tr>
              </tfoot>
              <tbody>
                {produk.map((item, index) => (
                  <tr key={item.id}>
                    <td>{index + 1}</td>
                    <td>{item.nama}</td>
                    <td>{item.harga}</td>
                    <td>{item.stok}</td>
                    <td>
                      <button
                        className="btn btn-warning btn-sm me-2"
                        onClick={() => navigate(`/produk/update/${item.id}`)}
                      >
                        Edit
                      </button>
                      <button
                        className="btn btn-danger btn-sm"
                        onClick={() => handleDelete(item.id)}
                      >
                        Hapus
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </div>
  );
}

export default Produk;
