import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

function EditProduk() {
  const [nama, setNama] = useState("");
  const [harga, setHarga] = useState("");
  const [stok, setStok] = useState("");
  const [deskripsi, setDeskripsi] = useState("");
  const [kategori, setKategori] = useState("");
  const [kategoriList, setKategoriList] = useState([]);
  const [lokasi_gambar, setLokasiGambar] = useState("");
  const navigate = useNavigate();
  const { id } = useParams();
  const token = localStorage.getItem("token");

  useEffect(() => {
    const fetchKategori = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/kategori-produk", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        setKategoriList(response.data.data);
      } catch (error) {
        console.error("Failed to fetch categories:", error);
      }
    };

    const fetchProduk = async () => {
      try {
        const response = await axios.get(`http://127.0.0.1:8000/api/produk/${id}`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        const { nama, harga, stok, deskripsi, kategori_produk_id, lokasi_gambar } = response.data.data;
        setNama(nama);
        setHarga(harga);
        setStok(stok);
        setDeskripsi(deskripsi);
        setKategori(kategori_produk_id);
        setLokasiGambar(lokasi_gambar);
      } catch (error) {
        console.error("Failed to fetch product details:", error);
      }
    };

    fetchKategori();
    fetchProduk();
  }, [id, token]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(
        `http://127.0.0.1:8000/api/produk/update/${id}`,
        {
          nama,
          harga,
          stok,
          deskripsi,
          kategori_produk_id: kategori,
          lokasi_gambar,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      alert("Produk berhasil diupdate!");
      navigate("/produk");
    } catch (error) {
      alert("Gagal mengupdate produk");
    }
  };

  return (
    <div className="container">
      <h1>Edit Produk</h1>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label>Nama Produk</label>
          <input
            type="text"
            className="form-control"
            value={nama}
            onChange={(e) => setNama(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label>Harga</label>
          <input
            type="number"
            className="form-control"
            value={harga}
            onChange={(e) => setHarga(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label>Stok</label>
          <input
            type="number"
            className="form-control"
            value={stok}
            onChange={(e) => setStok(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label>Deskripsi</label>
          <textarea
            className="form-control"
            value={deskripsi}
            onChange={(e) => setDeskripsi(e.target.value)}
            required
          ></textarea>
        </div>
        <div className="mb-3">
          <label>Lokasi Gambar</label>
          <input
            type="text"
            className="form-control"
            value={lokasi_gambar}
            onChange={(e) => setLokasiGambar(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="kategori" className="form-label">
            Kategori
          </label>
          <select
            className="form-control"
            id="kategori"
            value={kategori}
            onChange={(e) => setKategori(e.target.value)}
            required
          >
            <option value="">Pilih Kategori</option>
            {kategoriList.map((item) => (
              <option key={item.id} value={item.id}>
                {item.kategori}
              </option>
            ))}
          </select>
        </div>
        <button type="submit" className="btn btn-primary">
          Update
        </button>
      </form>
    </div>
  );
}

export default EditProduk;

