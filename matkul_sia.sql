-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 04:35 PM
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
-- Database: `matkul_sia`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_coa`
--

CREATE TABLE `m_coa` (
  `kode_akun` varchar(20) NOT NULL,
  `nama_akun` varchar(100) NOT NULL,
  `posisi_akun` varchar(3) NOT NULL,
  `tipe` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_coa`
--

INSERT INTO `m_coa` (`kode_akun`, `nama_akun`, `posisi_akun`, `tipe`) VALUES
('111', 'Kas', 'D', 'AKTIVA'),
('112', 'Simpanan di Bank', 'D', 'AKTIVA'),
('113', 'Piutang', 'D', 'AKTIVA'),
('114', 'Persediaan', 'D', 'AKTIVA'),
('121', 'Tanah', 'D', 'AKTIVA'),
('122', 'Bangunan', 'D', 'AKTIVA'),
('123', 'Kendaraan', 'D', 'AKTIVA'),
('124', 'Inventaris', 'D', 'AKTIVA'),
('125', 'Peralatan', 'D', 'AKTIVA'),
('126', 'Mesin', 'D', 'AKTIVA'),
('129', 'Akumulasi Penyusutan', 'D', 'AKTIVA'),
('211', 'Hutang Usaha', 'K', 'PASSIVA'),
('212', 'Hutang Bank', 'K', 'PASSIVA'),
('221', 'Modal', 'K', 'PASSIVA'),
('222', 'Prive', 'K', 'PASSIVA'),
('230', 'Laba Rugi', 'K', 'PASSIVA'),
('301', 'Penjualan', 'K', 'LABA'),
('399', 'Pendapatan Lainnya', 'K', 'LABA'),
('401', 'Harga Pokok Penjualan', 'D', 'RUGI'),
('411', 'Gaji', 'D', 'RUGI'),
('412', 'Biaya Utilitas', 'D', 'RUGI'),
('413', 'Biaya Transportasi', 'D', 'RUGI'),
('414', 'Biaya Sewa Kantor', 'D', 'RUGI'),
('421', 'Biaya Penyusutan', 'D', 'RUGI'),
('501', 'Pendapatan Bunga Bank', 'K', 'LABA'),
('601', 'Biaya Bank', 'D', 'RUGI');

-- --------------------------------------------------------

--
-- Table structure for table `t_jurnal`
--

CREATE TABLE `t_jurnal` (
  `no_jurnal` varchar(50) NOT NULL,
  `tgl_jurnal` date NOT NULL,
  `catatan` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jurnal`
--

INSERT INTO `t_jurnal` (`no_jurnal`, `tgl_jurnal`, `catatan`) VALUES
('JU-1', '2025-02-01', 'Setoran modal awal usaha'),
('JU-10', '2025-02-07', 'Pembayaran piutang oleh Toko B'),
('JU-11', '2025-02-07', 'Pembelian kendaraan'),
('JU-12', '2025-02-10', 'Pembayaran piutang oleh Toko C'),
('JU-13', '2025-02-10', 'Pembayaran piutang oleh Toko B'),
('JU-14', '2025-02-11', 'Pembayaran hutang ke PT Arman Sentosa'),
('JU-15', '2025-02-11', 'Penjualan kredit ke Toko C (margin 20%)'),
('JU-16', '2025-02-12', 'Pembelian barang dari PT Arman Sentosa (kredit)'),
('JU-17', '2025-02-12', 'Penjualan tunai ke Toko D (margin 20%)'),
('JU-18', '2025-02-12', 'Setor tunai hasil penjualan ke bank'),
('JU-19', '2025-02-12', 'Pembayaran piutang oleh Toko C'),
('JU-2', '2025-02-01', 'Pembayaran sewa kantor'),
('JU-20', '2025-02-13', 'Pembayaran hutang ke PT Arman Sentosa'),
('JU-21', '2025-02-14', 'Pembayaran hutang ke PT Arman Sentosa'),
('JU-22', '2025-02-14', 'Pembayaran hutang ke PT Salam'),
('JU-23', '2025-02-15', 'Pembelian barang dari PT Arman Sentosa (kredit)'),
('JU-24', '2025-02-16', 'Penjualan tunai ke Toko D (margin 20%)'),
('JU-25', '2025-02-17', 'Reimburse biaya solar kendaraan'),
('JU-26', '2025-02-25', 'Pembayaran Gaji Pegawai'),
('JU-27', '2025-02-25', 'Pembayaran tagihan listrik, air, dll'),
('JU-28', '2025-02-28', 'Pendapatan Bunga Bank'),
('JU-29', '2025-02-28', 'Biaya Administrasi Bank'),
('JU-3', '2025-02-02', 'Pembelian barang dari PT. Salam (kredit)'),
('JU-30', '2025-02-28', 'Penyusutan Kendaraan & Inventaris'),
('JU-4', '2025-02-02', 'Pembelian barang dari PT. Arman Sentosa'),
('JU-5', '2025-02-03', 'Penjualan tunai ke Toko A (margin 10%)'),
('JU-6', '2025-02-03', 'Penjualan kredit ke Toko B (margin 10%)'),
('JU-7', '2025-02-04', 'Pembelian inventaris (komputer & printer)'),
('JU-8', '2025-02-04', 'Penjualan kredit ke Toko B (margin 15%) BON'),
('JU-9', '2025-02-04', 'Penjualan kredit ke Toko C (margin 10%)');

-- --------------------------------------------------------

--
-- Table structure for table `t_jurnal_detail`
--

CREATE TABLE `t_jurnal_detail` (
  `id` int(9) UNSIGNED NOT NULL,
  `no_jurnal` varchar(50) NOT NULL,
  `kode_akun` varchar(20) NOT NULL,
  `debet` decimal(18,0) NOT NULL DEFAULT 0,
  `kredit` decimal(18,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jurnal_detail`
--

INSERT INTO `t_jurnal_detail` (`id`, `no_jurnal`, `kode_akun`, `debet`, `kredit`) VALUES
(171, 'JU-1', '112', 1000000000, 0),
(172, 'JU-1', '221', 0, 1000000000),
(173, 'JU-2', '414', 85000000, 0),
(174, 'JU-2', '112', 0, 85000000),
(175, 'JU-3', '114', 200000000, 0),
(176, 'JU-3', '211', 0, 200000000),
(177, 'JU-4', '114', 300000000, 0),
(178, 'JU-4', '211', 0, 300000000),
(179, 'JU-5', '111', 75000000, 0),
(180, 'JU-5', '301', 0, 75000000),
(181, 'JU-5', '401', 67500000, 0),
(182, 'JU-5', '114', 0, 67500000),
(183, 'JU-6', '113', 150000000, 0),
(184, 'JU-6', '301', 0, 150000000),
(185, 'JU-6', '401', 135000000, 0),
(186, 'JU-6', '114', 0, 135000000),
(187, 'JU-7', '124', 40000000, 0),
(188, 'JU-7', '112', 0, 40000000),
(189, 'JU-8', '113', 100000000, 0),
(190, 'JU-8', '301', 0, 100000000),
(191, 'JU-8', '401', 85000000, 0),
(192, 'JU-8', '114', 0, 85000000),
(193, 'JU-9', '113', 80000000, 0),
(194, 'JU-9', '301', 0, 80000000),
(195, 'JU-9', '401', 72000000, 0),
(196, 'JU-9', '114', 0, 72000000),
(197, 'JU-10', '112', 75000000, 0),
(198, 'JU-10', '113', 0, 75000000),
(199, 'JU-11', '123', 200000000, 0),
(200, 'JU-11', '112', 0, 200000000),
(201, 'JU-12', '112', 80000000, 0),
(202, 'JU-12', '113', 0, 80000000),
(203, 'JU-13', '112', 175000000, 0),
(204, 'JU-13', '113', 0, 175000000),
(205, 'JU-14', '221', 150000000, 0),
(206, 'JU-14', '112', 0, 150000000),
(207, 'JU-15', '113', 100000000, 0),
(208, 'JU-15', '301', 0, 100000000),
(209, 'JU-15', '401', 80000000, 0),
(210, 'JU-15', '114', 0, 80000000),
(211, 'JU-16', '114', 200000000, 0),
(212, 'JU-16', '211', 0, 200000000),
(213, 'JU-17', '111', 25000000, 0),
(214, 'JU-17', '301', 0, 25000000),
(215, 'JU-17', '401', 20000000, 0),
(216, 'JU-17', '114', 0, 20000000),
(217, 'JU-18', '112', 50000000, 0),
(218, 'JU-18', '111', 0, 50000000),
(219, 'JU-19', '112', 100000000, 0),
(220, 'JU-19', '113', 0, 100000000),
(221, 'JU-20', '211', 150000000, 0),
(222, 'JU-20', '112', 0, 150000000),
(223, 'JU-21', '211', 200000000, 0),
(224, 'JU-21', '112', 0, 200000000),
(225, 'JU-22', '211', 200000000, 0),
(226, 'JU-22', '112', 0, 200000000),
(227, 'JU-23', '114', 100000000, 0),
(228, 'JU-23', '211', 0, 100000000),
(229, 'JU-24', '111', 50000000, 0),
(230, 'JU-24', '301', 0, 50000000),
(231, 'JU-24', '401', 40000000, 0),
(232, 'JU-24', '114', 0, 40000000),
(233, 'JU-25', '413', 1500000, 0),
(234, 'JU-25', '111', 0, 1500000),
(235, 'JU-26', '411', 50000000, 0),
(236, 'JU-26', '112', 0, 50000000),
(237, 'JU-27', '412', 5000000, 0),
(238, 'JU-27', '112', 0, 5000000),
(239, 'JU-28', '112', 1500000, 0),
(240, 'JU-28', '501', 0, 1500000),
(241, 'JU-29', '601', 50000, 0),
(242, 'JU-29', '112', 0, 50000),
(243, 'JU-30', '421', 5000000, 0),
(244, 'JU-30', '129', 0, 5000000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_aktiva`
-- (See below for the actual view)
--
CREATE TABLE `v_aktiva` (
`kode_akun` varchar(20)
,`nama_akun` varchar(100)
,`debet` decimal(40,0)
,`kredit` decimal(40,0)
,`saldo` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_buku_besar`
-- (See below for the actual view)
--
CREATE TABLE `v_buku_besar` (
`no_jurnal` varchar(50)
,`tgl_jurnal` date
,`catatan` varchar(255)
,`kode_akun` varchar(20)
,`nama_akun` varchar(100)
,`debet` decimal(18,0)
,`kredit` decimal(18,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_laba_rugi`
-- (See below for the actual view)
--
CREATE TABLE `v_laba_rugi` (
`kode_akun` varchar(20)
,`nama_akun` varchar(100)
,`debet` decimal(40,0)
,`kredit` decimal(40,0)
,`saldo` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_passiva`
-- (See below for the actual view)
--
CREATE TABLE `v_passiva` (
`kode_akun` varchar(20)
,`nama_akun` varchar(100)
,`debet` decimal(62,0)
,`kredit` decimal(62,0)
,`saldo` decimal(63,0)
);

-- --------------------------------------------------------

--
-- Structure for view `v_aktiva`
--
DROP TABLE IF EXISTS `v_aktiva`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_aktiva`  AS SELECT `a`.`kode_akun` AS `kode_akun`, `a`.`nama_akun` AS `nama_akun`, sum(ifnull(`b`.`debet`,0)) AS `debet`, sum(ifnull(`b`.`kredit`,0)) AS `kredit`, sum(ifnull(`b`.`debet`,0)) - sum(ifnull(`b`.`kredit`,0)) AS `saldo` FROM (`m_coa` `a` left join `v_buku_besar` `b` on(`a`.`kode_akun` = `b`.`kode_akun`)) WHERE `a`.`tipe` = 'AKTIVA' GROUP BY `a`.`kode_akun`, `a`.`nama_akun` ORDER BY `a`.`kode_akun` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_buku_besar`
--
DROP TABLE IF EXISTS `v_buku_besar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_buku_besar`  AS SELECT `a`.`no_jurnal` AS `no_jurnal`, `b`.`tgl_jurnal` AS `tgl_jurnal`, `b`.`catatan` AS `catatan`, `a`.`kode_akun` AS `kode_akun`, `c`.`nama_akun` AS `nama_akun`, `a`.`debet` AS `debet`, `a`.`kredit` AS `kredit` FROM ((`t_jurnal_detail` `a` join `t_jurnal` `b`) join `m_coa` `c`) WHERE `a`.`no_jurnal` = `b`.`no_jurnal` AND `a`.`kode_akun` = `c`.`kode_akun` ;

-- --------------------------------------------------------

--
-- Structure for view `v_laba_rugi`
--
DROP TABLE IF EXISTS `v_laba_rugi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_laba_rugi`  AS SELECT `a`.`kode_akun` AS `kode_akun`, `a`.`nama_akun` AS `nama_akun`, sum(ifnull(`b`.`debet`,0)) AS `debet`, sum(ifnull(`b`.`kredit`,0)) AS `kredit`, CASE WHEN `a`.`tipe` = 'LABA' THEN sum(ifnull(`b`.`kredit`,0)) - sum(ifnull(`b`.`debet`,0)) ELSE sum(ifnull(`b`.`debet`,0)) - sum(ifnull(`b`.`kredit`,0)) END AS `saldo` FROM (`m_coa` `a` left join `v_buku_besar` `b` on(`a`.`kode_akun` = `b`.`kode_akun`)) WHERE `a`.`tipe` in ('LABA','RUGI') GROUP BY `a`.`kode_akun`, `a`.`nama_akun` ORDER BY `a`.`kode_akun` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_passiva`
--
DROP TABLE IF EXISTS `v_passiva`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_passiva`  AS SELECT `a`.`kode_akun` AS `kode_akun`, `a`.`nama_akun` AS `nama_akun`, CASE WHEN `a`.`kode_akun` = '230' THEN (select sum(`v_laba_rugi`.`debet`) from `v_laba_rugi`) ELSE sum(ifnull(`b`.`debet`,0)) END AS `debet`, CASE WHEN `a`.`kode_akun` = '230' THEN (select sum(`v_laba_rugi`.`kredit`) from `v_laba_rugi`) ELSE sum(ifnull(`b`.`kredit`,0)) END AS `kredit`, CASE WHEN `a`.`kode_akun` = '230' THEN (select sum(`v_laba_rugi`.`kredit` - `v_laba_rugi`.`debet`) from `v_laba_rugi`) ELSE sum(ifnull(`b`.`kredit`,0)) - sum(ifnull(`b`.`debet`,0)) END AS `saldo` FROM (`m_coa` `a` left join `v_buku_besar` `b` on(`a`.`kode_akun` = `b`.`kode_akun`)) WHERE `a`.`tipe` = 'PASSIVA' GROUP BY `a`.`kode_akun`, `a`.`nama_akun` ORDER BY `a`.`kode_akun` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_coa`
--
ALTER TABLE `m_coa`
  ADD PRIMARY KEY (`kode_akun`);

--
-- Indexes for table `t_jurnal`
--
ALTER TABLE `t_jurnal`
  ADD PRIMARY KEY (`no_jurnal`);

--
-- Indexes for table `t_jurnal_detail`
--
ALTER TABLE `t_jurnal_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_jurnal` (`no_jurnal`),
  ADD KEY `kode_akun` (`kode_akun`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_jurnal_detail`
--
ALTER TABLE `t_jurnal_detail`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_jurnal_detail`
--
ALTER TABLE `t_jurnal_detail`
  ADD CONSTRAINT `t_jurnal_detail_ibfk_1` FOREIGN KEY (`no_jurnal`) REFERENCES `t_jurnal` (`no_jurnal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_jurnal_detail_ibfk_2` FOREIGN KEY (`kode_akun`) REFERENCES `m_coa` (`kode_akun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
