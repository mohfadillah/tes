-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 10:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pelatihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `gelombang`
--

CREATE TABLE `gelombang` (
  `id` int(11) NOT NULL,
  `nama_gelombang` varchar(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gelombang`
--

INSERT INTO `gelombang` (`id`, `nama_gelombang`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Gelombang 1', 1, '2024-06-19 02:25:56', '2024-06-19 02:25:56'),
(2, 'Gelombang 2', 0, '2024-06-19 02:25:56', '2024-06-19 02:25:56'),
(3, 'Gelombang 3', 0, '2024-06-19 04:05:13', '2024-06-19 04:05:13'),
(4, 'Gelombang 4', 0, '2024-06-19 04:05:25', '2024-06-19 04:05:25'),
(6, 'Gelombang 5', 1, '2024-06-19 04:22:19', '2024-06-19 04:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama_jurusan`, `created_at`, `update_at`) VALUES
(2, 'Bahasa Korea', '2024-05-14 05:30:28', '2024-05-16 02:11:55'),
(5, 'Tata Boga', '2024-05-14 05:33:32', '2024-05-14 05:40:20'),
(6, 'Video Editor', '2024-05-14 05:40:36', '2024-05-16 02:10:52'),
(7, 'Tata Graha', '2024-05-16 02:07:18', '2024-05-16 02:07:18'),
(8, 'Tata Busana', '2024-05-16 02:07:29', '2024-05-16 02:07:29'),
(9, 'Teknik Pendingin', '2024-05-16 02:07:44', '2024-05-16 02:07:44'),
(10, 'Teknik Komputer', '2024-05-16 02:07:55', '2024-05-16 02:07:55'),
(11, 'Bahasa Inggris', '2024-05-16 02:08:10', '2024-05-16 02:08:10'),
(12, 'Desain Grafis', '2024-05-16 02:08:22', '2024-05-16 02:08:22'),
(13, 'Jaringan Komputer', '2024-05-16 02:08:36', '2024-05-16 02:08:36'),
(14, 'Operator Komputer', '2024-05-16 02:09:02', '2024-05-16 02:09:02'),
(15, 'Teknik Sepeda Motor', '2024-05-16 02:09:19', '2024-05-16 02:09:19'),
(16, 'Content Creator', '2024-05-16 02:09:35', '2024-05-16 02:09:35'),
(17, 'Make Up Artist', '2024-05-16 02:10:07', '2024-05-16 02:10:07'),
(18, 'Web Programming', '2024-05-16 02:10:19', '2024-05-16 02:12:12'),
(19, 'Barista', '2024-05-16 02:10:30', '2024-05-16 02:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `update_at`) VALUES
(1, 'Admin', '2024-05-15 04:20:22', '2024-06-19 02:17:51'),
(2, 'Peserta', '2024-05-15 04:20:22', '2024-06-19 02:44:27'),
(8, 'Administrator', '2024-06-19 02:44:08', '2024-06-19 02:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftran`
--

CREATE TABLE `pendaftran` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_gelombang` int(11) NOT NULL,
  `nik` varchar(18) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hp` varchar(13) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `gelombang` int(5) NOT NULL,
  `tahun_pelatihan` varchar(5) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftran`
--

INSERT INTO `pendaftran` (`id`, `id_jurusan`, `id_gelombang`, `nik`, `nama`, `email`, `hp`, `gender`, `alamat`, `pendidikan`, `gelombang`, `tahun_pelatihan`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 11, 0, '3355', 'Onana Andre', 'andre@gmail.com', '0811', 'Laki-laki', 'Jalan 7', 'S1', 1, '2024', 2, 0, '2024-05-14 08:03:37', '2024-05-16 04:52:50'),
(2, 11, 0, '3312', 'Deddy Corbuzier', 'deddy@gmail.com', '0812', 'Laki-laki', 'Jalan 6', 'S2', 1, '2024', 0, 0, '2024-05-14 08:04:24', '2024-05-16 04:52:58'),
(3, 11, 0, '3312', 'BCL', 'bcl@gmail.com', '0813', 'Laki-laki', 'Bandung', 'S1', 1, '2024', 3, 1, '2024-05-15 01:47:52', '2024-05-16 04:53:12'),
(4, 6, 0, '3388', 'Sule', 'sule@gmail.com', '0814', 'Laki-laki', 'Tambun', 'S1', 1, '2024', 1, 0, '2024-05-15 02:12:37', '2024-05-16 04:53:21'),
(5, 5, 0, '3375', 'Marcus Rashford', 'rashy@gmail.com', '0815', 'Laki-laki', 'Manchester', 'S3', 1, '2024', 3, 1, '2024-05-15 02:16:37', '2024-05-16 04:53:28'),
(6, 5, 0, '3376', 'Lily Slavina', 'lily@gmail.com', '0816', 'Perempuan', 'Andara', 'S3', 1, '2024', 1, 1, '2024-05-15 02:47:20', '2024-05-16 04:54:04'),
(7, 2, 0, '3378', 'Aleandro', 'ale@gmail.com', '0817', 'Laki-laki', 'Jalan 09', 'SD', 1, '2024', 0, 1, '2024-05-15 04:09:25', '2024-05-16 07:58:08'),
(8, 18, 0, '3311', 'Bentacur', 'ben@gmail.com', '0818', 'Laki-laki', 'Jalan Siantar', 'SMA', 1, '2024', 1, 0, '2024-05-16 03:21:35', '2024-05-17 03:45:08'),
(9, 18, 0, '3313', 'Locatelli', 'loca@gmail.com', '0819', 'Laki-laki', 'Bekasi Barat', 'SMK', 1, '2024', 1, 0, '2024-05-16 03:22:34', '2024-05-16 04:54:54'),
(10, 6, 0, '3314', 'Yasmin ', 'yas@gmail.com', '0820', 'Perempuan', 'Jakarta', 'S3', 1, '2024', 1, 0, '2024-05-16 03:24:21', '2024-05-16 04:55:01'),
(11, 5, 0, '12', 'Bambang', 'bam@gmail.com', '0821', 'Laki-laki', 'Jakarta', 'SMK', 1, '2024', NULL, 0, '2024-05-16 03:27:28', '2024-05-17 02:12:19'),
(12, 18, 0, '523', 'Boby', 'boby@gmail.com', '0822', 'Laki-laki', 'Jakarta', 'SMA', 1, '2024', NULL, 0, '2024-05-16 03:29:58', '2024-05-17 02:12:15'),
(13, 6, 0, '3123', 'Aji', 'aji@gmail.com', '0823', 'Laki-laki', 'Bekasi', 'SMK', 1, '2024', NULL, 0, '2024-05-16 03:36:57', '2024-05-17 02:14:17'),
(14, 5, 0, '21', 'Gustafa', 'gustafa@gmail.com', '0824', 'Laki-laki', 'Depok', 'SMA', 1, '2024', NULL, 0, '2024-05-16 03:38:30', '2024-05-17 02:33:12'),
(15, 5, 0, '134', 'Maya Karomah', 'maya@gmail.com', '0825', 'Perempuan', 'Jakarta', 'SMK', 1, '2024', 1, 0, '2024-05-16 03:39:01', '2024-05-16 07:42:50'),
(16, 2, 0, '434', 'Bunga', 'bunga@gmail.com', '0826', 'Perempuan', 'Jakarta', 'S3', 1, '2024', 1, 0, '2024-05-16 03:44:56', '2024-05-16 04:57:18'),
(17, 2, 0, '2133', 'Amanda', 'amanda@gmail.com', '0827', 'Perempuan', 'Depok', 'S1', 1, '2024', 1, 0, '2024-05-16 04:18:29', '2024-05-16 04:57:26'),
(18, 11, 0, '3370', 'Wan-Bissaka', 'wan@gmail.com', '0828', 'Laki-laki', 'Manchester', 'S1', 1, '2024', NULL, 0, '2024-05-16 04:43:08', '2024-05-17 02:33:16'),
(19, 2, 0, '33224', 'Andhika P.', 'andhika@gmail.com', '0829', 'Laki-laki', 'Bogor', 'S1', 1, '2024', 2, 0, '2024-05-16 08:01:09', '2024-05-17 03:44:35'),
(26, 11, 1, '21222', 'Tjahaja', 't@gmail.com', '058255', 'Perempuan', 'Jalan Nakasa', 'S2', 0, '2024', NULL, 0, '2024-06-19 08:20:34', '2024-06-19 08:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_wawancara`
--

CREATE TABLE `pertanyaan_wawancara` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `nama_pertanyaan` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertanyaan_wawancara`
--

INSERT INTO `pertanyaan_wawancara` (`id`, `id_jurusan`, `nama_pertanyaan`, `created_at`, `updated_at`) VALUES
(16, 6, 'apa yang dimaksud javascript versi 6?', '2024-05-17 08:01:49', '2024-05-20 04:01:50'),
(17, 10, 'bagaimana menghubungkan lan?', '2024-05-20 04:02:16', '2024-05-20 04:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(35) NOT NULL,
  `harga_brg` int(15) NOT NULL,
  `stock_brg` int(15) NOT NULL,
  `gbr_brg` varchar(35) NOT NULL,
  `tgl_publish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `harga_brg`, `stock_brg`, `gbr_brg`, `tgl_publish`) VALUES
(2, 'Buku CSS', 35000, 42, 'css.jpg', '2024-05-20'),
(3, 'Buku HTML', 54000, 49, 'html.jpg', '2024-05-21'),
(6, 'Buku Psikologi', 54200, 85, 'brg-1716190530.jpg', '2024-05-20'),
(7, 'Buku Resep', 22000, 12, 'brg-1716191325.jpg', '2024-05-20'),
(8, 'Buku Bernafas Dengan Baik', 54000, 11, 'brg-1716193840.jpg', '2024-05-20'),
(10, 'Buku Hukum Pidana', 89000, 12, 'brg-1716272591.jpg', '2024-05-21'),
(11, 'Buku Cara Mendidik Anak', 66000, 54, 'brg-1716275281.jpg', '2024-05-21'),
(12, 'Buku CPNS', 105000, 12, 'brg-1716276671.jpg', '2024-05-21'),
(14, 'Kamus Mandarin', 88000, 85, 'brg-1716277065.jpg', '2024-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama`, `email`, `password`, `created_at`, `update_at`) VALUES
(1, 1, 'Moh Fadillah Romadhon', 'fadil@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2024-05-13 02:06:45', '2024-06-19 01:47:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendaftran`
--
ALTER TABLE `pendaftran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan_wawancara`
--
ALTER TABLE `pertanyaan_wawancara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pendaftran`
--
ALTER TABLE `pendaftran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pertanyaan_wawancara`
--
ALTER TABLE `pertanyaan_wawancara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
