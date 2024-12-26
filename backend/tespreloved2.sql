-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Des 2024 pada 14.28
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tespreloved2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `produk_id`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 1, '2024-12-25 17:07:53', '2024-12-25 17:07:53'),
(4, 10, 2, 1, '2024-12-26 05:53:15', '2024-12-26 05:53:15'),
(5, 10, 3, 1, '2024-12-26 05:53:23', '2024-12-26 05:53:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `kategori`) VALUES
(1, 'Elektronik'),
(2, 'Pakaian'),
(3, 'Makanan'),
(4, 'Aksesoris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_08_094159_create_personal_access_tokens_table', 1),
(5, '2024_11_11_230818_update_password_length_in_users_table', 1),
(6, '2024_12_21_003516_add_timestamps_to_user_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'token', '80f1ddc6515b52b85063583bb1f282793db8220ab5651918cc52012739934adb', '[\"*\"]', NULL, NULL, '2024-12-20 17:39:28', '2024-12-20 17:39:28'),
(2, 'App\\Models\\User', 6, 'token', 'f0c8804e0e3b4951f8a9b2070162aef96a0236e082f73f3e562c0b0979bc598c', '[\"*\"]', NULL, NULL, '2024-12-20 17:44:23', '2024-12-20 17:44:23'),
(3, 'App\\Models\\User', 6, 'token', 'bf8a1dc8f79c0158aa6e5a614828586283602bc5a27afef21a8acd21c354db4e', '[\"*\"]', NULL, NULL, '2024-12-20 17:47:04', '2024-12-20 17:47:04'),
(4, 'App\\Models\\User', 6, 'token', '6eae1b247b99b243a4b33412c90c9246048948009a61832c15e7e48c273c657a', '[\"*\"]', NULL, NULL, '2024-12-20 17:58:10', '2024-12-20 17:58:10'),
(5, 'App\\Models\\User', 6, 'token', 'e4189341d24054bd68a432856ebe89d3167564fed202c9add4b1cf2afda238ee', '[\"*\"]', NULL, NULL, '2024-12-20 18:20:30', '2024-12-20 18:20:30'),
(6, 'App\\Models\\User', 6, 'token', '2ca54d686b07f668a3b1bf6d411fd24e1de1beffd3a422c20cf94d65890e5f50', '[\"*\"]', NULL, NULL, '2024-12-20 18:29:52', '2024-12-20 18:29:52'),
(7, 'App\\Models\\User', 6, 'token', '86b66c96753dd1f97640af115683e2efb4c7d61be8e525bbc937f3117de3783b', '[\"*\"]', NULL, NULL, '2024-12-20 18:49:37', '2024-12-20 18:49:37'),
(8, 'App\\Models\\User', 6, 'token', 'f84ec62a43fc289a6a7c2e3bf170495e9a5da9d78df5685c4f560ea7a578bad0', '[\"*\"]', NULL, NULL, '2024-12-20 18:54:11', '2024-12-20 18:54:11'),
(9, 'App\\Models\\User', 6, 'token', '71e10dbf0d35378805e0989cd1ebdbd0e10b01c66f0ed532e5acc77c47c6fe9e', '[\"*\"]', NULL, NULL, '2024-12-20 19:02:39', '2024-12-20 19:02:39'),
(10, 'App\\Models\\User', 6, 'token', 'dddb287339ca53d6ed48981e7c387e62d9234ff8f03595ff2ea4074d0c37de43', '[\"*\"]', NULL, NULL, '2024-12-20 19:05:36', '2024-12-20 19:05:36'),
(11, 'App\\Models\\User', 6, 'token', 'd889c042135380ea56195d48b8fb346c25ac2deb4a24ecd7960b403fc157f376', '[\"*\"]', NULL, NULL, '2024-12-21 02:54:43', '2024-12-21 02:54:43'),
(12, 'App\\Models\\User', 6, 'token', 'a965d9df8fcd5f5dfc24fb59c2a38ee557729ae6505d6259e17438ebac4e5207', '[\"*\"]', '2024-12-21 20:15:47', NULL, '2024-12-21 19:36:23', '2024-12-21 20:15:47'),
(13, 'App\\Models\\User', 6, 'token', 'a63807bd827d840d0cef5850ccc101fa3ebac5e64f09102f547ecb80864c4a2a', '[\"*\"]', '2024-12-21 20:00:24', NULL, '2024-12-21 19:56:22', '2024-12-21 20:00:24'),
(14, 'App\\Models\\User', 6, 'token', 'cc9001aa04662a29094b85a07f628b469648884d5d4a2020fe4da22433463830', '[\"*\"]', '2024-12-21 20:39:49', NULL, '2024-12-21 20:18:15', '2024-12-21 20:39:49'),
(15, 'App\\Models\\User', 6, 'token', '82db108c476571cc138280232a6a5439d491f320cf90413f6c0111759163e66c', '[\"*\"]', '2024-12-22 02:24:43', NULL, '2024-12-22 02:24:27', '2024-12-22 02:24:43'),
(16, 'App\\Models\\User', 7, 'token', '82381566604dd2a4339d05c1278cced66861822503105d81794f1fb16bbfb792', '[\"*\"]', NULL, NULL, '2024-12-22 06:08:44', '2024-12-22 06:08:44'),
(17, 'App\\Models\\User', 6, 'token', '470dda5d10db73b64d4e8121ef6d01129f3f575b26e7bc81bd607aed17f98cd0', '[\"*\"]', NULL, NULL, '2024-12-24 16:32:42', '2024-12-24 16:32:42'),
(18, 'App\\Models\\User', 6, 'token', 'c571636e6ca48b384c0e3e9087245cc0c443f6ee01148daf44222173c19af3ce', '[\"*\"]', '2024-12-24 16:40:27', NULL, '2024-12-24 16:32:44', '2024-12-24 16:40:27'),
(19, 'App\\Models\\User', 6, 'token', 'f52eafd36e32a7ae87c171a4fa6cd26187cf10fc9e46f0a6f43de1a23f8559d5', '[\"*\"]', '2024-12-24 18:21:48', NULL, '2024-12-24 16:41:22', '2024-12-24 18:21:48'),
(20, 'App\\Models\\User', 6, 'token', '900bd589a58e7d12d6a93ef74e579dfd0f3c309d00980a61be8f54b8352e6eca', '[\"*\"]', '2024-12-24 18:23:38', NULL, '2024-12-24 18:23:33', '2024-12-24 18:23:38'),
(21, 'App\\Models\\User', 10, 'token', '23bc9ee03a02633341a1cbbaae4a9b155929c0761dd006330669a68b33e9322a', '[\"*\"]', NULL, NULL, '2024-12-24 18:29:57', '2024-12-24 18:29:57'),
(22, 'App\\Models\\User', 10, 'token', '52b633d40050239782d1e9fabac130a26ecaac29766045602c792dfb71e8709c', '[\"*\"]', NULL, NULL, '2024-12-24 18:31:41', '2024-12-24 18:31:41'),
(23, 'App\\Models\\User', 10, 'token', 'c057d674cdc78d4c4ae9922f8c8cfb4fa3a7edfca1b9e60761808a6027feaf78', '[\"*\"]', NULL, NULL, '2024-12-24 18:33:11', '2024-12-24 18:33:11'),
(24, 'App\\Models\\User', 10, 'token', 'e8ea6db59de1a3c097bca1abd8179174aff9702484c6ab1cfd37c4b30e102e71', '[\"*\"]', NULL, NULL, '2024-12-24 18:34:40', '2024-12-24 18:34:40'),
(25, 'App\\Models\\User', 10, 'token', '3f251b7f651ea925ba792bab2714a5d56d709ea12769874be5f5fb59dc0b3b6c', '[\"*\"]', NULL, NULL, '2024-12-24 18:35:14', '2024-12-24 18:35:14'),
(26, 'App\\Models\\User', 10, 'token', '2c1275d67b8022abca1e4274c804328670c42f26a8c57e55c33e4d483b45d84a', '[\"*\"]', NULL, NULL, '2024-12-24 18:35:30', '2024-12-24 18:35:30'),
(27, 'App\\Models\\User', 6, 'token', 'c64667e676e33ce66da5aa40959778d33bcd6945a7b0ff32019ed64bc641d0fb', '[\"*\"]', '2024-12-24 18:38:28', NULL, '2024-12-24 18:38:24', '2024-12-24 18:38:28'),
(28, 'App\\Models\\User', 10, 'token', 'd5f14b231f43369c736a6fa5b5697de46a06b635bbcc1d6ac883c2ac246dc21b', '[\"*\"]', '2024-12-25 17:07:00', NULL, '2024-12-24 19:12:06', '2024-12-25 17:07:00'),
(29, 'App\\Models\\User', 6, 'token', '0c0d97c42024c3050bc3f78218a0b3dc8f96e20bc4951d4bf18ee1be125bbfc6', '[\"*\"]', '2024-12-25 17:07:52', NULL, '2024-12-25 17:07:39', '2024-12-25 17:07:52'),
(30, 'App\\Models\\User', 6, 'token', '2cdcaa24796dcf4b1192425abda041a814f07c93d166a9a4a6783f2645a73a9f', '[\"*\"]', NULL, NULL, '2024-12-25 17:13:28', '2024-12-25 17:13:28'),
(31, 'App\\Models\\User', 10, 'token', 'fe72b773afb451488458c08eb40ff4b2e108b0358d1b742b233db40dd1399574', '[\"*\"]', NULL, NULL, '2024-12-25 17:15:10', '2024-12-25 17:15:10'),
(32, 'App\\Models\\User', 10, 'token', 'b9217c5e7b874e489920bb1403055a6157b8da02ef1ff823d5d305544fdb1185', '[\"*\"]', NULL, NULL, '2024-12-26 02:13:29', '2024-12-26 02:13:29'),
(33, 'App\\Models\\User', 10, 'token', 'd64bc8beb725e70faf81ed01f16048a91e55ef4b087057bc99fbb67474950103', '[\"*\"]', NULL, NULL, '2024-12-26 02:15:25', '2024-12-26 02:15:25'),
(34, 'App\\Models\\User', 10, 'token', '015bf70da76a08ae58bcef7e055770013f1a7cc031c0fc187c1b2684677eeada', '[\"*\"]', NULL, NULL, '2024-12-26 02:17:37', '2024-12-26 02:17:37'),
(35, 'App\\Models\\User', 10, 'token', '11641a80e4d6854ff76afa2c958ab9993e99bc6aa9b31113e29a1ef331a7b434', '[\"*\"]', NULL, NULL, '2024-12-26 02:25:01', '2024-12-26 02:25:01'),
(36, 'App\\Models\\User', 10, 'token', '2ec843d418b864bdada4a436af12f47fdb82a9b926e136f7c790e8689cb2359f', '[\"*\"]', NULL, NULL, '2024-12-26 02:26:15', '2024-12-26 02:26:15'),
(37, 'App\\Models\\User', 10, 'token', '4dd634b7936e65f3a73e5a3ac58e58ef66cc5dfd03e6d02dd6780599bd118f41', '[\"*\"]', NULL, NULL, '2024-12-26 02:26:29', '2024-12-26 02:26:29'),
(38, 'App\\Models\\User', 10, 'token', 'd2c8edce57c2e9bacb4b45960373427e09dbd6f857184f6aa06123ade82bd056', '[\"*\"]', NULL, NULL, '2024-12-26 02:28:21', '2024-12-26 02:28:21'),
(39, 'App\\Models\\User', 10, 'token', '011cfe2ff0d9a2cfe99d7caf106716f13f96a6ba03071c54d7bc6836498de32c', '[\"*\"]', NULL, NULL, '2024-12-26 02:31:41', '2024-12-26 02:31:41'),
(40, 'App\\Models\\User', 10, 'token', 'c28e22b25595d88e77b68478fafda3ba9f0ff4b7c03ae56e9b42a9bf6f6079b4', '[\"*\"]', NULL, NULL, '2024-12-26 02:36:14', '2024-12-26 02:36:14'),
(41, 'App\\Models\\User', 10, 'token', '43d850f6719e89f83fd0612325a13898737890c257663c33c7cde367d0523065', '[\"*\"]', NULL, NULL, '2024-12-26 02:43:39', '2024-12-26 02:43:39'),
(42, 'App\\Models\\User', 10, 'token', 'd7910ddf0b37a8b1834be2b768c65214cdc74fca9aff77cc1241bf3f23507cce', '[\"*\"]', NULL, NULL, '2024-12-26 02:45:17', '2024-12-26 02:45:17'),
(43, 'App\\Models\\User', 10, 'token', 'e582b8af74239264df539f55592c2801d4c706fc9f99823825fb71339332370f', '[\"*\"]', '2024-12-26 02:47:38', NULL, '2024-12-26 02:47:07', '2024-12-26 02:47:38'),
(44, 'App\\Models\\User', 10, 'token', '43ce35fe33aaafa6c61de2977bf9c78e3469b847906223a10fadd2a7ea434e82', '[\"*\"]', NULL, NULL, '2024-12-26 05:12:14', '2024-12-26 05:12:14'),
(45, 'App\\Models\\User', 10, 'token', 'ae74118ce72ec6826386affc71c19d60e4c440482d5a0126eb2e03c28c7fb091', '[\"*\"]', NULL, NULL, '2024-12-26 05:14:34', '2024-12-26 05:14:34'),
(46, 'App\\Models\\User', 10, 'token', '96be5d24afda9fd97ef5b32b0ac4d476fb0c396379bdcad23725e9b8b9cf6384', '[\"*\"]', NULL, NULL, '2024-12-26 05:18:27', '2024-12-26 05:18:27'),
(47, 'App\\Models\\User', 10, 'token', '2c08880d005e814c955e462b8a257785adcf5bf6d6ee30d8d1a241442eb7e443', '[\"*\"]', NULL, NULL, '2024-12-26 05:19:38', '2024-12-26 05:19:38'),
(48, 'App\\Models\\User', 10, 'token', '5a703a693d6a8c98b6e6de8bf47201960804d6425c04bb8c3f4cb73ac2b525d0', '[\"*\"]', NULL, NULL, '2024-12-26 05:23:37', '2024-12-26 05:23:37'),
(49, 'App\\Models\\User', 10, 'token', 'b67d0b7e6b9cf71426ae5331c2dc3419f001f1b7364d8894eed3ee2da744292d', '[\"*\"]', '2024-12-26 05:53:25', NULL, '2024-12-26 05:24:20', '2024-12-26 05:53:25'),
(50, 'App\\Models\\User', 6, 'token', '066f1a70db40742b0cd8ae88b3ec91abe3d22aaa4c0db4a14c1a0994d5ce7907', '[\"*\"]', '2024-12-26 06:06:27', NULL, '2024-12-26 06:04:20', '2024-12-26 06:06:27'),
(51, 'App\\Models\\User', 6, 'token', 'afbc941606e4ee7b66d0a87ae70435329f81097b44bb4bf9f9f07ba40a761d43', '[\"*\"]', '2024-12-26 06:26:52', NULL, '2024-12-26 06:07:53', '2024-12-26 06:26:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` longtext NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `lokasi_gambar` longtext DEFAULT NULL,
  `kategori_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `deskripsi`, `stok`, `lokasi_gambar`, `kategori_produk_id`) VALUES
(1, 'Laptop', 15000000.00, 'Laptop Gaming dengan spesifikasi tinggi', 1, 'laptop.jpg', 1),
(2, 'Kaos Polos', 50000.00, 'Kaos polos berbagai warna', 40, 'kaos.jpg', 2),
(3, 'Topi', 25000.00, 'Topi keren', 1, 'topi.jpg', 4),
(4, 'Jam Tangan', 250000.00, 'Jam tangan modern dan stylish', 15, 'jam.jpgss', 3),
(5, 'Laptop', 15000000.00, 'Laptop Gaming', 10, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('sp3M6bWxL7xVqG0PZdQ1ml29iVQJXcEIGhfQqTJx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEVlbzV4c1VqM0xGWmRPZjQ4bDlFWTUxOGtoT21VaXdweGhKb1h5VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734741097);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pembayaran`
--

CREATE TABLE `status_pembayaran` (
  `id` int(11) NOT NULL,
  `status_pembayaran` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `status_pembayaran`
--

INSERT INTO `status_pembayaran` (`id`, `status_pembayaran`) VALUES
(1, 'Belum Dibayar'),
(2, 'Menunggu Konfirmasi'),
(3, 'Dibayar'),
(4, 'Dibatalkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `metode_pembayaran` varchar(45) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `status_pembayaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `user_id`, `produk_id`, `total_harga`, `jumlah_beli`, `metode_pembayaran`, `tanggal_transaksi`, `status_pembayaran_id`) VALUES
(1, 3, 1, 30490000, 2, 'Transfer Bank', '2024-12-20 19:03:16', 1),
(2, 3, 3, 0, 5, 'COD', '2024-12-20 19:03:16', 1),
(3, 3, 1, 0, 2, 'Transfer Bank', '2024-12-21 06:29:17', 1),
(4, 3, 3, 0, 5, 'COD', '2024-12-21 06:29:17', 1),
(5, 1, 2, 0, 3, 'Transfer Bank', '2024-12-21 06:30:47', 1),
(6, 2, 1, 0, 5, 'COD', '2024-12-21 06:30:47', 1),
(7, 2, 1, 0, 1, 'COD', '2024-12-21 06:32:11', 1),
(8, 1, 1, 30000000, 2, 'Transfer Bank', '2024-12-21 06:37:58', 1),
(10, 7, 2, 100000, 2, 'Transfer Bank', '2024-12-25 06:58:18', 1);

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `after_delete_transaksi` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN
    -- Hapus semua detail transaksi yang terkait dengan transaksi yang dihapus
    DELETE FROM transaksi_detail
    WHERE transaksi_id = OLD.id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_transaksi_insert` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
  -- Mengurangi stok produk sesuai dengan jumlah_beli
  UPDATE produk
  SET stok = stok - NEW.jumlah_beli
  WHERE id = NEW.produk_id;

  -- Mengecek apakah stok menjadi negatif
  IF (SELECT stok FROM produk WHERE id = NEW.produk_id) < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Stok produk tidak mencukupi!';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_transaksi` BEFORE INSERT ON `transaksi` FOR EACH ROW BEGIN
    -- Set status pembayaran default ke "Belum Dibayar" (ID 1)
    SET NEW.status_pembayaran_id = 1; -- Pastikan ID 1 adalah 'Belum Dibayar'
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_transaksi_insert` BEFORE INSERT ON `transaksi` FOR EACH ROW BEGIN
  DECLARE harga_produk DECIMAL(10, 2);

  -- Mendapatkan harga satuan produk dari tabel produk
  SELECT harga INTO harga_produk
  FROM produk
  WHERE id = NEW.produk_id;

  -- Menghitung total harga
  SET NEW.total_harga = harga_produk * NEW.jumlah_beli;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `transaksi_id`, `produk_id`, `jumlah_beli`, `harga_satuan`, `subtotal`) VALUES
(1, 1, 1, 2, 15000000.00, 30000000.00),
(2, 1, 2, 5, 50000.00, 250000.00),
(3, 1, 3, 3, 80000.00, 240000.00);

--
-- Trigger `transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `after_insert_transaksi_detail` AFTER INSERT ON `transaksi_detail` FOR EACH ROW BEGIN
    -- Kurangi stok produk berdasarkan jumlah_beli
    UPDATE produk
    SET stok = stok - NEW.jumlah_beli
    WHERE id = NEW.produk_id;

    -- Cek apakah stok menjadi negatif
    IF (SELECT stok FROM produk WHERE id = NEW.produk_id) < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Stok tidak mencukupi untuk produk ini!';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_transaksi_detail_insert` AFTER INSERT ON `transaksi_detail` FOR EACH ROW BEGIN
    -- Hitung total_harga untuk transaksi terkait
    UPDATE transaksi
    SET total_harga = (
        SELECT SUM(subtotal)
        FROM transaksi_detail
        WHERE transaksi_id = NEW.transaksi_id
    )
    WHERE id = NEW.transaksi_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_transaksi_detail` BEFORE INSERT ON `transaksi_detail` FOR EACH ROW BEGIN
    DECLARE current_stok INT;

    -- Ambil stok produk saat ini
    SELECT stok INTO current_stok
    FROM produk
    WHERE id = NEW.produk_id;

    -- Cek apakah stok mencukupi
    IF NEW.jumlah_beli > current_stok THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Jumlah beli melebihi stok yang tersedia!';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_transaksi_detail_insert` BEFORE INSERT ON `transaksi_detail` FOR EACH ROW BEGIN
    -- Hitung subtotal berdasarkan harga_satuan dan jumlah_beli
    SET NEW.subtotal = NEW.harga_satuan * NEW.jumlah_beli;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` longtext NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` longtext DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `role` enum('admin','penjual','customer','guest') NOT NULL DEFAULT 'guest',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `password`, `foto`, `no_hp`, `alamat`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', 'password123', NULL, '081234567890', 'Jl. Admin', 'admin', NULL, NULL),
(2, 'Penjual', 'penjual@example.com', 'password123', NULL, '081234567891', 'Jl. Penjual', 'penjual', NULL, NULL),
(3, 'Customer', 'customer@example.com', 'password123', NULL, '081234567892', 'Jl. Customer', 'customer', NULL, NULL),
(4, 'Guest', 'guest@example.com', 'password123', NULL, NULL, NULL, 'guest', NULL, NULL),
(5, 'John Doe', 'johndoe@example.com', 'password123', NULL, NULL, NULL, 'customer', NULL, NULL),
(6, 'customer', 'customer@gmail.com', '$2y$12$GFlIa2CaC1haox.9N6JkSOi5L34ug/AnC85T1MuVrEZBKZo1DGM/K', NULL, NULL, NULL, 'admin', '2024-12-20 17:35:51', '2024-12-20 17:35:51'),
(7, 'Muhammad Alfan Ridho', 'alfanridho507@gmail.com', '$2y$12$ngmWgV3D5N6MtMjVVdRM5OpGwE9130zZg.TFxPEhRzoyD44rLnD8G', NULL, NULL, NULL, 'guest', NULL, NULL),
(10, 'Ridho', 'ridho@gmail.com', '$2y$12$GFcd.xRK8inPF0cu/12cEONwcwMgMjgP2oMACQZx9cYUinP/3PTe6', NULL, NULL, NULL, 'customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_produk_id` (`kategori_produk_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_pembayaran_id` (`status_pembayaran_id`),
  ADD KEY `fk_produk_id` (`produk_id`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_produk_id` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`status_pembayaran_id`) REFERENCES `status_pembayaran` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`),
  ADD CONSTRAINT `transaksi_detail_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
