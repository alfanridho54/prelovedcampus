import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import styles from "../../assets/user/css/Profile.module.css";
import Header from "../../components/user/Header";
import Footer from "../../components/user/Footer";

function Profile() {
  const [userData, setUserData] = useState({
    nama: "",
    email: "",
    no_hp: "",
    alamat: "",
    role: "", // Menambahkan role di userData
  });

  const [error, setError] = useState("");
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchUser = async () => {
      const token = localStorage.getItem("token");
      const user = JSON.parse(localStorage.getItem("user"));

      if (!token || !user) {
        alert("Anda harus login untuk melihat profil.");
        navigate("/login");
        return;
      }

      try {
        const response = await axios.get(`http://127.0.0.1:8000/api/user/${user.id}`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (response.data.success) {
          setUserData(response.data.data);
        } else {
          alert("Gagal memuat data pengguna.");
        }
      } catch (error) {
        console.error("Error fetching user data:", error);
        alert("Terjadi kesalahan saat memuat data pengguna.");
      } finally {
        setLoading(false);
      }
    };

    fetchUser();
  }, [navigate]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setUserData({ ...userData, [name]: value });
  };

  const handleUpdate = async (e) => {
    e.preventDefault();
    setError("");

    const token = localStorage.getItem("token");
    if (!token) {
      alert("Anda harus login untuk memperbarui profil.");
      navigate("/login");
      return;
    }

    try {
      const response = await axios.put("http://127.0.0.1:8000/api/user/update", userData, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.data.success) {
        alert("Profil berhasil diperbarui!");
        setUserData(response.data.data);
      } else {
        setError(response.data.message || "Gagal memperbarui profil.");
      }
    } catch (error) {
      console.error("Error updating profile:", error);
      setError("Terjadi kesalahan saat memperbarui profil.");
    }
  };

  const handleBecomeSeller = async () => {
    try {
      const token = localStorage.getItem("token");
      const response = await axios.post(
        "http://127.0.0.1:8000/api/user/become-seller",
        {},
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
  
      if (response.data.success) {
        alert(response.data.message);
        
        // Update role di state langsung setelah sukses
        setUserData((prevState) => ({
          ...prevState,
          role: response.data.role, // Memperbarui role di state
        }));
  
        // Update data user di localStorage
        const updatedUserData = { ...userData, role: response.data.role };
        localStorage.setItem("user", JSON.stringify(updatedUserData));
  
        // Navigasi ke dashboard atau tetap di halaman profil setelah update
        navigate("/dashboard");
      } else {
        alert(response.data.message);
      }
    } catch (error) {
      console.error("Error updating role to seller:", error.response?.data || error.message);
      alert("Gagal memperbarui role menjadi penjual.");
    }
  };

  // Menggunakan useEffect untuk memonitor perubahan role secara langsung
  useEffect(() => {
    const user = JSON.parse(localStorage.getItem("user"));
    if (user) {
      setUserData(user); // Pastikan state selalu terupdate berdasarkan data di localStorage
    }
  }, []); // Tidak perlu mendengarkan perubahan `userData.role`, cukup load sekali saat komponen pertama kali dimuat

  if (loading) {
    return <p>Loading...</p>;
  }

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
          </div>
          <form onSubmit={handleUpdate}>
            <div className={styles.formGroup}>
              <label htmlFor="name">Nama</label>
              <input
                type="text"
                id="name"
                name="nama"
                value={userData.nama}
                onChange={handleChange}
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="email">Email</label>
              <input
                type="email"
                id="email"
                name="email"
                value={userData.email}
                disabled
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="phone">Nomor Telepon</label>
              <input
                type="tel"
                id="phone"
                name="no_hp"
                value={userData.no_hp}
                onChange={handleChange}
              />
            </div>
            <div className={styles.formGroup}>
              <label htmlFor="address">Alamat</label>
              <input
                type="text"
                id="address"
                name="alamat"
                value={userData.alamat}
                onChange={handleChange}
              />
            </div>

            <button type="submit" className={styles.btnSave}>
              Simpan
            </button>
          </form>

          {/* Cek apakah role bukan penjual untuk menampilkan tombol */}
          {userData.role !== "penjual" && (
            <div className={styles.becomeSave}>
              <button onClick={handleBecomeSeller} className={styles.btnSave}>
                Saya ingin menjadi Penjual
              </button>
            </div>
          )}

          {error && <p style={{ color: "red" }}>{error}</p>}
        </div>
      </main>
      <Footer />
    </>
  );
}

export default Profile;
