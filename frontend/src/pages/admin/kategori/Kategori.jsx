import React, { useEffect, useRef, useState } from "react";
import $ from "jquery";
import "datatables.net-dt";
import "datatables.net-dt/css/dataTables.dataTables.css";
import axios from "axios";
import Swal from "sweetalert2";
import { useNavigate } from "react-router-dom";

function Kategori() {
  const tableRef = useRef(null);
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [kategori, setKategori] = useState([]);

  // Fetch data kategori
  const fetchKategori = async () => {
    const token = localStorage.getItem("token");
    if (!token) {
      setError("Anda harus login terlebih dahulu.");
      setLoading(false);
      return;
    }

    try {
      const response = await axios.get("http://127.0.0.1:8000/api/kategori-produk", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.data.success) {
        setKategori(response.data.data);
      } else {
        setError("Data kategori tidak ditemukan.");
      }
    } catch (error) {
      setError("Gagal memuat data kategori.");
    } finally {
      setLoading(false);
    }
  };

  // Inisialisasi DataTables
  useEffect(() => {
    if (!loading && !error && kategori.length > 0) {
      const table = $(tableRef.current).DataTable();
      return () => {
        table.destroy();
      };
    }
  }, [loading, error, kategori]);

  // Fetch data saat komponen dimuat
  useEffect(() => {
    fetchKategori();
  }, []);

  return (
    <div className="container-fluid px-4">
      <h1 className="mt-4">Daftar Kategori</h1>
      <ol className="breadcrumb mb-4">
        <li className="breadcrumb-item">
          <a href="/dashboard">Dashboard</a>
        </li>
        <li className="breadcrumb-item active">Kategori</li>
      </ol>
      <div className="card mb-4">
        <div className="card-header">
          <button
            className="btn btn-primary"
            onClick={() => navigate("/kategori/create")}
          >
            Tambah Kategori
          </button>
        </div>
        <div className="card-body">
          {loading ? (
            <p>Loading...</p>
          ) : error ? (
            <p className="text-danger">{error}</p>
          ) : (
            <table ref={tableRef} className="table">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Nama</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
                {kategori.map((item, index) => (
                  <tr key={item.id}>
                    <td>{index + 1}</td>
                    <td>{item.kategori}</td>
                    <td>
                      <button
                        className="btn btn-warning btn-sm me-2"
                        onClick={() => navigate(`/kategori/edit/${item.id}`)}
                      >
                        Edit
                      </button>
                      <button
                        className="btn btn-danger btn-sm"
                        onClick={() => Swal.fire({
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
                              await axios.delete(`http://127.0.0.1:8000/api/kategori/delete/${item.id}`, {
                                headers: {
                                  Authorization: `Bearer ${token}`,
                                },
                              });
                              Swal.fire("Berhasil!", "Kategori berhasil dihapus.", "success");
                              fetchKategori(); // Refresh data setelah delete
                            } catch (error) {
                              Swal.fire("Gagal!", "Terjadi kesalahan saat menghapus kategori.", "error");
                            }
                          }
                        })}
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

export default Kategori;

