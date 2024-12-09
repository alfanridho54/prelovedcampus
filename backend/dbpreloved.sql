-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Des 2024 pada 00.01
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
-- Database: `dbpreloved`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `kategori`) VALUES
(1, 'Elektronik'),
(2, 'Pakaian'),
(3, 'Perabotan'),
(4, 'Buku'),
(6, 'tees');

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
(5, '2024_11_11_230818_update_password_length_in_users_table', 2);

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
(1, 'App\\Models\\User', 5, 'token', '0cec8832489a0b9164f5374f42b14deaf83d06e5b261aecf95daf3da21cecbe3', '[\"*\"]', NULL, NULL, '2024-11-27 02:01:20', '2024-11-27 02:01:20'),
(2, 'App\\Models\\User', 5, 'token', 'f77d2c804e762a4bde8f0548c342dbd4aed2115629958b95f7d035c59264c8da', '[\"*\"]', NULL, NULL, '2024-11-27 02:02:09', '2024-11-27 02:02:09'),
(3, 'App\\Models\\User', 5, 'token', '287d08309bb151f1d7367bbe9705d5e04003b43c51b436416d103dc2badfedad', '[\"*\"]', NULL, NULL, '2024-12-02 02:05:49', '2024-12-02 02:05:49'),
(4, 'App\\Models\\User', 5, 'token', 'f80ff0ef67e5788f5d376e867789f82a55508406f495599a31b14f59b8eccc15', '[\"*\"]', '2024-12-02 02:20:07', NULL, '2024-12-02 02:12:03', '2024-12-02 02:20:07'),
(5, 'App\\Models\\User', 5, 'token', '2462ad43c3e25c82bf3b2bac80a1668f41d07d5597b14ae0a4b9fe7458c3db13', '[\"*\"]', NULL, NULL, '2024-12-02 02:21:15', '2024-12-02 02:21:15'),
(6, 'App\\Models\\User', 5, 'token', '63a611f908cce4a4e7367096cce454f7f4479388877b1dce6a907f8640db36fa', '[\"*\"]', '2024-12-02 02:31:47', NULL, '2024-12-02 02:21:19', '2024-12-02 02:31:47'),
(7, 'App\\Models\\User', 5, 'token', '662aff08aa19b9668aac1164b13b2ddd654159315178f1e74607e3d2a166eedc', '[\"*\"]', '2024-12-02 02:40:19', NULL, '2024-12-02 02:31:58', '2024-12-02 02:40:19'),
(8, 'App\\Models\\User', 5, 'token', '5e1261d554f01711a017406c5f8f1c9c60f320f6bee0ec7cf9d86154fd50bbf7', '[\"*\"]', '2024-12-02 02:52:55', NULL, '2024-12-02 02:40:25', '2024-12-02 02:52:55'),
(9, 'App\\Models\\User', 5, 'token', 'fb61c023ce7944fbbcbf042487fd9fb9177892cffc6f9659bdd2afd46921a656', '[\"*\"]', NULL, NULL, '2024-12-02 02:42:58', '2024-12-02 02:42:58'),
(10, 'App\\Models\\User', 5, 'token', '9e222f32a194d9dd5675c2b0555e54845e674157b4e99e063bda9b60b2785fad', '[\"*\"]', '2024-12-02 02:55:23', NULL, '2024-12-02 02:50:59', '2024-12-02 02:55:23'),
(11, 'App\\Models\\User', 5, 'token', 'a3389f540795423c2841f91bcb0d07480ed353a8ce7e188c1285b13a07310f51', '[\"*\"]', '2024-12-02 16:28:53', NULL, '2024-12-02 16:23:29', '2024-12-02 16:28:53'),
(12, 'App\\Models\\User', 5, 'token', '1388e5bbcc928cfd9129edcdef47bb821a32247ad270f994bb2a4a4ab5a3891b', '[\"*\"]', '2024-12-02 16:32:37', NULL, '2024-12-02 16:31:46', '2024-12-02 16:32:37'),
(13, 'App\\Models\\User', 5, 'token', '5fc06f32dedfffe8cfba46d491419c92b81ef18255e99f1868cc3a55666b456e', '[\"*\"]', '2024-12-02 16:35:29', NULL, '2024-12-02 16:32:43', '2024-12-02 16:35:29'),
(14, 'App\\Models\\User', 5, 'token', '3ae1d9f4ab2ce2897f49732048599b3a7caad3bd752256fcbc70d40822a917d3', '[\"*\"]', '2024-12-02 16:36:48', NULL, '2024-12-02 16:35:33', '2024-12-02 16:36:48'),
(15, 'App\\Models\\User', 7, 'token', '6bac17cfac5b5be42e0d18287ca3e202d8a48d357aa80ad6319df23535bf0fee', '[\"*\"]', '2024-12-02 16:41:06', NULL, '2024-12-02 16:39:32', '2024-12-02 16:41:06'),
(16, 'App\\Models\\User', 7, 'token', '5121923b7e849030d06f115efd4da91de9d6dccfc993df38c9c3fec27d10ee92', '[\"*\"]', '2024-12-02 16:48:45', NULL, '2024-12-02 16:41:11', '2024-12-02 16:48:45'),
(17, 'App\\Models\\User', 8, 'token', 'd8a79d148a32eaf4ba3c8023782bc2d70fff4b1813c742cb969dfd9a573b5c1c', '[\"*\"]', '2024-12-02 17:13:06', NULL, '2024-12-02 17:12:10', '2024-12-02 17:13:06'),
(18, 'App\\Models\\User', 8, 'token', '5bd78ee7035d275bff6beaf3818ff3283e9cc9e8360a4b0489c07610219dbdb2', '[\"*\"]', NULL, NULL, '2024-12-02 17:15:32', '2024-12-02 17:15:32'),
(19, 'App\\Models\\User', 10, 'token', '3757100b9eeba833bc57ab0f2d10af89047368ee33642de11515f4ca37f68e15', '[\"*\"]', NULL, NULL, '2024-12-02 17:19:09', '2024-12-02 17:19:09'),
(20, 'App\\Models\\User', 10, 'token', '3ae2ee7c190f410a5d2d1d14a0720c20d91a39acb78de6fd43d2b57f07d2b333', '[\"*\"]', NULL, NULL, '2024-12-02 17:19:46', '2024-12-02 17:19:46'),
(21, 'App\\Models\\User', 10, 'token', '72356ef417c355b0dbf9205188581f6e8ce8556a02c84408eb91391113732b2f', '[\"*\"]', '2024-12-03 19:59:53', NULL, '2024-12-03 19:59:43', '2024-12-03 19:59:53'),
(22, 'App\\Models\\User', 10, 'token', '61140aa420ab8dd8e1d3776c3a1321d6b10ba10a3d6ce1cc189b12c45dafb246', '[\"*\"]', '2024-12-03 20:12:24', NULL, '2024-12-03 20:05:54', '2024-12-03 20:12:24'),
(23, 'App\\Models\\User', 10, 'token', 'b5f33eec43e5f1b25b364a6e928f1a2499695ba8777e75273a07cb30980de4e4', '[\"*\"]', '2024-12-03 20:34:10', NULL, '2024-12-03 20:15:40', '2024-12-03 20:34:10'),
(24, 'App\\Models\\User', 10, 'token', 'b32e9012249327c99cc2359ea0cfca0b7b4439914af97a09ac4bf62a1236c2b1', '[\"*\"]', '2024-12-03 20:38:13', NULL, '2024-12-03 20:32:42', '2024-12-03 20:38:13'),
(25, 'App\\Models\\User', 11, 'token', '2b2b5b66d0bf960c60007a9d1b746d2cea97b1589ffc3b342c0ce28e445634ec', '[\"*\"]', '2024-12-03 20:46:38', NULL, '2024-12-03 20:46:08', '2024-12-03 20:46:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `lokasi_gambar` longtext DEFAULT NULL,
  `kategori_produk_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `deskripsi`, `stok`, `lokasi_gambar`, `kategori_produk_id`) VALUES
(1, 'Laptop ASUS', 7500000.00, 'Laptop ASUS dengan spesifikasi tinggi', 10, 'path/to/laptop_asus.jpg', 1),
(2, 'Kemeja Pria', 150000.00, 'Kemeja pria bahan katun', 25, 'path/to/kemeja_pria.jpg', 2),
(3, 'Sofa Minimalis', 2000000.00, 'Sofa minimalis untuk ruang tamu', 5, 'path/to/sofa.jpg', 3),
(4, 'Buku Pemrograman', 100000.00, 'Buku panduan pemrograman untuk pemula', 30, 'path/to/buku_pemrograman.jpg', 4);

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
('aKy2Zwiflepx3pSOkldaQIu1fdrkFRErMrOXUvDu', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVVYZTdQemVUWnFpa1NHWHh5S0xXWWd3aVhZVnpPR1BJdVFqdnBzTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1733133323),
('g0n3CXerg6lzVUC8kClNYFqKZraJMZaTjMtDI2qs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEFHWm9MWHBLREtkUjJXUVBVdmFmZDJsZUtDaHNhcm9qUmVybGV5dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731062362),
('g47lO861ChMFtZcvGgBeBGHbW83V4drhVkalL14Y', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG15MGpoMk9jSk1hbnNEeEhydDhlbU9POUJKTlZIbjcwV2s1MklkbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1733182133),
('kxkEkkpOnlxnmHULQOgkfZcm8MpBuuM2qBNkVgWR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWIwZlN6aVFPd3ZSc0NuZGF0WVpWR2JRWlFhNUhBMUNINmlXTDRsZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731330019);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pembayaran`
--

CREATE TABLE `status_pembayaran` (
  `id` int(11) NOT NULL,
  `status_pembayaran` enum('Lunas','Belum Lunas','Dibatalkan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `status_pembayaran`
--

INSERT INTO `status_pembayaran` (`id`, `status_pembayaran`) VALUES
(1, 'Lunas'),
(2, 'Belum Lunas'),
(3, 'Dibatalkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `metode_pembayaran` varchar(45) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `status_pembayaran_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `no_hp` int(11) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `role` enum('admin','customer','penjual','guest') NOT NULL DEFAULT 'guest'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `password`, `foto`, `no_hp`, `alamat`, `role`) VALUES
(8, 'admin', 'admin@gmail.com', '$2y$12$S/5GaYh6uWZlQqO6LglMo.MnnexIlhI2Pz7AKKUZ.cnDj95iGCa1K', NULL, NULL, NULL, 'guest'),
(9, 'admin', 'admin@gmail.com', '$2y$12$qcxxvxEcWc2sTgWAHLX1huyWLn4kcOA8949qG80CFfIuuSOr6CgTO', NULL, NULL, NULL, 'admin'),
(10, 'admin', 'admin1@gmail.com', '$2y$12$eG6aPoAb9w2ONTeYgoyQRuEIfnR4zJIcUTGscfCp/MMwi5LoPMJum', NULL, NULL, NULL, 'admin'),
(11, 'customer', 'customer@gmail.com', '$2y$12$QeTWsvyh/9XywGYDckTyPuj.heeVKV/SAE6Dt2ABcBTGvmNQiTW1e', NULL, NULL, NULL, 'customer');

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
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `status_pembayaran_id` (`status_pembayaran_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`status_pembayaran_id`) REFERENCES `status_pembayaran` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
