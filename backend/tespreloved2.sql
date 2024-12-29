-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Des 2024 pada 13.51
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
(3, 'Furniture'),
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
(51, 'App\\Models\\User', 6, 'token', 'afbc941606e4ee7b66d0a87ae70435329f81097b44bb4bf9f9f07ba40a761d43', '[\"*\"]', '2024-12-26 06:26:52', NULL, '2024-12-26 06:07:53', '2024-12-26 06:26:52'),
(52, 'App\\Models\\User', 10, 'token', 'e83bc701cff7d183cdf4982b3d69e73122636a5cc06c1e0bf85527735d7bab46', '[\"*\"]', NULL, NULL, '2024-12-26 16:26:07', '2024-12-26 16:26:07'),
(53, 'App\\Models\\User', 10, 'token', '66c5f080314a2122cc5c4098811e26a52e5346296897a2600b61cbde1850f07d', '[\"*\"]', '2024-12-26 17:08:06', NULL, '2024-12-26 16:26:55', '2024-12-26 17:08:06'),
(54, 'App\\Models\\User', 6, 'token', '2cacf9016c960af1c892252a1df94d3ab8596685484ca7d27e90e96d4b9aed24', '[\"*\"]', '2024-12-26 17:40:19', NULL, '2024-12-26 17:18:48', '2024-12-26 17:40:19'),
(55, 'App\\Models\\User', 10, 'token', '83443f8502c906eb8aa99e8b2d127a8e1ba44c71cbda9715e9a9e5aa836a35dc', '[\"*\"]', '2024-12-26 17:41:57', NULL, '2024-12-26 17:40:56', '2024-12-26 17:41:57'),
(56, 'App\\Models\\User', 6, 'token', 'b5fae10c2799d30270048aac25800f5a64a4332241d2a74469d63a86098b23c1', '[\"*\"]', '2024-12-26 17:44:19', NULL, '2024-12-26 17:42:17', '2024-12-26 17:44:19'),
(57, 'App\\Models\\User', 10, 'token', 'b452bd2458671d37f2be6ea43b4dbe761a801a5ede1576df418dcfb24038817c', '[\"*\"]', '2024-12-26 17:45:15', NULL, '2024-12-26 17:45:05', '2024-12-26 17:45:15'),
(58, 'App\\Models\\User', 11, 'token', 'a6008cd49fe2e90595d064d6fc13c19b7436324cf7aa741bccd40bdddfec1df7', '[\"*\"]', '2024-12-26 17:47:42', NULL, '2024-12-26 17:47:00', '2024-12-26 17:47:42'),
(59, 'App\\Models\\User', 11, 'token', 'a43d8d1b6b882329f6d81c99587aa68f1bd6712fc168400553bc2689af900112', '[\"*\"]', NULL, NULL, '2024-12-26 17:51:47', '2024-12-26 17:51:47'),
(60, 'App\\Models\\User', 11, 'token', 'c2b6210cf6291b64f335f209e4e096a07776dda21e7d05704b702b7ad78cbaed', '[\"*\"]', NULL, NULL, '2024-12-26 17:53:25', '2024-12-26 17:53:25'),
(61, 'App\\Models\\User', 10, 'token', 'abd89ee4771c9bcf04babaea5187629745abab575542ca8dda646e8491ee4024', '[\"*\"]', NULL, NULL, '2024-12-26 17:53:55', '2024-12-26 17:53:55'),
(62, 'App\\Models\\User', 10, 'token', 'f59ddc2ee6f01acbfeed6518feda7d4693d63a8f9cc750df37f73f96e387c847', '[\"*\"]', NULL, NULL, '2024-12-26 17:57:09', '2024-12-26 17:57:09'),
(63, 'App\\Models\\User', 10, 'token', 'cea92297df1ebc7eb68cec362e2691670445bca63379ce216ad0f2aa45b19ba8', '[\"*\"]', NULL, NULL, '2024-12-26 17:59:00', '2024-12-26 17:59:00'),
(64, 'App\\Models\\User', 10, 'token', '3d75fa4b9b0a945db2c1afb96c3a16af7695de6a8434c6fda0665a3af72654eb', '[\"*\"]', '2024-12-26 18:00:32', NULL, '2024-12-26 18:00:20', '2024-12-26 18:00:32'),
(65, 'App\\Models\\User', 11, 'token', '15b366044e95fcb1c5c227277f91f5926c3b76f607228ea8671eb52717ed205d', '[\"*\"]', '2024-12-26 18:02:31', NULL, '2024-12-26 18:00:43', '2024-12-26 18:02:31'),
(66, 'App\\Models\\User', 10, 'token', 'd015e46f3cfab371fc3befd73b912ad8abe7ec1757ca43592177874ea116de20', '[\"*\"]', '2024-12-26 18:02:48', NULL, '2024-12-26 18:02:41', '2024-12-26 18:02:48'),
(67, 'App\\Models\\User', 10, 'token', '1348b60a7bc34d6eb3ec3518c8d7e4e2dafece3d973b836e04682e1f16afd9e2', '[\"*\"]', '2024-12-26 18:38:29', NULL, '2024-12-26 18:04:30', '2024-12-26 18:38:29'),
(68, 'App\\Models\\User', 10, 'token', '4f8f8a4fc98686125cc682bff79a2b687a32dcd05fb58d079fc7fe9c14cbda22', '[\"*\"]', NULL, NULL, '2024-12-26 18:38:43', '2024-12-26 18:38:43'),
(69, 'App\\Models\\User', 6, 'token', '11079950679cd012c5a7f0cd7a0e5dfcd81973da7df9f3053052c80dce385020', '[\"*\"]', '2024-12-26 18:41:00', NULL, '2024-12-26 18:40:06', '2024-12-26 18:41:00'),
(70, 'App\\Models\\User', 10, 'token', 'd8648fd0293f5978fa3c4cea1866f7c195089ac8a3f16751dc492462b70ec50e', '[\"*\"]', '2024-12-26 18:42:07', NULL, '2024-12-26 18:42:03', '2024-12-26 18:42:07'),
(71, 'App\\Models\\User', 10, 'token', 'a6973e81f63e341a8bd2139b8a52123fb9d6bb6aeb008c4d1f31be6a165d7d0c', '[\"*\"]', '2024-12-26 19:25:41', NULL, '2024-12-26 19:18:09', '2024-12-26 19:25:41'),
(72, 'App\\Models\\User', 10, 'token', '97542239523c13f84535dbe0ee924bfe18f4b01153e2b3bf255c4419ca9c6218', '[\"*\"]', '2024-12-27 00:04:24', NULL, '2024-12-27 00:04:13', '2024-12-27 00:04:24'),
(73, 'App\\Models\\User', 6, 'token', '6fd4f1ddd91a8b2ee2524b55f9a7a0ec433176672fbbdd00be2c2702304a4c57', '[\"*\"]', '2024-12-27 00:28:25', NULL, '2024-12-27 00:28:19', '2024-12-27 00:28:25'),
(74, 'App\\Models\\User', 10, 'token', '7256142e91e7aa444d5386b7a9edc2fe1eb8a87de02e1259bdf1acfa0e1db495', '[\"*\"]', '2024-12-27 00:44:01', NULL, '2024-12-27 00:43:06', '2024-12-27 00:44:01'),
(75, 'App\\Models\\User', 6, 'token', 'e8518593c7e1e43be9dcd58566138dfc020e94c6fb0b598b60cff3f26e4df082', '[\"*\"]', '2024-12-27 00:45:14', NULL, '2024-12-27 00:44:16', '2024-12-27 00:45:14'),
(76, 'App\\Models\\User', 10, 'token', 'bdc407dc0fae77ce6044df19bb9c12290a3ecf892f26e2fd8c6df050195f048c', '[\"*\"]', '2024-12-27 18:11:56', NULL, '2024-12-27 17:04:12', '2024-12-27 18:11:56'),
(77, 'App\\Models\\User', 6, 'token', '81935a65dbc841236cc80326b19e7e8484d0e628fe68b3d87ea8ee9ef46a61a7', '[\"*\"]', NULL, NULL, '2024-12-27 17:40:19', '2024-12-27 17:40:19'),
(78, 'App\\Models\\User', 10, 'token', 'd1afb7a0a2058540b947e3238b05275babec7073362ad0be88f474dd578d1f9c', '[\"*\"]', '2024-12-27 18:22:21', NULL, '2024-12-27 18:12:06', '2024-12-27 18:22:21'),
(79, 'App\\Models\\User', 6, 'token', 'b4aa2bb3875115965e0ca39ecec68ffc9d09f8a665a2373df4c0a02570064024', '[\"*\"]', '2024-12-27 19:27:35', NULL, '2024-12-27 18:23:21', '2024-12-27 19:27:35'),
(80, 'App\\Models\\User', 10, 'token', '3e095afa128592443074a143245498154ec6a8300e59e9df8a97f3ab8b7b3656', '[\"*\"]', '2024-12-28 02:11:41', NULL, '2024-12-27 19:28:13', '2024-12-28 02:11:41'),
(81, 'App\\Models\\User', 10, 'token', '6e0536ba42f438fef6c32814cced23df530fafaf4b412a38c366ec551e09b25d', '[\"*\"]', '2024-12-28 02:30:10', NULL, '2024-12-28 02:11:58', '2024-12-28 02:30:10'),
(82, 'App\\Models\\User', 6, 'token', 'b69f027c04981a538c551a2394fc46bbe0765d0b60599029ca698edfa325ccd8', '[\"*\"]', NULL, NULL, '2024-12-28 02:30:47', '2024-12-28 02:30:47'),
(83, 'App\\Models\\User', 10, 'token', '267b507cb6ef7cccf3c0dab0cfe6d22c7f603687bdd435fa54e7de5865f7c53a', '[\"*\"]', '2024-12-28 03:19:03', NULL, '2024-12-28 02:31:14', '2024-12-28 03:19:03'),
(84, 'App\\Models\\User', 10, 'token', '8b4912c075fcded9deb092f9fb2e44f30ad895b2da8dcb4fc185692dc3c4eec2', '[\"*\"]', '2024-12-28 17:17:34', NULL, '2024-12-28 16:42:08', '2024-12-28 17:17:34'),
(85, 'App\\Models\\User', 6, 'token', '571bd42a755b7064b3b7811049c37cbe8adf2378762ebef1f9cf9eb44ebfb293', '[\"*\"]', '2024-12-28 17:19:07', NULL, '2024-12-28 17:17:52', '2024-12-28 17:19:07'),
(86, 'App\\Models\\User', 10, 'token', '69fbae35c2443596c190e104f80f7cbe939d05796934847ef1a98b3fa0c8a85a', '[\"*\"]', '2024-12-28 18:25:48', NULL, '2024-12-28 17:42:49', '2024-12-28 18:25:48'),
(87, 'App\\Models\\User', 6, 'token', 'abbdb452be9f03a9b819f732318a108f83cb1609dd5e0f7aefda92b73451307f', '[\"*\"]', '2024-12-28 19:19:10', NULL, '2024-12-28 18:26:33', '2024-12-28 19:19:10'),
(88, 'App\\Models\\User', 10, 'token', '1f16d621bc46c079e3c4bd037feb27bf4c14b6ee618ba0e43c8b9da271fa916e', '[\"*\"]', '2024-12-28 19:46:58', NULL, '2024-12-28 19:21:04', '2024-12-28 19:46:58'),
(89, 'App\\Models\\User', 12, 'token', 'fa735e52972ef6bb2bdcfcd3b9253363265027e9d1d4f417eb2935bba08d3367', '[\"*\"]', '2024-12-29 01:50:18', NULL, '2024-12-28 20:26:55', '2024-12-29 01:50:18'),
(90, 'App\\Models\\User', 10, 'token', 'eb1afe7ed5e844b523cea54bb05ab1ced63d82c784a083d865a35c8e19f34508', '[\"*\"]', '2024-12-29 02:05:01', NULL, '2024-12-29 01:53:58', '2024-12-29 02:05:01'),
(91, 'App\\Models\\User', 12, 'token', 'da52cb085f528771b44d8c6eacc44a33b2bf53910f65af91d1dbcffdda7dd6e0', '[\"*\"]', '2024-12-29 02:06:36', NULL, '2024-12-29 02:05:57', '2024-12-29 02:06:36'),
(92, 'App\\Models\\User', 13, 'token', 'a4e6debaa26277d1633f62ebe872dd0d04845e5e33c1f91252b13aa72332bdd9', '[\"*\"]', '2024-12-29 02:23:23', NULL, '2024-12-29 02:20:30', '2024-12-29 02:23:23'),
(93, 'App\\Models\\User', 13, 'token', 'f3ffd290e74a45f7db8bc2229acfcf4511859998ad2f0c381b8d5f15d0340cbf', '[\"*\"]', '2024-12-29 02:26:39', NULL, '2024-12-29 02:24:56', '2024-12-29 02:26:39'),
(94, 'App\\Models\\User', 12, 'token', '2b409f5ecc51d6543ca02328d7fece592a4b6ad634706ca74c80d1514980cca3', '[\"*\"]', '2024-12-29 02:27:21', NULL, '2024-12-29 02:27:06', '2024-12-29 02:27:21'),
(95, 'App\\Models\\User', 13, 'token', '1c8a828b642e065eea5b91b423d625cb286de7878d647049ffd886f5eafef9c4', '[\"*\"]', '2024-12-29 02:27:48', NULL, '2024-12-29 02:27:42', '2024-12-29 02:27:48'),
(96, 'App\\Models\\User', 6, 'token', '2a2f4016b4e0198d0445fec535ad76ccb5b7f692d0134efb8bc99446751bf244', '[\"*\"]', '2024-12-29 02:28:50', NULL, '2024-12-29 02:28:24', '2024-12-29 02:28:50'),
(97, 'App\\Models\\User', 12, 'token', '221d29ee6f254c4bcd6a70f3749f5e22275052fd1b7c8ac310264b02e1dc9847', '[\"*\"]', '2024-12-29 02:57:28', NULL, '2024-12-29 02:41:52', '2024-12-29 02:57:28'),
(98, 'App\\Models\\User', 12, 'token', 'cda62abd3eacc21dcfc83092fe60068ff3d4d1f7000b1bd290479321971228bb', '[\"*\"]', '2024-12-29 04:47:02', NULL, '2024-12-29 02:57:47', '2024-12-29 04:47:02'),
(99, 'App\\Models\\User', 12, 'token', '48eba9672b35d54c2947915a5adb3bc6d163d4e32d200b674f50aa3b9abcf7d4', '[\"*\"]', '2024-12-29 04:48:01', NULL, '2024-12-29 04:47:54', '2024-12-29 04:48:01'),
(100, 'App\\Models\\User', 12, 'token', '273a1c8b4d5d4c02e9b5648888e72f10f319a9835cb1ed20032d593dacb73e62', '[\"*\"]', '2024-12-29 04:48:57', NULL, '2024-12-29 04:48:49', '2024-12-29 04:48:57'),
(101, 'App\\Models\\User', 12, 'token', '2186dab90b25334cadd7b4aca5014a20661fd811bb9ec03418238fafe09eb864', '[\"*\"]', '2024-12-29 04:50:37', NULL, '2024-12-29 04:50:33', '2024-12-29 04:50:37'),
(102, 'App\\Models\\User', 12, 'token', 'dabdde49ae725058a1502814b2f899381ded08bc9a0faa30e09a299d668b6a3c', '[\"*\"]', '2024-12-29 04:51:07', NULL, '2024-12-29 04:50:58', '2024-12-29 04:51:07'),
(103, 'App\\Models\\User', 12, 'token', '31aed0e7d4924752235b011583cc13349b433f1c501e2afda542ab8d9da1fafc', '[\"*\"]', '2024-12-29 04:53:03', NULL, '2024-12-29 04:52:57', '2024-12-29 04:53:03'),
(104, 'App\\Models\\User', 12, 'token', 'bc7c7d37e6dc3653583a6fc77c04a0e1c8ebeb7df7a2ef49ff1867a4bde1477e', '[\"*\"]', '2024-12-29 04:56:21', NULL, '2024-12-29 04:54:04', '2024-12-29 04:56:21'),
(105, 'App\\Models\\User', 12, 'token', 'e1e570ab8016f9597f499232a75f4fddf598fcfac8b59b800b740f9e4c3ee8ed', '[\"*\"]', '2024-12-29 05:39:43', NULL, '2024-12-29 05:10:39', '2024-12-29 05:39:43');

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
  `kategori_produk_id` int(11) NOT NULL,
  `penjual_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `deskripsi`, `stok`, `lokasi_gambar`, `kategori_produk_id`, `penjual_id`) VALUES
(10, 'Laptop Gaming', 5000000.00, 'Minecraft rata kanan 1000 fps', 0, 'produk/x4uQNBLz6LY9tlJtW6K7eADfGerw1EB8RkRU5MqJ.jpg', 1, NULL),
(11, 'Laptop murah', 1000000.00, 'laptop bagus', 0, 'produk/dBluXK5rJI9Csa2rf7pu7W53zCxw1t7Huz4gQhls.jpg', 1, 10),
(12, 'Laptop Gaming', 5000000.00, 'Laptop murah gaming rata kanan', 0, 'produk/SNLbIfHZs3Bn3L9Fisbloy0Q23g3P83rGxcj71Of.jpg', 1, 10),
(13, 'Topi', 20000.00, 'Topi yang membuatmu ganteng', 0, 'produk/KzxoYUwVsG9JcrY0d6QMSpT18Z0WAlZpubCawqSF.jpg', 4, 10),
(14, 'Kaos Anime', 50000.00, 'Kaos anime yang bikin kamu ganteng', 1, 'produk/yOz1EDlkojAJ3HtDz23Z7FxNoSNVyMu4iWL5YjS6.jpg', 2, 13),
(15, 'Topi NB', 50000.00, 'Topi yang membuat anda semakin ganteng', 1, 'produk/sTN1Fslmxz7aXRdi7H4BIwFIjviqaloJQef53jrh.jpg', 2, 12);

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
(24, 12, 13, 20000, 1, 'Transfer Bank', '2024-12-29 03:29:34', 1),
(25, 12, 13, 20000, 1, 'COD', '2024-12-29 08:11:03', 1),
(26, 12, 13, 20000, 1, 'Transfer Bank', '2024-12-29 08:13:27', 1),
(27, 12, 12, 5000000, 1, 'Transfer Bank', '2024-12-29 08:19:58', 1),
(28, 12, 12, 5000000, 1, 'Transfer Bank', '2024-12-29 08:21:03', 1),
(29, 10, 13, 20000, 1, 'Transfer Bank', '2024-12-29 09:04:48', 1),
(30, 13, 12, 5000000, 1, 'Transfer Bank', '2024-12-29 09:21:58', 1),
(31, 12, 14, 50000, 1, 'Transfer Bank', '2024-12-29 09:27:21', 1),
(32, 12, 14, 50000, 1, 'Transfer Bank', '2024-12-29 10:01:29', 1);

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
CREATE TRIGGER `before_insert_transaksi` BEFORE INSERT ON `transaksi` FOR EACH ROW BEGIN
    -- Set status pembayaran default ke "Belum Dibayar" (ID 1)
    SET NEW.status_pembayaran_id = 1; -- Pastikan ID 1 adalah 'Belum Dibayar'
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
  `role` enum('admin','penjual','customer') DEFAULT 'customer',
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
(4, 'Guest', 'guest@example.com', 'password123', NULL, NULL, NULL, '', NULL, NULL),
(5, 'John Doe', 'johndoe@example.com', 'password123', NULL, NULL, NULL, 'customer', NULL, NULL),
(6, 'customerr', 'customer@gmail.com', '$2y$12$GFlIa2CaC1haox.9N6JkSOi5L34ug/AnC85T1MuVrEZBKZo1DGM/K', NULL, '0897729827282', 'Gg. H. Boan RT05/RW03 Palsigunung', 'admin', '2024-12-20 17:35:51', '2024-12-20 17:35:51'),
(7, 'Muhammad Alfan Ridho', 'alfanridho507@gmail.com', '$2y$12$ngmWgV3D5N6MtMjVVdRM5OpGwE9130zZg.TFxPEhRzoyD44rLnD8G', NULL, NULL, NULL, '', NULL, NULL),
(10, 'Ridho', 'ridho@gmail.com', '$2y$12$GFcd.xRK8inPF0cu/12cEONwcwMgMjgP2oMACQZx9cYUinP/3PTe6', NULL, '08977298272823', 'Gg. H. Boan RT05/RW03 Palsigunung', 'penjual', NULL, NULL),
(11, 'Arman', 'arman@gmail.com', '$2y$12$5FuD8SMPC8ze0q/ujF2MEOmpP5Kh7FxQ4WeDTA6nwZVKmudz3tjye', NULL, NULL, NULL, 'customer', NULL, NULL),
(12, 'luffy', 'luffy@gmail.com', '$2y$12$fBPoWo5k7rRUss/eh9vKuO59Js8ZZ.oufb6UhQSXc.SPo1OTYqxWK', NULL, '08977298272823', 'Gg. H. Boan RT05/RW03 Palsigunung', 'penjual', NULL, NULL),
(13, 'zoro', 'zoro@gmail.com', '$2y$12$MFc9bsx4y4O0KDBO7NkJiOogVMlDVU1XntPm8agjcvRVdXjSjExGO', NULL, '0897729827282', 'Gg. H. Boan RT05/RW03 Palsigunung', 'penjual', NULL, NULL);

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
  ADD KEY `kategori_produk_id` (`kategori_produk_id`),
  ADD KEY `fk_penjual` (`penjual_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `fk_penjual` FOREIGN KEY (`penjual_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
