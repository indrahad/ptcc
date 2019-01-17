-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2019 at 05:26 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_ol`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `idbarang` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `harga` int(11) NOT NULL DEFAULT '0',
  `stok` int(11) NOT NULL DEFAULT '0',
  `foto` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`idbarang`, `nama`, `harga`, `stok`, `foto`) VALUES
(4, 'cangkul', 30000, 6, 'cangkul.jpg'),
(5, 'Kacamata', 1500000, 50, 'kacamata.jpg'),
(6, 'Sepeda', 1500000, 8, 'sepeda.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `idbuku` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `judul` varchar(40) NOT NULL,
  `pengarang` varchar(40) NOT NULL,
  `penerbit` varchar(40) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT '0',
  `foto` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`idbuku`, `kode`, `judul`, `pengarang`, `penerbit`, `stok`, `foto`) VALUES
(2, 'B002 ', 'Live Coding! 9 Aplikasi Android', 'Arief Aqbarul Huda', 'Andi Publisher', 6, 'livecoding.jpg'),
(3, 'KN01', 'Pride and Prejudice', 'Jane Austin', 'Thoma Egerton', 13, 'Pride and Prejudice.jpg'),
(4, 'KN02', 'The Hobbit', 'J.R.R Tolkien', 'Gramedia', 5, 'The Hobbit.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `djual`
--

CREATE TABLE `djual` (
  `iddjual` int(11) NOT NULL,
  `idhjual` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpinjam`
--

CREATE TABLE `dpinjam` (
  `iddpinjam` int(11) NOT NULL,
  `idhpinjam` int(11) NOT NULL,
  `idbuku` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dpinjam`
--

INSERT INTO `dpinjam` (`iddpinjam`, `idhpinjam`, `idbuku`, `qty`, `harga`) VALUES
(1, 1, 3, 1, 0),
(2, 1, 4, 1, 0),
(3, 2, 4, 1, 0),
(4, 2, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hjual`
--

CREATE TABLE `hjual` (
  `idhjual` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `namcust` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `notelp` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hpinjam`
--

CREATE TABLE `hpinjam` (
  `idhpinjam` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `notelp` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hpinjam`
--

INSERT INTO `hpinjam` (`idhpinjam`, `tanggal`, `nama`, `email`, `notelp`) VALUES
(1, '2018-06-19', 'Dwi', 'dwi.a@gmail.com', '08456734800'),
(2, '2018-06-19', 'Dwi', 'dwi.a@gmail.com', '0876890876');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `idpengguna` int(11) NOT NULL,
  `user` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `akses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`idpengguna`, `user`, `password`, `nama_lengkap`, `akses`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', 'toko'),
(2, 'cust', '3aad3506aa11f05f265ea8304b8152b3', 'pelanggan', 'beli');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idbarang`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`idbuku`);

--
-- Indexes for table `djual`
--
ALTER TABLE `djual`
  ADD PRIMARY KEY (`iddjual`);

--
-- Indexes for table `dpinjam`
--
ALTER TABLE `dpinjam`
  ADD PRIMARY KEY (`iddpinjam`);

--
-- Indexes for table `hjual`
--
ALTER TABLE `hjual`
  ADD PRIMARY KEY (`idhjual`);

--
-- Indexes for table `hpinjam`
--
ALTER TABLE `hpinjam`
  ADD PRIMARY KEY (`idhpinjam`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idpengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `idbuku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `djual`
--
ALTER TABLE `djual`
  MODIFY `iddjual` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dpinjam`
--
ALTER TABLE `dpinjam`
  MODIFY `iddpinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hjual`
--
ALTER TABLE `hjual`
  MODIFY `idhjual` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hpinjam`
--
ALTER TABLE `hpinjam`
  MODIFY `idhpinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `idpengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
