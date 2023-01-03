-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 02:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `Id_Anggota` varchar(10) NOT NULL,
  `Id_Mahasiswa` varchar(10) NOT NULL,
  `Nama Anggota` text NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `Id_Buku` varchar(10) NOT NULL,
  `Nama Buku` text NOT NULL,
  `Jenis Buku` varchar(10) NOT NULL,
  `Pengarang` text NOT NULL,
  `Penerbit` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `Id_Mahasiswa` varchar(10) NOT NULL,
  `Nama` text NOT NULL,
  `Kelas` varchar(5) NOT NULL,
  `Jurusan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `Id_Peminjam` varchar(10) NOT NULL,
  `Id_Anggota` varchar(10) NOT NULL,
  `Id_Pustakawan` varchar(10) NOT NULL,
  `Id_Buku` varchar(10) NOT NULL,
  `Nama` text NOT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `Id_Kembali` varchar(10) NOT NULL,
  `Id_Peminjam` varchar(10) NOT NULL,
  `Tgl_Kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pustakawan`
--

CREATE TABLE `pustakawan` (
  `Id_Pustakawan` varchar(10) NOT NULL,
  `Id_Buku` varchar(10) NOT NULL,
  `Nama Pustakawan` text NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`Id_Anggota`),
  ADD KEY `Id_Mahasiswa` (`Id_Mahasiswa`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Id_Buku`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`Id_Mahasiswa`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`Id_Peminjam`),
  ADD KEY `Id_Anggota` (`Id_Anggota`),
  ADD KEY `Id_Pustakawan` (`Id_Pustakawan`),
  ADD KEY `Id_Buku` (`Id_Buku`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`Id_Kembali`),
  ADD KEY `Id_Peminjam` (`Id_Peminjam`);

--
-- Indexes for table `pustakawan`
--
ALTER TABLE `pustakawan`
  ADD PRIMARY KEY (`Id_Pustakawan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `Id_Mahasiswa` FOREIGN KEY (`Id_Mahasiswa`) REFERENCES `mahasiswa` (`Id_Mahasiswa`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `Id_Anggota` FOREIGN KEY (`Id_Anggota`) REFERENCES `anggota` (`Id_Anggota`),
  ADD CONSTRAINT `Id_Buku` FOREIGN KEY (`Id_Buku`) REFERENCES `buku` (`Id_Buku`),
  ADD CONSTRAINT `Id_Pustakawan` FOREIGN KEY (`Id_Pustakawan`) REFERENCES `pustakawan` (`Id_Pustakawan`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `Id_Peminjam` FOREIGN KEY (`Id_Peminjam`) REFERENCES `peminjaman` (`Id_Peminjam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
