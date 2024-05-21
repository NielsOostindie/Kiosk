-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2024 at 10:13 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Kiosk`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Image`) VALUES
(1, 'Buckets', '../assets/Buckets/MicrosoftTeams-image-1.jpg'),
(2, 'Burgers', '../assets/Burgers/2024_W3_LTO_NIEUW_NIEUW-BUTTON_COLONEL-BURGER-OR-ONION-RINGS_MENUAPP_1200X800.jpg'),
(3, 'Drinks', '../assets/drinken/Pepsi-drink-M.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `ID` int(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Cat_ID` int(10) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `Meal` tinyint(1) NOT NULL DEFAULT 0,
  `MealID` int(10) NOT NULL,
  `MealImage` varchar(255) DEFAULT NULL,
  `Info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ID`, `Name`, `Cat_ID`, `Image`, `Price`, `Meal`, `MealID`, `MealImage`, `Info`) VALUES
(1, 'Variety Bucket for 4', 1, '../assets/Buckets/MicrosoftTeams-image-1.jpg', '420,69', 1, 3, '{\"1\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_VARIETY-BUCKET-FOR-4-MEAL_MENUAPP_1200X800-1.jpg\"}', 'volgt\r\n'),
(2, 'Variety Bucket for 2', 1, '../assets/Buckets/MicrosoftTeams-image.jpg', '420,69', 1, 4, '{\"1\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_VARIETY-BUCKET-FOR-2-MEAL_MENUAPP_1200X800-1.jpg\"}', 'volgt\r\n'),
(3, 'Variety Bucket Meal for 4', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_VARIETY-BUCKET-FOR-4-MEAL_MENUAPP_1200X800-1.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(4, 'Variety Bucket Meal for 2', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_VARIETY-BUCKET-FOR-2-MEAL_MENUAPP_1200X800-1.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(5, 'Bucket Meal 5 Original Pieces', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_5-COB-BUCKET-MEAL_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(6, 'Bucket Meal 20 Crispy Tenders', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_20-CT-BUCKET-MEAL_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(7, 'Bucket Meal 28 Hot Wings', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_BETER-LEVEN_28-HW-BUCKET-MEAL_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(8, 'Bucket Meal 10 Original Pieces', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_10-COB-BUCKET-MEAL_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(9, 'Bucket Meal 10 Crispy Tenders', 1, '../assets/Buckets/2024_W2_CORE_BUCKETS_10-CT-BUCKET-MEAL_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(10, 'Boneless Bucket', 1, '../assets/Buckets/564823850393ff3502791bba7878da8c-1024x683.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(11, 'Bucket Original Pieces', 1, '../assets/Buckets/c44aa340df87ae86a57edc96a30a23cc-1024x683.jpg', '420,69', 1, 0, '{\"1\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_5-COB-BUCKET-MEAL_MENUAPP_1200X800.jpg\",\"2\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_10-COB-BUCKET-MEAL_MENUAPP_1200X800.jpg\"}', 'volgt'),
(12, 'Bucket Hot Wings', 1, '../assets/Buckets/969200d4ef221b2c942cd603a737a25e-1024x683.jpeg', '420,69', 1, 0, '{\"1\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_BETER-LEVEN_28-HW-BUCKET-MEAL_MENUAPP_1200X800.jpg\"}', 'volgt'),
(13, 'Bucket Crispy Tenders', 1, '../assets/Buckets/6ffade569397893363dd2cb019a6ca9b-1024x683.jpg', '420,69', 1, 0, '{\"1\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_10-CT-BUCKET-MEAL_MENUAPP_1200X800.jpg\",\"2\":\"../assets/Buckets/2024_W2_CORE_BUCKETS_20-CT-BUCKET-MEAL_MENUAPP_1200X800.jpg\"}', 'volgt\r\n'),
(14, 'Colonel Burger Onion Rings Meal', 2, '../assets/Burgers/2024_W3_LTO_NIEUW_NIEUW-BUTTON_COLONEL-BURGER-OR-ONION-RINGS_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt\r\n'),
(15, 'Colonel Bruger Combo', 2, '../assets/Burgers/2024_W3_LTO_NIEUW_BURGER-COMBO_MENUAPP_1200X800.jpg', '420,69', 0, 0, NULL, 'volgt'),
(16, 'Fire Zinger Stacker', 2, '../assets/Burgers/Fire-Zinger-Stacker.jpg', '420,69', 0, 0, NULL, 'volgt'),
(17, 'Fire Zinger Burger', 2, '../assets/Burgers/Fire-Zinger-burger.jpg', '420,69', 0, 0, NULL, 'volgt'),
(18, 'Colonel Burger', 2, '../assets/Burgers/Colonel-Burger.jpg', '420,69', 1, 0, '{\"1\":\"../assets/Burgers/2024_W3_LTO_NIEUW_NIEUW-BUTTON_COLONEL-BURGER-OR-ONION-RINGS_MENUAPP_1200X800.jpg\",\"2\":\"../assets/Burgers/2024_W3_LTO_NIEUW_BURGER-COMBO_MENUAPP_1200X800.jpg\"}', 'volgt'),
(19, 'Colonel Stacker', 2, '../assets/Burgers/Colonel-Stacker.jpg', '420,69', 0, 0, NULL, 'volgt'),
(20, 'Original Burger', 2, '../assets/Burgers/Original-burger-1024x683.jpg', '420,69', 0, 0, NULL, 'volgt'),
(21, 'Zinger Burger', 2, '../assets/Burgers/HarmonyWave.jpeg', '420,69', 0, 0, NULL, 'volgt'),
(22, 'Double Crunch Burger', 2, '../assets/Burgers/Double-Crunch-burger-2.jpg', '420,69', 0, 0, NULL, 'volgt'),
(23, 'Crunchy CheesBurger', 2, '../assets/Burgers/Crunchy-Cheese-burger-1024x683.jpg', '420,69', 0, 0, NULL, 'volgt'),
(24, 'Pepsi Max', 3, '../assets/drinken/Pepsi-drink-M.jpg', '69,420', 0, 0, NULL, 'volgt'),
(25, 'Pepsi', 3, '../assets/drinken/Pepsi-drink-M.jpg', '69,420', 0, 0, NULL, 'volgt'),
(26, '7-up', 3, '../assets/drinken/5c85adc017554c77495dead082253778-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(27, 'Bananen Milkshake', 3, '../assets/drinken/5d524522f23402861d87b7e495d6d7d8-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(28, 'Sourcy Water 300ml', 3, '../assets/drinken/69f98ca942a86f5664e7120dc3ad6f9d-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(29, 'Chocolade Milkshake', 3, '../assets/drinken/90dfcbd8f2a041e0984c6b6384696dcd-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(30, 'Koffie', 3, '../assets/drinken/2023_W1_Core_Drinks_Koffie_Menu_App_1200x800.jpg', '69,420', 0, 0, NULL, 'volgt'),
(31, 'Sourcy Water 500ml', 3, '../assets/drinken/849811c64697ca0acd69b86b4bc8c88f-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(32, 'Vanille Milkshake', 3, '../assets/drinken/a5896fb7a6c46fe8912dbf9e2271abc7-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt'),
(33, 'Aardbeien Milkshake', 3, '../assets/drinken/cc3b4583fe6ea9009ee9a1182ce3aaa0-1024x683.jpg', '69,420', 0, 0, NULL, 'volgt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
