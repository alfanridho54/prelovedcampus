import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AddProduk() {
  const [nama, setNama] = useState("");
  const [harga, setHarga] = useState("");
  const [stok, setStok] = useState("");
  const [deskripsi, setDeskripsi] = useState("");

  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://127.0.0.1:8000/api/produk/create", {
        nama,
        harga,
        stok,
        deskripsi,
      });
      alert("Produk berhasil ditambahkan!");
      navigate("/produk");
    } catch (error) {
      alert("Gagal menambahkan produk");
    }
  };

  return (
    <div className="container">
      <h1>Tambah Produk</h1>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label>Nama Produk</label>
          <input type="text" className="form-control" value={nama} onChange={(e) => setNama(e.target.value)} required />
        </div>
        <div className="mb-3">
          <label>Harga</label>
          <input type="number" className="form-control" value={harga} onChange={(e) => setHarga(e.target.value)} required />
        </div>
        <div className="mb-3">
          <label>Stok</label>
          <input type="number" className="form-control" value={stok} onChange={(e) => setStok(e.target.value)} required />
        </div>
        <div className="mb-3">
          <label>Deskripsi</label>
          <textarea className="form-control" value={deskripsi} onChange={(e) => setDeskripsi(e.target.value)} required></textarea>
        </div>
        <button type="submit" className="btn btn-primary">Tambah</button>
      </form>
    </div>
  );
}

export default AddProduk;
