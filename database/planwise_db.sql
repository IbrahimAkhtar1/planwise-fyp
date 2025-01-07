-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 10:21 AM
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
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `session` enum('Fall','Spring') NOT NULL,
  `start_year_id` int(4) NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `name`, `session`, `start_year_id`, `slug`) VALUES
(1, 'Batch 2023', 'Fall', 1, 'fall_batch_2023'),
(2, 'Batch 2023', 'Spring', 1, 'sping_batch_2023'),
(3, 'Batch 2024', 'Fall', 2, 'fall_batch_2024'),
(4, 'Batch 2024', 'Spring', 2, 'spring_batch_2024'),
(5, 'Batch 2025', 'Fall', 3, 'fall_batch_2025'),
(6, 'Batch 2025', 'Spring', 3, 'spring_batch_2025');

-- --------------------------------------------------------

--
-- Table structure for table `batch_courses`
--

CREATE TABLE `batch_courses` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `yeadr_id` int(11) NOT NULL,
  `is_compulsory` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('lecture','lab') NOT NULL,
  `credit_hours` enum('1','2','3','4','5','6') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `type`, `credit_hours`) VALUES
(1, 'CSC 1101', 'Calculus and Analytical Geometry', 'lecture', '3'),
(2, 'CSC 1102', 'English Composition and Comprehension', 'lecture', '2'),
(3, 'CSC 1103', 'Fundamentals of Programming', 'lecture', '3'),
(4, 'CSCL 1103', 'Lab: Fundamentals of Programming', 'lab', '1'),
(5, 'CSC 1108', 'Introduction to Computer Science', 'lecture', '3'),
(6, 'CSCL 1108', 'Lab: Introduction to Computer Science', 'lab', '1'),
(7, 'CSC 1107', 'Applied Physics', 'lecture', '3'),
(8, 'CSCL 1107', 'Lab: Applied Physics', 'lab', '1'),
(9, 'CSC 1208', 'Object Oriented Programming Techniques', 'lecture', '3'),
(10, 'CSC 2102', 'Data Structures and Algorithms', 'lecture', '3'),
(11, 'CSCL 2102', 'Lab: Data Structures and Algorithms', 'lab', '1'),
(12, 'CSC 3105', 'Computer Organization and Assembly Language', 'lecture', '3'),
(13, 'CSCL 3105', 'Lab: Computer Organization and Assembly Language', 'lab', '1'),
(14, 'CSC 1201', 'Discrete Mathematical Structures', 'lecture', '3'),
(15, 'CSC 3206', 'Artificial Intelligence', 'lecture', '3'),
(16, 'CSCL 3206', 'Lab: Artificial Intelligence', 'lab', '1'),
(17, 'CSC 1202', 'Multivariate Calculus', 'lecture', '3'),
(18, 'CSC 3209', 'Computer Networks', 'lecture', '3'),
(19, 'CSCL 3209', 'Lab: Computer Networks', 'lab', '1'),
(20, 'CSC 2203', 'Database Systems', 'lecture', '3'),
(21, 'CSCL 2203', 'Lab: Database Systems', 'lab', '5'),
(22, 'CSC 3202', 'Design and Analysis of Algorithms', 'lecture', '3'),
(23, 'AIC 2401', 'Programming for Artificial Intelligence', 'lecture', '3'),
(24, 'AICL 2401', 'Lab: Programming for Artificial Intelligence', 'lab', '1'),
(25, 'CSC 2206', 'Linear Algebra', 'lecture', '3'),
(26, 'CSC 4102', 'Software Engineering', 'lecture', '3'),
(27, 'CSCL 4102', 'Lab: Software Engineering', 'lab', '1'),
(28, 'CSC 4108', 'Web Technologies', 'lecture', '3'),
(29, 'CSCL 4108', 'Lab: Web Technologies', 'lecture', '1'),
(30, 'CSC 4202', 'Cloud Computing', 'lecture', '3'),
(31, 'CSC 4305', 'Information Security', 'lecture', '3'),
(32, 'CSCL 4305', 'Lab: Information Security', 'lab', '1'),
(33, 'CSC 4303', 'Mobile App Development', 'lecture', '3'),
(34, 'CSC 4105', 'Big Data', 'lecture', '3'),
(35, 'CSCL 4105', 'Lab: Big Data', 'lab', '1'),
(36, 'CSC 4204', 'Distributed Systems', 'lecture', '3'),
(37, 'CSC 4308', 'Blockchain Technology', 'lecture', '3'),
(38, 'CSC 4403', 'Computational Biology', 'lecture', '3'),
(39, 'CSCL 4403', 'Lab: Computational Biology', 'lab', '1'),
(40, 'CSC 4505', 'Machine Learning', 'lecture', '3'),
(41, 'CSCL 4505', 'Lab: Machine Learning', 'lab', '1'),
(42, 'CSC 5105', 'Artificial Intelligence in Healthcare', 'lecture', '3'),
(43, 'CSC 5206', 'Advanced Software Engineering', 'lecture', '3'),
(44, 'CSC 5301', 'Computer Vision', 'lecture', '3'),
(45, 'CSC 5402', 'Data Science and Analytics', 'lecture', '3'),
(46, 'CSC 5504', 'Cloud Data Management', 'lecture', '3'),
(47, 'CSC 6105', 'Capstone Project', 'lecture', '6'),
(48, 'CSC 6207', 'Ethical Hacking and Cyber Security', 'lecture', '3'),
(49, 'CSC 6301', 'Computational Finance', 'lecture', '3'),
(50, 'CSC 6403', 'Virtual Reality and Augmented Reality', 'lecture', '3');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `slug`) VALUES
(1, 'Semester 1', 'semester_1'),
(2, 'Semester 2', 'semester_2'),
(3, 'Semester 3', 'semester_3'),
(4, 'Semester 4', 'semester_4'),
(5, 'Semester 5', 'semester_5'),
(6, 'Semester 6', 'semester_6'),
(7, 'Semester 7', 'semester_7'),
(8, 'Semester 8', 'semester_8'),
(9, 'Semester 9', 'semester_9');

-- --------------------------------------------------------

--
-- Table structure for table `semester_batch_year`
--

CREATE TABLE `semester_batch_year` (
  `id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester_batch_year`
--

INSERT INTO `semester_batch_year` (`id`, `semester_id`, `batch_id`, `year_id`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers_courses`
--

CREATE TABLE `teachers_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(1000) NOT NULL DEFAULT '',
  `role` varchar(40) NOT NULL DEFAULT 'student',
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `status`) VALUES
(1, 'Test User 1', 'test_user1', '12345678', 'teacher', 1),
(2, 'Test User 2', 'test_user2', '12345678', 'student', 1),
(3, 'Test User3', 'test_user3', '12345678', 'student', 1),
(4, 'Test User4', 'test_user4', 'scrypt:32768:8:1$HPG3qSe2DPvrvSBY$4795d46471582914bbcb4ab3dabf6617d730f3fbdae70cf3e58dcaeb69b226283fdc538ae93c6f487de70b771decd943a71da1b2b42acec8e5e0f3ff4b09c751', 'teacher', 1),
(5, 'Test User', 'test_user5', 'scrypt:32768:8:1$JCgxDegkfOp7xOd7$e135b43a2b59e3686184d453d52bfa78e8802f80ce600e3481d5e6dde8cd51e30c074ad107d9e1d617b1fc2d59414d916c71a203b13389c3034afa1d543959f0', 'student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year`) VALUES
(1, '2023'),
(2, '2024'),
(3, '2025');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch_courses`
--
ALTER TABLE `batch_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester_batch_year`
--
ALTER TABLE `semester_batch_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers_courses`
--
ALTER TABLE `teachers_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`username`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `batch_courses`
--
ALTER TABLE `batch_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `semester_batch_year`
--
ALTER TABLE `semester_batch_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers_courses`
--
ALTER TABLE `teachers_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
