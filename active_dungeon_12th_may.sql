-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2024 at 09:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_fiverr`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_dungeon`
--

CREATE TABLE `active_dungeon` (
  `dungeon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dungeon_move_1` int(11) DEFAULT NULL,
  `dungeon_move_2` int(11) DEFAULT NULL,
  `dungeon_move_3` int(11) DEFAULT NULL,
  `dungeon_move_4` int(11) DEFAULT NULL,
  `dungeon_move_5` int(11) DEFAULT NULL,
  `turns` int(11) DEFAULT NULL,
  `dungeon_monster_id` int(11) DEFAULT NULL,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `team3_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_dungeon`
--
ALTER TABLE `active_dungeon`
  ADD PRIMARY KEY (`dungeon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_dungeon`
--
ALTER TABLE `active_dungeon`
  MODIFY `dungeon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
