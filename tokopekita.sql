-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2023 pada 12.18
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokopekita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(10, '15wKVT0nej25Y', 2, '2020-03-16 12:10:42', 'Selesai'),
(11, '15Swf8Ye0Fm.M', 2, '2020-03-16 12:17:34', 'Cart'),
(12, '15PzF03ejd8W2', 1, '2020-05-13 02:40:48', 'Confirmed'),
(13, '16hKxbXNd9rhY', 3, '2023-06-07 04:42:53', 'Confirmed'),
(14, '16bccWx8AlP8A', 3, '2023-06-14 12:51:27', 'Confirmed'),
(15, '16gZoWobrAmNE', 4, '2023-06-14 12:54:55', 'Confirmed'),
(16, '16GBlODYNtqwE', 5, '2023-06-21 08:24:42', 'Confirmed'),
(17, '16SFRfGklW1Bk', 5, '2023-06-21 08:30:51', 'Cart'),
(18, '16mz4/i1LG0N6', 3, '2023-06-21 09:44:17', 'Payment'),
(19, '16fQ1uTPdqZ6U', 11, '2023-07-21 08:49:18', 'Confirmed'),
(20, '16iJymbMmDZkY', 1, '2023-07-21 10:12:52', 'Cart');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(20, '16GBlODYNtqwE', 4, 2),
(21, '16SFRfGklW1Bk', 5, 1),
(22, '16SFRfGklW1Bk', 6, 3),
(23, '16bccWx8AlP8A', 4, 2),
(24, '16bccWx8AlP8A', 7, 1),
(25, '16mz4/i1LG0N6', 4, 1),
(27, '16fQ1uTPdqZ6U', 5, 1),
(28, '16iJymbMmDZkY', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Sirup', '2019-12-20 07:28:34'),
(2, 'Kapsul', '2019-12-20 07:34:17'),
(3, 'Tablet', '2020-03-16 12:15:40'),
(4, 'Vitamin', '2023-06-21 09:57:17'),
(5, 'Vitaminvc', '2023-07-21 06:33:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(1, '15PzF03ejd8W2', 1, 'Bank BCA', 'Admin', '2020-05-16', '2020-05-13 02:41:51'),
(6, '16fQ1uTPdqZ6U', 11, 'Bank BCA', 'Isna Nurul Aini / 0987654', '2023-07-21', '2023-07-21 09:08:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Isna Nurul Aini', 'isnanurul@gmail.com', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '01234567890', 'Indonesia', '2020-03-16 11:31:17', 'Admin', NULL),
(2, 'Member', 'member@gmail.com', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 11:30:40', 'Member', NULL),
(9, 'Isna Nurul Aini', 'admin@gmail.com', '$2y$10$BMmtcO7T2CdKzGGGgqM2vO.oC6oqv02.DRCXdlkHS07Djeu3Rbfu2', '0882001207018', 'Mangunreja', '2023-07-21 06:14:12', 'Admin', NULL),
(10, 'admin', 'admin@gmail.com', '$2y$10$68AFfpZAmj4rRHz2ubRj8eHusB.fm048SCDXzUBybFNLytJZR0NgK', '097644678', 'Mangunreja', '2023-07-21 06:36:18', 'Admin', NULL),
(11, 'isna nurul', 'isna@gmail.com', '$2y$10$ZZUGZuX1cV8yB.vrALFCdOD3FnSE.3bXdoXvQlFqEDmdZaekiIBi.', '0882001207017', 'Mangunreja', '2023-07-21 08:48:32', 'Member', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'images/bca.jpg', 'Tokopekita'),
(2, 'Bank Mandiri', '943248844843', 'images/mandiri.jpg', 'Tokopekita'),
(3, 'DANA', '0882313132123', 'images/dana.png', 'Tokopekita'),
(5, 'GOPAY', '91827931', 'images/mandiri.jpg', 'Selviani');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(4, 3, 'Paracetamol', 'produk/16X1xfyMP5QQg.jpg', 'Satu box obat', 5, 30000, 26000, '2023-06-14 13:01:15'),
(5, 3, 'Amoxcillin', 'produk/165rgb3gWrNiA.jpg', 'Obat  satu strip', 5, 10000, 7000, '2023-06-14 14:57:40'),
(6, 3, 'Graxine', 'produk/16KWEc.c2atDk.jpg', 'Satu box obat', 4, 30000, 28000, '2023-06-14 14:59:53'),
(7, 1, 'OBH COMBI', 'produk/160CpnpLqB7pk.jpg', 'dfgughbnm,', 4, 23000, 20000, '2023-06-21 08:09:03'),
(9, 3, 'PARACETAMOL', 'produk/16X1xfyMP5QQg.jpg', 'Satu box obat', 5, 25000, 20000, '2023-06-21 09:58:20'),
(10, 5, 'PARACETAMOL', 'produk/166mL.OpQyul2.jpg', 'Satu box obat', 4, 234567, 675432, '2023-07-21 10:09:29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indeks untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
