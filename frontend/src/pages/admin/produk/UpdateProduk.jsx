import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

function EditProduk() {
  const { id } = useParams(); // Mendapatkan id produk dari URL
  const navigate = useNavigate();

  const [nama, setNama] = useState("");
  const [harga, setHarga] = useState("");
  const [stok, setStok] = useState("");
  const [deskripsi, setDeskripsi] = useState("");
  const [error, setError] = useState(null);

  // Fetch data produk berdasarkan id
  useEffect(() => {
    const fetchProduk = async () => {
      try {
        const response = await axios.get(`http://127.0.0.1:8000/api/produk/${id}`);
        const data = response.data;
        setNama(data.nama);
        setHarga(data.harga);
        setStok(data.stok);
        setDeskripsi(data.deskripsi);
      } catch (error) {
        setError("Gagal memuat data produk");
      }
    };

    fetchProduk();
  }, [id]);

  // Handle submit untuk update produk
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(`http://127.0.0.1:8000/api/produk/update/${id}`, {
        nama,
        harga,
        stok,
        deskripsi,
      });
      alert("Produk berhasil diperbarui!");
      navigate("/produk"); // Kembali ke halaman daftar produk
    } catch (error) {
      alert("Gagal memperbarui produk");
      console.error(error);
    }
  };

  return (
    <div className="container mt-4">
      <h1>Edit Produk</h1>
      {error ? (
        <p className="text-danger">{error}</p>
      ) : (
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <label htmlFor="nama" className="form-label">
              Nama Produk
            </label>
            <input
              type="text"
              className="form-control"
              id="nama"
              value={nama}
              onChange={(e) => setNama(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="harga" className="form-label">
              Harga
            </label>
            <input
              type="number"
              className="form-control"
              id="harga"
              value={harga}
              onChange={(e) => setHarga(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="stok" className="form-label">
              Stok
            </label>
            <input
              type="number"
              className="form-control"
              id="stok"
              value={stok}
              onChange={(e) => setStok(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="deskripsi" className="form-label">
              Deskripsi
            </label>
            <textarea
              className="form-control"
              id="deskripsi"
              value={deskripsi}
              onChange={(e) => setDeskripsi(e.target.value)}
              rows="4"
              required
            ></textarea>
          </div>
          <button type="submit" className="btn btn-primary">
            Update
          </button>
        </form>
      )}
    </div>
  );
}

export default EditProduk;
