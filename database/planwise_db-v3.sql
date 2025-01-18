-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 10:02 PM
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
-- Database: `planwise_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(200) NOT NULL DEFAULT '',
  `ur_id` varchar(40) NOT NULL DEFAULT 'student',
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `ur_id`, `status`) VALUES
(1, 'ADMIN User 1', 'admin_user1', 'scrypt:32768:8:1$HPG3qSe2DPvrvSBY$4795d46471582914bbcb4ab3dabf6617d730f3fbdae70cf3e58dcaeb69b226283fdc538ae93c6f487de70b771decd943a71da1b2b42acec8e5e0f3ff4b09c751', '1', 1),
(2, 'Test User 1', 'test_user1', 'scrypt:32768:8:1$HPG3qSe2DPvrvSBY$4795d46471582914bbcb4ab3dabf6617d730f3fbdae70cf3e58dcaeb69b226283fdc538ae93c6f487de70b771decd943a71da1b2b42acec8e5e0f3ff4b09c751', '2', 1),
(3, 'Test User 2', 'test_user2', 'scrypt:32768:8:1$HPG3qSe2DPvrvSBY$4795d46471582914bbcb4ab3dabf6617d730f3fbdae70cf3e58dcaeb69b226283fdc538ae93c6f487de70b771decd943a71da1b2b42acec8e5e0f3ff4b09c751', '3', 1),
(4, 'Test User 3', 'test_user3', 'scrypt:32768:8:1$HPG3qSe2DPvrvSBY$4795d46471582914bbcb4ab3dabf6617d730f3fbdae70cf3e58dcaeb69b226283fdc538ae93c6f487de70b771decd943a71da1b2b42acec8e5e0f3ff4b09c751', '2', 1),
(5, 'Test User 4', 'test_user4', 'scrypt:32768:8:1$JCgxDegkfOp7xOd7$e135b43a2b59e3686184d453d52bfa78e8802f80ce600e3481d5e6dde8cd51e30c074ad107d9e1d617b1fc2d59414d916c71a203b13389c3034afa1d543959f0', '3', 1),
(6, 'Test User6', 'test_user6', 'scrypt:32768:8:1$yUmSltKebxMa3Ss6$2e804af8e37991a567b2b742f8bbfcf8978e5af71bc1105251838865557524aea7280b240c74a518fea175be4b63b67facd6451ef9506cea2defac08df869b60', '3', 1),
(7, 'Test User7', 'test_user7', 'scrypt:32768:8:1$wC5R1Tm1GglnHeCt$1bf1b26f47f8372d5f4516722360df63c4e6077229574defcb73db81276e2ef9c3f6981c5c5334af7df3060fcfd058ca27cb8b96714b8999ea449d374fb4acc3', '3', 1),
(8, 'Test User8', 'test_user8', 'scrypt:32768:8:1$gD3k4asTWsJg9WrE$0d9ab3f53d57cadedb3bc751cd30e8ad24b32e8a359ab3d386e24aba60b299a69476ca5787ab5e062f1b524bc2133c7bcf600fc9e782b3a3dad917a7a26bddb3', '3', 1),
(9, 'Test User9', 'test_user9', 'scrypt:32768:8:1$UuXZCFaKsx9hr8zv$41f6251c891c8d43c4441a18121275faf0806457070681d3ab430cd1d17faae32500f73bb5344eaded91944f2cee65469250141a5d1452e26a5133b0ae763f77', '3', 1),
(12, 'Test User10', 'test_user10', 'scrypt:32768:8:1$0YfmYyi9h9Imel0V$0a975046c5a8a11b1e9fd1f80b84d29638e72e277132d52abd22852525a745646cb13e37bd428b73f3310b7452e9e38e892f1a335b4daca4f7743951f0d91357', '3', 1),
(14, 'Test User11', 'test_user11', 'scrypt:32768:8:1$EpuXoJVLUk81zJsA$5bb82738a1ebbed56a74c8121c30ea28a647e9fe854a1b7a4a6e164c4efb7e416f047b57f0112ea25e7c67c4d6a091ae1312ce4bfef3915d27c925f120f82add', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'teacher'),
(3, 'students');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`username`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
