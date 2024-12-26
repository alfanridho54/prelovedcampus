import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

function EditKategori() {
  const { id } = useParams();
  const [kategori, setKategori] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const fetchKategori = async () => {
      const token = localStorage.getItem("token");
      if (!token) {
        console.error("No token found");
        return;
      }
      try {
        const response = await axios.get(
          `http://127.0.0.1:8000/api/kategori-produk/${id}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        );
        setKategori(response.data.data.kategori);
      } catch (error) {
        console.error("Failed to fetch category:", error);
      }
    };
    fetchKategori();
  }, [id]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const token = localStorage.getItem("token");
    if (!token) {
      alert("No token found");
      return;
    }
    try {
      await axios.put(
        `http://127.0.0.1:8000/api/kategori-produk/update/${id}`,
        { kategori },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      alert("Kategori berhasil diupdate!");
      navigate("/kategori");
    } catch (error) {
      alert("Gagal mengupdate kategori");
    }
  };

  return (
    <div className="container">
      <h1>Edit Kategori</h1>
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
          Ubah
        </button>
      </form>
    </div>
  );
}

export default EditKategori;

