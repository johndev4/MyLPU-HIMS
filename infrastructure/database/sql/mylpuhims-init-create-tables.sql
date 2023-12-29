-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 02:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mylpuhims_db`
--
CREATE SCHEMA IF NOT EXISTS mylpuhims_db;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`activity_logs` (
  `log_id` int(11) NOT NULL,
  `enduser_id` varchar(45) NOT NULL,
  `enduser_type` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `description` varchar(300) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `remote_address` varchar(45) NOT NULL,
  `server_address` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`administrators` (
  `admin_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `admin_name` varchar(45) NOT NULL,
  `locked` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`batches` (
  `batch_id` varchar(45) NOT NULL,
  `product_id` varchar(45) NOT NULL,
  `stock_in` int(11) NOT NULL,
  `stock_out` int(11) NOT NULL,
  `expiration_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`consultations` (
  `consultation_no` varchar(16) NOT NULL,
  `status` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `message` text NOT NULL,
  `personnel_id_no` varchar(45) DEFAULT NULL,
  `lycean_id_no` varchar(45) NOT NULL,
  `meeting_schedule` datetime DEFAULT NULL,
  `meeting_link` varchar(2048) DEFAULT NULL,
  `rejection_message` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`equipments` (
  `product_id` varchar(45) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_personnels`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`health_personnels` (
  `id_no` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_personnels_account`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`health_personnels_account` (
  `id_no` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `locked` int(1) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_personnels_notification`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`health_personnels_notification` (
  `notification_id` int(11) NOT NULL,
  `id_no` varchar(45) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `info` varchar(100) NOT NULL,
  `status` varchar(45) NOT NULL,
  `link` varchar(2048) NOT NULL,
  `created_at` varchar(45) NOT NULL,
  `updated_at` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_records`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`health_records` (
  `record_id` int(11) NOT NULL,
  `id_no` varchar(45) NOT NULL,
  `file_path` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lyceans`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`lyceans` (
  `id_no` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `department` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` varchar(25) DEFAULT NULL,
  `weight` varchar(25) DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lyceans_account`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`lyceans_account` (
  `id_no` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `locked` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lyceans_notification`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`lyceans_notification` (
  `notification_id` int(11) NOT NULL,
  `id_no` varchar(45) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `info` varchar(100) NOT NULL,
  `status` varchar(45) NOT NULL,
  `link` varchar(2048) NOT NULL,
  `created_at` varchar(45) NOT NULL,
  `updated_at` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medical_files`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`medical_files` (
  `file_id` int(11) NOT NULL,
  `consultation_no` varchar(16) NOT NULL,
  `file_path` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE IF NOT EXISTS mylpuhims_db.`medicines` (
  `product_id` varchar(45) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `generic_name` varchar(100) NOT NULL,
  `brand_name` varchar(45) NOT NULL,
  `drug_class` varchar(100) NOT NULL,
  `dosage` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE mylpuhims_db.`activity_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `administrators`
--
ALTER TABLE mylpuhims_db.`administrators`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE mylpuhims_db.`batches`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `fk_batches_medicines1_idx` (`product_id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE mylpuhims_db.`consultations`
  ADD PRIMARY KEY (`consultation_no`),
  ADD KEY `fk_consultations_clinic_personnels1_idx` (`personnel_id_no`),
  ADD KEY `fk_consultations_lyceans1_idx` (`lycean_id_no`);

--
-- Indexes for table `equipments`
--
ALTER TABLE mylpuhims_db.`equipments`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `health_personnels`
--
ALTER TABLE mylpuhims_db.`health_personnels`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `health_personnels_account`
--
ALTER TABLE mylpuhims_db.`health_personnels_account`
  ADD PRIMARY KEY (`id_no`),
  ADD KEY `fk_clinic_personnels_credentials_clinic_personnels_idx` (`id_no`);

--
-- Indexes for table `health_personnels_notification`
--
ALTER TABLE mylpuhims_db.`health_personnels_notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_copy1_health_personnels1_idx` (`id_no`);

--
-- Indexes for table `health_records`
--
ALTER TABLE mylpuhims_db.`health_records`
  ADD PRIMARY KEY (`record_id`,`id_no`),
  ADD UNIQUE KEY `file_path_UNIQUE` (`file_path`),
  ADD KEY `fk_health_record_lyceans1_idx` (`id_no`);

--
-- Indexes for table `lyceans`
--
ALTER TABLE mylpuhims_db.`lyceans`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `lyceans_account`
--
ALTER TABLE mylpuhims_db.`lyceans_account`
  ADD PRIMARY KEY (`id_no`),
  ADD KEY `fk_lycean_credentials_lyceans1_idx` (`id_no`);

--
-- Indexes for table `lyceans_notification`
--
ALTER TABLE mylpuhims_db.`lyceans_notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notifications_copy1_lyceans1_idx` (`id_no`);

--
-- Indexes for table `medical_files`
--
ALTER TABLE mylpuhims_db.`medical_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `fk_medical_files_consultations1_idx` (`consultation_no`);

--
-- Indexes for table `medicines`
--
ALTER TABLE mylpuhims_db.`medicines`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE mylpuhims_db.`activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_personnels_notification`
--
ALTER TABLE mylpuhims_db.`health_personnels_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_records`
--
ALTER TABLE mylpuhims_db.`health_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lyceans_notification`
--
ALTER TABLE mylpuhims_db.`lyceans_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_files`
--
ALTER TABLE mylpuhims_db.`medical_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE mylpuhims_db.`batches`
  ADD CONSTRAINT `fk_batches_medicines1` FOREIGN KEY (`product_id`) REFERENCES `medicines` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `consultations`
--
ALTER TABLE mylpuhims_db.`consultations`
  ADD CONSTRAINT `fk_consultations_clinic_personnels1` FOREIGN KEY (`personnel_id_no`) REFERENCES `health_personnels` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consultations_lyceans1` FOREIGN KEY (`lycean_id_no`) REFERENCES `lyceans` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `health_personnels_account`
--
ALTER TABLE mylpuhims_db.`health_personnels_account`
  ADD CONSTRAINT `fk_clinic_personnels_credentials_clinic_personnels` FOREIGN KEY (`id_no`) REFERENCES `health_personnels` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `health_personnels_notification`
--
ALTER TABLE mylpuhims_db.`health_personnels_notification`
  ADD CONSTRAINT `fk_notifications_copy1_health_personnels1` FOREIGN KEY (`id_no`) REFERENCES `health_personnels` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `health_records`
--
ALTER TABLE mylpuhims_db.`health_records`
  ADD CONSTRAINT `fk_health_record_lyceans1` FOREIGN KEY (`id_no`) REFERENCES `lyceans` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lyceans_account`
--
ALTER TABLE mylpuhims_db.`lyceans_account`
  ADD CONSTRAINT `fk_lycean_credentials_lyceans1` FOREIGN KEY (`id_no`) REFERENCES `lyceans` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lyceans_notification`
--
ALTER TABLE mylpuhims_db.`lyceans_notification`
  ADD CONSTRAINT `fk_notifications_copy1_lyceans1` FOREIGN KEY (`id_no`) REFERENCES `lyceans` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medical_files`
--
ALTER TABLE mylpuhims_db.`medical_files`
  ADD CONSTRAINT `fk_medical_files_consultations1` FOREIGN KEY (`consultation_no`) REFERENCES `consultations` (`consultation_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO mylpuhims_db.`administrators` (`admin_id`, `username`, `password`, `admin_name`, `locked`) VALUES (202100001, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Administrator', 0);
