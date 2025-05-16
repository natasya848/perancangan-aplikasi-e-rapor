-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2025 at 07:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `asuransi`
--

CREATE TABLE `asuransi` (
  `id_asuransi` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asuransi`
--

INSERT INTO `asuransi` (`id_asuransi`, `nama`, `harga`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3301, 'Tidak ada Asuransi', 0.00, 0, '2025-04-02 14:54:50', NULL, NULL),
(3302, 'Asuransi Perjalanan', 85000.00, 0, '2025-04-02 14:54:50', NULL, NULL),
(3303, 'Asuransi Penerbangan Delay', 150000.00, 0, '2025-04-02 14:54:50', NULL, NULL),
(3304, 'Asuransi Bagasi Hilang', 20000.00, 0, '2025-04-02 14:54:50', NULL, NULL),
(3305, 'Asuransi Reschedule Penerbangan', 60000.00, 0, '2025-04-02 14:54:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bandara`
--

CREATE TABLE `bandara` (
  `id_bandara` int(11) NOT NULL,
  `nama_bandara` varchar(255) NOT NULL,
  `kode_bandara` varchar(50) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bandara`
--

INSERT INTO `bandara` (`id_bandara`, `nama_bandara`, `kode_bandara`, `kota`, `negara`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5001, 'Hang Nadim', 'BTH', 'Batam', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5002, 'Soekarno-Hatta', 'CGK', 'Jakarta', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5003, 'Ngurah Rai', 'DPS', 'Bali', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5004, 'Juanda', 'SUB', 'Surabaya', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5005, 'Kualanamu', 'KNO', 'Medan', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5006, 'Changi Airport', 'SIN', 'Singapura', 'Singapura', 0, '2025-03-14 22:39:14', NULL, NULL),
(5007, 'Suvarnabhumi Airport', 'BKK', 'Bangkok', 'Thailand', 0, '2025-03-14 22:39:14', NULL, NULL),
(5008, 'Kuala Lumpur Intl Airport', 'KUL', 'Kuala Lumpur', 'Malaysia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5009, 'Incheon International Airport', 'ICN', 'Seoul', 'Korea Selatan', 0, '2025-03-14 22:39:14', NULL, NULL),
(5010, 'Narita International Airport', 'NRT', 'Tokyo', 'Jepang', 0, '2025-03-14 22:39:14', NULL, NULL),
(5011, 'Yogyakarta International', 'YIA', 'Yogyakarta', 'Indonesia', 0, '2025-03-14 22:39:14', '2025-03-19 16:37:22', NULL),
(5012, 'Husein Sastranegara', 'BDO', 'Bandung', 'Indonesia', 0, '2025-03-14 22:39:14', NULL, NULL),
(5013, 'Bandar Udara  Komodo', 'LBJ', 'NTT', 'Indonesia', 0, '2025-03-14 22:39:14', '2025-04-06 12:36:17', NULL),
(5014, 'Hong Kong International', 'HKG', 'Hong Kong', 'Hong Kong', 0, '2025-03-14 22:39:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `id_checkin` int(11) NOT NULL,
  `id_tiket` int(11) NOT NULL,
  `status` enum('Sudah','Belum') NOT NULL,
  `waktu_checkin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkin`
--

INSERT INTO `checkin` (`id_checkin`, `id_tiket`, `status`, `waktu_checkin`) VALUES
(1001, 9001, 'Sudah', '2025-02-20 01:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `aktivitas` text NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id_log`, `id_user`, `aktivitas`, `ip_address`, `waktu`) VALUES
(1, 19, 'Mengakses Dashboard', '::1', '2025-03-19 07:33:14'),
(2, 19, 'Mengakses Dashboard', '::1', '2025-03-19 07:35:08'),
(3, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 07:39:09'),
(4, 19, 'Mengakses Settings', '::1', '2025-03-19 07:42:37'),
(5, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 07:42:38'),
(6, 19, 'Mengakses Profil', '::1', '2025-03-19 07:57:37'),
(7, 19, 'Logout dari sistem', '::1', '2025-03-19 07:57:40'),
(8, 9, 'Login ke sistem', '::1', '2025-03-19 07:57:47'),
(9, 9, 'Mengakses Dashboard', '::1', '2025-03-19 07:57:47'),
(10, 9, 'Mengakses Profil', '::1', '2025-03-19 07:58:05'),
(11, 9, 'Mengakses Profil', '::1', '2025-03-19 08:03:41'),
(12, 9, 'Mengakses Profil', '::1', '2025-03-19 08:04:46'),
(13, 9, 'Mengakses Profil', '::1', '2025-03-19 08:04:56'),
(14, 9, 'Mengakses Profil', '::1', '2025-03-19 08:06:45'),
(15, 9, 'Mengakses Profil', '::1', '2025-03-19 08:06:53'),
(16, 9, 'Mengakses Profil', '::1', '2025-03-19 08:08:01'),
(17, 9, 'Mengakses Profil', '::1', '2025-03-19 08:08:18'),
(18, 9, 'Mengakses Profil', '::1', '2025-03-19 08:08:49'),
(19, 9, 'Mengakses Profil', '::1', '2025-03-19 08:10:15'),
(20, 9, 'Mengakses Profil', '::1', '2025-03-19 08:12:01'),
(21, 9, 'Mengakses Profil', '::1', '2025-03-19 08:12:15'),
(22, 9, 'Mengakses Profil', '::1', '2025-03-19 08:12:28'),
(23, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:12:30'),
(24, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:14:00'),
(25, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:14:04'),
(26, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:19:14'),
(27, 9, 'Mencari Penerbangan', '::1', '2025-03-19 08:19:32'),
(28, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 08:19:49'),
(29, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:19:49'),
(30, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:19:52'),
(31, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:20:13'),
(32, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:20:19'),
(33, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 08:23:06'),
(34, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:23:10'),
(35, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:23:14'),
(36, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:23:56'),
(37, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:24:05'),
(38, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:24:08'),
(39, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:47:26'),
(40, 4, 'Login ke sistem', '::1', '2025-03-19 08:48:07'),
(41, 4, 'Mengakses Dashboard', '::1', '2025-03-19 08:48:07'),
(42, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:49:12'),
(43, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:50:05'),
(44, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:50:11'),
(45, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:51:21'),
(46, 4, 'Mengakses Profil', '::1', '2025-03-19 08:52:04'),
(47, 4, 'Logout dari sistem', '::1', '2025-03-19 08:52:08'),
(48, 9, 'Login ke sistem', '::1', '2025-03-19 08:52:14'),
(49, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:52:14'),
(50, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:52:26'),
(51, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:55:12'),
(52, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:55:14'),
(53, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:55:20'),
(54, 9, 'Mengakses Dashboard', '::1', '2025-03-19 08:56:06'),
(55, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:56:15'),
(56, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 08:57:50'),
(57, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:00:03'),
(58, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:01:13'),
(59, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:01:55'),
(60, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:02:35'),
(61, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:04:56'),
(62, 9, 'Mengakses Profil', '::1', '2025-03-19 09:05:37'),
(63, 9, 'Logout dari sistem', '::1', '2025-03-19 09:05:39'),
(64, 4, 'Login ke sistem', '::1', '2025-03-19 09:05:43'),
(65, 4, 'Mengakses Dashboard', '::1', '2025-03-19 09:05:43'),
(66, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:05:46'),
(67, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:05:56'),
(68, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:07:33'),
(69, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-19 09:07:38'),
(70, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:07:40'),
(71, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:09:18'),
(72, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:10:09'),
(73, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:11:10'),
(74, 4, 'Mengakses Profil', '::1', '2025-03-19 09:11:57'),
(75, 4, 'Logout dari sistem', '::1', '2025-03-19 09:11:58'),
(76, 9, 'Login ke sistem', '::1', '2025-03-19 09:12:02'),
(77, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:12:03'),
(78, 9, 'Mengakses Profil', '::1', '2025-03-19 09:19:59'),
(79, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:20:01'),
(80, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:20:08'),
(81, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:20:09'),
(82, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:20:13'),
(83, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 09:20:28'),
(84, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:20:28'),
(85, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:21:15'),
(86, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:21:19'),
(87, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:21:29'),
(88, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:21:40'),
(89, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:22:25'),
(90, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:23:39'),
(91, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:23:48'),
(92, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:23:50'),
(93, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:23:57'),
(94, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:24:04'),
(95, 9, 'Mengakses Profil', '::1', '2025-03-19 09:24:14'),
(96, 9, 'Logout dari sistem', '::1', '2025-03-19 09:24:16'),
(97, 4, 'Login ke sistem', '::1', '2025-03-19 09:24:20'),
(98, 4, 'Mengakses Dashboard', '::1', '2025-03-19 09:24:21'),
(99, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:24:24'),
(100, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:24:39'),
(101, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 09:26:29'),
(102, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:26:35'),
(103, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:26:53'),
(104, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:27:37'),
(105, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:27:45'),
(106, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:28:02'),
(107, 4, 'Mengakses Profil', '::1', '2025-03-19 09:28:41'),
(108, 4, 'Logout dari sistem', '::1', '2025-03-19 09:28:43'),
(109, 9, 'Login ke sistem', '::1', '2025-03-19 09:28:57'),
(110, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:28:57'),
(111, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:29:00'),
(112, 9, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:36:12'),
(113, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:36:12'),
(114, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:36:30'),
(115, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:36:32'),
(116, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:36:47'),
(117, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:36:49'),
(118, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:36:53'),
(119, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:36:54'),
(120, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:37:00'),
(121, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:37:01'),
(122, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:37:46'),
(123, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:37:47'),
(124, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:37:52'),
(125, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:37:54'),
(126, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:38:02'),
(127, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 09:38:13'),
(128, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:38:13'),
(129, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:38:25'),
(130, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:38:34'),
(131, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 09:38:44'),
(132, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:38:44'),
(133, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:38:46'),
(134, 9, 'Mengakses Profil', '::1', '2025-03-19 09:38:50'),
(135, 9, 'Logout dari sistem', '::1', '2025-03-19 09:38:52'),
(136, 4, 'Login ke sistem', '::1', '2025-03-19 09:39:01'),
(137, 4, 'Mengakses Dashboard', '::1', '2025-03-19 09:39:01'),
(138, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:39:05'),
(139, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:40:14'),
(140, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:40:20'),
(141, 4, 'Mengakses Profil', '::1', '2025-03-19 09:40:28'),
(142, 4, 'Logout dari sistem', '::1', '2025-03-19 09:40:30'),
(143, 9, 'Login ke sistem', '::1', '2025-03-19 09:40:39'),
(144, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:40:39'),
(145, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:40:47'),
(146, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:40:50'),
(147, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 09:40:55'),
(148, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:40:57'),
(149, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:41:03'),
(150, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:41:16'),
(151, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:41:20'),
(152, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:42:01'),
(153, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:42:04'),
(154, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:42:31'),
(155, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:42:42'),
(156, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:42:50'),
(157, 9, 'Mengakses Profil', '::1', '2025-03-19 09:42:52'),
(158, 9, 'Logout dari sistem', '::1', '2025-03-19 09:42:54'),
(159, 4, 'Login ke sistem', '::1', '2025-03-19 09:43:04'),
(160, 4, 'Mengakses Dashboard', '::1', '2025-03-19 09:43:04'),
(161, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:43:09'),
(162, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:43:11'),
(163, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:43:43'),
(164, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:44:46'),
(165, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:44:51'),
(166, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:44:55'),
(167, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:46:35'),
(168, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:48:15'),
(169, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:51:45'),
(170, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:51:49'),
(171, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:52:49'),
(172, 4, 'Mengakses Profil', '::1', '2025-03-19 09:52:54'),
(173, 4, 'Logout dari sistem', '::1', '2025-03-19 09:52:55'),
(174, 9, 'Login ke sistem', '::1', '2025-03-19 09:53:03'),
(175, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:53:03'),
(176, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:53:27'),
(177, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 09:53:37'),
(178, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:53:37'),
(179, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:53:41'),
(180, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:53:49'),
(181, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:53:53'),
(182, 9, 'Mencari Penerbangan', '::1', '2025-03-19 09:53:57'),
(183, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 09:54:05'),
(184, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:54:05'),
(185, 9, 'Mengakses Dashboard', '::1', '2025-03-19 09:54:08'),
(186, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:54:15'),
(187, 9, 'Mengakses Profil', '::1', '2025-03-19 09:54:17'),
(188, 9, 'Logout dari sistem', '::1', '2025-03-19 09:54:19'),
(189, 4, 'Login ke sistem', '::1', '2025-03-19 09:54:27'),
(190, 4, 'Mengakses Dashboard', '::1', '2025-03-19 09:54:27'),
(191, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 09:54:30'),
(192, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:54:35'),
(193, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:55:13'),
(194, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:55:18'),
(195, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:55:24'),
(196, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:55:28'),
(197, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 09:59:26'),
(198, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:00:17'),
(199, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:02:04'),
(200, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:03:34'),
(201, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 10:03:37'),
(202, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:04:20'),
(203, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:06:32'),
(204, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 10:07:34'),
(205, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 10:07:37'),
(206, 4, 'Mengakses Profil', '::1', '2025-03-19 11:42:20'),
(207, 9, 'Login ke sistem', '::1', '2025-03-19 11:42:30'),
(208, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:42:30'),
(209, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:42:36'),
(210, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:42:44'),
(211, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:43:01'),
(212, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:45:29'),
(213, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:48:15'),
(214, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:48:15'),
(215, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:48:25'),
(216, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:48:42'),
(217, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:48:53'),
(218, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:49:03'),
(219, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:49:05'),
(220, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:49:10'),
(221, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:49:23'),
(222, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:49:23'),
(223, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:52:20'),
(224, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:52:30'),
(225, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:54:13'),
(226, 9, 'Mengakses Profil', '::1', '2025-03-19 11:54:19'),
(227, 9, 'Logout dari sistem', '::1', '2025-03-19 11:54:20'),
(228, 4, 'Login ke sistem', '::1', '2025-03-19 11:54:27'),
(229, 4, 'Mengakses Dashboard', '::1', '2025-03-19 11:54:27'),
(230, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-19 11:54:29'),
(231, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 11:54:36'),
(232, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:54:39'),
(233, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:54:45'),
(234, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 11:54:48'),
(235, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:57:18'),
(236, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:57:24'),
(237, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 11:57:26'),
(238, 4, 'Mengakses Profil', '::1', '2025-03-19 11:58:26'),
(239, 4, 'Logout dari sistem', '::1', '2025-03-19 11:58:27'),
(240, 9, 'Login ke sistem', '::1', '2025-03-19 11:58:34'),
(241, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:58:34'),
(242, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:58:41'),
(243, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 11:58:49'),
(244, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:58:49'),
(245, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:58:51'),
(246, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 11:58:58'),
(247, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:59:00'),
(248, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:59:07'),
(249, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:59:09'),
(250, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:59:16'),
(251, 9, 'Mengakses Dashboard', '::1', '2025-03-19 11:59:20'),
(252, 9, 'Mencari Penerbangan', '::1', '2025-03-19 11:59:24'),
(253, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 12:04:34'),
(254, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:04:34'),
(255, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:07:25'),
(256, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:07:30'),
(257, 9, 'Mencari Penerbangan', '::1', '2025-03-19 12:07:35'),
(258, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:07:40'),
(259, 9, 'Mencari Penerbangan', '::1', '2025-03-19 12:07:42'),
(260, 9, 'Mencari Penerbangan', '::1', '2025-03-19 12:08:38'),
(261, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 12:08:53'),
(262, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:08:53'),
(263, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:08:59'),
(264, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:09:03'),
(265, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:09:06'),
(266, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:11:22'),
(267, 9, 'Mencari Penerbangan', '::1', '2025-03-19 12:11:26'),
(268, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-19 12:11:56'),
(269, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:11:56'),
(270, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:12:33'),
(271, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:12:42'),
(272, 9, 'Mengakses Profil', '::1', '2025-03-19 12:12:49'),
(273, 9, 'Logout dari sistem', '::1', '2025-03-19 12:12:50'),
(274, 4, 'Login ke sistem', '::1', '2025-03-19 12:12:56'),
(275, 4, 'Mengakses Dashboard', '::1', '2025-03-19 12:12:56'),
(276, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:13:00'),
(277, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:13:08'),
(278, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 12:13:10'),
(279, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-19 12:13:28'),
(280, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 12:13:31'),
(281, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-19 12:13:32'),
(282, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-19 12:13:33'),
(283, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:13:37'),
(284, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:13:41'),
(285, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-19 12:13:44'),
(286, 4, 'Mengakses Profil', '::1', '2025-03-19 12:13:47'),
(287, 4, 'Logout dari sistem', '::1', '2025-03-19 12:13:48'),
(288, 9, 'Login ke sistem', '::1', '2025-03-19 12:13:57'),
(289, 9, 'Mengakses Dashboard', '::1', '2025-03-19 12:13:57'),
(290, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:14:00'),
(291, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-19 12:17:49'),
(292, 9, 'Mengakses Tabel Tiket', '::1', '2025-03-19 12:17:51'),
(293, 9, 'Download Tiket', '::1', '2025-03-19 12:17:54'),
(294, 19, 'Login ke sistem', '::1', '2025-03-23 03:48:43'),
(295, 19, 'Mengakses Dashboard', '::1', '2025-03-23 03:48:44'),
(296, 19, 'Mengakses Profil', '::1', '2025-03-23 03:51:48'),
(297, 19, 'Logout dari sistem', '::1', '2025-03-23 03:51:50'),
(298, 9, 'Login ke sistem', '::1', '2025-03-23 03:54:35'),
(299, 9, 'Mengakses Dashboard', '::1', '2025-03-23 03:54:35'),
(300, 9, 'Mengakses Profil', '::1', '2025-03-23 03:55:42'),
(301, 9, 'Logout dari sistem', '::1', '2025-03-23 03:55:46'),
(302, 24, 'Login ke sistem', '::1', '2025-03-23 05:31:53'),
(303, 24, 'Mengakses Dashboard', '::1', '2025-03-23 05:31:53'),
(304, 24, 'Mengakses Profil', '::1', '2025-03-23 05:31:57'),
(305, 24, 'Logout dari sistem', '::1', '2025-03-23 05:32:15'),
(306, 24, 'Login ke sistem', '::1', '2025-03-23 06:45:49'),
(307, 24, 'Mengakses Dashboard', '::1', '2025-03-23 06:45:49'),
(308, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 06:48:39'),
(309, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 06:49:34'),
(310, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 06:50:52'),
(311, 24, 'Mengakses Dashboard', '::1', '2025-03-23 07:10:03'),
(312, 24, 'Mengakses Dashboard', '::1', '2025-03-23 07:10:18'),
(313, 24, 'Mengakses Tabel Pembayaran', '::1', '2025-03-23 07:12:07'),
(314, 24, 'Mengakses Tabel Pembayaran', '::1', '2025-03-23 07:12:11'),
(315, 24, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-23 07:12:14'),
(316, 24, 'Mengakses Dashboard', '::1', '2025-03-23 07:12:30'),
(317, 24, 'Mengakses Profil', '::1', '2025-03-23 07:12:39'),
(318, 24, 'Mengakses Dashboard', '::1', '2025-03-23 07:12:43'),
(319, 24, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-23 07:12:45'),
(320, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:51'),
(321, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:53'),
(322, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:54'),
(323, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:56'),
(324, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:56'),
(325, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:57'),
(326, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:57'),
(327, 24, 'Mengakses halaman Reset Password', '::1', '2025-03-23 07:12:57'),
(328, 19, 'Login ke sistem', '::1', '2025-03-23 07:13:04'),
(329, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:13:04'),
(330, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:13:04'),
(331, 19, 'Mengakses Laporan Pemesanan', '::1', '2025-03-23 07:13:09'),
(332, 19, 'Mengakses Profil', '::1', '2025-03-23 07:13:12'),
(333, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-23 07:13:14'),
(334, 19, 'Mengakses Tabel Penumpang', '::1', '2025-03-23 07:13:19'),
(335, 19, 'Mengakses Tabel Petugas', '::1', '2025-03-23 07:13:28'),
(336, 19, 'Mengakses Tabel Bandara', '::1', '2025-03-23 07:13:32'),
(337, 19, 'Mengakses Tabel Bandara', '::1', '2025-03-23 07:22:15'),
(338, 19, 'Mengakses Tabel Bandara', '::1', '2025-03-23 07:23:40'),
(339, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:24:28'),
(340, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:24:40'),
(341, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:24:51'),
(342, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:30:34'),
(343, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-23 07:30:59'),
(344, 19, 'Mengakses Profil', '::1', '2025-03-23 07:31:03'),
(345, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:32:18'),
(346, 19, 'Mengakses Tabel Pemesanan', '::1', '2025-03-23 07:32:21'),
(347, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:32:27'),
(348, 19, 'Mengakses Settings', '::1', '2025-03-23 07:32:32'),
(349, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:32:39'),
(350, 19, 'Mengakses Tabel Rute', '::1', '2025-03-23 07:33:07'),
(351, 19, 'Mengakses Settings', '::1', '2025-03-23 07:33:10'),
(352, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:34:02'),
(353, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:34:06'),
(354, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:34:11'),
(355, 19, 'Mengakses Tabel Penumpang', '::1', '2025-03-23 07:36:08'),
(356, 19, 'Mengakses Dashboard', '::1', '2025-03-23 07:36:10'),
(357, 19, 'Login ke sistem', '::1', '2025-03-23 12:20:34'),
(358, 19, 'Mengakses Dashboard', '::1', '2025-03-23 12:20:34'),
(359, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 12:24:39'),
(360, 19, 'Mencetak Laporan PDF Pembayaran dari 2025-02-07 sampai 2025-03-23 untuk semua maskapai.', '::1', '2025-03-23 12:24:49'),
(361, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 12:24:59'),
(362, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 12:34:47'),
(363, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:34:49'),
(364, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:35:03'),
(365, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:38:24'),
(366, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:38:59'),
(367, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:41:41'),
(368, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:54:07'),
(369, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 12:59:09'),
(370, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:00:53'),
(371, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:27:58'),
(372, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:32:21'),
(373, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:34:05'),
(374, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:34:26'),
(375, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:37:10'),
(376, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:38:01'),
(377, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:38:28'),
(378, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:42:32'),
(379, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:43:35'),
(380, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:48:21'),
(381, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:56:47'),
(382, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 13:56:49'),
(383, 19, 'Mencetak Laporan PDF Pembayaran dari 2025-02-01 sampai 2025-03-23 untuk maskapai ID 6002', '::1', '2025-03-23 13:56:57'),
(384, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 13:57:41'),
(385, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:57:45'),
(386, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:58:13'),
(387, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 13:59:59'),
(388, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 14:00:20'),
(389, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 14:00:34'),
(390, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 14:00:39'),
(391, 19, 'Mengakses Laporan Keuangan', '::1', '2025-03-23 14:01:47'),
(392, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 14:12:07'),
(393, 19, 'Mengakses Laporan Pembayaran', '::1', '2025-03-23 14:16:03'),
(394, 19, 'Login ke sistem', '::1', '2025-03-25 05:21:33'),
(395, 19, 'Mengakses Dashboard', '::1', '2025-03-25 05:21:33'),
(396, 19, 'Mengakses Dashboard', '::1', '2025-03-25 05:21:55'),
(397, 19, 'Mengakses Settings', '::1', '2025-03-25 05:24:21'),
(398, 19, 'Mengakses Profil', '::1', '2025-03-25 05:24:23'),
(399, 19, 'Logout dari sistem', '::1', '2025-03-25 05:24:24'),
(400, 9, 'Login ke sistem', '::1', '2025-03-25 05:31:38'),
(401, 9, 'Mengakses Dashboard', '::1', '2025-03-25 05:31:38'),
(402, 9, 'Login ke sistem', '::1', '2025-03-25 08:14:30'),
(403, 9, 'Mengakses Dashboard', '::1', '2025-03-25 08:14:30'),
(404, 9, 'Mencari Penerbangan', '::1', '2025-03-25 08:14:36'),
(405, 9, 'Mencari Penerbangan', '::1', '2025-03-25 08:18:08'),
(406, 9, 'Mencari Penerbangan', '::1', '2025-03-25 08:21:36'),
(407, 9, 'Mencari Penerbangan', '::1', '2025-03-25 08:25:42'),
(408, 9, 'Mencari Penerbangan', '::1', '2025-03-25 08:26:54'),
(409, 9, 'Login ke sistem', '::1', '2025-03-26 03:52:09'),
(410, 9, 'Mengakses Dashboard', '::1', '2025-03-26 03:52:09'),
(411, 9, 'Mengakses Dashboard', '::1', '2025-03-26 04:02:12'),
(412, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:02:17'),
(413, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:03:16'),
(414, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:03:26'),
(415, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:04:48'),
(416, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:15:18'),
(417, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:15:30'),
(418, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:16:49'),
(419, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:17:01'),
(420, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:17:21'),
(421, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:43:20'),
(422, 9, 'Login ke sistem', '::1', '2025-03-26 04:43:46'),
(423, 9, 'Mengakses Dashboard', '::1', '2025-03-26 04:43:46'),
(424, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:43:54'),
(425, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:44:02'),
(426, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:50:30'),
(427, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:52:02'),
(428, 9, 'Mencari Penerbangan', '::1', '2025-03-26 04:52:48'),
(429, 9, 'Login ke sistem', '::1', '2025-03-26 06:01:01'),
(430, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:01:01'),
(431, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:08:39'),
(432, 9, 'Login ke sistem', '::1', '2025-03-26 06:08:52'),
(433, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:08:53'),
(434, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:12:17'),
(435, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:20:13'),
(436, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:20:31'),
(437, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:25:24'),
(438, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:25:27'),
(439, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:29:22'),
(440, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:35:43'),
(441, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:37:21'),
(442, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:39:06'),
(443, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:42:22'),
(444, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:44:38'),
(445, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:53:53'),
(446, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:54:12'),
(447, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:55:29'),
(448, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:56:08'),
(449, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:56:15'),
(450, 9, 'Mengakses Dashboard', '::1', '2025-03-26 06:59:25'),
(451, 9, 'Mengakses Dashboard', '::1', '2025-03-26 07:09:14'),
(452, 9, 'Mengakses Dashboard', '::1', '2025-03-26 07:10:39'),
(453, 9, 'Mengakses Dashboard', '::1', '2025-03-26 07:13:53'),
(454, 9, 'Mengakses Dashboard', '::1', '2025-03-26 07:15:06'),
(455, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 08:28:04'),
(456, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 08:29:51'),
(457, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 08:35:01'),
(458, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:35:01'),
(459, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:43:54'),
(460, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:44:10'),
(461, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:44:16'),
(462, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:44:28'),
(463, 9, 'Mengakses Profil', '::1', '2025-03-26 08:44:35'),
(464, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:44:36'),
(465, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:44:50'),
(466, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 08:45:15'),
(467, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:45:15'),
(468, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:51:52'),
(469, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:51:59'),
(470, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:52:01'),
(471, 9, 'Mengakses Dashboard', '::1', '2025-03-26 08:52:14'),
(472, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 08:52:41'),
(473, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 08:52:41'),
(474, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:08:54'),
(475, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:08:58'),
(476, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:09:06'),
(477, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:09:08'),
(478, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:09:16'),
(479, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:09:33'),
(480, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 09:09:57'),
(481, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:09:57'),
(482, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:12:44'),
(483, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:12:55'),
(484, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:12:58'),
(485, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 09:13:42'),
(486, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:13:42'),
(487, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:23:59'),
(488, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:24:09'),
(489, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:24:11'),
(490, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:24:20'),
(491, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 09:24:50'),
(492, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:24:50'),
(493, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:29:19'),
(494, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:29:32'),
(495, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:29:35'),
(496, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 09:30:00'),
(497, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:30:00'),
(498, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:31:57'),
(499, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:32:06'),
(500, 9, 'Mengakses Dashboard', '::1', '2025-03-26 09:32:09'),
(501, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-26 09:32:34'),
(502, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-26 09:32:34'),
(503, 9, 'Login ke sistem', '::1', '2025-03-27 02:42:54'),
(504, 9, 'Mengakses Dashboard', '::1', '2025-03-27 02:42:54'),
(505, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 02:43:02'),
(506, 9, 'Mengakses Dashboard', '::1', '2025-03-27 02:43:05'),
(507, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:44:45'),
(508, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:48:19'),
(509, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:49:20'),
(510, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 02:49:20'),
(511, 9, 'Mengakses Dashboard', '::1', '2025-03-27 02:50:39'),
(512, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 02:50:49'),
(513, 9, 'Mengakses Dashboard', '::1', '2025-03-27 02:50:53'),
(514, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:51:16'),
(515, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:52:51'),
(516, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 02:56:40'),
(517, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:06:45'),
(518, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:09:25'),
(519, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:09:45'),
(520, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:11:41'),
(521, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:21:34'),
(522, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:21:35'),
(523, 9, 'Mengakses Dashboard', '::1', '2025-03-27 03:24:25'),
(524, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:24:33'),
(525, 9, 'Mengakses Dashboard', '::1', '2025-03-27 03:24:54'),
(526, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:25:16'),
(527, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 03:32:53'),
(528, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:32:53'),
(529, 9, 'Mengakses Dashboard', '::1', '2025-03-27 03:33:27'),
(530, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:33:35'),
(531, 9, 'Mengakses Profil', '::1', '2025-03-27 03:33:38'),
(532, 9, 'Logout dari sistem', '::1', '2025-03-27 03:33:40'),
(533, 4, 'Login ke sistem', '::1', '2025-03-27 03:33:47'),
(534, 4, 'Mengakses Dashboard', '::1', '2025-03-27 03:33:47'),
(535, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 03:33:51'),
(536, 4, 'Mengakses Tabel Rute', '::1', '2025-03-27 03:33:52'),
(537, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:34:01'),
(538, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:34:09'),
(539, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-27 03:34:14'),
(540, 4, 'Download Tiket', '::1', '2025-03-27 03:34:18'),
(541, 4, 'Download Tiket', '::1', '2025-03-27 03:34:23'),
(542, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:34:32'),
(543, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 03:34:40'),
(544, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 03:34:44'),
(545, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-27 03:34:51'),
(546, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 03:34:52'),
(547, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-27 03:34:54'),
(548, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 03:34:56'),
(549, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 03:41:40'),
(550, 9, 'Login ke sistem', '::1', '2025-03-27 07:22:50'),
(551, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:22:50'),
(552, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:22:57'),
(553, 9, 'Mengakses Tabel Tiket', '::1', '2025-03-27 07:23:02'),
(554, 9, 'Mengakses Tabel Tiket', '::1', '2025-03-27 07:23:08'),
(555, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:23:11'),
(556, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-27 07:23:13'),
(557, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:23:21'),
(558, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-27 07:24:44'),
(559, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:24:45'),
(560, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:24:47'),
(561, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:24:56'),
(562, 9, 'Mengakses Profil', '::1', '2025-03-27 07:25:00'),
(563, 9, 'Logout dari sistem', '::1', '2025-03-27 07:25:02'),
(564, 4, 'Login ke sistem', '::1', '2025-03-27 07:25:09'),
(565, 4, 'Mengakses Dashboard', '::1', '2025-03-27 07:25:09'),
(566, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-27 07:25:12'),
(567, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-03-27 07:25:17'),
(568, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:25:19'),
(569, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:25:23'),
(570, 4, 'Mengakses Tabel Tiket', '::1', '2025-03-27 07:25:25'),
(571, 4, 'Mengakses Tabel Penumpang', '::1', '2025-03-27 07:25:29'),
(572, 4, 'Mengakses Tabel Maskapai', '::1', '2025-03-27 07:25:32'),
(573, 4, 'Mengakses Tabel Petugas', '::1', '2025-03-27 07:25:33'),
(574, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-03-27 07:25:36'),
(575, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-03-27 07:25:43'),
(576, 4, 'Mengakses Tabel Rute', '::1', '2025-03-27 07:25:57'),
(577, 4, 'Mengakses Profil', '::1', '2025-03-27 07:27:00'),
(578, 4, 'Logout dari sistem', '::1', '2025-03-27 07:27:02'),
(579, 9, 'Login ke sistem', '::1', '2025-03-27 07:27:08'),
(580, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:27:08'),
(581, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:27:16'),
(582, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:36:14'),
(583, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:45:34'),
(584, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:47:44'),
(585, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:49:01'),
(586, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:49:23'),
(587, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:50:44'),
(588, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:52:04'),
(589, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:52:54'),
(590, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:53:12'),
(591, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:53:44'),
(592, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:53:49'),
(593, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:55:10'),
(594, 9, 'Mengakses Dashboard', '::1', '2025-03-27 07:55:19'),
(595, 9, 'Mengakses Dashboard', '::1', '2025-03-27 08:00:43'),
(596, 9, 'Mengakses Dashboard', '::1', '2025-03-27 08:01:44'),
(597, 9, 'Mengakses Dashboard', '::1', '2025-03-27 08:14:47'),
(598, 9, 'Login ke sistem', '::1', '2025-03-27 09:54:58'),
(599, 9, 'Mengakses Dashboard', '::1', '2025-03-27 09:54:58'),
(600, 9, 'Mengakses Dashboard', '::1', '2025-03-27 09:55:13'),
(601, 9, 'Mengakses Dashboard', '::1', '2025-03-27 09:57:34'),
(602, 9, 'Mengakses Dashboard', '::1', '2025-03-27 09:58:04'),
(603, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:03:38'),
(604, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:05:37'),
(605, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:06:22'),
(606, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:13:51'),
(607, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:14:26'),
(608, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:18:00'),
(609, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:24:28'),
(610, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:24:50'),
(611, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:42:17'),
(612, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:47:29'),
(613, 9, 'Mengakses Dashboard', '::1', '2025-03-27 10:47:54'),
(614, 9, 'Login ke sistem', '::1', '2025-03-27 12:48:17'),
(615, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:48:17'),
(616, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:52:11'),
(617, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:52:20'),
(618, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:53:25'),
(619, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:56:08'),
(620, 9, 'Mengakses Dashboard', '::1', '2025-03-27 12:59:39'),
(621, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:20:20'),
(622, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:20:38'),
(623, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:22:14'),
(624, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:23:13'),
(625, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:23:51'),
(626, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:26:48'),
(627, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:39:31'),
(628, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:40:07'),
(629, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:40:52'),
(630, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:41:16'),
(631, 9, 'Mengakses Dashboard', '::1', '2025-03-27 13:42:49'),
(632, 9, 'Login ke sistem', '::1', '2025-03-27 14:05:37'),
(633, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:05:37'),
(634, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:05:49'),
(635, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:06:10'),
(636, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:12:12'),
(637, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:12:30'),
(638, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:15:27'),
(639, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:15:48'),
(640, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:29:26'),
(641, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:31:40'),
(642, 9, 'Mengakses Dashboard', '::1', '2025-03-27 14:33:58'),
(643, 9, 'Login ke sistem', '::1', '2025-03-28 02:30:45'),
(644, 9, 'Mengakses Dashboard', '::1', '2025-03-28 02:30:45'),
(645, 4, 'Login ke sistem', '::1', '2025-03-31 08:29:26'),
(646, 4, 'Mengakses Dashboard', '::1', '2025-03-31 08:29:26'),
(647, 4, 'Mengakses Profil', '::1', '2025-03-31 08:30:23'),
(648, 4, 'Logout dari sistem', '::1', '2025-03-31 08:30:25'),
(649, 9, 'Login ke sistem', '::1', '2025-03-31 08:30:35'),
(650, 9, 'Mengakses Dashboard', '::1', '2025-03-31 08:30:35'),
(651, 9, 'Mengakses Dashboard', '::1', '2025-03-31 08:30:59'),
(652, 9, 'Penumpang Memesan Tiket', '::1', '2025-03-31 08:31:39'),
(653, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-03-31 08:31:40'),
(654, 9, 'Mengakses Profil', '::1', '2025-03-31 08:32:59'),
(655, 9, 'Logout dari sistem', '::1', '2025-03-31 08:33:02'),
(656, 4, 'Login ke sistem', '::1', '2025-03-31 08:33:10'),
(657, 4, 'Mengakses Dashboard', '::1', '2025-03-31 08:33:11'),
(658, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:33:14'),
(659, 4, 'Menambahkan Rute Kembali: Maskapai ID 6006 dari Bandara 5014 ke Bandara 5009', '::1', '2025-03-31 08:43:51'),
(660, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:43:51'),
(661, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:51:04'),
(662, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:51:19'),
(663, 4, 'Mengedit Rute ID 7001 - Harga dari \'1000\' ke \'1000000\'', '::1', '2025-03-31 08:52:54'),
(664, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:52:54'),
(665, 4, 'Mengedit Rute ID 7002 - Harga dari \'5000\' ke \'5000000\'', '::1', '2025-03-31 08:53:04'),
(666, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:53:04'),
(667, 4, 'Mengedit Rute ID 7003 - Harga dari \'4250\' ke \'4250000\'', '::1', '2025-03-31 08:53:19'),
(668, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:53:19'),
(669, 4, 'Mengedit Rute ID 7004 - Harga dari \'12000\' ke \'12000000\'', '::1', '2025-03-31 08:53:31'),
(670, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:53:31'),
(671, 4, 'Mengedit Rute ID 7005 - Harga dari \'7500\' ke \'7500000\'', '::1', '2025-03-31 08:53:40'),
(672, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:53:40'),
(673, 4, 'Mengedit Rute ID 7006 - Harga dari \'12000\' ke \'12000000\'', '::1', '2025-03-31 08:53:49'),
(674, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:53:49'),
(675, 4, 'Mengedit Rute ID 7008 - Harga dari \'900\' ke \'900000\'', '::1', '2025-03-31 08:53:59'),
(676, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:54:00'),
(677, 4, 'Mengedit Rute ID 7008 - Estimasi tiba dari \'15:00:00\' ke \'03:00\'', '::1', '2025-03-31 08:54:10'),
(678, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:54:10'),
(679, 4, 'Mengedit Rute ID 7009 - Harga dari \'1000\' ke \'1000000\'', '::1', '2025-03-31 08:54:19'),
(680, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:54:19'),
(681, 4, 'Mengedit Rute ID 7010 - Estimasi tiba dari \'18:00:00\' ke \'06:00\'', '::1', '2025-03-31 08:54:32'),
(682, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:54:32'),
(683, 4, 'Mengedit Rute ID 7011 - Estimasi tiba dari \'18:00:00\' ke \'06:00\'', '::1', '2025-03-31 08:54:46'),
(684, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:54:46'),
(685, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-03-31 08:54:53'),
(686, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-03-31 08:55:30'),
(687, 4, 'Mengakses Tabel Rute', '::1', '2025-03-31 08:55:57'),
(688, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-03-31 08:59:11'),
(689, 4, 'Login ke sistem', '::1', '2025-04-01 13:33:48'),
(690, 4, 'Mengakses Dashboard', '::1', '2025-04-01 13:33:49'),
(691, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-01 13:33:53'),
(692, 4, 'Mengakses Tabel Rute', '::1', '2025-04-01 13:33:58'),
(693, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-01 13:34:19'),
(694, 4, 'Login ke sistem', '::1', '2025-04-02 04:20:54'),
(695, 4, 'Mengakses Dashboard', '::1', '2025-04-02 04:20:54'),
(696, 4, 'Mengakses Tabel Rute', '::1', '2025-04-02 04:21:23'),
(697, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-02 04:21:29'),
(698, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-02 04:44:00'),
(699, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-02 04:45:06'),
(700, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-02 04:45:31'),
(701, 4, 'Mengakses Profil', '::1', '2025-04-02 04:45:38'),
(702, 4, 'Logout dari sistem', '::1', '2025-04-02 04:45:41'),
(703, 9, 'Login ke sistem', '::1', '2025-04-02 04:45:52'),
(704, 9, 'Mengakses Dashboard', '::1', '2025-04-02 04:45:52'),
(705, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-02 04:46:36'),
(706, 9, 'Mengakses Dashboard', '::1', '2025-04-02 04:46:50'),
(707, 9, 'Mengakses Dashboard', '::1', '2025-04-02 05:09:02'),
(708, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-02 05:09:02'),
(709, 9, 'Mengakses Profil', '::1', '2025-04-02 05:09:05'),
(710, 9, 'Logout dari sistem', '::1', '2025-04-02 05:09:07'),
(711, 4, 'Login ke sistem', '::1', '2025-04-02 05:09:15'),
(712, 4, 'Mengakses Dashboard', '::1', '2025-04-02 05:09:16'),
(713, 4, 'Mengakses Dashboard', '::1', '2025-04-02 05:10:51'),
(714, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-02 05:22:29'),
(715, 4, 'Mengakses Profil', '::1', '2025-04-02 05:22:38'),
(716, 4, 'Logout dari sistem', '::1', '2025-04-02 05:23:03'),
(717, 19, 'Login ke sistem', '::1', '2025-04-02 05:23:21'),
(718, 19, 'Mengakses Dashboard', '::1', '2025-04-02 05:23:21'),
(719, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:23:25'),
(720, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-02 05:23:58'),
(721, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-02 05:24:01'),
(722, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-02 05:24:04'),
(723, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:24:07'),
(724, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:25:49'),
(725, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:28:52'),
(726, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:29:12'),
(727, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 05:54:17'),
(728, 19, 'Login ke sistem', '::1', '2025-04-02 06:04:55'),
(729, 19, 'Mengakses Dashboard', '::1', '2025-04-02 06:04:55'),
(730, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:05:00'),
(731, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:06:43'),
(732, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:10:16'),
(733, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:11:49'),
(734, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:12:04'),
(735, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:12:38'),
(736, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-02 06:12:45'),
(737, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-02 06:12:50'),
(738, 19, 'Mengakses Tabel Data Petugas yang Dihapus', '::1', '2025-04-02 06:12:53'),
(739, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-02 06:12:55'),
(740, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:13:52'),
(741, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:15:00'),
(742, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:16:17'),
(743, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:18:33'),
(744, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:19:46'),
(745, 19, 'Menambahkan Voucher: VC-2 dengan diskon 15 dan min transaksi 1500000', '::1', '2025-04-02 06:20:16'),
(746, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:20:16'),
(747, 19, 'Menambahkan Voucher: VC-3 dengan diskon 25 dan min transaksi 5500000', '::1', '2025-04-02 06:20:40'),
(748, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:20:40'),
(749, 19, 'Menambahkan Voucher: VC-4 dengan diskon 45 dan min transaksi 18000000', '::1', '2025-04-02 06:21:27'),
(750, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:21:27'),
(751, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:27:18'),
(752, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:30:02'),
(753, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:31:44'),
(754, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:37:48'),
(755, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:40:46'),
(756, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:43:46'),
(757, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:46:39'),
(758, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:51:05'),
(759, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:53:47'),
(760, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:55:17'),
(761, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:55:47'),
(762, 19, 'Menghapus voucher dengan ID: 6504 (soft delete)', '::1', '2025-04-02 06:57:15'),
(763, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 06:57:16'),
(764, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 06:57:19'),
(765, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:00:11'),
(766, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:01:00'),
(767, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-02 07:01:03'),
(768, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-02 07:01:05'),
(769, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-02 07:01:08'),
(770, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:01:11'),
(771, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:01:13'),
(772, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:03:53');
INSERT INTO `log_activity` (`id_log`, `id_user`, `aktivitas`, `ip_address`, `waktu`) VALUES
(773, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:05:43'),
(774, 19, 'Mengembalikan voucher dengan ID: 6504 (soft delete)', '::1', '2025-04-02 07:05:49'),
(775, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:05:49'),
(776, 19, 'Mengakses Tabel Data Voucher yang Dihapus', '::1', '2025-04-02 07:05:52'),
(777, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-02 07:05:54'),
(778, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:06:00'),
(779, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-02 07:08:54'),
(780, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:09:41'),
(781, 19, 'id_user=19 mencoba mengakses detail user ID 6501', NULL, '2025-04-02 07:09:43'),
(782, 19, 'id_user=19 tidak menemukan data user ID 6501', NULL, '2025-04-02 07:09:43'),
(783, 19, 'Mengakses Tabel User', '::1', '2025-04-02 07:09:43'),
(784, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:09:47'),
(785, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:09:56'),
(786, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:09:56'),
(787, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:12:00'),
(788, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:12:00'),
(789, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:12:22'),
(790, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:12:22'),
(791, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:13:58'),
(792, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:13:58'),
(793, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:15:05'),
(794, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:15:05'),
(795, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:16:07'),
(796, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:16:07'),
(797, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:17:03'),
(798, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:17:03'),
(799, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:18:01'),
(800, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:18:01'),
(801, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:19:02'),
(802, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:19:02'),
(803, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:19:25'),
(804, 19, 'id_user=19 mencoba mengakses detail voucher ID 6501', NULL, '2025-04-02 07:19:28'),
(805, 19, 'id_user=19 berhasil melihat detail voucher ID 6501', NULL, '2025-04-02 07:19:28'),
(806, 19, 'id_user=19 mencoba mengakses detail voucher ID 6501', NULL, '2025-04-02 07:19:46'),
(807, 19, 'id_user=19 berhasil melihat detail voucher ID 6501', NULL, '2025-04-02 07:19:46'),
(808, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:19:55'),
(809, 19, 'id_user=19 mencoba mengakses detail voucher ID 6503', NULL, '2025-04-02 07:19:58'),
(810, 19, 'id_user=19 berhasil melihat detail voucher ID 6503', NULL, '2025-04-02 07:19:58'),
(811, 19, 'id_user=19 mencoba mengakses detail voucher ID 6503', NULL, '2025-04-02 07:20:30'),
(812, 19, 'id_user=19 berhasil melihat detail voucher ID 6503', NULL, '2025-04-02 07:20:30'),
(813, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:20:33'),
(814, 19, 'id_user=19 mencoba mengakses detail voucher ID 6504', NULL, '2025-04-02 07:20:36'),
(815, 19, 'id_user=19 berhasil melihat detail voucher ID 6504', NULL, '2025-04-02 07:20:36'),
(816, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:20:50'),
(817, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:20:56'),
(818, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:20:56'),
(819, 19, 'id_user=19 mencoba mengakses detail voucher ID 6502', NULL, '2025-04-02 07:21:11'),
(820, 19, 'id_user=19 berhasil melihat detail voucher ID 6502', NULL, '2025-04-02 07:21:11'),
(821, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:21:14'),
(822, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 07:23:05'),
(823, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:35:36'),
(824, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:40:04'),
(825, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:40:34'),
(826, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:40:41'),
(827, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:44:31'),
(828, 19, 'Menambahkan Asuransi: Boneka dengan harga Rp 89.999', '::1', '2025-04-02 07:44:58'),
(829, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:44:58'),
(830, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:49:25'),
(831, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:49:31'),
(832, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:51:54'),
(833, 19, 'Mengedit Asuransi ID 3306 - Harga dari \'89999.00\' ke \'89990\'', '::1', '2025-04-02 07:52:03'),
(834, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:52:03'),
(835, 19, 'Mengedit Asuransi ID 3306 - Nama dari \'Boneka\' ke \'Bonekaa\'', '::1', '2025-04-02 07:52:11'),
(836, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 07:52:11'),
(837, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:03:23'),
(838, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:05:34'),
(839, 19, 'Menghapus asuransi dengan ID: 3306 (soft delete)', '::1', '2025-04-02 08:05:38'),
(840, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:05:38'),
(841, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:07:03'),
(842, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:08:08'),
(843, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:09:18'),
(844, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:09:21'),
(845, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:10:30'),
(846, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:10:41'),
(847, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:10:59'),
(848, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:13:10'),
(849, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:17:09'),
(850, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:17:11'),
(851, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 08:17:14'),
(852, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:17:17'),
(853, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:18:46'),
(854, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 08:20:28'),
(855, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 09:01:06'),
(856, 19, 'Login ke sistem', '::1', '2025-04-02 09:01:21'),
(857, 19, 'Mengakses Dashboard', '::1', '2025-04-02 09:01:21'),
(858, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:01:24'),
(859, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 09:01:28'),
(860, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:01:31'),
(861, 19, 'Menghapus asuransi dengan ID: 3306 (soft delete)', '::1', '2025-04-02 09:01:35'),
(862, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:01:35'),
(863, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 09:01:38'),
(864, 19, 'Menghapus permanen asuransi dengan ID: 3306', '::1', '2025-04-02 09:01:44'),
(865, 19, 'Mengakses Tabel Data Asuransi yang Dihapus', '::1', '2025-04-02 09:01:45'),
(866, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:01:47'),
(867, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-02 09:01:50'),
(868, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:02:00'),
(869, 19, 'id_user=19 mencoba mengakses detail asuransi ID 3302', NULL, '2025-04-02 09:02:04'),
(870, 19, 'id_user=19 mencoba mengakses detail asuransi ID 3302', NULL, '2025-04-02 09:03:56'),
(871, 19, 'id_user=19 berhasil melihat detail asuransi ID 3302', NULL, '2025-04-02 09:03:56'),
(872, 19, 'id_user=19 mencoba mengakses detail asuransi ID 3302', NULL, '2025-04-02 09:06:00'),
(873, 19, 'id_user=19 berhasil melihat detail asuransi ID 3302', NULL, '2025-04-02 09:06:00'),
(874, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:06:02'),
(875, 19, 'id_user=19 mencoba mengakses detail asuransi ID 3303', NULL, '2025-04-02 09:06:04'),
(876, 19, 'id_user=19 berhasil melihat detail asuransi ID 3303', NULL, '2025-04-02 09:06:04'),
(877, 19, 'id_user=19 mencoba mengakses detail asuransi ID 3303', NULL, '2025-04-02 09:07:58'),
(878, 19, 'id_user=19 berhasil melihat detail asuransi ID 3303', NULL, '2025-04-02 09:07:58'),
(879, 19, 'Mengakses Tabel Asuransi', '::1', '2025-04-02 09:09:23'),
(880, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:23:41'),
(881, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:26:41'),
(882, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:29:31'),
(883, 19, 'Menambahkan Reward: Voucher Diskon 50% dengan poin 500 dan stok 50', '::1', '2025-04-02 09:30:22'),
(884, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:30:22'),
(885, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:31:23'),
(886, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:34:37'),
(887, 19, 'Menambahkan Reward: Amenities dengan poin 800 dan stok 390', '::1', '2025-04-02 09:35:44'),
(888, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:35:44'),
(889, 19, 'Menambahkan Reward: Mascot Plushie dengan poin 1000 dan stok 65', '::1', '2025-04-02 09:37:19'),
(890, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:37:19'),
(891, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 09:37:31'),
(892, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:37:46'),
(893, 19, 'Mengedit Reward ID 7802 - Nama_reward dari \'Amenities\' ke \'Amenities Kit\'', '::1', '2025-04-02 09:42:47'),
(894, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:42:47'),
(895, 19, 'Menghapus reward dengan ID: 7801 (soft delete)', '::1', '2025-04-02 09:51:45'),
(896, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:51:46'),
(897, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 09:51:48'),
(898, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 09:52:10'),
(899, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 09:52:24'),
(900, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 09:53:35'),
(901, 19, 'Mengembalikan reward dengan ID: 7801 (soft delete)', '::1', '2025-04-02 09:53:39'),
(902, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 09:53:39'),
(903, 19, 'Login ke sistem', '::1', '2025-04-02 12:12:57'),
(904, 19, 'Mengakses Dashboard', '::1', '2025-04-02 12:12:57'),
(905, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:13:05'),
(906, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 12:13:08'),
(907, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:13:10'),
(908, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:17:43'),
(909, 19, 'id_user=19 mencoba mengakses detail reward ID 7803', NULL, '2025-04-02 12:17:45'),
(910, 19, 'id_user=19 mencoba mengakses detail reward ID 7803', NULL, '2025-04-02 12:20:39'),
(911, 19, 'id_user=19 berhasil melihat detail reward ID 7803', NULL, '2025-04-02 12:20:39'),
(912, 19, 'id_user=19 mencoba mengakses detail reward ID 7803', NULL, '2025-04-02 12:20:52'),
(913, 19, 'id_user=19 berhasil melihat detail reward ID 7803', NULL, '2025-04-02 12:20:52'),
(914, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:20:58'),
(915, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:21:16'),
(916, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:21:26'),
(917, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:30:56'),
(918, 19, 'Menambahkan Promo Bank: Bank BCA dengan diskon 10 dan minimal transaksi 680000', '::1', '2025-04-02 12:40:22'),
(919, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:40:22'),
(920, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:41:01'),
(921, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:41:50'),
(922, 19, 'Mengakses Tabel Voucher', '::1', '2025-04-02 12:42:01'),
(923, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:42:07'),
(924, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:42:32'),
(925, 19, 'Menambahkan Promo Bank: Bank Mandiri dengan diskon 15 dan minimal transaksi 550000', '::1', '2025-04-02 12:43:13'),
(926, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:43:13'),
(927, 19, 'Menambahkan Promo Bank: Bank BNI dengan diskon 20 dan minimal transaksi 1000000', '::1', '2025-04-02 12:43:47'),
(928, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:43:47'),
(929, 19, 'Menambahkan Promo Bank: Bank CIMB Niaga dengan diskon 12 dan minimal transaksi 800000', '::1', '2025-04-02 12:44:35'),
(930, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:44:35'),
(931, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:48:32'),
(932, 19, 'Mengakses Tabel Data Reward yang Dihapus', '::1', '2025-04-02 12:48:36'),
(933, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:48:39'),
(934, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:48:49'),
(935, 19, 'Mengakses Tabel Reward', '::1', '2025-04-02 12:49:06'),
(936, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:49:33'),
(937, 19, 'Mengedit Promo ID 2 - Min_transaksi dari \'550000.00\' ke \'950000\', Status dari \'0\' ke \'\'', '::1', '2025-04-02 12:52:44'),
(938, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 12:52:44'),
(939, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:02:18'),
(940, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:02:54'),
(941, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:02:56'),
(942, 19, 'Menghapus promo dengan ID: 3 (soft delete)', '::1', '2025-04-02 13:04:23'),
(943, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:04:23'),
(944, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:04:27'),
(945, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:10:12'),
(946, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:11:14'),
(947, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:14:48'),
(948, 19, 'Mengakses Tabel Data Promo yang Dihapus', '::1', '2025-04-02 13:14:56'),
(949, 19, 'Mengembalikan promo dengan ID: 3', '::1', '2025-04-02 13:17:54'),
(950, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:17:55'),
(951, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:32:09'),
(952, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:32:32'),
(953, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:32:56'),
(954, 19, 'id_user=19 mencoba mengakses detail promo ID 1', NULL, '2025-04-02 13:32:59'),
(955, 19, 'id_user=19 berhasil melihat detail promo ID 1', NULL, '2025-04-02 13:32:59'),
(956, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:33:03'),
(957, 19, 'id_user=19 mencoba mengakses detail promo ID 1', NULL, '2025-04-02 13:33:05'),
(958, 19, 'id_user=19 berhasil melihat detail promo ID 1', NULL, '2025-04-02 13:33:05'),
(959, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:33:08'),
(960, 19, 'id_user=19 mencoba mengakses detail promo ID 2', NULL, '2025-04-02 13:33:11'),
(961, 19, 'id_user=19 berhasil melihat detail promo ID 2', NULL, '2025-04-02 13:33:11'),
(962, 19, 'Mengakses Tabel Promo Bank', '::1', '2025-04-02 13:33:15'),
(963, 19, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-02 13:33:19'),
(964, 19, 'Mengakses Profil', '::1', '2025-04-02 14:09:25'),
(965, 9, 'Login ke sistem', '::1', '2025-04-02 14:09:44'),
(966, 9, 'Mengakses Dashboard', '::1', '2025-04-02 14:09:44'),
(967, 9, 'Mengakses Dashboard', '::1', '2025-04-02 15:43:59'),
(968, 9, 'Login ke sistem', '::1', '2025-04-03 05:31:29'),
(969, 9, 'Mengakses Dashboard', '::1', '2025-04-03 05:31:29'),
(970, 9, 'Mengakses Dashboard', '::1', '2025-04-03 05:32:06'),
(971, 9, 'Mengakses Dashboard', '::1', '2025-04-03 05:45:24'),
(972, 19, 'Login ke sistem', '::1', '2025-04-03 05:45:35'),
(973, 19, 'Mengakses Dashboard', '::1', '2025-04-03 05:45:35'),
(974, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 05:45:41'),
(975, 19, 'Mengakses Tabel Rute', '::1', '2025-04-03 05:46:42'),
(976, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 05:47:50'),
(977, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 05:48:05'),
(978, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 05:48:45'),
(979, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 05:48:58'),
(980, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 06:04:06'),
(981, 19, 'User ID 19 mencoba mengakses detail penumpang ID 2001', '::1', '2025-04-03 06:04:13'),
(982, 19, 'User ID 19 berhasil melihat detail penumpang ID 2001', '::1', '2025-04-03 06:04:13'),
(983, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 06:04:25'),
(984, 19, 'Mengakses Profil', '::1', '2025-04-03 06:04:32'),
(985, 19, 'Logout dari sistem', '::1', '2025-04-03 06:04:34'),
(986, 19, 'Login ke sistem', '::1', '2025-04-03 06:04:41'),
(987, 19, 'Mengakses Dashboard', '::1', '2025-04-03 06:04:41'),
(988, 19, 'Mengakses Settings', '::1', '2025-04-03 06:04:46'),
(989, 19, 'Mengakses Profil', '::1', '2025-04-03 06:04:50'),
(990, 19, 'Logout dari sistem', '::1', '2025-04-03 06:04:52'),
(991, 9, 'Login ke sistem', '::1', '2025-04-03 06:05:05'),
(992, 9, 'Mengakses Dashboard', '::1', '2025-04-03 06:05:06'),
(993, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-03 07:40:43'),
(994, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:40:54'),
(995, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 07:40:58'),
(996, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 07:49:19'),
(997, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:49:21'),
(998, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 07:49:42'),
(999, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:51:01'),
(1000, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:52:04'),
(1001, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:54:39'),
(1002, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:58:57'),
(1003, 9, 'Mengakses Dashboard', '::1', '2025-04-03 07:59:25'),
(1004, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:00:14'),
(1005, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:02:01'),
(1006, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:02:17'),
(1007, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:12:54'),
(1008, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:16:38'),
(1009, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 08:16:43'),
(1010, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:16:45'),
(1011, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:18:01'),
(1012, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:19:35'),
(1013, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:19:54'),
(1014, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:20:06'),
(1015, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:22:46'),
(1016, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:23:00'),
(1017, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:24:15'),
(1018, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:25:43'),
(1019, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:28:03'),
(1020, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:29:43'),
(1021, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:30:02'),
(1022, 9, 'Mengakses Dashboard', '::1', '2025-04-03 08:31:20'),
(1023, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:18:21'),
(1024, 9, 'Login ke sistem', '::1', '2025-04-03 09:21:52'),
(1025, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:21:52'),
(1026, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:23:01'),
(1027, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:23:55'),
(1028, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:24:55'),
(1029, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:26:36'),
(1030, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:28:18'),
(1031, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:30:41'),
(1032, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:31:31'),
(1033, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-03 09:31:45'),
(1034, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 09:31:48'),
(1035, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:32:45'),
(1036, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:34:42'),
(1037, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:36:18'),
(1038, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:37:51'),
(1039, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:40:48'),
(1040, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:43:07'),
(1041, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:44:05'),
(1042, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:45:05'),
(1043, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:45:29'),
(1044, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:45:50'),
(1045, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 09:46:01'),
(1046, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:46:04'),
(1047, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:46:52'),
(1048, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:47:41'),
(1049, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:47:56'),
(1050, 9, 'Mengakses Dashboard', '::1', '2025-04-03 09:48:51'),
(1051, 4, 'Login ke sistem', '::1', '2025-04-03 12:44:46'),
(1052, 4, 'Mengakses Dashboard', '::1', '2025-04-03 12:44:46'),
(1053, 4, 'Login ke sistem', '::1', '2025-04-03 14:54:33'),
(1054, 4, 'Mengakses Dashboard', '::1', '2025-04-03 14:54:33'),
(1055, 4, 'Mengakses Tabel Penumpang', '::1', '2025-04-03 14:54:37'),
(1056, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-03 14:56:12'),
(1057, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-03 14:56:33'),
(1058, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-03 14:56:50'),
(1059, 4, 'Mengakses Tabel User', '::1', '2025-04-03 14:57:05'),
(1060, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-03 14:58:18'),
(1061, 4, 'Mengakses Tabel Rute', '::1', '2025-04-03 14:58:32'),
(1062, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-03 14:59:05'),
(1063, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-03 14:59:18'),
(1064, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-03 14:59:32'),
(1065, 4, 'Mengakses Tabel Voucher', '::1', '2025-04-03 14:59:50'),
(1066, 4, 'Mengakses Tabel Asuransi', '::1', '2025-04-03 15:00:02'),
(1067, 4, 'Mengakses Tabel Voucher', '::1', '2025-04-03 15:00:09'),
(1068, 4, 'Mengakses Tabel Asuransi', '::1', '2025-04-03 15:00:20'),
(1069, 4, 'Mengakses Tabel Reward', '::1', '2025-04-03 15:00:31'),
(1070, 4, 'Mengakses Tabel Promo Bank', '::1', '2025-04-03 15:00:42'),
(1071, 4, 'Mengakses Laporan Pemesanan', '::1', '2025-04-03 15:00:56'),
(1072, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-03 15:01:06'),
(1073, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-03 15:01:40'),
(1074, 4, 'Mengakses Profil', '::1', '2025-04-03 15:01:54'),
(1075, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-03 15:03:05'),
(1076, 4, 'Mengakses Profil', '::1', '2025-04-03 15:11:36'),
(1077, 4, 'Logout dari sistem', '::1', '2025-04-03 15:11:39'),
(1078, 19, 'Login ke sistem', '::1', '2025-04-03 15:11:48'),
(1079, 19, 'Mengakses Dashboard', '::1', '2025-04-03 15:11:48'),
(1080, 19, 'Mengakses Profil', '::1', '2025-04-03 15:11:51'),
(1081, 19, 'Mengakses Profil', '::1', '2025-04-03 15:12:10'),
(1082, 19, 'Mengakses Settings', '::1', '2025-04-03 15:12:55'),
(1083, 9, 'Login ke sistem', '::1', '2025-04-04 13:51:26'),
(1084, 9, 'Mengakses Dashboard', '::1', '2025-04-04 13:51:26'),
(1085, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-04 14:15:01'),
(1086, 9, 'Mengakses Tabel Tiket', '::1', '2025-04-04 14:15:18'),
(1087, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-04 14:15:21'),
(1088, 9, 'Mengakses Tabel Tiket', '::1', '2025-04-04 14:15:24'),
(1089, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-04 14:15:28'),
(1090, 9, 'Mengakses Tabel Tiket', '::1', '2025-04-04 14:15:34'),
(1091, 9, 'Download Tiket', '::1', '2025-04-04 14:15:47'),
(1092, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-04 14:18:03'),
(1093, 9, 'Mengakses Dashboard', '::1', '2025-04-04 14:18:07'),
(1094, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-04 14:23:40'),
(1095, 9, 'Mengakses Profil', '::1', '2025-04-04 14:23:54'),
(1096, 9, 'Logout dari sistem', '::1', '2025-04-04 14:35:03'),
(1097, 3, 'Login ke sistem', '::1', '2025-04-04 14:35:28'),
(1098, 3, 'Mengakses Dashboard', '::1', '2025-04-04 14:35:28'),
(1099, 3, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-04 14:35:30'),
(1100, 3, 'Mengakses Dashboard', '::1', '2025-04-04 14:35:31'),
(1101, 3, 'Login ke sistem', '::1', '2025-04-04 14:40:13'),
(1102, 3, 'Mengakses Dashboard', '::1', '2025-04-04 14:40:14'),
(1103, 3, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-04 14:40:16'),
(1104, 3, 'Mengakses Dashboard', '::1', '2025-04-04 14:40:21'),
(1105, 3, 'Mengakses Dashboard', '::1', '2025-04-04 14:40:57'),
(1106, 3, 'Mengakses Profil', '::1', '2025-04-04 14:52:42'),
(1107, 3, 'Logout dari sistem', '::1', '2025-04-04 14:52:47'),
(1108, 9, 'Login ke sistem', '::1', '2025-04-05 03:46:57'),
(1109, 9, 'Mengakses Dashboard', '::1', '2025-04-05 03:46:57'),
(1110, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 03:47:04'),
(1111, 9, 'Mengakses Profil', '::1', '2025-04-05 03:56:16'),
(1112, 9, 'Mengakses Dashboard', '::1', '2025-04-05 03:56:18'),
(1113, 9, 'Mengakses Dashboard', '::1', '2025-04-05 03:57:20'),
(1114, 9, 'Mengakses Profil', '::1', '2025-04-05 03:57:53'),
(1115, 9, 'Logout dari sistem', '::1', '2025-04-05 03:57:55'),
(1116, 9, 'Login ke sistem', '::1', '2025-04-05 03:59:17'),
(1117, 9, 'Mengakses Dashboard', '::1', '2025-04-05 03:59:17'),
(1118, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:07:01'),
(1119, 9, 'Mengakses Profil', '::1', '2025-04-05 04:07:05'),
(1120, 9, 'Logout dari sistem', '::1', '2025-04-05 04:07:09'),
(1121, 9, 'Login ke sistem', '::1', '2025-04-05 04:08:24'),
(1122, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:08:24'),
(1123, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:11:47'),
(1124, 9, 'Mengakses Profil', '::1', '2025-04-05 04:11:51'),
(1125, 9, 'Logout dari sistem', '::1', '2025-04-05 04:11:54'),
(1126, 9, 'Login ke sistem', '::1', '2025-04-05 04:12:06'),
(1127, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:12:06'),
(1128, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-05 04:25:15'),
(1129, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:25:15'),
(1130, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:25:19'),
(1131, 9, 'Mengakses Profil', '::1', '2025-04-05 04:26:28'),
(1132, 9, 'Logout dari sistem', '::1', '2025-04-05 04:26:30'),
(1133, 9, 'Login ke sistem', '::1', '2025-04-05 04:26:47'),
(1134, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:26:47'),
(1135, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:27:06'),
(1136, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:27:42'),
(1137, 9, 'Mengakses Profil', '::1', '2025-04-05 04:27:46'),
(1138, 9, 'Logout dari sistem', '::1', '2025-04-05 04:27:48'),
(1139, 9, 'Login ke sistem', '::1', '2025-04-05 04:28:05'),
(1140, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:28:05'),
(1141, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-05 04:28:45'),
(1142, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:28:45'),
(1143, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-05 04:28:52'),
(1144, 9, 'Mengakses Profil', '::1', '2025-04-05 04:28:59'),
(1145, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:29:03'),
(1146, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:29:14'),
(1147, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:29:34'),
(1148, 9, 'Mengakses Profil', '::1', '2025-04-05 04:30:09'),
(1149, 9, 'Logout dari sistem', '::1', '2025-04-05 04:31:02'),
(1150, 9, 'Login ke sistem', '::1', '2025-04-05 04:31:10'),
(1151, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:31:10'),
(1152, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-05 04:31:46'),
(1153, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:31:46'),
(1154, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:31:50'),
(1155, 9, 'Mengakses Profil', '::1', '2025-04-05 04:33:00'),
(1156, 9, 'Logout dari sistem', '::1', '2025-04-05 04:33:08'),
(1157, 9, 'Login ke sistem', '::1', '2025-04-05 04:33:28'),
(1158, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:33:28'),
(1159, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-05 04:34:28'),
(1160, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:34:28'),
(1161, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:34:34'),
(1162, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 04:34:57'),
(1163, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-05 04:35:10'),
(1164, 9, 'Mengakses Dashboard', '::1', '2025-04-05 04:35:18'),
(1165, 9, 'Mengakses Profil', '::1', '2025-04-05 04:35:26'),
(1166, 9, 'Logout dari sistem', '::1', '2025-04-05 04:35:36'),
(1167, 19, 'Login ke sistem', '::1', '2025-04-05 04:35:48'),
(1168, 19, 'Mengakses Dashboard', '::1', '2025-04-05 04:35:48'),
(1169, 19, 'Mengakses Tabel Maskapai', '::1', '2025-04-05 04:38:19'),
(1170, 19, 'Mengakses Dashboard', '::1', '2025-04-05 04:38:23'),
(1171, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:08:25'),
(1172, 19, 'Login ke sistem', '::1', '2025-04-05 05:09:38'),
(1173, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:09:38'),
(1174, 19, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:09:40'),
(1175, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:09:45'),
(1176, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:09:50'),
(1177, 19, 'Mengakses Tabel User', '::1', '2025-04-05 05:09:53'),
(1178, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:09:59'),
(1179, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:13:36'),
(1180, 19, 'Mengakses Tabel Maskapai', '::1', '2025-04-05 05:13:41'),
(1181, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:17:01'),
(1182, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:18:04'),
(1183, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:18:58'),
(1184, 19, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:19:04'),
(1185, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:19:08'),
(1186, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:19:12'),
(1187, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:21:17'),
(1188, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:21:38'),
(1189, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:21:40'),
(1190, 19, 'Mengakses Tabel Data Petugas yang Dihapus', '::1', '2025-04-05 05:21:42'),
(1191, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:21:45'),
(1192, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:21:52'),
(1193, 19, 'Mengakses Settings', '::1', '2025-04-05 05:21:59'),
(1194, 19, 'Mengakses Profil', '::1', '2025-04-05 05:22:01'),
(1195, 19, 'Logout dari sistem', '::1', '2025-04-05 05:22:04'),
(1196, 19, 'Login ke sistem', '::1', '2025-04-05 05:22:15'),
(1197, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:22:15'),
(1198, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-05 05:22:23'),
(1199, 19, 'User ID 19 mencoba mengakses detail penumpang ID 2002', '::1', '2025-04-05 05:22:35'),
(1200, 19, 'User ID 19 berhasil melihat detail penumpang ID 2002', '::1', '2025-04-05 05:22:35'),
(1201, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-05 05:22:44'),
(1202, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:22:46'),
(1203, 19, 'Menghapus petugas dengan ID: 4009 (soft delete)', '::1', '2025-04-05 05:22:53'),
(1204, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:22:53'),
(1205, 19, 'Mengakses Tabel Data Petugas yang Dihapus', '::1', '2025-04-05 05:22:56'),
(1206, 19, 'Mengembalikan petugas dengan ID: 4009 (soft delete)', '::1', '2025-04-05 05:22:59'),
(1207, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:22:59'),
(1208, 19, 'Mengedit Data Petugas ID 4009 - Nama petugas dari \'Ola\' ke \'Olay\', Username dari \'\' ke \'ola@s\'', '::1', '2025-04-05 05:23:12'),
(1209, 19, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:23:12'),
(1210, 19, 'Mengakses Tabel Maskapai', '::1', '2025-04-05 05:23:16'),
(1211, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-05 05:23:23'),
(1212, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-05 05:23:29'),
(1213, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-05 05:23:31'),
(1214, 19, 'Mengakses Tabel User', '::1', '2025-04-05 05:23:34'),
(1215, 19, 'Mengakses Tabel Data User yang Dihapus', '::1', '2025-04-05 05:23:41'),
(1216, 19, 'Mengembalikan user ID: 20 (soft delete)', '::1', '2025-04-05 05:23:50'),
(1217, 19, 'Mengakses Tabel User', '::1', '2025-04-05 05:23:50'),
(1218, 19, 'Mengakses Tabel Rute', '::1', '2025-04-05 05:23:56'),
(1219, 19, 'Menambahkan Rute Kembali: Maskapai ID 6006 dari Bandara 5009 ke Bandara 5003', '::1', '2025-04-05 05:27:33'),
(1220, 19, 'Mengakses Tabel Rute', '::1', '2025-04-05 05:27:33'),
(1221, 19, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:27:41'),
(1222, 19, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:28:24'),
(1223, 19, 'Mengakses Tabel Pemesanan', '::1', '2025-04-05 05:28:34'),
(1224, 19, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 05:28:43'),
(1225, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:29:02'),
(1226, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:32:20'),
(1227, 19, 'Mengakses Dashboard', '::1', '2025-04-05 05:33:33'),
(1228, 19, 'Mengakses Profil', '::1', '2025-04-05 05:33:40'),
(1229, 19, 'Mengakses Profil', '::1', '2025-04-05 05:33:58'),
(1230, 19, 'Logout dari sistem', '::1', '2025-04-05 05:34:02'),
(1231, 4, 'Login ke sistem', '::1', '2025-04-05 05:35:28'),
(1232, 4, 'Mengakses Dashboard', '::1', '2025-04-05 05:35:28'),
(1233, 4, 'Mengakses Tabel Penumpang', '::1', '2025-04-05 05:35:35'),
(1234, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-05 05:35:42'),
(1235, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-05 05:35:53'),
(1236, 4, 'Mengedit Maskapai ID 6003 - Id bandara dari \'5002\' ke \'5004\'', '::1', '2025-04-05 05:36:16'),
(1237, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-05 05:36:16'),
(1238, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-05 05:36:20'),
(1239, 4, 'Mengakses Tabel User', '::1', '2025-04-05 05:36:24'),
(1240, 4, 'Menghapus user ID: 24 (soft delete)', '::1', '2025-04-05 05:36:34'),
(1241, 4, 'Mengakses Tabel User', '::1', '2025-04-05 05:36:35'),
(1242, 4, 'Mengakses Tabel Rute', '::1', '2025-04-05 05:36:43'),
(1243, 4, 'Menambahkan Rute Kembali: Maskapai ID 6004 dari Bandara 5010 ke Bandara 5006', '::1', '2025-04-05 05:37:31'),
(1244, 4, 'Mengakses Tabel Rute', '::1', '2025-04-05 05:37:32'),
(1245, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:37:43'),
(1246, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-05 05:38:14'),
(1247, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-05 05:38:27'),
(1248, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 05:38:32'),
(1249, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 05:38:42'),
(1250, 4, 'Mengakses Tabel Tiket', '::1', '2025-04-05 05:38:45'),
(1251, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-05 05:38:49'),
(1252, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 05:38:51'),
(1253, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-05 05:38:56'),
(1254, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-05 05:39:01'),
(1255, 4, 'Mengakses Tabel Voucher', '::1', '2025-04-05 05:39:06'),
(1256, 4, 'Mengakses Tabel Asuransi', '::1', '2025-04-05 05:39:09'),
(1257, 4, 'Mengakses Tabel Reward', '::1', '2025-04-05 05:39:12'),
(1258, 4, 'Mengakses Tabel Promo Bank', '::1', '2025-04-05 05:39:15'),
(1259, 4, 'Mengakses Laporan Pemesanan', '::1', '2025-04-05 05:39:22'),
(1260, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-05 05:39:26'),
(1261, 4, 'Mencetak Laporan PDF Pembayaran dari 2025-03-01 sampai 2025-04-01 untuk semua maskapai.', '::1', '2025-04-05 05:39:37'),
(1262, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-05 05:39:43'),
(1263, 4, 'Mencetak Laporan PDF Pembayaran dari 2025-02-01 sampai 2025-03-01 untuk semua maskapai.', '::1', '2025-04-05 05:39:58'),
(1264, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-05 05:40:07'),
(1265, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-05 05:40:15'),
(1266, 4, 'Mengakses Profil', '::1', '2025-04-05 05:40:43'),
(1267, 4, 'Mengakses Profil', '::1', '2025-04-05 05:40:56'),
(1268, 4, 'Logout dari sistem', '::1', '2025-04-05 05:40:59'),
(1269, 9, 'Login ke sistem', '::1', '2025-04-05 06:42:26'),
(1270, 9, 'Mengakses Dashboard', '::1', '2025-04-05 06:42:26'),
(1271, 9, 'Mengakses Profil', '::1', '2025-04-05 07:32:36'),
(1272, 9, 'Login ke sistem', '::1', '2025-04-06 05:11:45'),
(1273, 9, 'Mengakses Dashboard', '::1', '2025-04-06 05:11:45'),
(1274, 9, 'Mengakses Profil', '::1', '2025-04-06 05:11:56'),
(1275, 9, 'Logout dari sistem', '::1', '2025-04-06 05:11:59'),
(1276, 10, 'Login ke sistem', '::1', '2025-04-06 05:13:16'),
(1277, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:13:16'),
(1278, 10, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:14:02'),
(1279, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:14:05'),
(1280, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:17:06'),
(1281, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:18:29'),
(1282, 10, 'Mengakses Profil', '::1', '2025-04-06 05:18:37'),
(1283, 10, 'Logout dari sistem', '::1', '2025-04-06 05:18:40'),
(1284, 10, 'Login ke sistem', '::1', '2025-04-06 05:19:45'),
(1285, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:19:45'),
(1286, 10, 'Mengakses Profil', '::1', '2025-04-06 05:20:13'),
(1287, 10, 'Logout dari sistem', '::1', '2025-04-06 05:20:16'),
(1288, 10, 'Login ke sistem', '::1', '2025-04-06 05:21:01'),
(1289, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:21:01'),
(1290, 10, 'Penumpang Memesan Tiket', '::1', '2025-04-06 05:24:12'),
(1291, 10, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:24:12'),
(1292, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:24:31'),
(1293, 10, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:25:09'),
(1294, 10, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 05:25:27'),
(1295, 10, 'Mengakses Profil', '::1', '2025-04-06 05:25:34'),
(1296, 10, 'Mengakses Profil', '::1', '2025-04-06 05:25:49'),
(1297, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:25:53'),
(1298, 10, 'Mengakses Profil', '::1', '2025-04-06 05:25:55'),
(1299, 10, 'Logout dari sistem', '::1', '2025-04-06 05:25:58'),
(1300, 4, 'Login ke sistem', '::1', '2025-04-06 05:26:05'),
(1301, 4, 'Mengakses Dashboard', '::1', '2025-04-06 05:26:05'),
(1302, 4, 'Mengakses Tabel Penumpang', '::1', '2025-04-06 05:26:18'),
(1303, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-06 05:26:33'),
(1304, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-06 05:26:39'),
(1305, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-06 05:26:48'),
(1306, 4, 'Mengedit Maskapai ID 6005 - Id bandara dari \'5002\' ke \'5008\'', '::1', '2025-04-06 05:27:06'),
(1307, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-06 05:27:06'),
(1308, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:27:12'),
(1309, 4, 'Mengakses Tabel User', '::1', '2025-04-06 05:27:23'),
(1310, 4, 'Mengakses Tabel Rute', '::1', '2025-04-06 05:27:45'),
(1311, 4, 'Menambahkan Rute Kembali: Maskapai ID 6001 dari Bandara 5002 ke Bandara 5007', '::1', '2025-04-06 05:28:57'),
(1312, 4, 'Mengakses Tabel Rute', '::1', '2025-04-06 05:28:57'),
(1313, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-06 05:29:08'),
(1314, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-06 05:29:48'),
(1315, 4, 'Mengedit Penerbangan ID 8015 (GA-7016) - Kapasitas dari \'39\' ke \'99\'', '::1', '2025-04-06 05:30:11'),
(1316, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-06 05:30:11'),
(1317, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-06 05:30:20'),
(1318, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:30:29'),
(1319, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:30:46'),
(1320, 4, 'Mengakses Tabel Tiket', '::1', '2025-04-06 05:30:51'),
(1321, 4, 'Download Tiket', '::1', '2025-04-06 05:30:59'),
(1322, 4, 'Mengakses Tabel Voucher', '::1', '2025-04-06 05:31:17'),
(1323, 4, 'Mengakses Tabel Reward', '::1', '2025-04-06 05:31:21'),
(1324, 4, 'Mengakses Laporan Pemesanan', '::1', '2025-04-06 05:31:27'),
(1325, 4, 'Mencetak Laporan Pemesanan dari 2025-02-01 sampai 2025-04-01 untuk maskapai ID 6001', '::1', '2025-04-06 05:31:42'),
(1326, 4, 'Mengakses Laporan Pemesanan', '::1', '2025-04-06 05:31:58'),
(1327, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-06 05:32:00'),
(1328, 4, 'Mencetak Laporan PDF Pembayaran dari 2025-02-14 sampai 2025-04-06 untuk semua maskapai.', '::1', '2025-04-06 05:32:14'),
(1329, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-06 05:32:22'),
(1330, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 05:33:04'),
(1331, 4, 'Mengakses Profil', '::1', '2025-04-06 05:33:30'),
(1332, 4, 'Logout dari sistem', '::1', '2025-04-06 05:33:38'),
(1333, 19, 'Login ke sistem', '::1', '2025-04-06 05:33:47'),
(1334, 19, 'Mengakses Dashboard', '::1', '2025-04-06 05:33:48'),
(1335, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:33:58'),
(1336, 19, 'id_user=19 mencoba mengakses detail bandara ID 5010', NULL, '2025-04-06 05:34:02'),
(1337, 19, 'id_user=19 berhasil melihat detail bandara ID 5010', NULL, '2025-04-06 05:34:02'),
(1338, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:34:09'),
(1339, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-06 05:34:13'),
(1340, 19, 'User ID 19 mencoba mengakses detail penumpang ID 2003', '::1', '2025-04-06 05:34:18'),
(1341, 19, 'User ID 19 berhasil melihat detail penumpang ID 2003', '::1', '2025-04-06 05:34:18'),
(1342, 19, 'Mengakses Tabel Penumpang', '::1', '2025-04-06 05:34:27'),
(1343, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:34:29'),
(1344, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-06 05:34:34'),
(1345, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:34:36'),
(1346, 19, 'Menghapus bandara dengan ID: 5013 (soft delete)', '::1', '2025-04-06 05:34:43'),
(1347, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:34:43'),
(1348, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-06 05:34:46'),
(1349, 19, 'Mengakses Tabel Data Bandara yang Dihapus', '::1', '2025-04-06 05:35:53'),
(1350, 19, 'Mengembalikan bandara dengan ID: 5013 (soft delete)', '::1', '2025-04-06 05:36:17'),
(1351, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:36:18'),
(1352, 19, 'id_user=19 mencoba mengakses detail bandara ID 5013', NULL, '2025-04-06 05:36:25'),
(1353, 19, 'id_user=19 berhasil melihat detail bandara ID 5013', NULL, '2025-04-06 05:36:25'),
(1354, 19, 'Mengakses Tabel Bandara', '::1', '2025-04-06 05:36:29'),
(1355, 19, 'Mengakses Settings', '::1', '2025-04-06 05:36:36'),
(1356, 19, 'Mengupdate pengaturan website: {\"site_name\":\"E-Tiket \",\"site_email\":\"etiketpswt@gmail.com\",\"site_phone\":\"8333382\",\"site_logo\":\"1743917816_e1eaaf186f99ac7f62a5.jpeg\"}', '::1', '2025-04-06 05:36:56'),
(1357, 19, 'Mengakses Settings', '::1', '2025-04-06 05:36:56'),
(1358, 19, 'Mengakses Profil', '::1', '2025-04-06 05:37:06'),
(1359, 19, 'Logout dari sistem', '::1', '2025-04-06 05:41:56'),
(1360, 10, 'Login ke sistem', '::1', '2025-04-06 05:42:09'),
(1361, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:42:09'),
(1362, 10, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 05:42:16'),
(1363, 10, 'Mengakses Dashboard', '::1', '2025-04-06 05:42:19'),
(1364, 10, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 05:46:49'),
(1365, 10, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 05:47:44'),
(1366, 10, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 05:48:02'),
(1367, 10, 'Mengakses Profil', '::1', '2025-04-06 05:48:13'),
(1368, 4, 'Login ke sistem', '::1', '2025-04-06 06:12:02'),
(1369, 4, 'Mengakses Dashboard', '::1', '2025-04-06 06:12:02'),
(1370, 4, 'Mengakses Tabel Penumpang', '::1', '2025-04-06 06:12:47'),
(1371, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-06 06:13:10'),
(1372, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-06 06:13:30'),
(1373, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-06 06:13:49'),
(1374, 4, 'Mengakses Tabel User', '::1', '2025-04-06 06:14:09'),
(1375, 4, 'Mengakses Tabel Bandara', '::1', '2025-04-06 06:14:19'),
(1376, 4, 'Mengakses Tabel Petugas', '::1', '2025-04-06 06:14:52'),
(1377, 4, 'Mengakses Tabel Maskapai', '::1', '2025-04-06 06:14:54'),
(1378, 4, 'Mengakses Tabel User', '::1', '2025-04-06 06:14:55'),
(1379, 4, 'Mengakses Tabel Rute', '::1', '2025-04-06 06:16:23'),
(1380, 4, 'Mengakses Tabel Penerbangan', '::1', '2025-04-06 06:16:44'),
(1381, 4, 'Mengakses Tabel Pemesanan', '::1', '2025-04-06 06:17:01'),
(1382, 4, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:17:18'),
(1383, 4, 'Mengakses Tabel Voucher', '::1', '2025-04-06 06:17:40'),
(1384, 4, 'Mengakses Tabel Asuransi', '::1', '2025-04-06 06:17:55'),
(1385, 4, 'Mengakses Tabel Reward', '::1', '2025-04-06 06:18:12'),
(1386, 4, 'Mengakses Tabel Promo Bank', '::1', '2025-04-06 06:18:24'),
(1387, 4, 'Mengakses Laporan Pemesanan', '::1', '2025-04-06 06:20:39'),
(1388, 4, 'Mengakses Laporan Pembayaran', '::1', '2025-04-06 06:20:53'),
(1389, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 06:21:20'),
(1390, 4, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 06:21:52'),
(1391, 4, 'Mengakses Profil', '::1', '2025-04-06 06:22:13'),
(1392, 4, 'Mengakses Profil', '::1', '2025-04-06 06:23:26'),
(1393, 4, 'Logout dari sistem', '::1', '2025-04-06 06:23:28'),
(1394, 19, 'Login ke sistem', '::1', '2025-04-06 06:23:36'),
(1395, 19, 'Mengakses Dashboard', '::1', '2025-04-06 06:23:36'),
(1396, 19, 'Mengakses Settings', '::1', '2025-04-06 06:23:39'),
(1397, 19, 'Mengupdate pengaturan website: {\"site_name\":\"E-Tiket \",\"site_email\":\"etiketpswt@gmail.com\",\"site_phone\":\"8333382\",\"site_logo\":\"1743920654_adf30017baca74320dc5.jpeg\"}', '::1', '2025-04-06 06:24:14'),
(1398, 19, 'Mengakses Settings', '::1', '2025-04-06 06:24:14'),
(1399, 19, 'Mengupdate pengaturan website: {\"site_name\":\"E-Tiket Pesawat\",\"site_email\":\"etiketpswt@gmail.com\",\"site_phone\":\"8333382\"}', '::1', '2025-04-06 06:24:28'),
(1400, 19, 'Mengakses Settings', '::1', '2025-04-06 06:24:28'),
(1401, 4, 'Login ke sistem', '::1', '2025-04-06 06:33:19'),
(1402, 4, 'Mengakses Dashboard', '::1', '2025-04-06 06:33:19'),
(1403, 4, 'Mengakses Tabel Rute', '::1', '2025-04-06 06:33:23'),
(1404, 4, 'Mengakses Profil', '::1', '2025-04-06 06:46:19'),
(1405, 4, 'Logout dari sistem', '::1', '2025-04-06 06:46:21'),
(1406, 9, 'Login ke sistem', '::1', '2025-04-06 06:46:32'),
(1407, 9, 'Mengakses Dashboard', '::1', '2025-04-06 06:46:32'),
(1408, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 06:48:00'),
(1409, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:48:02'),
(1410, 9, 'Mengakses Dashboard', '::1', '2025-04-06 06:49:02'),
(1411, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:49:08'),
(1412, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:50:06'),
(1413, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:50:20'),
(1414, 9, 'Mengakses Dashboard', '::1', '2025-04-06 06:50:33'),
(1415, 9, 'Penumpang Memesan Tiket', '::1', '2025-04-06 06:50:51'),
(1416, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:50:52'),
(1417, 9, 'Mengakses Dashboard', '::1', '2025-04-06 06:50:54'),
(1418, 9, 'Mengakses Tabel Pembayaran', '::1', '2025-04-06 06:51:37'),
(1419, 9, 'Mengakses Tabel Tiket', '::1', '2025-04-06 06:52:24'),
(1420, 9, 'Mengakses Tabel Tiket', '::1', '2025-04-06 06:52:47'),
(1421, 9, 'Download Tiket', '::1', '2025-04-06 06:53:26'),
(1422, 9, 'Mengakses Dashboard', '::1', '2025-04-06 06:54:07'),
(1423, 9, 'Mengakses Riwayat Aktivitas', '::1', '2025-04-06 06:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `maskapai`
--

CREATE TABLE `maskapai` (
  `id_maskapai` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bandara` int(11) NOT NULL,
  `nama_maskapai` varchar(255) DEFAULT NULL,
  `kode_maskapai` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `jumlah_pswt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maskapai`
--

INSERT INTO `maskapai` (`id_maskapai`, `id_user`, `id_bandara`, `nama_maskapai`, `kode_maskapai`, `email`, `no_hp`, `jumlah_pswt`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6001, 5, 5002, 'Garuda Indonesia', 'GA', 'garuda@email.com', '089848893842', 45, 0, '2025-03-13 17:34:31', NULL, NULL),
(6002, 5, 5001, 'Lion Air', 'JT', 'lion@email.com', '08129876545', 68, 0, '2025-03-13 17:34:31', NULL, NULL),
(6003, 4, 5004, 'Citilink', 'QG', 'citilink@gmail.com', '08121112222	', 29, 0, '2025-03-13 17:34:31', '2025-04-05 12:36:16', NULL),
(6004, 5, 5003, 'Singapore Airlines', 'SQ', 'singaporeairlines@gmail.com', '08363876587', 14, 0, '2025-03-13 17:34:31', NULL, NULL),
(6005, 5, 5008, 'Qatar Airways', 'QR', 'qatarairways@gmail.com', '08909836795', 8, 0, '2025-03-13 17:34:31', '2025-04-06 12:27:06', NULL),
(6006, 5, 5009, 'Asiana Airlines', 'OZ', 'asiana@gmail.com', '08932893289', 28, 1, '2025-03-13 17:34:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `jumlah_harga` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` enum('kartu_kredit','transfer_bank') NOT NULL,
  `status_pembayaran` enum('Menunggu','Menunggu Konfirmasi','Selesai','Gagal') NOT NULL,
  `waktu_pembayaran` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bukti_pembayaran` text NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pemesanan`, `jumlah_harga`, `metode_pembayaran`, `status_pembayaran`, `waktu_pembayaran`, `bukti_pembayaran`, `updated_at`) VALUES
(2224, 3043, 12000.00, 'kartu_kredit', 'Selesai', '2025-03-05 14:54:36', '', NULL),
(2225, 3044, 24000.00, 'kartu_kredit', 'Menunggu', '2025-02-22 10:49:23', '', NULL),
(2226, 3045, 12000.00, 'kartu_kredit', 'Selesai', '2025-02-24 12:55:21', '', NULL),
(2227, 3046, 12000.00, 'kartu_kredit', 'Selesai', '2025-02-24 10:42:51', '', NULL),
(2236, 3055, 24000.00, 'transfer_bank', 'Selesai', '2025-02-24 13:12:17', '', NULL),
(2237, 3056, 2000.00, 'transfer_bank', 'Selesai', '2025-02-24 13:14:13', '', NULL),
(2242, 3061, 3000.00, 'kartu_kredit', 'Selesai', '2025-02-24 14:04:58', '', NULL),
(2244, 3063, 10000.00, 'kartu_kredit', 'Selesai', '2025-02-24 14:19:54', '', NULL),
(2247, 3066, 15000.00, 'transfer_bank', 'Selesai', '2025-03-01 08:25:32', '', NULL),
(2251, 3070, 10000.00, 'kartu_kredit', 'Selesai', '2025-03-04 04:20:33', '', NULL),
(2252, 3071, 15000.00, 'kartu_kredit', 'Selesai', '2025-03-04 06:24:03', '', NULL),
(2255, 3074, 12000.00, 'kartu_kredit', 'Selesai', '2025-03-05 15:07:47', '', NULL),
(2256, 3075, 12000.00, 'transfer_bank', 'Selesai', '2025-03-05 15:09:54', '', NULL),
(2257, 3076, 10000.00, 'kartu_kredit', 'Selesai', '2025-03-09 07:47:32', '', NULL),
(2258, 3077, 24000.00, 'kartu_kredit', 'Selesai', '2025-03-16 13:21:47', '', NULL),
(2259, 3078, 2000.00, 'kartu_kredit', 'Selesai', '2025-03-17 03:20:34', '', NULL),
(2260, 3079, 2000.00, 'kartu_kredit', 'Selesai', '2025-03-19 09:07:33', '1742374574_5d9f1012505982609c8e.jpg', NULL),
(2261, 3080, 12000.00, 'transfer_bank', 'Gagal', '2025-03-19 09:27:45', '1742376236_1f071f0c6d12fee9f965.jpg', NULL),
(2262, 3081, 5000.00, 'kartu_kredit', 'Gagal', '2025-03-19 09:43:47', 'uwqheuug.jpeg', NULL),
(2263, 3082, 5000.00, 'transfer_bank', 'Gagal', '2025-03-19 09:48:21', '1742377247_0ab2073cef55741d2aa6.jpg', NULL),
(2264, 3083, 1000.00, 'kartu_kredit', 'Gagal', '2025-03-19 10:02:08', '1742378028_486ba4fb576d8d6a8751.jpg', '2025-03-19 17:02:08'),
(2265, 3084, 5000.00, 'kartu_kredit', 'Gagal', '2025-03-19 10:06:36', '1742378055_228522df503eba4edbd3.jpg', NULL),
(2269, 3085, 5000.00, 'transfer_bank', 'Gagal', '2025-03-19 11:54:45', '1742384922_9b5de0c503d561c11d11.jpg', NULL),
(2270, 3086, 12000.00, 'kartu_kredit', 'Gagal', '2025-03-19 11:57:24', '1742385150_43336a7a9f8a7aee1c55.jpg', NULL),
(2271, 3087, 5000.00, 'kartu_kredit', 'Gagal', '2025-03-19 12:13:07', '1742385538_6c1f926fdd33a6c3bd83.jpg', NULL),
(2274, 3090, 1000.00, 'kartu_kredit', 'Selesai', '2025-03-19 12:13:41', '1742386362_3eb5225b5782830cef89.jpg', NULL),
(2297, 3106, 2000.00, 'transfer_bank', 'Selesai', '2025-03-27 03:34:09', '1743046415_5b060d260dea758ca3a9.jpeg', NULL),
(2298, 3107, 10000.00, 'kartu_kredit', 'Selesai', '2025-03-27 07:25:23', '1743060296_7f37abd8b352aa3268df.jpeg', NULL),
(2299, 3108, 24000.00, 'kartu_kredit', 'Menunggu Konfirmasi', '2025-04-02 04:46:36', '1743569196_b8e888d5895a1fc7645f.jpeg', NULL),
(2300, 3109, 8000000.00, 'kartu_kredit', 'Menunggu', '2025-04-03 07:40:43', '', NULL),
(2302, 3111, 32000000.00, 'transfer_bank', 'Gagal', '2025-04-05 05:38:56', '1743827373_0fcd4f5f544835947717.jpeg', NULL),
(2303, 3112, 32000000.00, 'transfer_bank', 'Menunggu', '2025-04-05 04:31:46', '', NULL),
(2304, 3113, 32000000.00, 'transfer_bank', 'Selesai', '2025-04-05 05:38:42', '1743827697_e43bce7ec8acdd36b010.jpeg', NULL),
(2305, 3114, 32000000.00, 'transfer_bank', 'Selesai', '2025-04-06 05:30:46', '1743917109_67b1e9076c89c39748d8.jpeg', NULL),
(2306, 3115, 8000000.00, 'transfer_bank', 'Menunggu', '2025-04-06 06:50:51', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_penerbangan` int(11) NOT NULL,
  `id_penumpang` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `kode_pemesanan` varchar(255) NOT NULL,
  `waktu_pesan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Terkonfirmasi','Dibatalkan') NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime DEFAULT NULL,
  `tipe_tiket` enum('One Way','Round Trip') NOT NULL DEFAULT 'One Way',
  `id_penerbangan_pulang` int(11) DEFAULT NULL,
  `id_voucher` int(11) DEFAULT NULL,
  `id_asuransi` int(11) DEFAULT NULL,
  `id_promo_bank` int(11) DEFAULT NULL,
  `lokasi_transit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_penerbangan`, `id_penumpang`, `id_pembayaran`, `kode_pemesanan`, `waktu_pesan`, `status`, `total_harga`, `jumlah_tiket`, `updated_at`, `tipe_tiket`, `id_penerbangan_pulang`, `id_voucher`, `id_asuransi`, `id_promo_bank`, `lokasi_transit`) VALUES
(3043, 8004, 2003, 2224, 'KP3032', '2025-02-22 10:31:22', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3044, 8004, 2002, 2225, 'KP3033', '2025-02-22 10:49:23', 'Terkonfirmasi', 24000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3045, 8004, 2002, 2226, 'KP3034', '2025-02-22 11:56:34', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3046, 8004, 2002, 2227, 'KP3035', '2025-02-22 12:06:38', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3048, 8004, 2003, 2229, 'KP3037', '2025-02-22 12:13:48', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3049, 8004, 2002, 2230, 'KP3038', '2025-02-22 13:22:45', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3055, 8004, 2004, 2236, 'KP3040', '2025-02-24 13:12:45', 'Terkonfirmasi', 24000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3063, 8001, 2004, 2244, 'KP3048', '2025-02-24 14:19:29', 'Terkonfirmasi', 10000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3064, 8005, 2003, 2245, 'KP3049', '2025-02-26 12:06:04', 'Terkonfirmasi', 7500.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3065, 8005, 2003, 2246, 'KP3050', '2025-02-26 15:12:01', 'Terkonfirmasi', 7500.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3066, 8003, 2005, 2247, 'KP3051', '2025-03-01 08:21:48', 'Terkonfirmasi', 15000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3067, 8003, 2006, 2248, 'KP3052', '2025-03-03 03:07:35', 'Terkonfirmasi', 10000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3068, 8005, 2003, 2249, 'KP3053', '2025-03-03 09:00:22', 'Terkonfirmasi', 7500.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3069, 8003, 2007, 2250, 'KP3054', '2025-03-04 03:16:32', 'Terkonfirmasi', 10000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3070, 8003, 2003, 2251, 'KP3055', '2025-03-04 04:20:08', 'Terkonfirmasi', 10000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3071, 8005, 2004, 2252, 'KP3056', '2025-03-04 06:23:23', 'Terkonfirmasi', 15000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3072, 8005, 2003, 2253, 'KP3057', '2025-03-04 13:07:24', 'Terkonfirmasi', 15000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3073, 8002, 2003, 2254, 'KP3058', '2025-03-04 13:15:27', 'Terkonfirmasi', 1000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3074, 8009, 2003, 2255, 'KP3059', '2025-03-05 14:57:48', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3075, 8009, 2003, 2256, 'KP3060', '2025-03-05 15:09:46', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3076, 8003, 2003, 2257, 'KP3061', '2025-03-09 07:47:25', 'Terkonfirmasi', 10000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3077, 8004, 2004, 2258, 'KP3062', '2025-03-16 13:20:08', 'Terkonfirmasi', 24000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3078, 8002, 2001, 2259, 'KP3063', '2025-03-17 03:19:33', 'Terkonfirmasi', 2000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3079, 8002, 2003, 2260, 'KP3064', '2025-03-19 08:19:49', 'Terkonfirmasi', 2000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3080, 8004, 2003, 2261, 'KP3065', '2025-03-19 09:20:28', 'Terkonfirmasi', 12000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3081, 8003, 2003, 2262, 'KP3066', '2025-03-19 09:38:13', 'Terkonfirmasi', 5000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3082, 8001, 2003, 2263, 'KP3067', '2025-03-19 09:38:44', 'Terkonfirmasi', 5000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3083, 8002, 2003, 2264, 'KP3068', '2025-03-19 09:53:37', 'Terkonfirmasi', 1000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3084, 8003, 2003, 2265, 'KP3069', '2025-03-19 09:54:05', 'Terkonfirmasi', 5000.00, 1, NULL, 'One Way', NULL, NULL, NULL, NULL, NULL),
(3085, 8003, 2003, 2269, 'KP3070', '2025-03-19 11:48:15', 'Terkonfirmasi', 5000.00, 1, '2025-03-19 18:48:15', 'One Way', NULL, NULL, NULL, NULL, NULL),
(3086, 8004, 2003, 2270, 'KP3071', '2025-03-19 11:49:23', 'Terkonfirmasi', 12000.00, 1, '2025-03-19 18:49:23', 'One Way', NULL, NULL, NULL, NULL, NULL),
(3087, 8003, 2003, 2271, 'KP3072', '2025-03-19 12:13:07', 'Dibatalkan', 5000.00, 1, '2025-03-19 19:13:07', 'One Way', NULL, NULL, NULL, NULL, NULL),
(3090, 8002, 2003, 2274, 'KP3075', '2025-03-19 12:13:41', 'Terkonfirmasi', 1000.00, 1, '2025-03-19 19:13:41', 'One Way', NULL, NULL, NULL, NULL, NULL),
(3106, 8002, 2003, 2297, 'KP3087', '2025-03-27 03:34:09', 'Terkonfirmasi', 2000.00, 1, '2025-03-27 10:34:09', 'Round Trip', 8010, NULL, NULL, NULL, NULL),
(3107, 8001, 2003, 2298, 'KP3088', '2025-03-27 07:25:23', 'Terkonfirmasi', 5000.00, 1, '2025-03-27 14:25:23', 'Round Trip', NULL, NULL, NULL, NULL, NULL),
(3108, 8004, 2003, 2299, 'KP3089', '2025-03-31 08:31:39', 'Terkonfirmasi', 12000.00, 1, '2025-03-31 15:31:39', 'Round Trip', NULL, NULL, NULL, NULL, NULL),
(3109, 8011, 2003, 2300, 'KP3090', '2025-04-03 07:40:43', 'Terkonfirmasi', 8000000.00, 1, '2025-04-03 14:40:43', 'One Way', NULL, NULL, NULL, NULL, NULL),
(3111, 8011, 2003, 2302, 'KP3091', '2025-04-05 05:38:56', 'Dibatalkan', 32000000.00, 1, '2025-04-05 12:38:56', 'Round Trip', 8012, NULL, NULL, NULL, NULL),
(3112, 8011, 2003, 2303, 'KP3092', '2025-04-05 04:31:46', 'Terkonfirmasi', 32000000.00, 1, '2025-04-05 11:31:46', 'Round Trip', 8012, NULL, NULL, NULL, NULL),
(3113, 8011, 2003, 2304, 'KP3093', '2025-04-05 05:38:42', 'Terkonfirmasi', 32000000.00, 1, '2025-04-05 12:38:42', 'Round Trip', 8012, NULL, NULL, NULL, NULL),
(3114, 8011, 2004, 2305, 'KP3094', '2025-04-06 05:30:46', 'Terkonfirmasi', 32000000.00, 1, '2025-04-06 12:30:46', 'Round Trip', 8012, NULL, NULL, NULL, NULL),
(3115, 8011, 2003, 2306, 'KP3095', '2025-04-06 06:50:51', 'Terkonfirmasi', 8000000.00, 1, '2025-04-06 13:50:51', 'One Way', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_asuransi`
--

CREATE TABLE `pemesanan_asuransi` (
  `id` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `id_asuransi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerbangan`
--

CREATE TABLE `penerbangan` (
  `id_penerbangan` int(11) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `kode_penerbangan` varchar(255) NOT NULL,
  `tanggal_penerbangan` date NOT NULL,
  `waktu_berangkat` time NOT NULL,
  `waktu_tiba` time NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `kapasitas_tersisa` int(11) NOT NULL,
  `status` enum('Dijadwalkan','Berangkat','Tertunda','Dibatalkan','Selesai') NOT NULL,
  `statusr` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `id_promo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbangan`
--

INSERT INTO `penerbangan` (`id_penerbangan`, `id_rute`, `kode_penerbangan`, `tanggal_penerbangan`, `waktu_berangkat`, `waktu_tiba`, `kapasitas`, `kapasitas_tersisa`, `status`, `statusr`, `created_at`, `updated_at`, `deleted_at`, `id_promo`) VALUES
(8001, 7002, 'GA-7002', '2025-04-04', '18:00:00', '17:45:00', 70, 45, 'Selesai', 0, '2025-03-15 23:35:22', '2025-04-04 21:40:43', NULL, NULL),
(8002, 7001, 'JT-7001', '2025-02-14', '20:30:00', '00:50:00', 185, 82, 'Berangkat', 0, '2025-03-15 23:35:22', NULL, NULL, NULL),
(8003, 7002, 'SQ-7003', '2025-02-19', '17:00:00', '19:30:00', 160, 155, 'Dijadwalkan', 0, '2025-03-15 23:35:22', NULL, NULL, NULL),
(8004, 7004, 'SQ-7004', '2025-02-24', '11:00:00', '14:40:00', 25, 0, 'Dijadwalkan', 0, '2025-03-15 23:35:22', NULL, NULL, NULL),
(8005, 7005, 'QR-7005', '2025-02-26', '17:20:00', '21:30:00', 168, 0, 'Berangkat', 0, '2025-03-15 23:35:22', NULL, NULL, NULL),
(8009, 7006, 'OZ-7006', '2025-03-15', '13:00:00', '19:50:00', 55, 0, 'Dijadwalkan', 0, '2025-03-15 23:35:22', NULL, NULL, NULL),
(8010, 7009, 'JT-7002', '2025-02-15', '06:00:00', '10:20:00', 185, 185, 'Dijadwalkan', 0, '2025-03-27 10:04:39', '2025-03-27 10:08:44', NULL, NULL),
(8011, 7010, 'OZ-7010', '2025-04-05', '11:35:00', '17:35:00', 55, 55, 'Dijadwalkan', 0, '2025-04-02 11:44:00', '2025-04-05 10:57:40', NULL, NULL),
(8012, 7011, 'OZ-7011', '2025-04-07', '18:50:00', '20:50:00', 66, 66, 'Dijadwalkan', 0, '2025-04-02 11:45:06', '2025-04-03 16:23:51', NULL, NULL),
(8013, 7012, 'OZ-7012', '2025-04-08', '20:30:00', '04:00:00', 45, 45, 'Dijadwalkan', 0, '2025-04-05 12:28:24', NULL, NULL, NULL),
(8014, 7014, 'SQ-7014', '2025-04-07', '14:40:00', '18:20:00', 60, 60, 'Dijadwalkan', 0, '2025-04-05 12:38:14', NULL, NULL, NULL),
(8015, 7016, 'GA-7016', '2025-04-08', '20:30:00', '23:45:00', 99, 39, 'Dijadwalkan', 0, '2025-04-06 12:29:48', '2025-04-06 12:30:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penumpang`
--

CREATE TABLE `penumpang` (
  `id_penumpang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_penumpang` varchar(255) NOT NULL,
  `nomor_indentitas` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `total_transaksi` decimal(10,2) DEFAULT 0.00,
  `jumlah_poin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penumpang`
--

INSERT INTO `penumpang` (`id_penumpang`, `id_user`, `nama_penumpang`, `nomor_indentitas`, `jenis_kelamin`, `no_hp`, `created_at`, `updated_at`, `total_transaksi`, `jumlah_poin`) VALUES
(2001, 2, 'James', 843932, 'Laki-laki', '08932893289', '2025-03-13 15:41:30', '2025-04-03 12:37:56', 2000.00, 0),
(2002, 8, 'Julie', 737291, 'Perempuan', '08129876543', '2025-03-13 15:41:30', '2025-04-03 12:52:31', 60000.00, 24),
(2003, 9, 'Ethan', 374843, 'Laki-laki', '08373927462', '2025-03-13 15:41:30', '2025-04-03 12:52:31', 178500.00, 71),
(2004, 10, 'Karina', 939392, 'Perempuan', '08237292384', '2025-03-13 15:41:30', '2025-04-03 12:52:31', 73000.00, 29),
(2005, 11, 'Upin', 436382, 'Laki-laki', '082738329103', '2025-03-13 15:41:30', '2025-04-03 12:52:31', 15000.00, 6),
(2006, 13, 'Ruby', 873834, 'Perempuan', '08274928472', '2025-03-13 15:41:30', '2025-04-03 12:52:31', 10000.00, 4),
(2010, 24, 'dk', 737291, 'Laki-laki', '082372923849', '2025-03-23 12:31:43', NULL, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `id_bandara` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `id_user`, `nama_petugas`, `jenis_kelamin`, `no_hp`, `id_bandara`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4001, 3, 'Kiran', 'Perempuan', '08488372923', 5001, 0, '2025-03-13 16:23:17', '2025-03-17 11:09:51', NULL),
(4002, 6, 'Harto', 'Laki-laki', '08237292388', 5002, 0, '2025-03-13 16:23:17', '2025-03-14 22:23:59', NULL),
(4003, 7, 'Arya', 'Laki-laki', '08129838548', 5003, 0, '2025-03-13 16:23:17', NULL, NULL),
(4009, 20, 'Olay', 'Perempuan', '08129876545', 5006, 0, '2025-03-13 16:23:17', '2025-04-05 12:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo_bank`
--

CREATE TABLE `promo_bank` (
  `id_promo` int(11) NOT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `diskon` decimal(10,2) DEFAULT NULL,
  `min_transaksi` decimal(10,2) DEFAULT NULL,
  `berlaku_sampai` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_bank`
--

INSERT INTO `promo_bank` (`id_promo`, `nama_bank`, `diskon`, `min_transaksi`, `berlaku_sampai`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bank BCA', 10.00, 680000.00, '2025-08-20', 0, '2025-04-02 19:40:22', '2025-04-02 19:40:59', NULL),
(2, 'Bank Mandiri', 15.00, 950000.00, '2025-06-10', 0, '2025-04-02 19:43:13', '2025-04-02 19:52:44', NULL),
(3, 'Bank BNI', 20.00, 1000000.00, '2025-09-20', 0, '2025-04-02 19:43:47', '2025-04-02 20:17:54', NULL),
(4, 'Bank CIMB Niaga', 12.00, 800000.00, '2025-05-17', 0, '2025-04-02 19:44:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

CREATE TABLE `reward` (
  `id_reward` int(11) NOT NULL,
  `nama_reward` varchar(50) DEFAULT NULL,
  `jumlah_poin` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`id_reward`, `nama_reward`, `jumlah_poin`, `stok`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7801, 'Voucher Diskon 50%', 70, 50, 0, '2025-04-02 16:30:22', '2025-04-03 13:12:52', NULL),
(7802, 'Amenities Kit', 800, 390, 0, '2025-04-02 16:35:44', '2025-04-02 16:42:47', NULL),
(7803, 'Mascot Plushie', 1000, 65, 0, '2025-04-02 16:37:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `id_maskapai` int(11) NOT NULL,
  `id_bandara_asal` int(11) NOT NULL,
  `id_bandara_tujuan` int(11) NOT NULL,
  `estimasi_tiba` time NOT NULL,
  `harga` int(11) NOT NULL,
  `kelas_penerbangan` enum('Ekonomi','Bisnis','First Class') NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`id_rute`, `id_maskapai`, `id_bandara_asal`, `id_bandara_tujuan`, `estimasi_tiba`, `harga`, `kelas_penerbangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7001, 6002, 5001, 5003, '04:20:00', 1000000, 'Ekonomi', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:52:54', NULL),
(7002, 6001, 5002, 5003, '01:45:00', 5000000, 'Bisnis', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:53:04', NULL),
(7003, 6004, 5003, 5002, '02:30:00', 4250000, 'Ekonomi', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:53:19', NULL),
(7004, 6004, 5006, 5010, '03:40:00', 12000000, 'Bisnis', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:53:31', NULL),
(7005, 6005, 5008, 5010, '04:30:00', 7500000, 'Ekonomi', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:53:40', NULL),
(7006, 6006, 5009, 5006, '06:50:00', 12000000, 'Bisnis', 'Aktif', '2025-03-15 23:16:19', '2025-03-31 15:53:49', NULL),
(7007, 6004, 5004, 5013, '01:58:00', 9999999, 'First Class', 'Nonaktif', '2025-03-17 10:24:41', '2025-03-17 13:12:33', NULL),
(7008, 6003, 5004, 5011, '03:00:00', 900000, 'Ekonomi', 'Aktif', '2025-03-17 13:12:16', '2025-03-31 15:54:10', NULL),
(7009, 6002, 5003, 5001, '06:40:00', 1000000, 'Ekonomi', 'Aktif', '2025-03-27 10:01:57', '2025-03-31 15:54:19', NULL),
(7010, 6006, 5009, 5014, '06:00:00', 8000000, 'Bisnis', 'Aktif', '2025-03-31 15:43:51', '2025-03-31 15:54:32', NULL),
(7011, 6006, 5014, 5009, '06:00:00', 8000000, 'Bisnis', 'Aktif', '2025-03-31 15:43:51', '2025-03-31 15:54:46', NULL),
(7012, 6006, 5003, 5009, '07:30:00', 34000000, 'First Class', 'Aktif', '2025-04-05 12:27:33', NULL, NULL),
(7013, 6006, 5009, 5003, '07:30:00', 34000000, 'First Class', 'Aktif', '2025-04-05 12:27:33', NULL, NULL),
(7014, 6004, 5006, 5010, '03:40:00', 14000000, 'Bisnis', 'Aktif', '2025-04-05 12:37:31', NULL, NULL),
(7015, 6004, 5010, 5006, '03:40:00', 14000000, 'Bisnis', 'Aktif', '2025-04-05 12:37:31', NULL, NULL),
(7016, 6001, 5007, 5002, '03:15:00', 16000000, 'Bisnis', 'Aktif', '2025-04-06 12:28:57', NULL, NULL),
(7017, 6001, 5002, 5007, '03:15:00', 16000000, 'Bisnis', 'Aktif', '2025-04-06 12:28:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_logo` varchar(255) NOT NULL,
  `site_email` varchar(255) NOT NULL,
  `site_phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_logo`, `site_email`, `site_phone`) VALUES
(1, 'E-Tiket Pesawat', '1743920654_adf30017baca74320dc5.jpeg', 'etiketpswt@gmail.com', '8333382');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `id_penerbangan` int(11) NOT NULL,
  `kode_tiket` varchar(50) NOT NULL,
  `no_kursi` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `boarding_pass` varchar(255) NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nama_penumpang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `id_pemesanan`, `id_penerbangan`, `kode_tiket`, `no_kursi`, `harga`, `total_harga`, `boarding_pass`, `dibuat_pada`, `nama_penumpang`) VALUES
(9044, 3063, 8001, 'TK9916', 'A1', 5000.00, 5000.00, 'BP3708', '2025-02-24 14:19:29', 'juli'),
(9045, 3063, 8001, 'TK5809', 'B2', 5000.00, 5000.00, 'BP2204', '2025-02-24 14:19:29', 'jua'),
(9046, 3064, 8005, 'TK3592', 'A1', 7500.00, 7500.00, 'BP7840', '2025-02-26 12:06:04', 'Ethan'),
(9047, 3065, 8005, 'TK9262', 'A1', 7500.00, 7500.00, 'BP4116', '2025-02-26 15:12:01', 'Ethan'),
(9048, 3066, 8003, 'TK6171', 'A1', 5000.00, 5000.00, 'BP5573', '2025-03-01 08:21:48', 'Upin'),
(9049, 3066, 8003, 'TK3683', 'B2', 5000.00, 5000.00, 'BP4582', '2025-03-01 08:21:48', 'Ipin'),
(9050, 3066, 8003, 'TK2385', 'C3', 5000.00, 5000.00, 'BP5276', '2025-03-01 08:21:48', 'Kak Ros'),
(9051, 3067, 8003, 'TK2968', 'A1', 5000.00, 5000.00, 'BP3925', '2025-03-03 03:07:35', 'Ruby'),
(9052, 3067, 8003, 'TK3086', 'B2', 5000.00, 5000.00, 'BP5186', '2025-03-03 03:07:35', 'Rubah'),
(9053, 3068, 8005, 'TK6855', 'A1', 7500.00, 7500.00, 'BP3651', '2025-03-03 09:00:22', 'Ethan'),
(9054, 3069, 8003, 'TK2836', 'A1', 5000.00, 5000.00, 'BP6829', '2025-03-04 03:16:32', 'justin'),
(9055, 3069, 8003, 'TK7930', 'B2', 5000.00, 5000.00, 'BP7390', '2025-03-04 03:16:32', 'maui'),
(9056, 3070, 8003, 'TK9676', 'A1', 5000.00, 5000.00, 'BP2772', '2025-03-04 04:20:08', 'Ethan'),
(9057, 3070, 8003, 'TK7445', 'B2', 5000.00, 5000.00, 'BP8220', '2025-03-04 04:20:08', 'Winter'),
(9058, 3071, 8005, 'TK8023', 'A1', 7500.00, 7500.00, 'BP5752', '2025-03-04 06:23:23', 'Karina'),
(9059, 3071, 8005, 'TK9582', 'B2', 7500.00, 7500.00, 'BP8471', '2025-03-04 06:23:23', 'Winter'),
(9060, 3072, 8005, 'TK6518', 'A1', 7500.00, 7500.00, 'BP3795', '2025-03-04 13:07:24', 'juli'),
(9061, 3072, 8005, 'TK6536', 'B2', 7500.00, 7500.00, 'BP5134', '2025-03-04 13:07:24', 'jua'),
(9062, 3073, 8002, 'TK1110', 'A1', 1000.00, 1000.00, 'BP7086', '2025-03-04 13:15:27', 'juli'),
(9063, 3074, 8009, 'TK6091', 'A1', 12000.00, 12000.00, 'BP4179', '2025-03-05 14:57:48', 'Ethan'),
(9064, 3075, 8009, 'TK4931', 'A1', 12000.00, 12000.00, 'BP3112', '2025-03-05 15:09:46', 'Ethan'),
(9065, 3076, 8003, 'TK1891', 'A1', 5000.00, 5000.00, 'BP6416', '2025-03-09 07:47:25', 'Ethan'),
(9066, 3076, 8003, 'TK7947', 'B2', 5000.00, 5000.00, 'BP7476', '2025-03-09 07:47:25', 'Winter'),
(9067, 3077, 8004, 'TK8096', 'A1', 12000.00, 12000.00, 'BP9683', '2025-03-16 13:20:08', 'Karina'),
(9068, 3077, 8004, 'TK9769', 'B2', 12000.00, 12000.00, 'BP6603', '2025-03-16 13:20:08', 'Winter'),
(9069, 3078, 8002, 'TK1976', 'A1', 1000.00, 1000.00, 'BP3845', '2025-03-17 03:19:33', 'antoni'),
(9070, 3078, 8002, 'TK9774', 'B2', 1000.00, 1000.00, 'BP4946', '2025-03-17 03:19:33', 'budi '),
(9071, 3079, 8002, 'TK2939', 'A1', 1000.00, 1000.00, 'BP2012', '2025-03-19 08:19:49', 'Ethan'),
(9072, 3079, 8002, 'TK5524', 'B2', 1000.00, 1000.00, 'BP3675', '2025-03-19 08:19:49', 'Winter'),
(9073, 3080, 8004, 'TK8035', 'A1', 12000.00, 12000.00, 'BP8939', '2025-03-19 09:20:28', 'Ethan'),
(9074, 3081, 8003, 'TK1296', 'A1', 5000.00, 5000.00, 'BP6962', '2025-03-19 09:38:13', 'Ethan'),
(9075, 3082, 8001, 'TK8585', 'A1', 5000.00, 5000.00, 'BP2007', '2025-03-19 09:38:44', 'Ethan'),
(9076, 3083, 8002, 'TK1694', 'A1', 1000.00, 1000.00, 'BP3609', '2025-03-19 09:53:37', 'Ethan'),
(9077, 3084, 8003, 'TK8596', 'A1', 5000.00, 5000.00, 'BP9296', '2025-03-19 09:54:05', 'Ethan'),
(9078, 3085, 8003, 'TK3290', 'A1', 5000.00, 5000.00, 'BP2888', '2025-03-19 11:48:15', 'Ethan'),
(9079, 3086, 8004, 'TK8800', 'A1', 12000.00, 12000.00, 'BP7607', '2025-03-19 11:49:23', 'Ethan'),
(9080, 3087, 8003, 'TK1988', 'A1', 5000.00, 5000.00, 'BP3384', '2025-03-19 11:58:49', 'Ethan'),
(9083, 3090, 8002, 'TK8441', 'A1', 1000.00, 1000.00, 'BP5622', '2025-03-19 12:11:56', 'Ethan'),
(9090, 3106, 8002, 'TK6260', 'A1', 1000.00, 1000.00, 'BP6112', '2025-03-27 03:32:53', 'Ethan'),
(9091, 3106, 8010, 'TK9690', 'B1', 1000.00, 1000.00, 'BP3042', '2025-03-27 03:32:53', 'Ethan'),
(9092, 3107, 8001, 'TK1767', 'A1', 5000.00, 5000.00, 'BP5677', '2025-03-27 07:24:44', 'Ethan'),
(9093, 3108, 8004, 'TK2040', 'A1', 12000.00, 12000.00, 'BP5207', '2025-03-31 08:31:39', 'Ethan'),
(9095, 3111, 8011, 'TK6016', 'A1', 8000000.00, 8000000.00, 'BP4847', '2025-04-05 04:28:45', 'Ethan'),
(9096, 3111, 8011, 'TK1639', 'A2', 8000000.00, 8000000.00, 'BP4394', '2025-04-05 04:28:45', 'Karina'),
(9097, 3112, 8011, 'TK2091', 'A1', 8000000.00, 8000000.00, 'BP5485', '2025-04-05 04:31:46', 'Ethan'),
(9098, 3112, 8011, 'TK9279', 'A2', 8000000.00, 8000000.00, 'BP9038', '2025-04-05 04:31:46', 'Karina'),
(9099, 3113, 8011, 'TK7336', 'A1', 8000000.00, 8000000.00, 'BP1537', '2025-04-05 04:34:28', 'Ethan'),
(9100, 3113, 8011, 'TK7849', 'A2', 8000000.00, 8000000.00, 'BP1896', '2025-04-05 04:34:28', 'Karins'),
(9101, 3114, 8011, 'TK4636', 'A1', 8000000.00, 8000000.00, 'BP2351', '2025-04-06 05:24:12', 'Karina'),
(9102, 3114, 8011, 'TK1200', 'A2', 8000000.00, 8000000.00, 'BP2228', '2025-04-06 05:24:12', 'Karini'),
(9103, 3115, 8011, 'TK6223', 'A1', 8000000.00, 8000000.00, 'BP6534', '2025-04-06 06:50:51', 'Ethan');

-- --------------------------------------------------------

--
-- Table structure for table `transit`
--

CREATE TABLE `transit` (
  `id_transit` int(11) NOT NULL,
  `id_penerbangan` int(11) DEFAULT NULL,
  `lokasi_transit` varchar(100) DEFAULT NULL,
  `waktu_transit` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transit`
--

INSERT INTO `transit` (`id_transit`, `id_penerbangan`, `lokasi_transit`, `waktu_transit`) VALUES
(1, 8004, 'Incheon International Airport', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('1','2','3','4') NOT NULL,
  `foto` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `reset_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`, `foto`, `created_at`, `updated_at`, `deleted_at`, `status`, `reset_token`) VALUES
(2, 'James', 'james@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '', '2025-03-14 22:45:07', '2025-03-15 22:34:39', '2025-03-15 22:34:39', 0, NULL),
(3, 'Kiran', 'kiran@s', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(4, 'admin2', 'admin2@m', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1743831656_c2b618b6e6020a36b0c6.jpeg', '2025-03-14 22:45:07', '2025-04-05 12:40:56', NULL, 0, NULL),
(5, 'admin1', 'admin1@m', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(6, 'Harto', 'harto@s', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(7, 'Arya', 'arya@s', 'b59c67bf196a4758191e42f76670ceba', '3', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(8, 'Julie', 'julie@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(9, 'Ethan', 'ethan@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '1742371680_5b2394127b9627dd8cec.jpeg', '2025-03-14 22:45:07', '2025-03-19 15:12:28', NULL, 0, NULL),
(10, 'Karinaaaa', 'karina@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '1743917149_d51fdf3abcc103d12375.jpeg', '2025-03-14 22:45:07', '2025-04-06 12:25:49', NULL, 0, NULL),
(11, 'Upin', 'upin@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '', '2025-03-14 22:45:07', '2025-03-15 23:05:29', '2025-03-15 22:39:43', 1, NULL),
(13, 'Ruby', 'ruby@p', 'c81e728d9d4c2f636f067f89cc14862c', '2', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(18, 'Ola', 'ola@s', 'b59c67bf196a4758191e42f76670ceba', '3', '', '2025-03-14 22:45:07', NULL, NULL, 0, NULL),
(19, 'admin3', 's.admin@m', 'c4ca4238a0b923820dcc509a6f75849b', '4', '1743693130_a31620d797a18e422d60.jpeg', '2025-03-14 22:45:07', '2025-04-03 22:12:10', NULL, 0, NULL),
(20, 'Ola', 'ola@s', '$2y$10$7mV45KklLINwdXfMhEHAuutWCdNRSt4D3XS4SLW7JPYfjP9OUKWaG', '3', '', '2025-03-14 22:45:07', '2025-04-05 12:23:50', NULL, 0, NULL),
(24, 'dk', 'treasurejae20@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c', '2', '', '2025-03-23 12:31:43', '2025-04-05 14:38:19', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL,
  `kode_voucher` varchar(20) DEFAULT NULL,
  `diskon` decimal(10,2) DEFAULT NULL,
  `min_transaksi` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `kode_voucher`, `diskon`, `min_transaksi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6501, 'VC-1', 10.00, 1200000.00, 0, '2025-04-02 13:04:46', '2025-04-02 13:40:16', NULL),
(6502, 'VC-2', 15.00, 1500000.00, 0, '2025-04-02 13:20:16', '2025-04-02 13:40:21', NULL),
(6503, 'VC-3', 25.00, 5500000.00, 0, '2025-04-02 13:20:40', '2025-04-02 13:40:27', NULL),
(6504, 'VC-4', 45.00, 18000000.00, 0, '2025-04-02 13:21:27', '2025-04-02 14:05:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asuransi`
--
ALTER TABLE `asuransi`
  ADD PRIMARY KEY (`id_asuransi`);

--
-- Indexes for table `bandara`
--
ALTER TABLE `bandara`
  ADD PRIMARY KEY (`id_bandara`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`id_checkin`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `maskapai`
--
ALTER TABLE `maskapai`
  ADD PRIMARY KEY (`id_maskapai`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_penerbangan_pulang` (`id_penerbangan_pulang`),
  ADD KEY `id_voucher` (`id_voucher`),
  ADD KEY `id_asuransi` (`id_asuransi`),
  ADD KEY `id_promo_bank` (`id_promo_bank`);

--
-- Indexes for table `pemesanan_asuransi`
--
ALTER TABLE `pemesanan_asuransi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pemesanan` (`id_pemesanan`),
  ADD KEY `id_asuransi` (`id_asuransi`);

--
-- Indexes for table `penerbangan`
--
ALTER TABLE `penerbangan`
  ADD PRIMARY KEY (`id_penerbangan`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id_penumpang`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `promo_bank`
--
ALTER TABLE `promo_bank`
  ADD PRIMARY KEY (`id_promo`);

--
-- Indexes for table `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`id_reward`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `fk_tiket_pemesanan` (`id_pemesanan`),
  ADD KEY `fk_tiket_penerbangan` (`id_penerbangan`);

--
-- Indexes for table `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`id_transit`),
  ADD KEY `id_penerbangan` (`id_penerbangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`),
  ADD UNIQUE KEY `kode_voucher` (`kode_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asuransi`
--
ALTER TABLE `asuransi`
  MODIFY `id_asuransi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3307;

--
-- AUTO_INCREMENT for table `bandara`
--
ALTER TABLE `bandara`
  MODIFY `id_bandara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5016;

--
-- AUTO_INCREMENT for table `checkin`
--
ALTER TABLE `checkin`
  MODIFY `id_checkin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1424;

--
-- AUTO_INCREMENT for table `maskapai`
--
ALTER TABLE `maskapai`
  MODIFY `id_maskapai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6007;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2307;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3116;

--
-- AUTO_INCREMENT for table `pemesanan_asuransi`
--
ALTER TABLE `pemesanan_asuransi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penerbangan`
--
ALTER TABLE `penerbangan`
  MODIFY `id_penerbangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8016;

--
-- AUTO_INCREMENT for table `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id_penumpang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2011;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4011;

--
-- AUTO_INCREMENT for table `promo_bank`
--
ALTER TABLE `promo_bank`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reward`
--
ALTER TABLE `reward`
  MODIFY `id_reward` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7804;

--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7018;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9104;

--
-- AUTO_INCREMENT for table `transit`
--
ALTER TABLE `transit`
  MODIFY `id_transit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6506;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD CONSTRAINT `log_activity_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_penerbangan_pulang`) REFERENCES `penerbangan` (`id_penerbangan`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_voucher`) REFERENCES `voucher` (`id_voucher`),
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`id_asuransi`) REFERENCES `asuransi` (`id_asuransi`),
  ADD CONSTRAINT `pemesanan_ibfk_4` FOREIGN KEY (`id_promo_bank`) REFERENCES `promo_bank` (`id_promo`);

--
-- Constraints for table `pemesanan_asuransi`
--
ALTER TABLE `pemesanan_asuransi`
  ADD CONSTRAINT `pemesanan_asuransi_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`),
  ADD CONSTRAINT `pemesanan_asuransi_ibfk_2` FOREIGN KEY (`id_asuransi`) REFERENCES `asuransi` (`id_asuransi`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `fk_tiket_pemesanan` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tiket_penerbangan` FOREIGN KEY (`id_penerbangan`) REFERENCES `penerbangan` (`id_penerbangan`) ON DELETE CASCADE;

--
-- Constraints for table `transit`
--
ALTER TABLE `transit`
  ADD CONSTRAINT `transit_ibfk_1` FOREIGN KEY (`id_penerbangan`) REFERENCES `penerbangan` (`id_penerbangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
