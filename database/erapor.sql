-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2025 at 07:21 AM
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
-- Database: `erapor`
--

-- --------------------------------------------------------

--
-- Table structure for table `blok`
--

CREATE TABLE `blok` (
  `id_blok` int(11) NOT NULL,
  `kode_blok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blok`
--

INSERT INTO `blok` (`id_blok`, `kode_blok`) VALUES
(554, 1),
(555, 2),
(556, 3),
(557, 4);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `nip` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `id_user`, `nama_guru`, `nip`, `alamat`, `jenis_kelamin`) VALUES
(4959, 134, 'Dewi', 728378, 'Jl. Anggrek No.15', 'Perempuan'),
(4960, 135, 'Prita', 983493, 'Jalan Surya Kencana ', 'Perempuan'),
(4961, 136, 'Hendra', 423749, 'Jalan Pahlawan No.10', 'Laki-laki'),
(4963, 137, 'Endang', 487342, 'Jalan Mawar No.23', 'Perempuan'),
(4965, 138, 'Saraswati', 985493, 'Jalan Kenangan Indah', 'Perempuan'),
(4975, 151, 'Amar', 327632, 'Sydney', 'Laki-laki');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_rombel` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_blok` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_tahunajaran` int(11) NOT NULL,
  `sesi` varchar(11) NOT NULL,
  `jam_sesi` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_rombel`, `id_mapel`, `id_guru`, `id_blok`, `id_semester`, `id_tahunajaran`, `sesi`, `jam_sesi`) VALUES
(993, 367, 836, 4961, 557, 111, 409, '3', '10:40:00'),
(994, 367, 834, 4959, 557, 111, 409, '4', '12:30:00'),
(995, 367, 835, 4960, 557, 111, 409, '1', '07:30:00'),
(996, 368, 838, 4965, 557, 111, 409, '5', '13:50:00'),
(997, 368, 834, 4959, 557, 111, 409, '3', '10:40:00'),
(998, 368, 835, 4960, 557, 111, 409, '2', '08:50:00'),
(999, 369, 840, 4963, 557, 111, 409, '4', '12:30:00'),
(1000, 369, 835, 4960, 557, 111, 409, '5', '13:50:00'),
(1001, 369, 834, 4959, 557, 111, 409, '1', '07:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(255) DEFAULT NULL,
  `kajur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `kajur`) VALUES
(1, 'rpl', 'pak if'),
(2, 'bdp', 'bu rina'),
(3, 'akl', 'bu loli');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(283, 'XI-A'),
(284, 'XI-B'),
(285, 'XI-C'),
(286, 'RPL XI A');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_jadwal`, `nilai`) VALUES
(2, 2711, 994, 92),
(3, 2711, 995, 83),
(4, 2717, 994, 95),
(5, 2713, 996, 81),
(6, 2711, 993, 85),
(7, 2717, 993, 96),
(8, 2724, 995, 87),
(10, 2729, 996, 90),
(11, 2729, 997, 87);

-- --------------------------------------------------------

--
-- Table structure for table `rapor`
--

CREATE TABLE `rapor` (
  `id_rapor` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `nis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rapor`
--

INSERT INTO `rapor` (`id_rapor`, `catatan`, `nis`) VALUES
(1, 'Peningkatan nilainya sudah bagus, tetap dipertahankan prestasinya nak', 234848),
(2, 'Tingkatkan prestasinya nak!', 234823),
(3, 'Sudah baik, tingkatkan semangat belajarnya !', 234875);

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `id_rombel` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `nama_rombel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rombel`
--

INSERT INTO `rombel` (`id_rombel`, `id_kelas`, `id_guru`, `nama_rombel`) VALUES
(367, 283, 4961, 'RPL'),
(368, 284, 4965, 'AKL'),
(369, 285, 4959, 'BDP');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `kode_semester` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_semester`, `kode_semester`) VALUES
(111, 'Ganjil'),
(112, 'Genap');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `id_sesi` int(11) NOT NULL,
  `sesi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`id_sesi`, `sesi`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `nis` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_rombel` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_user`, `nama_siswa`, `nis`, `id_kelas`, `id_rombel`, `tanggal_lahir`, `alamat`, `jenis_kelamin`) VALUES
(2711, 122, 'Ethan', 234823, 283, 367, '2014-09-16', 'Griya Asri Blok B No. 12', 'L'),
(2713, 123, 'Zahra', 234838, 284, 368, '2014-03-25', 'Taman Harmoni 2', 'P'),
(2714, 124, 'Gemini', 234832, 285, 369, '2014-06-17', 'Jl. Diponogoro', 'P'),
(2715, 125, 'Kaivan', 234858, 284, 368, '2014-03-25', 'Bukit Asri Blok. 5', 'L'),
(2717, 126, 'Luna', 234848, 283, 367, '2015-11-22', 'Desa Bahagia No.47', 'P'),
(2729, 150, 'Mark', 234875, 284, 368, '2015-11-10', 'Jl. Soekarno', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id_tahunajaran` int(11) NOT NULL,
  `nama_tahun` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id_tahunajaran`, `nama_tahun`) VALUES
(408, '2023/2024'),
(409, '2024/2025');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL,
  `level` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
(34, 'rora', 'rorah', '6', '5'),
(35, 'ciki', 'ck', '6', '5'),
(36, 'ruka', 'rk', '6', '5'),
(37, 'iya', 'iy', '6', '5'),
(111, 'admin', 'admin@m', 'c4ca4238a0b923820dcc509a6f75849b', '1'),
(112, 'kepsek', 'kepsek@m', 'b59c67bf196a4758191e42f76670ceba', '2'),
(122, 'Ethan', 'ethan@s', 'b59c67bf196a4758191e42f76670ceba', '5'),
(123, 'Zahra', 'zahra@s', 'b59c67bf196a4758191e42f76670ceba', '5'),
(124, 'Gemini', 'gemini@s', 'b59c67bf196a4758191e42f76670ceba', '5'),
(125, 'Kaivan', 'kaivan@s', '5', '5'),
(126, 'Luna', 'luna@s', '5', '5'),
(134, 'Dewi', 'dewi@g', '3', '3'),
(135, 'Prita', 'prita@g', '4', '4'),
(136, 'Hendra', 'hendra@g', '3', '3'),
(137, 'Endang', 'endang@g', '4', '4'),
(138, 'Saraswati', 'saraswati@g', '3', '3'),
(150, 'Mark', 'mark@s', '$2y$10$1kbYOxmN6bDIhmfVpZUAQe5H4btU', '5'),
(151, 'Amar', 'amar@g', '$2y$10$wtAP2rRjK3AFk492uz3tEujuMI/r', '4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blok`
--
ALTER TABLE `blok`
  ADD PRIMARY KEY (`id_blok`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `rapor`
--
ALTER TABLE `rapor`
  ADD PRIMARY KEY (`id_rapor`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id_sesi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id_tahunajaran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blok`
--
ALTER TABLE `blok`
  MODIFY `id_blok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=558;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4976;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rapor`
--
ALTER TABLE `rapor`
  MODIFY `id_rapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rombel`
--
ALTER TABLE `rombel`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
  MODIFY `id_sesi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2730;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id_tahunajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
