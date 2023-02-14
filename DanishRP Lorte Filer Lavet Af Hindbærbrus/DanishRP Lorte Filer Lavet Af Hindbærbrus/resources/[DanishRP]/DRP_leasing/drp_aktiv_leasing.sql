-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 16. 01 2023 kl. 00:53:21
-- Serverversion: 10.4.27-MariaDB
-- PHP-version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `es_extended`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `drp_aktiv_leasing`
--

CREATE TABLE `drp_aktiv_leasing` (
  `ejer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `dato` varchar(50) DEFAULT NULL,
  `udlober` varchar(50) DEFAULT NULL,
  `pris` int(11) DEFAULT NULL,
  `daglig` int(11) DEFAULT NULL,
  `dage` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `sellerNavn` varchar(50) DEFAULT NULL,
  `koberNavn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
