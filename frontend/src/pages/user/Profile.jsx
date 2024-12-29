import { useState, useEffect } from "react";
import axios from "axios";
import Footer from "../../components/user/Footer";
import Header from "../../components/user/Header";
import styles from "../../assets/user/css/Profile.module.css";

export default function Profile() {
  const [formData, setFormData] = useState({
    nama: "",
    email: "",
    no_hp: "",
    alamat: "",
    role: "",
  });

  const [error, setError] = useState(null);

  // Ambil data user yang login
  useEffect(() => {
    const fetchUserData = async () => {
      try {
        const response = await axios.get(`http://localhost:8000/api/user/${id}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`, 
          },
        });
        if (response.data.success) {
          setFormData({
            nama: response.data.data.nama || "",
            email: response.data.data.email || "",
            no_hp: response.data.data.no_hp || "",
            alamat: response.data.data.alamat || "",
            role: response.data.data.role || "",
          });
        } else {
          setError("Gagal memuat data pengguna.");
        }
      } catch (err) {
        setError("Terjadi kesalahan saat mengambil data pengguna.");
      }
    };

    fetchUserData();
  }, []);

  // Handler untuk input perubahan data
  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevFormData) => ({
      ...prevFormData,
      [name]: value,
    }));
  };

  // Simpan data yang diperbarui
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.put(
        `http://localhost:8000/api/user/${id}`,
        formData,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        }
      );
      if (response.data.success) {
        alert("Profil berhasil diperbarui!");
      } else {
        setError("Gagal memperbarui profil.");
      }
    } catch (err) {
      setError("Terjadi kesalahan saat memperbarui profil.");
    }
  };

  return (
    <>
      <Header />
      <main>
        <div className={styles.profileContainer}>
          <div className={styles.profileHeader}>
            <h1>Profil Saya</h1>
            <p>
              Kelola informasi profil Anda untuk mengontrol, melindungi, dan
              mengamankan akun
            </p>
          </div>
          <div className={styles.profileImage}>
            <img src="profile.jpg" alt="Profile Image" />
            <br />
            <label className={styles.uploadBtn}>
              Pilih Gambar
              <input type="file" accept="image/jpeg, image/png" />
            </label>
            <p style={{ fontSize: 12, color: "#777" }}>
              Ukuran gambar: maks. 1 MB
              <br />
              Format gambar: .JPEG, .PNG
            </p>
          </div>
          <form onSubmit={handleSubmit}>
            <div className={styles.formGroup}>
              <label htmlFor="name">Nama</label>
              <input
                type="text"
                id="name"
                name="nama"
                value={formData.nama}
                onChange={handleInputChange}
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="email">Email</label>
              <input
                type="email"
                id="email"
                name="email"
                value={formData.email}
                disabled
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="phone">Nomor Telepon</label>
              <input
                type="tel"
                id="phone"
                name="no_hp"
                value={formData.no_hp}
                onChange={handleInputChange}
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="address">Alamat</label>
              <input
                type="text"
                id="address"
                name="alamat"
                value={formData.alamat}
                onChange={handleInputChange}
              />
            </div>
            <div className={styles.formGroup}>
              <label>Role</label>
              <input type="text" value={formData.role} disabled />
            </div>
            <button type="submit" className={styles.btnSave}>
              Simpan
            </button>
          </form>
          {error && <p style={{ color: "red" }}>{error}</p>}
        </div>
      </main>
      <Footer />
    </>
  );
}
