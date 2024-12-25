import React, { useEffect, useRef, useState } from "react";
import $ from "jquery";
import "datatables.net-dt";
import "datatables.net-dt/css/dataTables.dataTables.css";
import axios from "axios";
import Swal from "sweetalert2";
import { useNavigate } from "react-router-dom";

function Produk() {
  const tableRef = useRef(null);
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [produk, setProduk] = useState([]);

  // Fetch data produk
  const fetchProduk = async () => {
    const token = localStorage.getItem("token");
    if (!token) {
      setError("Anda harus login terlebih dahulu.");
      setLoading(false);
      return;
    }

    try {
      const response = await axios.get("http://127.0.0.1:8000/api/produk", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.data.success) {
        setProduk(response.data.data);
      } else {
        setError("Data produk tidak ditemukan.");
      }
    } catch (error) {
      setError("Gagal memuat data produk.");
    } finally {
      setLoading(false);
    }
  };

  // Inisialisasi DataTables
  useEffect(() => {
    if (!loading && !error && produk.length > 0) {
      const table = $(tableRef.current).DataTable({
        responsive: true, // Untuk membuat DataTable responsif
      });
      return () => {
        table.destroy();
      };
    }
  }, [loading, error, produk]);

  // Fetch data saat komponen dimuat
  useEffect(() => {
    fetchProduk();
  }, []);

  // Handle delete produk
  const handleDelete = async (id) => {
    const token = localStorage.getItem("token");

    Swal.fire({
      title: "Anda yakin?",
      text: "Data yang dihapus tidak bisa dikembalikan!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Ya, hapus!",
    }).then(async (result) => {
      if (result.isConfirmed) {
        try {
          await axios.delete(`http://127.0.0.1:8000/api/produk/delete/${id}`, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          Swal.fire("Berhasil!", "Produk berhasil dihapus.", "success");
          fetchProduk(); // Refresh data setelah delete
        } catch (error) {
          Swal.fire("Gagal!", "Terjadi kesalahan saat menghapus produk.", "error");
        }
      }
    });
  };

  return (
    <div className="container-fluid px-4">
      <h1 className="mt-4">Daftar Produk</h1>
      <ol className="breadcrumb mb-4">
        <li className="breadcrumb-item">
          <a href="/dashboard">Dashboard</a>
        </li>
        <li className="breadcrumb-item active">Produk</li>
      </ol>
      <div className="card mb-4">
        <div className="card-header">
          <button
            className="btn btn-primary"
            onClick={() => navigate("/produk/create")}
          >
            Tambah Produk
          </button>
        </div>
        <div className="card-body">
          {loading ? (
            <p>Loading...</p>
          ) : error ? (
            <p className="text-danger">{error}</p>
          ) : (
            <div className="table-responsive"> {/* Tambahkan class table-responsive */}
              <table ref={tableRef} className="table table-bordered">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Harga</th>
                    <th>Stok</th>
                    <th>Kategori</th>
                    <th>Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  {produk.map((item, index) => (
                    <tr key={item.id}>
                      <td>{index + 1}</td>
                      <td>{item.nama}</td>
                      <td>{item.harga}</td>
                      <td>{item.stok}</td>
                      <td>{item.kategori}</td>
                      <td>
                        <button
                          className="btn btn-warning btn-sm me-2"
                          onClick={() => navigate(`/produk/edit/${item.id}`)}
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
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default Produk;
