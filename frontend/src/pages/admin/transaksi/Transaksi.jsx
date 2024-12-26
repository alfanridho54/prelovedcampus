import  { useEffect, useRef, useState } from "react";
import $ from "jquery";
import "datatables.net-dt";
import "datatables.net-dt/css/dataTables.dataTables.css";
import axios from "axios";
import Swal from "sweetalert2";

function Transaksi() {
  const tableRef = useRef(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [transaksi, setTransaksi] = useState([]);

  // Fetch data transaksi
  const fetchTransaksi = async () => {
    const token = localStorage.getItem("token");
    
    if (!token) {
      setError("Anda harus login terlebih dahulu.");
      setLoading(false);
      return;
    }

    try {
      const response = await axios.get("http://127.0.0.1:8000/api/transaksi", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.data.success) {
        setTransaksi(response.data.data);
      } else {
        setError("Data transaksi tidak ditemukan.");
      }
    } catch (error) {
      setError("Gagal memuat data transaksi.");
    } finally {
      setLoading(false);
    }
  };

  // Inisialisasi DataTables
  useEffect(() => {
    if (!loading && !error && transaksi.length > 0) {
      const table = $(tableRef.current).DataTable();
      return () => {
        table.destroy();
      };
    }
  }, [loading, error, transaksi]);

  // Fetch data saat komponen dimuat
  useEffect(() => {
    fetchTransaksi();
  }, []);

  // Handle delete transaksi
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
          await axios.delete(`http://127.0.0.1:8000/api/transaksi/delete/${id}`, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          Swal.fire("Berhasil!", "Transaksi berhasil dihapus.", "success");
          fetchTransaksi(); // Refresh data setelah delete
        } catch (error) {
          Swal.fire("Gagal!", "Terjadi kesalahan saat menghapus transaksi.", "error");
        }
      }
    });
  };

  return (
    <div className="container-fluid">
      <h1 className="mt-4">Daftar Transaksi</h1>
      <ol className="breadcrumb mb-4">
        <li className="breadcrumb-item">
          <a href="/dashboard">Dashboard</a>
        </li>
        <li className="breadcrumb-item active">Transaksi</li>
      </ol>
      <div className="card mb-4">
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
                  <th>Pembeli</th>
                  <th>Produk</th>
                  <th>Jumlah Beli</th>
                  <th>Total Harga</th>
                  <th>Metode Pembayaran</th>
                  <th>Status Pembayaran</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
                {transaksi.map((item, index) => (
                  <tr key={item.id}>
                    <td>{index + 1}</td>
                    <td>{item.user_nama}</td>
                    <td>{item.produk_nama}</td>
                    <td>{item.jumlah_beli}</td>
                    <td>{item.total_harga}</td>
                    <td>{item.metode_pembayaran}</td>
                    <td>{item.status_pembayaran}</td>
                    <td>
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

export default Transaksi;
