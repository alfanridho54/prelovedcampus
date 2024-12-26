import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AddKategori() {
  const [kategori, setKategori] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://127.0.0.1:8000/api/kategori-produk/create", {
        kategori,
      });
      alert("Kategori berhasil ditambahkan!");
      navigate("/kategori");
    } catch (error) {
      alert("Gagal menambahkan kategori");
    }
  };

  return (
    <div className="container">
      <h1>Tambah Kategori</h1>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label>Kategori</label>
          <input
            type="text"
            className="form-control"
            value={kategori}
            onChange={(e) => setKategori(e.target.value)}
            required
          />
        </div>
        <button type="submit" className="btn btn-primary">
          Tambah
        </button>
      </form>
    </div>
  );
}

export default AddKategori;

