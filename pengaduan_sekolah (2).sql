-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2026 at 09:35 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `password` varchar(255) NOT NULL,
  `username` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`password`, `username`) VALUES
('admin123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aspirasi`
--

CREATE TABLE `aspirasi` (
  `id_aspirasi` int NOT NULL,
  `status` enum('menunggu','proses','selesai') NOT NULL,
  `feedback` int NOT NULL,
  `id_kategori` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `input_aspirasi`
--

CREATE TABLE `input_aspirasi` (
  `id_pelaporan` int NOT NULL,
  `nis` int NOT NULL,
  `id_kategori` int NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `ket` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `ket_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` int NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `kelas`) VALUES
(23241302, 'XII PPLG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `aspirasi`
--
ALTER TABLE `aspirasi`
  ADD PRIMARY KEY (`id_aspirasi`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `input_aspirasi`
--
ALTER TABLE `input_aspirasi`
  ADD PRIMARY KEY (`nis`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspirasi`
--
ALTER TABLE `aspirasi`
  MODIFY `id_aspirasi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `input_aspirasi`
--
ALTER TABLE `input_aspirasi`
  MODIFY `nis` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspirasi`
--
ALTER TABLE `aspirasi`
  ADD CONSTRAINT `aspirasi_ibfk_1` FOREIGN KEY (`id_aspirasi`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aspirasi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `input_aspirasi` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `input_aspirasi`
--
ALTER TABLE `input_aspirasi`
  ADD CONSTRAINT `input_aspirasi_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `aspirasi` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
