-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 11, 2019 at 07:44 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pasal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accessory_spec`
--

CREATE TABLE `tbl_accessory_spec` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brands`
--

CREATE TABLE `tbl_brands` (
  `brand_id` int(11) NOT NULL,
  `activate` bit(1) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `google_plus_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brands`
--

INSERT INTO `tbl_brands` (`brand_id`, `activate`, `brand_name`, `facebook_link`, `google_plus_link`, `instagram_link`, `twitter_link`, `type`) VALUES
(1, b'1', 'Mazda', '', '', '', '', 'cars'),
(2, b'0', 'Ford', '', '', '', '', 'cars'),
(3, b'0', 'Lamborghini', '', '', '', '', 'cars'),
(4, b'1', 'Dhapakhel Apartments', '', '', '', '', 'housing'),
(5, b'0', 'Sunrise Apartments', '', '', '', '', 'housing'),
(6, b'0', 'Tilotama Apartments', '', '', '', '', 'housing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business_spec`
--

CREATE TABLE `tbl_business_spec` (
  `id` int(11) NOT NULL,
  `included_in_price` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cars`
--

CREATE TABLE `tbl_cars` (
  `car_id` int(11) NOT NULL,
  `car_name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text,
  `engine` int(11) NOT NULL,
  `features` text,
  `fuel` varchar(255) DEFAULT NULL,
  `make_year` int(11) NOT NULL,
  `price` double NOT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cars`
--

INSERT INTO `tbl_cars` (`car_id`, `car_name`, `color`, `description`, `engine`, `features`, `fuel`, `make_year`, `price`, `transmission`, `type`, `brand_id`) VALUES
(1, 'Mazda Nz 230', 'Silver', 'Mazda Nz 230\r\nFull Specification look from another site.', 1500, NULL, 'Petrol', 2017, 5560000, 'Manual 2D', 'Sedan', 1),
(2, 'Mazda Sr 350', 'Silver', 'Mazda Sr 350', 2300, NULL, 'Deisel', 2018, 3400000, 'Manual 3D', 'Jeep / SUV', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_car_spec`
--

CREATE TABLE `tbl_car_spec` (
  `id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `features` text,
  `fuel` varchar(255) DEFAULT NULL,
  `kilometers` int(11) NOT NULL,
  `make_year` int(11) NOT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_car_spec`
--

INSERT INTO `tbl_car_spec` (`id`, `color`, `engine`, `features`, `fuel`, `kilometers`, `make_year`, `transmission`, `type`, `main_ads_id`) VALUES
(1, 'Silver', '2200', 'Power Window,Power Steering,Leather Seat,Sunroof,Central Lock,Keyless Remote Entry,Air Bags,Air Conditioning,Electric ORVM,Audio System,Bluetooth Connectivity', 'Petrol', 2000, 2018, 'Automatic Gear - 4 WD', 'Sedan', 2),
(2, 'black', '1200', 'Power Window,Power Steering,Leather Seat,Sunroof,Central Lock,Alloy Wheels,Anti-theft Alarm,Keyless Remote Entry,Tubeless Tyres,Air Bags,Anti-lock Braking (ABS),Air Conditioning,Climate Control,Steering Mounted Controls,Projected Headlight,Fog Lights,Electric ORVM,Audio System,LCD Touchscreen,Bluetooth Connectivity', 'Diesel', 340000, 2012, 'Manual Gear - 4 WD', 'Jeep / SUV', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`) VALUES
(1, 'Automobiles'),
(2, 'Books & Learning'),
(3, 'Beauty & Health'),
(4, 'Events & Happenings'),
(5, 'Apparels & Accessories'),
(6, 'Computer & Peripherals'),
(9, 'Mobile & Accessories'),
(11, 'Music Instrument'),
(12, 'Pets & Pet Care'),
(13, 'Real Estate'),
(14, 'Services'),
(15, 'Business & Industrial'),
(16, 'Sports & Fitness'),
(17, 'Toys & Video Games'),
(18, 'Travel, Tour & Packages'),
(19, 'Home, Furnishing & Appliances');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clothing_spec`
--

CREATE TABLE `tbl_clothing_spec` (
  `id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clothing_spec`
--

INSERT INTO `tbl_clothing_spec` (`id`, `color`, `size`, `type`, `main_ads_id`) VALUES
(1, 'brown/black', 'XS,S', 'Hoodies & Sweatshirt', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_common_spec`
--

CREATE TABLE `tbl_common_spec` (
  `id` int(11) NOT NULL,
  `spec_condition` varchar(255) DEFAULT NULL,
  `used_for` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_common_spec`
--

INSERT INTO `tbl_common_spec` (`id`, `spec_condition`, `used_for`, `main_ads_id`) VALUES
(1, 'Like New (used few times)', '1months', 1),
(2, 'Like New (used few times)', '3 months', 2),
(3, 'Excellent', '3 months', 3),
(4, 'Excellent', '3 months', 4),
(5, 'Excellent', '4 years', 5),
(6, 'Good/Fair', '3 months', 6),
(7, 'Like New (used few times)', '4 months', 7),
(8, 'Brand New (not used)', 'NA', 8),
(9, 'Brand New (not used)', '0', 9),
(10, 'Like New (used few times)', '3 months', 10),
(11, 'Brand New (not used)', '0', 11),
(12, 'Good/Fair', '4 years', 12),
(13, 'Brand New (not used)', 'not used', 13),
(14, 'Like New (used few times)', '3 months', 14),
(15, 'Brand New (not used)', 'not used', 16),
(16, 'Brand New (not used)', '0', 19),
(17, 'Brand New (not used)', '40 days', 20),
(18, 'Brand New (not used)', '9 years', 22),
(19, 'Not Working', '6 years', 23),
(20, 'Like New (used few times)', '', 24),
(21, 'Like New (used few times)', 'not used', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) NOT NULL,
  `area_location` varchar(255) DEFAULT NULL,
  `street_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `added_date`, `name`, `phone`, `verified`, `email`, `city_name`, `area_location`, `street_name`) VALUES
(1, '2019-02-07 18:15:00', 'Shreeya Shrestha', '9813344166', 0, 'shreeya@gmail.com', 'Kathmandu', 'Bouddha-06', 'Kuwa tole'),
(2, '2019-02-07 18:15:00', 'Bruce Wayne', '9813344166', 0, 'batman@gmail.com', 'Kathmandu', 'JORPATI', 'CHAMUNDA HALL'),
(3, '2019-02-07 18:15:00', 'Clerk Kent', '9813344166', 0, 'superman@gmail.com', 'Patan', 'Mangal Bazaar', 'Chyasal'),
(4, '2019-02-07 18:15:00', 'Australia Nepal', '9813344166', 1, 'australian@gmail.com', 'Bhaktapur', 'bhaktapur', 'bhaktapur'),
(5, '2019-02-09 16:17:11', 'Happy ', '9813344166', 1, 'happy@gmail.com', 'kathmandu', 'bouddha-06', 'kuwa tole'),
(6, '2019-02-09 16:18:26', 'Abc', '9813344166', 0, 'abc@xyz.com', 'Kathmandu', 'bouddha-06', 'Gaurighat'),
(7, '2019-02-15 06:18:07', 'Dawa Waiba', '9807766876', 0, 'dawa@gmail.com', 'Kathmandu', 'Boudha', 'Gaurighat'),
(8, '2019-03-10 08:33:16', 'Nepal Nepali', '9813344166', 1, 'nepali@gmail.com', 'Kathmandu', 'Bouddha-06', 'Gaurighat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery`
--

CREATE TABLE `tbl_delivery` (
  `id` int(11) NOT NULL,
  `delivery_area` varchar(255) DEFAULT NULL,
  `delivery_charges` varchar(255) DEFAULT NULL,
  `home_delivery` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_delivery`
--

INSERT INTO `tbl_delivery` (`id`, `delivery_area`, `delivery_charges`, `home_delivery`, `main_ads_id`) VALUES
(1, NULL, NULL, 'No', 1),
(2, 'NA', '', 'No', 2),
(3, 'Almost anywhere in Nepal', '50', 'Yes', 3),
(4, 'Within my City', '300', 'Yes', 4),
(5, 'NA', '', 'No', 5),
(6, NULL, '', 'No', 6),
(7, 'NA', '', 'No', 7),
(8, 'Within my Area', '120', 'Yes', 8),
(9, NULL, '', 'No', 9),
(10, NULL, '', 'No', 10),
(11, NULL, '', 'No', 11),
(12, 'Within my Area', '12', 'Yes', 12),
(13, NULL, '', 'No', 13),
(14, 'Within my Area', 'na', 'Yes', 14),
(15, NULL, NULL, 'No', 16),
(16, NULL, NULL, 'No', 19),
(17, NULL, NULL, 'No', 20),
(18, NULL, '', 'No', 23),
(19, 'NA', '', 'No', 24),
(20, NULL, '', 'No', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_handset_spec`
--

CREATE TABLE `tbl_handset_spec` (
  `id` int(11) NOT NULL,
  `back_camera` varchar(255) DEFAULT NULL,
  `cpu_core` varchar(255) DEFAULT NULL,
  `features` text,
  `front_camera` varchar(255) DEFAULT NULL,
  `internal_storage` varchar(255) DEFAULT NULL,
  `ownership` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `screen_size` varchar(255) DEFAULT NULL,
  `sim_slot` varchar(255) DEFAULT NULL,
  `smartphone_os` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_handset_spec`
--

INSERT INTO `tbl_handset_spec` (`id`, `back_camera`, `cpu_core`, `features`, `front_camera`, `internal_storage`, `ownership`, `ram`, `screen_size`, `sim_slot`, `smartphone_os`, `main_ads_id`) VALUES
(1, '8 MP - 12.9 MP', 'Deca - 10', 'Water & Dust Proof (IP),Gorilla Glass Screen,WiFi,Front LED Flash,GPS,Fingerprint Sensor,Proximity Sensor,Compass Sensor', '8 MP', '64 GB', 'Stamped warranty card,IMEI matching box,Original purchase bill (for used phone)', '4 GB', '5.0 to 5.4 inch', 'Single Sim - 4G (LTE)', 'Android 8.0 (Oreo)', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_housings`
--

CREATE TABLE `tbl_housings` (
  `housing_id` int(11) NOT NULL,
  `added_date` date DEFAULT NULL,
  `appliances` varchar(255) DEFAULT NULL,
  `area` int(11) NOT NULL,
  `available` varchar(255) DEFAULT NULL,
  `bathroom` int(11) NOT NULL,
  `bedroom` int(11) NOT NULL,
  `cooling` varchar(255) DEFAULT NULL,
  `dates` int(11) NOT NULL,
  `description` text,
  `flooring` varchar(255) DEFAULT NULL,
  `heating` varchar(255) DEFAULT NULL,
  `housing_name` varchar(255) DEFAULT NULL,
  `laundry` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `parking` varchar(255) DEFAULT NULL,
  `pets` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `rent_per_sqft` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit_floor` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_housings`
--

INSERT INTO `tbl_housings` (`housing_id`, `added_date`, `appliances`, `area`, `available`, `bathroom`, `bedroom`, `cooling`, `dates`, `description`, `flooring`, `heating`, `housing_name`, `laundry`, `others`, `parking`, `pets`, `price`, `purpose`, `rent_per_sqft`, `type`, `unit_floor`, `brand_id`) VALUES
(3, NULL, NULL, 4000, 'Available Now', 2, 2, 'Yes', 5, 'Super Super Super SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper Super', 'Parketting', 'Yes', 'Phase II Dhapakhel Z', 'Owner', 'Super SuperSuper SuperSuper SuperSuper SuperSuper SuperSuper Super', 'Carport', NULL, 4500000, 'For Buy', 6700, 'Civil Home', 5, 4),
(4, NULL, NULL, 2345, 'Available Now', 9, 9, 'No Data', 2019, 'sdcfvgbhjnklm,', 'Marble', 'No Data', 'Dhapakhel Sc1 Apartment', 'Per kg', 'bfgchvjbkn', 'Carport', NULL, 234567890, 'For Rent', 21345, 'Apartment', 6, 4),
(5, NULL, 'Washing Machine,Dryer,Dish Washer,Heater', 3400, 'Available Now', 4, 4, 'No Data', 2014, 'Very GOOd Bungolo', 'Parketting', 'No Data', 'Sunrise Apartment BHK15', 'Per kg', 'nothing', 'No Parking', 'Small Dogs,Big Dogs,Birds', 12000, 'For Rent', 3400, 'Apartment', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_laptop_spec`
--

CREATE TABLE `tbl_laptop_spec` (
  `id` int(11) NOT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `features` text,
  `hdd` varchar(255) DEFAULT NULL,
  `processor` varchar(255) DEFAULT NULL,
  `processor_generation` varchar(255) DEFAULT NULL,
  `ram` int(11) NOT NULL,
  `screen_size` int(11) NOT NULL,
  `screen_type` varchar(255) DEFAULT NULL,
  `video_card` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_laptop_spec`
--

INSERT INTO `tbl_laptop_spec` (`id`, `battery`, `features`, `hdd`, `processor`, `processor_generation`, `ram`, `screen_size`, `screen_type`, `video_card`, `main_ads_id`) VALUES
(1, 'Above 5 Hour', 'Blu-ray Drive,Webcam,WiFi,Bluetooth,SD Card Slot,Touch Screen,Surround Speaker,Ethernet LAN,Fingerprint Recognition,HDMI', '1 Tb', 'Intel Core i7', '6th (2016)', 256, 25, 'OLED', 'Amedon', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_main_ads`
--

CREATE TABLE `tbl_main_ads` (
  `main_ads_id` int(11) NOT NULL,
  `ad_run_days` int(11) NOT NULL,
  `ad_title` varchar(255) NOT NULL,
  `added_date` date DEFAULT NULL,
  `description` text,
  `expired` bit(1) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `featured` bit(1) NOT NULL,
  `price` bigint(20) NOT NULL,
  `price_negotiable` varchar(255) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_main_ads`
--

INSERT INTO `tbl_main_ads` (`main_ads_id`, `ad_run_days`, `ad_title`, `added_date`, `description`, `expired`, `expiry_date`, `featured`, `price`, `price_negotiable`, `view_count`, `customer_id`, `sub_category_id`, `model_id`) VALUES
(1, 14, 'Google VR - Gaming Console', '2019-02-15', 'Google VR - Gaming Console for all the time with the complex reality.', b'1', '2019-03-01', b'0', 12000, 'Yes', 88, 1, 27, 31),
(2, 90, 'Ford Eco Sport', '2019-02-08', 'Ford Eco Sport', b'1', '2019-05-09', b'1', 6500000, 'Fixed Price', 61, 2, 1, 1),
(3, 60, 'Premium book Saksi ', '2019-02-08', 'Premium book Saksi ', b'1', '2019-04-09', b'1', 500, 'Yes', 32, 2, 14, NULL),
(4, 120, 'Dell PC truly for GAMING!!', '2019-02-09', 'Dell showed off overhauled versions of its G-series gaming laptops at CES 2019. The upcoming G7 15 will be available on Jan. 29 with RTX graphics and an optional 4K display. We expect to publish a full review soon. \r\n\r\nWithin every goodbye lies the potential for a promising hello. That\'s the story with Dell\'s Inspiron Gaming line. The company recently phased out its entry-level gaming-laptop series in favor of something more exciting and powerful, the new G Series brand, including the G7 15 (starting at $849, reviewed at $1,049).\r\n\r\nRocking a sports-car-like design complete with eye-catching color, the G7 looks like nothing Dell\'s ever made. But beyond the fetching new look, you get loud audio and specs capable of delivering solid midlevel gaming performance. However, a dim display and sluggish hard drive keep the G7 15 from earning a higher rating.', b'1', '2019-06-09', b'0', 85000, 'Yes', 30, 6, 24, NULL),
(5, 60, 'Landrover Freelander 1 ', '2019-02-13', 'Freelander 1 2005 model europe make', b'1', '2019-04-14', b'0', 3000000, 'Fixed Price', 4, 4, 1, 9),
(6, 30, 'Pencils and pens', '2019-02-13', 'Pencils and pens', b'1', '2019-03-15', b'0', 1200, 'Fixed Price', 8, 4, 22, NULL),
(7, 120, 'KTM Duke NEpla', '2019-02-13', 'KTM Duke NEpla', b'1', '2019-02-08', b'0', 250000, 'Fixed Price', 5, 4, 2, 4),
(8, 14, 'H&m New Jacket ', '2019-02-13', 'Japan bata layeko ho.\r\nH&M made in Sweden.\r\nSize M \r\nInterested buyer can call direct.', b'1', '2019-02-27', b'0', 6000, 'Fixed Price', 3, 4, 34, NULL),
(9, 90, 'Mens Shoes Elegant Design', '2019-02-13', 'Shoes designed to move you. Looks so Good on the Outside, It\'ll Make You Feel Good Inside. You will get Noticed.\r\nMADE IN NEPAL BY RARA FOOTWEAR', b'1', '2019-05-14', b'0', 1200, 'Yes', 1, 2, 40, NULL),
(10, 120, 'LED Screen 32 inch - Samsung', '2019-02-13', 'LED Screen 32 inch - Samsung', b'0', '2019-06-13', b'0', 30000, 'Fixed Price', 2, 2, 154, NULL),
(11, 60, 'Kangaroo Hoodies in nepal', '2019-02-13', 'Kangaroo Hoodies in nepal', b'1', '2019-04-14', b'0', 3400, 'Fixed Price', 1, 2, 45, NULL),
(12, 60, 'Glass Eye for and Eye', '2019-02-13', 'Glass Eye for and Eye', b'1', '2019-04-14', b'0', 1200, 'Fixed Price', 4, 2, 6, NULL),
(13, 90, 'Mens Shoes Elegant Design 2', '2019-02-13', 'Mens Shoes Elegant Design 2', b'1', '2019-05-14', b'1', 7000, 'Fixed Price', 1, 5, 40, NULL),
(14, 120, 'Google Pixel 2 (sky Blue Colour) With Fast Charger ', '2019-02-13', 'Imported from USA.\r\nFresh condition.\r\nUsed for four month.\r\nPrice: 31000', b'0', '2019-06-13', b'1', 31000, 'Fixed Price', 3, 5, 149, 52),
(15, 30, 'Avenger Age of ulton', '2019-02-13', 'Avenger Age of ulton', b'1', '2019-03-15', b'0', 400, 'Fixed Price', 2, 5, 32, NULL),
(16, 60, 'American Diamond ', '2019-02-13', 'Very good condition ,American diamond ,like new .\r\n', b'1', '2019-04-14', b'0', 5900, 'Fixed Price', 4, 5, 44, NULL),
(17, 30, 'Buddha Air tickets', '2019-02-13', 'Buddha Air tickets', b'1', '2019-03-15', b'0', 123, 'Yes', 8, 5, 123, NULL),
(18, 14, 'life is run', '2019-02-14', 'life is run', b'1', '2019-02-28', b'0', 3450, 'Fixed Price', 1, 5, 29, NULL),
(19, 90, 'instrument music guitar', '2019-02-14', 'instrument music guitar', b'1', '2019-05-15', b'1', 11, 'Yes', 11, 5, 49, NULL),
(20, 120, 'Cocker Spaniel Puppy - Love them', '2019-02-14', 'Cocker Spaniel Puppy - Love them', b'0', '2019-06-14', b'1', 12000, 'Fixed Price', 30, 5, 59, NULL),
(21, 120, 'Pokhara flat Apartment', '2019-02-14', 'Pokhara flat Apartment', b'0', '2019-06-14', b'1', 9000, 'Fixed Price', 12, 5, 65, NULL),
(22, 60, 'Bhumisang House Bikrima', '2019-02-14', 'Bhumisang House Bikrima', b'1', '2019-04-15', b'0', 12000000, 'Yes', 55, 5, 67, NULL),
(23, 14, 'Henry Ford Book of life', '2019-02-14', 'Henry Ford Book of life', b'1', '2019-02-08', b'0', 300, 'Yes', 2, 5, 18, NULL),
(24, 14, 'Pubg Trigger', '2019-02-15', 'Pubg trigger brand new. Easy chicken dinner.', b'1', '2019-03-01', b'0', 200, 'Yes', 2, 7, 27, 23),
(25, 120, 'Avenger Age of ulton BOOK', '2019-04-01', 'Avenger Age of ulton BOOK', b'0', '2019-07-30', b'0', 3400, 'Fixed Price', 1, 4, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models`
--

CREATE TABLE `tbl_models` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_models`
--

INSERT INTO `tbl_models` (`model_id`, `model_name`, `sub_category_id`) VALUES
(1, 'Ford', 1),
(2, 'Honda', 1),
(3, 'Flat', 1),
(4, 'KTM', 2),
(5, 'Hero Honda', 2),
(6, 'Royal Enfield', 2),
(7, 'Honda ', 2),
(8, 'Bajaj', 2),
(9, 'Land Rover', 1),
(10, 'Mazda', 1),
(11, 'For Car', 3),
(12, 'For Motorcycle', 3),
(13, 'Royal Royce', 1),
(14, 'Battery ', 27),
(15, ' Chargers ', 27),
(16, 'Hyundai', 1),
(17, 'Apple iPhone', 149),
(18, 'Blackberry', 149),
(19, 'Cover & Cases', 27),
(20, 'Data Cables', 27),
(21, 'Headsets & Earphones', 27),
(22, 'Memory Cards', 27),
(23, 'Mobile Apps & Games', 27),
(24, 'Mobile Parts', 27),
(25, 'Mobile Unlock & Upgrade', 27),
(26, 'Other Accessories', 27),
(27, 'Power Banks', 27),
(28, 'Screen Protectors', 27),
(29, 'Selfie Monopod', 27),
(30, 'Smart Watch & Bands', 27),
(31, 'VR Glass Box', 27),
(32, 'Colors', 149),
(33, 'Gionee', 149),
(34, 'HTC', 149),
(35, 'Huawei', 149),
(36, 'Lava - Xolo', 149),
(37, 'Lenovo', 149),
(38, 'LG', 149),
(39, 'Mi (Xiaomi)', 149),
(40, 'Micromax', 149),
(41, 'Motorola', 149),
(42, 'Nokia - Microsoft', 149),
(43, 'OnePlus', 149),
(44, 'Oppo', 149),
(45, 'Other Brands', 149),
(46, 'Other Chinese Brands', 149),
(47, 'Other Copy-Clone Phones', 149),
(48, 'Other Indian Brands', 149),
(49, 'Samsung', 149),
(50, 'Sony', 149),
(51, 'Vivo', 149),
(52, 'Google', 149);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monitor_spec`
--

CREATE TABLE `tbl_monitor_spec` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_monitor_spec`
--

INSERT INTO `tbl_monitor_spec` (`id`, `size`, `type`, `main_ads_id`) VALUES
(1, 32, 'LED', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_motocycle_spec`
--

CREATE TABLE `tbl_motocycle_spec` (
  `id` int(11) NOT NULL,
  `anchal` varchar(255) DEFAULT NULL,
  `engine` int(11) NOT NULL,
  `features` text,
  `kilometers` int(11) NOT NULL,
  `lot_no` int(11) NOT NULL,
  `make_year` int(11) NOT NULL,
  `mileage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_motocycle_spec`
--

INSERT INTO `tbl_motocycle_spec` (`id`, `anchal`, `engine`, `features`, `kilometers`, `lot_no`, `make_year`, `mileage`, `type`, `main_ads_id`) VALUES
(1, 'Bagmati', 200, 'Electric Start,Alloy Wheels,Tubeless Tyres,Digital Display Panel,LED Tail Light,Front Disc Brake,Anti-lock Braking (ABS),Mono Suspension,Split Seat,Low Fuel Indicator,Tripmeter', 5000, 89, 2018, '30', 'Dirt', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_networking_equipment_spec`
--

CREATE TABLE `tbl_networking_equipment_spec` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pictures`
--

CREATE TABLE `tbl_pictures` (
  `id` int(11) NOT NULL,
  `picture_name` varchar(255) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `housing_id` int(11) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pictures`
--

INSERT INTO `tbl_pictures` (`id`, `picture_name`, `car_id`, `housing_id`, `main_ads_id`) VALUES
(1, 'Mobile & Accessories_Accessories_vrpark-virtual-reality-3d-glasses-vr-google.jpg', NULL, NULL, 1),
(2, 'Mobile & Accessories_Accessories_xg-vr.jpg', NULL, NULL, 1),
(3, 'Automobiles_Cars_2014_Rolls-Royce_Wraith_(MY14)_coupe_(2015-07-25)_02.jpg', 1, NULL, NULL),
(5, 'Automobiles_Cars_2018-ROLLS-ROYCE-WRAITH-used-2186-H25642-1.jpg', 1, NULL, NULL),
(17, 'Automobiles_Cars_Automobiles_Cars_1200px-2018_Ford_EcoSport_ST-Line_1.0_(1).jpg', NULL, NULL, 2),
(18, 'Automobiles_Cars_Automobiles_Cars_4.jpg', NULL, NULL, 2),
(19, 'Automobiles_Cars_Automobiles_Cars_2f1cae4a7b619685ec6bfe4cf9cf71fa.png', NULL, NULL, 2),
(20, 'Books & Learning_Book - Children & School_Books & Learning_Book - Children & School_A-Good-Lifetime-Habit-Read-More-Books-to-Expand-Your-Sense-of-Life---.jpg', NULL, NULL, 3),
(21, 'Books & Learning_Book - Children & School_Books & Learning_Book - Fiction_51GVuIHGNML._SX329_BO1,204,203,200_.jpg', NULL, NULL, 3),
(25, 'Computer & Peripherals_Desktop PC_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDNfbGVkZS5qcGc=.jpeg', NULL, NULL, 4),
(26, 'Computer & Peripherals_Desktop PC_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDUuanBn.jpeg', NULL, NULL, 4),
(27, 'Computer & Peripherals_Desktop PC_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMzUuanBn.jpeg', NULL, NULL, 4),
(28, 'Computer & Peripherals_Desktop PC_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wNDIuanBn.jpeg', NULL, NULL, 4),
(29, 'Computer & Peripherals_Desktop PC_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wNDEuanBn.jpeg', NULL, NULL, 4),
(30, 'Automobiles_Cars_1664731_0208ch98fehg2b1b.jpg', NULL, NULL, 5),
(31, 'Automobiles_Cars_1664731_02081c83gfghf2b7.jpg', NULL, NULL, 5),
(32, 'Automobiles_Cars_1664731_02081hcfebef5e98.jpg', NULL, NULL, 5),
(33, 'Automobiles_Cars_1664731_02088e67c4696gf6.jpg', NULL, NULL, 5),
(34, 'Books & Learning_Stationery Items _aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMzUuanBn.jpeg', NULL, NULL, 6),
(35, 'Automobiles_Motorcycles_1246560_1222d5ca4381ac53.jpg', NULL, NULL, 7),
(36, 'Automobiles_Motorcycles_1246560_1222dhe3e874ede8 (1).jpg', NULL, NULL, 7),
(37, 'Automobiles_Motorcycles_1246560_1222g9459676h73h.jpg', NULL, NULL, 7),
(38, 'Apparels & Accessories_Baby & Children Accessories_1662905_02068c2e65b9c671.jpg', NULL, NULL, 8),
(39, 'Apparels & Accessories_Baby & Children Accessories_1662905_02064bca6a817c39 (1).jpg', NULL, NULL, 8),
(40, 'Apparels & Accessories_Baby & Children Accessories_1662905_0206677cbh355a6b.jpg', NULL, NULL, 8),
(41, 'Apparels & Accessories_Men\'s Shoes _1665405_02092g29hhe9b635 (1).jpg', NULL, NULL, 9),
(42, 'Apparels & Accessories_Men\'s Shoes _1665405_02092g29hhe9b635.jpg', NULL, NULL, 9),
(43, 'Computer & Peripherals_Monitors_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDUuanBn.jpeg', NULL, NULL, 10),
(44, 'Computer & Peripherals_Monitors_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDNfbGVkZS5qcGc=.jpeg', NULL, NULL, 10),
(45, 'Apparels & Accessories_Women\'s Clothing _1662905_0206e7df7dffcf43.jpg', NULL, NULL, 11),
(47, 'Beauty & Health_Eye Care _square-linkedin-512.png', NULL, NULL, 12),
(48, 'Apparels & Accessories_Men\'s Shoes _1665405_02092g29hhe9b635.jpg', NULL, NULL, 13),
(49, 'Mobile & Accessories_Handsets_1662247_0206c32313fb9227.jpg', NULL, NULL, 14),
(50, 'Events & Happenings_Theatre-Plays-Movies _download.jpeg', NULL, NULL, 15),
(51, 'Apparels & Accessories_Women\'s Accessories _1666432_02102bacf251d95b.jpg', NULL, NULL, 16),
(52, 'Apparels & Accessories_Women\'s Accessories _1666432_02104452beb856g8.jpg', NULL, NULL, 16),
(53, 'Apparels & Accessories_Women\'s Accessories _1666432_02104gaffc466gee.jpg', NULL, NULL, 16),
(54, 'Apparels & Accessories_Women\'s Accessories _1666432_0210758747cgd41c.jpg', NULL, NULL, 16),
(55, 'Events & Happenings_Dance - Music Concerts _spiderman-logo-design.jpg.pagespeed.ce.dkiWDYbrJx.jpg', NULL, NULL, 18),
(56, 'Music Instrument_Instrument - Cajon _26073573_136184780389780_5975022424746360832_n (1).jpg', NULL, NULL, 19),
(58, 'Real Estate_Flatmates & Paying Guests_17269282_1601652666529088_1817406776_o.jpg', NULL, NULL, 21),
(60, 'Books & Learning_Book - Other_aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wNDEuanBn.jpeg', NULL, NULL, 23),
(79, '1.png', NULL, 3, NULL),
(80, '2.jpg', NULL, 3, NULL),
(81, '3.jpg', NULL, 3, NULL),
(82, '4.jpg', NULL, 3, NULL),
(90, 'aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDNfbGVkZS5qcGc=.jpeg', NULL, 4, NULL),
(91, 'aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wMDUuanBn.jpeg', NULL, 4, NULL),
(93, 'aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wNDEuanBn.jpeg', NULL, 4, NULL),
(94, 'aHR0cHM6Ly93d3cubGFwdG9wbWFnLmNvbS9pbWFnZXMvdXBsb2Fkcy81NDk1L2cvZGVsbC1nNy0xNS0wNDIuanBn.jpeg', NULL, 4, NULL),
(96, 'Real Estate_For Rent - House _2.jpg', NULL, NULL, 22),
(97, '120.jpg', NULL, 5, NULL),
(98, '1323086003ext-type-r-p2.jpg', NULL, 5, NULL),
(99, '1542620815soalteecitymain-460.jpg', NULL, 5, NULL),
(100, 'soalteecity480300.jpg', NULL, 5, NULL),
(101, 'vegas_4.jpg', NULL, 5, NULL),
(102, '1.png', NULL, 5, NULL),
(103, '2.jpg', NULL, 5, NULL),
(104, '3.jpg', NULL, 5, NULL),
(105, '4.jpg', NULL, 5, NULL),
(107, 'Pets & Pet Care_Kennel & Dog Accessories _Cocker-Spaniel-Puppies-For-Sale-300x300.jpg', NULL, NULL, 20),
(108, 'Pets & Pet Care_Kennel & Dog Accessories _cocker-spaniel-300x300.jpg', NULL, NULL, 20),
(109, 'Pets & Pet Care_Kennel & Dog Accessories _cocker-spaniel-puppies-300x300.jpg', NULL, NULL, 20),
(110, 'Pets & Pet Care_Kennel & Dog Accessories _u-g-PZ15JH0.jpg', NULL, NULL, 20),
(111, 'Mobile & Accessories_Accessories_1662905_02064bca6a817c39.jpg', NULL, NULL, 24),
(112, 'Mobile & Accessories_Accessories_1662905_0206677cbh355a6b.jpg', NULL, NULL, 24),
(138, 'author.jpg', 2, NULL, NULL),
(139, 'gallery1.jpg', 2, NULL, NULL),
(189, 'author.jpg', 1, NULL, NULL),
(190, 'gallery1.jpg', 1, NULL, NULL),
(191, 'gallery2.jpg', 1, NULL, NULL),
(192, 'gallery3.jpg', 1, NULL, NULL),
(193, 'gallery4.jpg', 1, NULL, NULL),
(194, 'gallery5.jpg', 1, NULL, NULL),
(196, 'gallery8.jpg', NULL, 4, NULL),
(197, 'author.jpg', NULL, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_printer_spec`
--

CREATE TABLE `tbl_printer_spec` (
  `id` int(11) NOT NULL,
  `features` text,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questions`
--

CREATE TABLE `tbl_questions` (
  `question_id` int(11) NOT NULL,
  `asked_on` date DEFAULT NULL,
  `question_comment` varchar(255) DEFAULT NULL,
  `asked_by` int(11) DEFAULT NULL,
  `asked_to` int(11) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_questions`
--

INSERT INTO `tbl_questions` (`question_id`, `asked_on`, `question_comment`, `asked_by`, `asked_to`, `main_ads_id`) VALUES
(1, '2019-02-13', 'Can you discount abit more on this ?????', 2, 1, 1),
(2, '2019-02-13', 'are you there\r\n', 2, 1, 1),
(3, '2019-02-13', 'asdasdasdad', 2, 1, 1),
(4, '2019-02-13', 'I want discount too ??\r\n', 5, 1, 1),
(5, '2019-02-13', 'sadasd', 1, 1, 1),
(6, '2019-02-13', 'I want this !! Any price you want ?', 5, 6, 4),
(7, '2019-02-13', 'adasdasd', 5, 6, 4),
(8, '2019-02-14', 'i want this', 1, 5, 17),
(9, '2019-02-15', 'exgdfhgjk', 4, 5, 20),
(10, '2019-02-15', 'Is it available', 1, 5, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_realestate_spec`
--

CREATE TABLE `tbl_realestate_spec` (
  `id` int(11) NOT NULL,
  `access_road` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `bathroom` int(11) NOT NULL,
  `bedroom` int(11) NOT NULL,
  `built_up` int(11) NOT NULL,
  `features` text,
  `floors` int(11) NOT NULL,
  `furnishing` varchar(255) DEFAULT NULL,
  `land_size` int(11) NOT NULL,
  `livingroom` int(11) NOT NULL,
  `property_location` varchar(255) DEFAULT NULL,
  `property_type` varchar(255) DEFAULT NULL,
  `water_supply` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_realestate_spec`
--

INSERT INTO `tbl_realestate_spec` (`id`, `access_road`, `area`, `bathroom`, `bedroom`, `built_up`, `features`, `floors`, `furnishing`, `land_size`, `livingroom`, `property_location`, `property_type`, `water_supply`, `main_ads_id`) VALUES
(1, '5 to 8 feet', 'Bhaktapur', 4, 3, 3, 'Garden,Parking Space,Garage,Servant Quarter,Security Guards,Backup Generator,Elevator,Swimming Pool,Gymnasium', 2, 'Semi', 4, 3, 'Bhumisang House Bikrima', 'House - Individual', 'Yes', 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_replies`
--

CREATE TABLE `tbl_replies` (
  `reply_id` int(11) NOT NULL,
  `replied` bit(1) NOT NULL,
  `reply_comment` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_replies`
--

INSERT INTO `tbl_replies` (`reply_id`, `replied`, `reply_comment`, `question_id`) VALUES
(1, b'1', 'No can do !! :D', 1),
(2, b'1', 'i wont give any discount ?? this is branded !!', 4),
(3, b'1', 'tugh', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shoes_spec`
--

CREATE TABLE `tbl_shoes_spec` (
  `id` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_shoes_spec`
--

INSERT INTO `tbl_shoes_spec` (`id`, `color`, `size`, `type`, `main_ads_id`) VALUES
(1, 'brown/black', '8', 'Formal', 9),
(2, 'brown/black', '8,9,10', 'Formal', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_software_spec`
--

CREATE TABLE `tbl_software_spec` (
  `id` int(11) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sport_spec`
--

CREATE TABLE `tbl_sport_spec` (
  `id` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `gear` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `wheel_size` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_storage_spec`
--

CREATE TABLE `tbl_storage_spec` (
  `id` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_categories`
--

CREATE TABLE `tbl_sub_categories` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sub_categories`
--

INSERT INTO `tbl_sub_categories` (`sub_category_id`, `sub_category_name`, `category_id`) VALUES
(1, 'Cars', 1),
(2, 'Motorcycles', 1),
(3, 'Parts & Accessories', 1),
(4, 'Bath Toiletries ', 3),
(5, 'Electronic Cigarette & Vape', 3),
(6, 'Eye Care ', 3),
(7, 'Face Care', 3),
(8, 'Medical & Health Devices', 3),
(9, 'Cosmetics & Skin Care ', 3),
(10, 'Body Care ', 3),
(12, 'Others', 3),
(13, 'Perfumes & Fragrances ', 3),
(14, 'Book - Children & School', 2),
(15, 'Book - Educational Textbook', 2),
(16, 'Book - Fiction', 2),
(17, 'Book - Non Fiction & Biography', 2),
(18, 'Book - Other', 2),
(19, 'Book - Technology ', 2),
(20, 'Interactive & Video Learning', 2),
(21, 'Magazine & Comics ', 2),
(22, 'Stationery Items ', 2),
(23, 'Desktop Accessories ', 6),
(24, 'Desktop PC', 6),
(26, 'Laptops', 6),
(27, 'Accessories', 9),
(29, 'Dance - Music Concerts ', 4),
(30, 'Exhibitions - Trade Fairs ', 4),
(31, 'Festivals ', 4),
(32, 'Theatre-Plays-Movies ', 4),
(33, 'Workshop - Seminars ', 4),
(34, 'Baby & Children Accessories', 5),
(35, 'Baby & Children Clothing ', 5),
(36, 'Bags & Luggage ', 5),
(37, 'Jewellery ', 5),
(38, 'Men\'s Accessories ', 5),
(39, 'Men\'s Clothing ', 5),
(40, 'Men\'s Shoes ', 5),
(41, 'Others ', 5),
(42, 'Sunglasses ', 5),
(43, 'Watches ', 5),
(44, 'Women\'s Accessories ', 5),
(45, 'Women\'s Clothing ', 5),
(46, 'Women\'s Shoes ', 5),
(47, 'Amp & Speakers ', 11),
(48, 'DJ Gear & Lighting ', 11),
(49, 'Instrument - Cajon ', 11),
(50, 'Instrument - Drums ', 11),
(51, 'Instrument - Guitars ', 11),
(52, 'Instrument - Keyboard & Piano ', 11),
(53, 'Instrument - Others ', 11),
(54, 'Microphones ', 11),
(55, 'Mixer & Studio Equipments ', 11),
(56, 'Other Music Accessories ', 11),
(57, 'Pedal & Processors for Guitar ', 11),
(58, 'Aquarium & Fish Accessories ', 12),
(59, 'Kennel & Dog Accessories ', 12),
(60, 'Other Pet Accessories ', 12),
(61, 'Pet - Dogs ', 12),
(62, 'Pet - Fish ', 12),
(63, 'Pet - Other Pets ', 12),
(64, 'Pet Services ', 12),
(65, 'Flatmates & Paying Guests', 13),
(66, 'For Rent - Flat & Apartment ', 13),
(67, 'For Rent - House ', 13),
(68, 'For Rent - Land ', 13),
(69, 'For Rent - Office Space ', 13),
(70, 'For Rent - Shutter & Shop Space ', 13),
(71, 'For Sale - Commercial Property ', 13),
(72, 'For Sale - Flat & Apartment ', 13),
(73, 'For Sale - House ', 13),
(74, 'For Sale - Land ', 13),
(75, 'Advertising-Printing-Publication ', 14),
(76, 'Classes - Learning-Hobby-Music ', 14),
(77, 'Coaching & Tutors ', 14),
(78, 'Computer - Sales & Repair ', 14),
(79, 'Computer - Web & Design ', 14),
(80, 'Courses - Education & Training ', 14),
(81, 'Electronics Repair', 14),
(82, 'Event Planner & Caterers', 14),
(83, 'Financial & Legal', 14),
(85, 'Health, Fitness & Beauty', 14),
(86, 'Home Construct & Design', 14),
(87, 'Home Repair & Maintainence', 14),
(88, 'Movers Courier & Transport', 14),
(89, 'Music-Video-Photography', 14),
(90, 'Other Services', 14),
(92, 'Writing - Designing - Translating', 14),
(93, 'Bicycle Parts & Accessories', 16),
(94, 'Bicycles ', 16),
(95, 'Fitness & Gym Equipment', 16),
(96, 'Fitness Supplements', 16),
(97, 'Other Sporting Goods', 16),
(98, 'Outdoor & Hiking', 16),
(99, 'Business For Sale', 15),
(100, 'Business Offers', 15),
(101, 'Business Services', 15),
(102, 'Dealership - Franchise', 15),
(103, 'Equipments For Business', 15),
(104, 'Generator & Power Equipments', 15),
(105, 'Machinery', 15),
(106, 'Office Electronics', 15),
(107, 'Office Furniture & Fixtures', 15),
(108, 'Others', 15),
(109, 'Raw Materials', 15),
(110, 'Security & CCTV', 15),
(111, 'Supplies For Business ', 15),
(112, 'Tool & Small Machines', 15),
(113, 'Wholesale B2B', 15),
(114, 'Gaming Accessories', 17),
(115, 'Gaming Console', 17),
(116, 'Gaming Disc & Cartidges', 17),
(117, 'Others', 17),
(118, 'Toys - Educational', 17),
(119, 'Toys - General', 17),
(120, 'Toys - Outdoor', 17),
(121, 'Toys - Remote Controlled', 17),
(122, 'Toys - Stuffed, Dolls & Figures', 17),
(123, 'Air Tickets', 18),
(124, 'Bus, Train Tickets', 18),
(125, 'Car & Bike Rentals', 18),
(126, 'Day Trip & Excursion', 18),
(127, 'Hotel & Homestay', 18),
(128, 'Others', 18),
(129, 'Tour Package - Domestic', 18),
(130, 'Tour Package - International', 18),
(131, 'Trekking Package', 18),
(133, 'Antique & Collectables', 19),
(134, 'Art & Handicrafts', 19),
(135, 'Bath & Plumbing', 19),
(136, 'Construction Materials', 19),
(137, 'Food & Drinks', 19),
(138, 'Garden & Outdoor', 19),
(139, 'Home Appliances', 19),
(140, 'Home Decor & Interiors', 19),
(141, 'Home Furniture', 19),
(142, 'Inverter & Generator', 19),
(143, 'Kitchen Appliances', 19),
(144, 'Kitchenwares & Utensils', 19),
(145, 'Lightning, Solar & Electricals', 19),
(146, 'Linens & Mattress', 19),
(147, 'Others', 19),
(148, 'Tools For Home Improvement', 19),
(149, 'Handsets', 9),
(150, 'Desktop Components', 6),
(151, 'Games', 6),
(152, 'Graphic & Video Cards', 6),
(153, 'Laptop Accessories', 6),
(154, 'Monitors', 6),
(155, 'Networking Equipments', 6),
(156, 'Others', 6),
(157, 'Printers & Scanner', 6),
(158, 'Software', 6),
(159, 'Storage & Optical Drives', 6),
(160, 'Tablet Accessories', 6),
(161, 'Tablet PC & iPads', 6),
(162, 'TV Cards', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tablet_spec`
--

CREATE TABLE `tbl_tablet_spec` (
  `id` int(11) NOT NULL,
  `camera` varchar(255) DEFAULT NULL,
  `connectivity` varchar(255) DEFAULT NULL,
  `features` text,
  `internal_storage` int(11) NOT NULL,
  `os` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_travel_spec`
--

CREATE TABLE `tbl_travel_spec` (
  `id` int(11) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `inclusion` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `email` varchar(100) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`email`, `enabled`, `password`) VALUES
('abc@xyz.com', b'1', 'user123'),
('australian@gmail.com', b'1', 'user123'),
('batman@gmail.com', b'1', 'user321'),
('dawa@gmail.com', b'1', 'manjillama'),
('happy@gmail.com', b'1', 'user123'),
('heuju@gmail.com', b'1', 'admin123'),
('nepali@gmail.com', b'1', 'user123'),
('shreeya@gmail.com', b'1', 'user123'),
('sub@gmail.com', b'1', 'user123'),
('superman@gmail.com', b'1', 'user123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_roles`
--

CREATE TABLE `tbl_user_roles` (
  `user_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_roles`
--

INSERT INTO `tbl_user_roles` (`user_id`, `role`, `email`) VALUES
(1, 'ROLE_USER', 'shreeya@gmail.com'),
(2, 'ROLE_ADMIN', 'heuju@gmail.com'),
(3, 'ROLE_USER', 'batman@gmail.com'),
(4, 'ROLE_USER', 'sub@gmail.com'),
(6, 'ROLE_USER', 'superman@gmail.com'),
(7, 'ROLE_USER', 'australian@gmail.com'),
(8, 'ROLE_USER', 'happy@gmail.com'),
(9, 'ROLE_USER', 'abc@xyz.com'),
(10, 'ROLE_USER', 'dawa@gmail.com'),
(11, 'ROLE_USER', 'nepali@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warranty`
--

CREATE TABLE `tbl_warranty` (
  `id` int(11) NOT NULL,
  `warranty_includes` varchar(255) DEFAULT NULL,
  `warranty_period` varchar(255) DEFAULT NULL,
  `warranty_type` varchar(255) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_warranty`
--

INSERT INTO `tbl_warranty` (`id`, `warranty_includes`, `warranty_period`, `warranty_type`, `main_ads_id`) VALUES
(1, NULL, NULL, 'No Warranty', 1),
(2, '', '', 'No Warranty', 2),
(3, '', '', 'No Warranty', 3),
(4, '', '', 'No Warranty', 4),
(5, '', '', 'No Warranty', 5),
(6, '', '', 'No Warranty', 6),
(7, 'Servicing', '1 year', 'Dealer/Shop', 7),
(8, '', '', 'No Warranty', 8),
(9, '', '', 'No Warranty', 9),
(10, '', '', 'No Warranty', 10),
(11, '', '', 'No Warranty', 11),
(12, 'Servicing', '1 year', 'Dealer/Shop', 12),
(13, '', '', 'No Warranty', 13),
(14, 'na', '1 year', 'Dealer/Shop', 14),
(15, NULL, NULL, 'No Warranty', 16),
(16, NULL, NULL, 'No Warranty', 19),
(17, NULL, NULL, 'No Warranty', 20),
(18, '', '', 'No Warranty', 23),
(19, '', '', 'No Warranty', 24),
(20, '', '', 'No Warranty', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `main_ads_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`id`, `customer_id`, `main_ads_id`) VALUES
(1, 1, 2),
(7, 2, 1),
(8, 1, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accessory_spec`
--
ALTER TABLE `tbl_accessory_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_gi0nnlqt11wawmxsx9yloq0j8` (`main_ads_id`);

--
-- Indexes for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_business_spec`
--
ALTER TABLE `tbl_business_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_bpi7hf5jvrfqi6l1n10j2coim` (`main_ads_id`);

--
-- Indexes for table `tbl_cars`
--
ALTER TABLE `tbl_cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `FKh7kgbjgcd206lp4sy4nq4f2mq` (`brand_id`);

--
-- Indexes for table `tbl_car_spec`
--
ALTER TABLE `tbl_car_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_1u17fojcd8md1xfmrwfeinnv2` (`main_ads_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_clothing_spec`
--
ALTER TABLE `tbl_clothing_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_k8hn559wa89whmf1v832kukkg` (`main_ads_id`);

--
-- Indexes for table `tbl_common_spec`
--
ALTER TABLE `tbl_common_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_17f2o1wwior1r1v9t80djpnhi` (`main_ads_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `UK_53apr70l6f1evldp5dn3mx01t` (`email`);

--
-- Indexes for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4f0e09bwyvw1yjqapx6rsvi1v` (`main_ads_id`);

--
-- Indexes for table `tbl_handset_spec`
--
ALTER TABLE `tbl_handset_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_j7pox8t4t8dutqm6wclmw3r4u` (`main_ads_id`);

--
-- Indexes for table `tbl_housings`
--
ALTER TABLE `tbl_housings`
  ADD PRIMARY KEY (`housing_id`),
  ADD KEY `FKhcleixni4e0je6ywc3gdje11d` (`brand_id`);

--
-- Indexes for table `tbl_laptop_spec`
--
ALTER TABLE `tbl_laptop_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_b0j30h926ype979vj4ady3b18` (`main_ads_id`);

--
-- Indexes for table `tbl_main_ads`
--
ALTER TABLE `tbl_main_ads`
  ADD PRIMARY KEY (`main_ads_id`),
  ADD KEY `FKk6mq8gap59wgo1g32a0w9lmtw` (`customer_id`),
  ADD KEY `FKs8278tj56vm4jlhwq51jvflr0` (`sub_category_id`),
  ADD KEY `FKtjjjxu74waiumx1s6j8uklw59` (`model_id`);

--
-- Indexes for table `tbl_models`
--
ALTER TABLE `tbl_models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `FK8mkkeqdyfxx58fc56xuti0fqy` (`sub_category_id`);

--
-- Indexes for table `tbl_monitor_spec`
--
ALTER TABLE `tbl_monitor_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_h3etcfj0fu91kf4fi70v14q93` (`main_ads_id`);

--
-- Indexes for table `tbl_motocycle_spec`
--
ALTER TABLE `tbl_motocycle_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_dkc20hjg5l713q30o70uehuhc` (`main_ads_id`);

--
-- Indexes for table `tbl_networking_equipment_spec`
--
ALTER TABLE `tbl_networking_equipment_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_f680cu0vr1vbmw50gig9fe2st` (`main_ads_id`);

--
-- Indexes for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK50q7xmvpnxod49bqoj3467xo4` (`car_id`),
  ADD KEY `FKq9ol84g3pfgi6aoa91m1stigg` (`housing_id`),
  ADD KEY `FK9emcdm6kvrxetm9eki39jw870` (`main_ads_id`);

--
-- Indexes for table `tbl_printer_spec`
--
ALTER TABLE `tbl_printer_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_d7hafx9ucnnja162u3kaonqcl` (`main_ads_id`);

--
-- Indexes for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `FKnhsolde2yroctxt5uwmyo00n0` (`asked_by`),
  ADD KEY `FKp1ivmneg78hdyru4mxvc4g6yb` (`asked_to`),
  ADD KEY `FK83d6ghq52ee06x2npa9gsxsh9` (`main_ads_id`);

--
-- Indexes for table `tbl_realestate_spec`
--
ALTER TABLE `tbl_realestate_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_r3yo0t08ll3seb2juakl8wrve` (`main_ads_id`);

--
-- Indexes for table `tbl_replies`
--
ALTER TABLE `tbl_replies`
  ADD PRIMARY KEY (`reply_id`),
  ADD UNIQUE KEY `UK_49e1fivkympkbjcgn66vwonlw` (`question_id`);

--
-- Indexes for table `tbl_shoes_spec`
--
ALTER TABLE `tbl_shoes_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6p6rftd4sxmywlb23epvfbeqx` (`main_ads_id`);

--
-- Indexes for table `tbl_software_spec`
--
ALTER TABLE `tbl_software_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6gx984b37bu3ae3iekdp847nb` (`main_ads_id`);

--
-- Indexes for table `tbl_sport_spec`
--
ALTER TABLE `tbl_sport_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_m87fpvksa8yh7igcqsuip9uwj` (`main_ads_id`);

--
-- Indexes for table `tbl_storage_spec`
--
ALTER TABLE `tbl_storage_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_qpocs37dcfg1ocb6lysyxh5sv` (`main_ads_id`);

--
-- Indexes for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD KEY `FK7xaukr1d9ih5qhb8wngsww5j9` (`category_id`);

--
-- Indexes for table `tbl_tablet_spec`
--
ALTER TABLE `tbl_tablet_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_l2kt6lrxwito6jf00yo8tkull` (`main_ads_id`);

--
-- Indexes for table `tbl_travel_spec`
--
ALTER TABLE `tbl_travel_spec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_cgoq0yiw9204mqpuexoxy17v2` (`main_ads_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_5t43qttqbxahbkn9fhdjm0olt` (`email`);

--
-- Indexes for table `tbl_warranty`
--
ALTER TABLE `tbl_warranty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_i6jcy2s0o9vaiewf1hcouhbga` (`main_ads_id`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg3sxldi1r42yxo0rwf4j2oeu9` (`customer_id`),
  ADD KEY `FKp98ui4aed5inudxhh8r3vv2kv` (`main_ads_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accessory_spec`
--
ALTER TABLE `tbl_accessory_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_business_spec`
--
ALTER TABLE `tbl_business_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_cars`
--
ALTER TABLE `tbl_cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_car_spec`
--
ALTER TABLE `tbl_car_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_clothing_spec`
--
ALTER TABLE `tbl_clothing_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_common_spec`
--
ALTER TABLE `tbl_common_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_handset_spec`
--
ALTER TABLE `tbl_handset_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_housings`
--
ALTER TABLE `tbl_housings`
  MODIFY `housing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_laptop_spec`
--
ALTER TABLE `tbl_laptop_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_main_ads`
--
ALTER TABLE `tbl_main_ads`
  MODIFY `main_ads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `tbl_monitor_spec`
--
ALTER TABLE `tbl_monitor_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_motocycle_spec`
--
ALTER TABLE `tbl_motocycle_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_networking_equipment_spec`
--
ALTER TABLE `tbl_networking_equipment_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;
--
-- AUTO_INCREMENT for table `tbl_printer_spec`
--
ALTER TABLE `tbl_printer_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_realestate_spec`
--
ALTER TABLE `tbl_realestate_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_replies`
--
ALTER TABLE `tbl_replies`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_shoes_spec`
--
ALTER TABLE `tbl_shoes_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_software_spec`
--
ALTER TABLE `tbl_software_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sport_spec`
--
ALTER TABLE `tbl_sport_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_storage_spec`
--
ALTER TABLE `tbl_storage_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT for table `tbl_tablet_spec`
--
ALTER TABLE `tbl_tablet_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_travel_spec`
--
ALTER TABLE `tbl_travel_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_warranty`
--
ALTER TABLE `tbl_warranty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_accessory_spec`
--
ALTER TABLE `tbl_accessory_spec`
  ADD CONSTRAINT `FKspcn47hcp7jjwi15ocyworrn6` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_business_spec`
--
ALTER TABLE `tbl_business_spec`
  ADD CONSTRAINT `FKdb3l2op7egwydotf4t6g5jqnn` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_cars`
--
ALTER TABLE `tbl_cars`
  ADD CONSTRAINT `FKh7kgbjgcd206lp4sy4nq4f2mq` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brands` (`brand_id`);

--
-- Constraints for table `tbl_car_spec`
--
ALTER TABLE `tbl_car_spec`
  ADD CONSTRAINT `FK5wbvcyr22ynwnib0bf6sto1h0` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_clothing_spec`
--
ALTER TABLE `tbl_clothing_spec`
  ADD CONSTRAINT `FKte7bbxor72vbronfyg5o77t` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_common_spec`
--
ALTER TABLE `tbl_common_spec`
  ADD CONSTRAINT `FKku1j8este8isjlxvbad6axsxu` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD CONSTRAINT `FKbuvsx8yc87qd3acrpdb131lml` FOREIGN KEY (`email`) REFERENCES `tbl_users` (`email`);

--
-- Constraints for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD CONSTRAINT `FKr8k2ioh82utjsec67xjqhi0ho` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_handset_spec`
--
ALTER TABLE `tbl_handset_spec`
  ADD CONSTRAINT `FKh809gj6s2wcr0d3pydhpr2e8a` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_housings`
--
ALTER TABLE `tbl_housings`
  ADD CONSTRAINT `FKhcleixni4e0je6ywc3gdje11d` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brands` (`brand_id`);

--
-- Constraints for table `tbl_laptop_spec`
--
ALTER TABLE `tbl_laptop_spec`
  ADD CONSTRAINT `FK3owqffxw6qtfevxjwmtxniha5` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_main_ads`
--
ALTER TABLE `tbl_main_ads`
  ADD CONSTRAINT `FKk6mq8gap59wgo1g32a0w9lmtw` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`),
  ADD CONSTRAINT `FKs8278tj56vm4jlhwq51jvflr0` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_sub_categories` (`sub_category_id`),
  ADD CONSTRAINT `FKtjjjxu74waiumx1s6j8uklw59` FOREIGN KEY (`model_id`) REFERENCES `tbl_models` (`model_id`);

--
-- Constraints for table `tbl_models`
--
ALTER TABLE `tbl_models`
  ADD CONSTRAINT `FK8mkkeqdyfxx58fc56xuti0fqy` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_sub_categories` (`sub_category_id`);

--
-- Constraints for table `tbl_monitor_spec`
--
ALTER TABLE `tbl_monitor_spec`
  ADD CONSTRAINT `FKht09d997q3ei2sc80x091a3n` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_motocycle_spec`
--
ALTER TABLE `tbl_motocycle_spec`
  ADD CONSTRAINT `FKb33q1hysamammanr6qavtlnb5` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_networking_equipment_spec`
--
ALTER TABLE `tbl_networking_equipment_spec`
  ADD CONSTRAINT `FKixty957j01gdee0s2home5cog` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  ADD CONSTRAINT `FK50q7xmvpnxod49bqoj3467xo4` FOREIGN KEY (`car_id`) REFERENCES `tbl_cars` (`car_id`),
  ADD CONSTRAINT `FK9emcdm6kvrxetm9eki39jw870` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`),
  ADD CONSTRAINT `FKq9ol84g3pfgi6aoa91m1stigg` FOREIGN KEY (`housing_id`) REFERENCES `tbl_housings` (`housing_id`);

--
-- Constraints for table `tbl_printer_spec`
--
ALTER TABLE `tbl_printer_spec`
  ADD CONSTRAINT `FKmo8ti2f857kl5rsk30qcaebt3` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD CONSTRAINT `FK83d6ghq52ee06x2npa9gsxsh9` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`),
  ADD CONSTRAINT `FKnhsolde2yroctxt5uwmyo00n0` FOREIGN KEY (`asked_by`) REFERENCES `tbl_customer` (`customer_id`),
  ADD CONSTRAINT `FKp1ivmneg78hdyru4mxvc4g6yb` FOREIGN KEY (`asked_to`) REFERENCES `tbl_customer` (`customer_id`);

--
-- Constraints for table `tbl_realestate_spec`
--
ALTER TABLE `tbl_realestate_spec`
  ADD CONSTRAINT `FK72sds1ponoup74hqq7fnaaj8h` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_replies`
--
ALTER TABLE `tbl_replies`
  ADD CONSTRAINT `FKpvx9j06ygcf10b8o91xthofjm` FOREIGN KEY (`question_id`) REFERENCES `tbl_questions` (`question_id`);

--
-- Constraints for table `tbl_shoes_spec`
--
ALTER TABLE `tbl_shoes_spec`
  ADD CONSTRAINT `FKclg9o6vwj6dkgouv212p74f5d` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_software_spec`
--
ALTER TABLE `tbl_software_spec`
  ADD CONSTRAINT `FKhn6m75dldgocuskkqeibsh5il` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_sport_spec`
--
ALTER TABLE `tbl_sport_spec`
  ADD CONSTRAINT `FKmholtyfo8dwkl33ursdbxo4y3` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_storage_spec`
--
ALTER TABLE `tbl_storage_spec`
  ADD CONSTRAINT `FKh70bolp0wbmr2lhngw5jl7sil` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  ADD CONSTRAINT `FK7xaukr1d9ih5qhb8wngsww5j9` FOREIGN KEY (`category_id`) REFERENCES `tbl_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tablet_spec`
--
ALTER TABLE `tbl_tablet_spec`
  ADD CONSTRAINT `FKbferk7hfysmvtm43nmqujkgmt` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_travel_spec`
--
ALTER TABLE `tbl_travel_spec`
  ADD CONSTRAINT `FKl43ussfui42ff29breai6rtgk` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD CONSTRAINT `FK6q4m6o6s180njlpn81qk20l1q` FOREIGN KEY (`email`) REFERENCES `tbl_users` (`email`);

--
-- Constraints for table `tbl_warranty`
--
ALTER TABLE `tbl_warranty`
  ADD CONSTRAINT `FK34cvxo96n13atrbibiaasgvok` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

--
-- Constraints for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD CONSTRAINT `FKg3sxldi1r42yxo0rwf4j2oeu9` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`),
  ADD CONSTRAINT `FKp98ui4aed5inudxhh8r3vv2kv` FOREIGN KEY (`main_ads_id`) REFERENCES `tbl_main_ads` (`main_ads_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
