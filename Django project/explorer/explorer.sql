-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2023 at 02:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `explorer`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add gallery', 10, 'add_gallery'),
(38, 'Can change gallery', 10, 'change_gallery'),
(39, 'Can delete gallery', 10, 'delete_gallery'),
(40, 'Can view gallery', 10, 'view_gallery'),
(41, 'Can add cart', 11, 'add_cart'),
(42, 'Can change cart', 11, 'change_cart'),
(43, 'Can delete cart', 11, 'delete_cart'),
(44, 'Can view cart', 11, 'view_cart'),
(45, 'Can add order', 12, 'add_order'),
(46, 'Can change order', 12, 'change_order'),
(47, 'Can delete order', 12, 'delete_order'),
(48, 'Can view order', 12, 'view_order'),
(49, 'Can add feedback', 13, 'add_feedback'),
(50, 'Can change feedback', 13, 'change_feedback'),
(51, 'Can delete feedback', 13, 'delete_feedback'),
(52, 'Can view feedback', 13, 'view_feedback'),
(53, 'Can add feedback1', 13, 'add_feedback1'),
(54, 'Can change feedback1', 13, 'change_feedback1'),
(55, 'Can delete feedback1', 13, 'delete_feedback1'),
(56, 'Can view feedback1', 13, 'view_feedback1'),
(57, 'Can add order1', 12, 'add_order1'),
(58, 'Can change order1', 12, 'change_order1'),
(59, 'Can delete order1', 12, 'delete_order1'),
(60, 'Can view order1', 12, 'view_order1');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$FXfLxLJFpP5vSxJ4Ptg03f$nksJYkdIAatoXD36e8C2rwvawYu2ssrigrPz4LAX5nc=', NULL, 1, 'manish', '', '', 'kalalmanish44@gmail.com', 1, 1, '2022-09-27 03:17:38.057982');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(11, 'website', 'cart'),
(7, 'website', 'category'),
(8, 'website', 'customer'),
(13, 'website', 'feedback1'),
(10, 'website', 'gallery'),
(12, 'website', 'order1'),
(9, 'website', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-07 16:49:38.968425'),
(2, 'auth', '0001_initial', '2020-09-07 16:49:40.320586'),
(3, 'admin', '0001_initial', '2020-09-07 16:49:45.558692'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-07 16:49:47.156858'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-07 16:49:47.187833'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-07 16:49:47.758079'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-07 16:49:48.433662'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-07 16:49:48.547591'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-07 16:49:48.583569'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-07 16:49:49.133049'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-07 16:49:49.151037'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-07 16:49:49.195012'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-07 16:49:49.281964'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-07 16:49:49.399883'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-07 16:49:49.483834'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-07 16:49:49.517812'),
(17, 'sessions', '0001_initial', '2020-09-07 16:49:50.081932'),
(18, 'website', '0001_initial', '2020-09-07 16:49:50.602611'),
(19, 'website', '0002_customer_is_block', '2020-09-09 09:22:57.950576'),
(20, 'website', '0003_product', '2020-09-10 04:51:40.953709'),
(21, 'website', '0004_auto_20200910_1024', '2020-09-10 04:55:13.471782'),
(22, 'website', '0005_auto_20200910_1024', '2020-09-10 04:55:13.570720'),
(23, 'website', '0006_auto_20200912_1720', '2020-09-12 11:50:39.654166'),
(24, 'website', '0007_gallery', '2020-09-19 08:55:21.840654'),
(25, 'website', '0008_auto_20200928_1630', '2020-09-28 11:00:36.428393'),
(26, 'website', '0009_auto_20200928_1645', '2020-09-28 11:15:32.175996'),
(27, 'website', '0010_product_created_date', '2020-10-04 09:37:44.398096'),
(28, 'website', '0011_auto_20201011_1251', '2020-10-11 07:21:31.644556'),
(29, 'website', '0012_cart', '2020-10-17 08:52:55.497285'),
(30, 'auth', '0012_alter_user_first_name_max_length', '2020-10-31 14:35:39.691169'),
(31, 'website', '0013_auto_20201031_2005', '2020-10-31 14:35:39.740863'),
(32, 'website', '0014_auto_20201101_2033', '2020-11-01 15:04:05.989418'),
(33, 'website', '0015_customer_bill_city', '2020-11-01 15:05:08.749734'),
(34, 'website', '0016_auto_20201102_1530', '2020-11-02 10:01:11.264596'),
(35, 'website', '0017_auto_20201121_1545', '2020-11-21 10:15:15.684176'),
(36, 'website', '0018_auto_20201130_1448', '2020-11-30 09:19:22.673030'),
(37, 'website', '0019_auto_20201201_1443', '2020-12-01 09:13:38.747273'),
(38, 'website', '0020_auto_20201202_1027', '2020-12-02 04:57:44.952160');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('126maf6cr92v216ig91pklg4ou1fylsr', 'NzI2MWU1MWE3NTg1OTkwY2I0YTJlOWJiNjcwZGZjN2U1OTIzMDQ0OTp7ImlzX2xvZ2dlZCI6dHJ1ZX0=', '2020-09-27 03:56:16.259574'),
('68wotghuwqn7m7felxdgh0d7ncvdl3yw', 'MDM2ZDg3YTg3YjRhMThhYjhhMWE0ZWMyNWIxNmVmNjhkYzI2NTI4NTp7fQ==', '2020-10-19 10:12:25.395323'),
('7nzhvotghcqax6dooynfkujdtzyqh5fu', 'e30:1kkI7t:9K9Z90ZDn-RqEcOPQTyYIbSZsdHnkyJZTyWIqVJN3OY', '2020-12-16 02:44:17.825177'),
('7w8wwrep9mhyukhh3iydbd71p6byyy8h', 'eyJpc19sb2dnZWRfY3VzdCI6InJhaHVsQGdtYWlsLmNvbSIsImlzX2xvZ2dlZCI6dHJ1ZX0:1kZGEB:T_a7SlQ98vua5dHVDI_9aYSTK4YD6tsOzxuwTnJK9m4', '2020-11-15 16:29:11.420862'),
('bm425cb187n6wxovl2q5u8e1p7zyu7ro', 'eyJpc19sb2dnZWQiOnRydWUsImlzX2xvZ2dlZF9jdXN0IjoicmFodWxAZ21haWwuY29tIn0:1kkKAJ:zHiVv6_od0LbXuqqRbrLuwHDqlhgkaU8_VK0qVA1JZ4', '2020-12-16 04:54:55.456538'),
('h41qlnkyjs3ochclhvexyz0vuaytn4yq', 'NjBkOTU2NjEwNjk5NmE2MWEzNGM0YTYyYWNmZmY5NjQzN2IzNmRiMzp7ImlzX2xvZ2dlZCI6dHJ1ZSwiaXNfbG9nZ2VkX2N1c3QiOiJwYW5rYWprYWxhbDM4M0BnbWFpbC5jb20ifQ==', '2020-10-31 09:31:21.199831'),
('kc6b3i2hkzeql1ms3sax78e2c2472nxv', 'eyJpc19sb2dnZWQiOnRydWV9:1od1AI:9FWlNgSHcmQ5YTafo8AD5k3GyToq-Z-KH2fwvQx0vXA', '2022-10-11 03:21:46.305576');

-- --------------------------------------------------------

--
-- Table structure for table `website_cart`
--

CREATE TABLE `website_cart` (
  `cart_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_cart`
--

INSERT INTO `website_cart` (`cart_id`, `qty`, `cust_id`, `p_id`) VALUES
(16, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_category`
--

CREATE TABLE `website_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(20) NOT NULL,
  `cat_desc` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_category`
--

INSERT INTO `website_category` (`cat_id`, `cat_name`, `cat_desc`) VALUES
(1, 'Camping Bags', 'All types of bag'),
(2, 'Camping Furniture', 'Furniture like chair, table etc'),
(3, 'Camping Kitchen', 'Kitchen equipment like gas, stove and lunchbox.'),
(4, 'Camping Tents', 'Tents for sleeping and staying.'),
(5, 'Camping Tools', 'Tools like torch,knife etc');

-- --------------------------------------------------------

--
-- Table structure for table `website_customer`
--

CREATE TABLE `website_customer` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_block` tinyint(1) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `bill_pin` int(11) DEFAULT NULL,
  `bill_add` varchar(255) DEFAULT NULL,
  `bill_city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_customer`
--

INSERT INTO `website_customer` (`cust_id`, `cust_name`, `email`, `password`, `gender`, `is_admin`, `is_block`, `contact_no`, `dob`, `bill_pin`, `bill_add`, `bill_city`) VALUES
(1, 'Pankaj Kalal', 'pankajkalal383@gmail.com', 'pankaj1998', 0, 1, 0, '8460415017', '1998-07-06', NULL, NULL, NULL),
(2, 'Padmanaban Pillai', 'pillai@gmail.com', 'pillai1997', 0, 0, 0, '6333458475', '1997-07-26', 382340, 'Amrajinagar near bhargav road kubernager', 'Ahmedabad'),
(3, 'Manish Kalal', 'manish@gmail.com', 'manish@1997', 0, 0, 1, '8457968585', '1998-07-06', 458975, 'pooja apartment, vasna', 'surat'),
(5, 'Nikita Kasta', 'nikitakasta77@gmail.com', 'niki123', 1, 0, 0, '8795868475', '1998-07-07', 458975, 'vidyanagr near temple,hiravadi', 'surat'),
(6, 'Chintak Doshi', 'chintak@gmail.com', 'chintak1234', 0, 0, 0, '9485857878', '1999-02-14', 382387, 'Savitri nagar meghaningar', 'ahmedabad'),
(9, 'Rahul Chaoudary', 'rahul@gmail.com', 'rahul123', 0, 0, 0, '7875475444', '2000-09-25', 382340, 'Amrajinagar near bhargav road kubernager', 'ahmedabad');

-- --------------------------------------------------------

--
-- Table structure for table `website_feedback1`
--

CREATE TABLE `website_feedback1` (
  `f_id` int(11) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_feedback1`
--

INSERT INTO `website_feedback1` (`f_id`, `feedback`, `cust_id`, `p_id`) VALUES
(3, 'Bag is awesome. value for money', 6, 1),
(4, 'My all Stuff is fill in this bag. i like it.', 3, 1),
(5, 'Damage product received', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `website_gallery`
--

CREATE TABLE `website_gallery` (
  `g_id` int(11) NOT NULL,
  `p_image` varchar(200) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_gallery`
--

INSERT INTO `website_gallery` (`g_id`, `p_image`, `p_id`) VALUES
(5, '/website/product_Images/Coletherm%20Sleeping%20Bag.jpg', 1),
(6, '/website/product_Images/Coletherm%20Sleeping%20Bag_2.jpg', 1),
(7, '/website/product_Images/Coletherm%20Sleeping%20Bag_3.jpg', 1),
(8, '/website/product_Images/Coletherm%20Sleeping%20Bag_4.jpg', 1),
(9, '/website/product_Images/Polestar%2055L%20Backpack.jpg', 2),
(10, '/website/product_Images/Polestar%2055L%20Backpack_2.jpg', 2),
(11, '/website/product_Images/Polestar%2055L%20Backpack_3.jpg', 2),
(13, '/website/product_Images/Coleman%20Cot%20Converta.jpg', 3),
(14, '/website/product_Images/Coleman%20Cot%20Converta_2.jpg', 3),
(15, '/website/product_Images/Coleman%20Cot%20Converta_3.jpg', 3),
(16, '/website/product_Images/Kurtzy%20Folding%20Table.jpg', 4),
(17, '/website/product_Images/Kurtzy%20Folding%20Table_2.jpg', 4),
(18, '/website/product_Images/Kurtzy%20Folding%20Table_3.jpg', 4),
(20, '/website/product_Images/ROYAL%20Camping%20Burner%20.jpg', 5),
(21, '/website/product_Images/ROYAL%20Camping%20Burner%20_2.jpg', 5),
(22, '/website/product_Images/ROYAL%20Camping%20Burner%20_3.jpg', 5),
(23, '/website/product_Images/ROYAL%20Camping%20Burner%20_4.jpg', 5),
(24, '/website/product_Images/CAMPSOR%20Pots%20Pans%20Bowls.jpg', 6),
(25, '/website/product_Images/CAMPSOR%20Pots%20Pans%20Bowls_2.jpg', 6),
(26, '/website/product_Images/CAMPSOR%20Pots%20Pans%20Bowls_3.jpg', 6),
(27, '/website/product_Images/Headlight.jpg', 9),
(28, '/website/product_Images/Flashlight.jpg', 10),
(29, '/website/product_Images/Walking%20Stick.jpg', 11),
(30, '/website/product_Images/And%20Retails%20Cloth%20Changing%20Tent.jpg', 7),
(31, '/website/product_Images/And%20Retails%20Cloth%20Changing%20Tent_2.jpg', 7),
(32, '/website/product_Images/And%20Retails%20Cloth%20Changing%20Tent_3.jpg', 7),
(33, '/website/product_Images/Basics%204%20Person%20Tent.jpg', 8),
(34, '/website/product_Images/Basics%204%20Person%20Tent_2.jpg', 8),
(35, '/website/product_Images/Basics%204%20Person%20Tent_3.jpg', 8),
(36, '/website/product_Images/Trawoc%2065L%20Backpack.jpg', 13),
(37, '/website/product_Images/Trawoc%2065L%20Backpack_2.jpg', 13),
(38, '/website/product_Images/Trawoc%2065L%20Backpack_3.jpg', 13),
(39, '/website/product_Images/Trawoc%2065L%20Backpack_4.jpg', 13),
(40, '/website/product_Images/Sportneer%20Sleeping%20Bag.jpg', 14),
(41, '/website/product_Images/Sportneer%20Sleeping%20Bag_2.jpg', 14),
(42, '/website/product_Images/Sportneer%20Sleeping%20Bag_3.jpg', 14),
(43, '/website/product_Images/Sportneer%20Sleeping%20Bag_4.jpg', 14),
(44, '/website/product_Images/Knife.jpg', 15),
(45, '/website/product_Images/Ohuhu%20Camping%20Stove.jpg', 16),
(46, '/website/product_Images/Ohuhu%20Camping%20Stove_2.jpg', 16),
(47, '/website/product_Images/Ohuhu%20Camping%20Stove_3.jpg', 16),
(48, '/website/product_Images/Ohuhu%20Camping%20Stove_4.jpg', 16);

-- --------------------------------------------------------

--
-- Table structure for table `website_order1`
--

CREATE TABLE `website_order1` (
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `t_amt` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `ship_add` varchar(255) DEFAULT NULL,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_pin` int(11) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_order1`
--

INSERT INTO `website_order1` (`order_id`, `qty`, `t_amt`, `flag`, `ship_add`, `ship_city`, `ship_pin`, `date`, `order_status`, `payment_status`, `cust_id`, `p_id`) VALUES
(9, 1, 2279, 6778176, 'amrajinagar near bhargav road kubernager', 'ahmedabad', 382340, '2020-11-21 15:33:41.000000', 0, 0, 9, 13),
(10, 2, 1198, 4153976, 'Amrajinagar near bhargav road kubernager', 'ahmedabad', 382340, '2020-11-23 11:42:20.302719', 2, 0, 2, 10),
(14, 3, 4317, 3068724, '45 Priya aparment near krishnagar', 'ahmedabad', 382345, '2020-12-02 10:28:07.529258', 1, 0, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_product`
--

CREATE TABLE `website_product` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_desc` varchar(250) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `p_image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_product`
--

INSERT INTO `website_product` (`p_id`, `p_name`, `p_price`, `p_desc`, `cat_id`, `created_date`, `p_image`) VALUES
(1, 'Coletherm Sleeping Bag', 1439, 'Brand: Coletherm Color: Green & Grey ', 1, '2020-09-25', '/website/product_Images/Coletherm%20Sleeping%20Bag.jpg'),
(2, 'Polestar 55L Backpack', 1919, 'Brand: Polestar\r\nColor: Blue and Black\r\nRAIN COVER & WATERPROOF', 1, '2020-10-04', '/website/product_Images/Polestar%2055L%20Backpack.jpg'),
(3, 'Coleman Cot Converta', 2725, 'Brand: Coleman\r\nColor: Brown\r\nPowder-coated, rust-resistant, steel frame.', 2, '2020-10-04', '/website/product_Images/Coleman%20Cot%20Converta.jpg'),
(4, 'Kurtzy Folding Table', 2999, 'Brand: Kurtzy\r\nColor: Green\r\nAluminium Folding Table for \r\nPicnic Camping.', 2, '2020-09-25', '/website/product_Images/Kurtzy%20Folding%20Table.jpg'),
(5, 'ROYAL Camping Burner ', 899, 'Brand: ROYAL\r\nColor: Red\r\nportable design, ideal equipment for camping', 3, '2020-09-25', '/website/product_Images/ROYAL%20Camping%20Burner%20.jpg'),
(6, 'CAMPSOR Pots Pans Bowls', 1790, 'Brand: CAMPSOR\r\nColor: Black\r\n7pcs Portable Non-Stick Pots Pans Bowls.', 3, '2020-09-25', '/website/product_Images/CAMPSOR%20Pots%20Pans%20Bowls.jpg'),
(7, 'And Retails Cloth Changing Tent', 1449, 'Brand: And Retails\r\nColor: Dark Green\r\nGoing on vacation, camping and picnic,\r\nThis tent is must have for all, \r\nespecially for those travelling with women', 4, '2020-09-25', '/website/product_Images/And%20Retails%20Cloth%20Changing%20Tent.jpg'),
(8, 'Basics 4 Person Tent', 2679, 'Brand: Basics\r\nColor: Yellow and Grey\r\nDome-style, free-standing tent accommodates up to 4 people \r\nworks well for 3-season camping.', 4, '2020-09-25', '/website/product_Images/Basics%204%20Person%20Tent.jpg'),
(9, 'Headlight', 749, 'Brand: Coleman \r\nColor: Black\r\nLighting range : 50 meters\r\nBurning time: 12 hours\r\nBattery: 3 AAA', 5, '2020-09-25', '/website/product_Images/Headlight.jpg'),
(10, 'Flashlight', 599, 'Brand: German aluminium\r\nColor: Black\r\nPatented Advanced Focus System\r\nAircraft Grade Aluminum Construction Body\r\nHigh End Power LED', 5, '2020-10-07', '/website/product_Images/Flashlight.jpg'),
(11, 'Walking Stick', 2149, 'Brand: WFutaba\r\nColor: Black & Blue\r\nTelescopic Carbon Walking Stick for Hiking/Trekking/Camping \r\nAdjustable length from approximately 50-110cm.', 5, '2020-09-25', '/website/product_Images/Walking%20Stick.jpg'),
(13, 'Trawoc 65L Backpack', 2279, 'Brand: Trawoc\r\ncolor: Grey\r\nLARGE, SPACIOUS & MULTI UTILITY\r\nRAIN COVER & WATER PROOF BASE\r\nSHOE COMPARTMENT\r\nWATER RESISTANT', 1, '2020-10-10', '/website/product_Images/Trawoc%2065L%20Backpack.jpg'),
(14, 'Sportneer Sleeping Bag', 1899, 'Brand: Sportneer\r\nColor: Blue\r\nWARM COTTON FILLING\r\nWEARABLE, INNOVATIVE ZIPPER DESIGN\r\nDURABLE AND WEATHER-RESISTANT\r\nLIGHTWEIGHT AND PORTABLE', 1, '2020-10-10', '/website/product_Images/Sportneer%20Sleeping%20Bag.jpg'),
(15, 'Knife', 259, 'Brand: Rustom handicrafts\r\nColor: green\r\nBest usage for hiking camping activities', 5, '2020-10-10', '/website/product_Images/Knife.jpg'),
(16, 'Ohuhu Camping Stove', 1299, 'Brand: Ohuhu\r\nColor: Silver\r\nStainless Steel Backpacking Stove Potable, \r\nWood Burning Stoves for Picnic .', 3, '2020-10-10', '/website/product_Images/Ohuhu%20Camping%20Stove.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `website_cart`
--
ALTER TABLE `website_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `website_cart_cust_id_4eb9f214_fk_website_customer_cust_id` (`cust_id`),
  ADD KEY `website_cart_p_id_0d2d51a0_fk_website_product_p_id` (`p_id`);

--
-- Indexes for table `website_category`
--
ALTER TABLE `website_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `website_customer`
--
ALTER TABLE `website_customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `website_feedback1`
--
ALTER TABLE `website_feedback1`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `website_feedback_cust_id_603f6d7a_fk_website_customer_cust_id` (`cust_id`),
  ADD KEY `website_feedback_p_id_52ccb3ef_fk_website_product_p_id` (`p_id`);

--
-- Indexes for table `website_gallery`
--
ALTER TABLE `website_gallery`
  ADD PRIMARY KEY (`g_id`),
  ADD KEY `website_gallery_p_id_edbe1744_fk_website_product_p_id` (`p_id`);

--
-- Indexes for table `website_order1`
--
ALTER TABLE `website_order1`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `website_order_cust_id_2ef33f48_fk_website_customer_cust_id` (`cust_id`),
  ADD KEY `website_order_p_id_ebe64592_fk_website_product_p_id` (`p_id`);

--
-- Indexes for table `website_product`
--
ALTER TABLE `website_product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `website_product_cat_id_c6a82d36_fk_website_category_cat_id` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `website_cart`
--
ALTER TABLE `website_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `website_category`
--
ALTER TABLE `website_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `website_customer`
--
ALTER TABLE `website_customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `website_feedback1`
--
ALTER TABLE `website_feedback1`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `website_gallery`
--
ALTER TABLE `website_gallery`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `website_order1`
--
ALTER TABLE `website_order1`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `website_product`
--
ALTER TABLE `website_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_cart`
--
ALTER TABLE `website_cart`
  ADD CONSTRAINT `website_cart_cust_id_4eb9f214_fk_website_customer_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `website_customer` (`cust_id`),
  ADD CONSTRAINT `website_cart_p_id_0d2d51a0_fk_website_product_p_id` FOREIGN KEY (`p_id`) REFERENCES `website_product` (`p_id`);

--
-- Constraints for table `website_feedback1`
--
ALTER TABLE `website_feedback1`
  ADD CONSTRAINT `website_feedback_cust_id_603f6d7a_fk_website_customer_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `website_customer` (`cust_id`),
  ADD CONSTRAINT `website_feedback_p_id_52ccb3ef_fk_website_product_p_id` FOREIGN KEY (`p_id`) REFERENCES `website_product` (`p_id`);

--
-- Constraints for table `website_gallery`
--
ALTER TABLE `website_gallery`
  ADD CONSTRAINT `website_gallery_p_id_edbe1744_fk_website_product_p_id` FOREIGN KEY (`p_id`) REFERENCES `website_product` (`p_id`);

--
-- Constraints for table `website_order1`
--
ALTER TABLE `website_order1`
  ADD CONSTRAINT `website_order_cust_id_2ef33f48_fk_website_customer_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `website_customer` (`cust_id`),
  ADD CONSTRAINT `website_order_p_id_ebe64592_fk_website_product_p_id` FOREIGN KEY (`p_id`) REFERENCES `website_product` (`p_id`);

--
-- Constraints for table `website_product`
--
ALTER TABLE `website_product`
  ADD CONSTRAINT `website_product_cat_id_c6a82d36_fk_website_category_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `website_category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
