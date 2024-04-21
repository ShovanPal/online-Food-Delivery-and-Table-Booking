-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2024 at 07:27 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_delivery1`
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
  `id` bigint(20) NOT NULL,
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add menu', 6, 'add_menu'),
(22, 'Can change menu', 6, 'change_menu'),
(23, 'Can delete menu', 6, 'delete_menu'),
(24, 'Can view menu', 6, 'view_menu'),
(25, 'Can add item', 7, 'add_item'),
(26, 'Can change item', 7, 'change_item'),
(27, 'Can delete item', 7, 'delete_item'),
(28, 'Can view item', 7, 'view_item'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add cart item', 9, 'add_cartitem'),
(34, 'Can change cart item', 9, 'change_cartitem'),
(35, 'Can delete cart item', 9, 'delete_cartitem'),
(36, 'Can view cart item', 9, 'view_cartitem'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order');

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-18 08:30:57.438531', '1', 'Pizza[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(2, '2024-04-18 08:32:37.808317', '1', 'Onion Pizza', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-04-18 20:47:34.826098', '2', 'Burger[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(4, '2024-04-18 20:47:50.105485', '3', 'Pizza[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(5, '2024-04-18 20:48:10.633811', '4', 'Burger[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(6, '2024-04-18 20:49:01.654825', '5', 'Momo[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(7, '2024-04-18 20:52:32.500951', '5', 'Momo[Non-veg]', 3, '', 6, 1),
(8, '2024-04-18 20:52:32.554469', '4', 'Burger[Non-veg]', 3, '', 6, 1),
(9, '2024-04-18 20:52:32.587652', '3', 'Pizza[Veg]', 3, '', 6, 1),
(10, '2024-04-18 20:52:32.716299', '2', 'Burger[Veg]', 3, '', 6, 1),
(11, '2024-04-18 20:52:32.749047', '1', 'Pizza[Non-veg]', 3, '', 6, 1),
(12, '2024-04-18 20:53:31.873873', '6', 'Fast Food[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(13, '2024-04-18 20:53:45.203773', '7', 'Fast Food[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(14, '2024-04-18 20:54:27.583376', '8', 'chinese[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(15, '2024-04-18 20:59:20.881719', '7', 'Fast Food[Non-veg]', 3, '', 6, 1),
(16, '2024-04-18 20:59:39.602442', '9', 'Fast F[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(17, '2024-04-18 20:59:48.629910', '9', 'Fast F[Veg]', 3, '', 6, 1),
(18, '2024-04-18 20:59:57.996917', '10', 'Fast Food[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(19, '2024-04-18 21:00:33.371779', '2', 'Chicken Burger', 1, '[{\"added\": {}}]', 7, 1),
(20, '2024-04-18 21:03:21.882550', '3', 'Vegetable Sandwich', 1, '[{\"added\": {}}]', 7, 1),
(21, '2024-04-18 21:08:41.673074', '4', 'Chicken Tikka Pizza', 1, '[{\"added\": {}}]', 7, 1),
(22, '2024-04-18 21:11:16.785850', '5', 'Fried rice and Chili chicken', 1, '[{\"added\": {}}]', 7, 1),
(23, '2024-04-18 21:14:20.390656', '6', 'Chicken Noodls and Chilli chicken', 1, '[{\"added\": {}}]', 7, 1),
(24, '2024-04-18 21:15:29.842249', '11', 'Soft Drinks[Drinks]', 1, '[{\"added\": {}}]', 6, 1),
(25, '2024-04-18 21:18:23.548102', '7', 'Coca Cola', 1, '[{\"added\": {}}]', 7, 1),
(26, '2024-04-21 05:22:38.943004', '12', 'Fas[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(27, '2024-04-21 05:22:50.971136', '12', 'Fas[Veg]', 3, '', 6, 1),
(28, '2024-04-21 05:23:14.608095', '13', 'Fast-Food[Veg]', 1, '[{\"added\": {}}]', 6, 1),
(29, '2024-04-21 05:23:50.247789', '3', 'Vegetable Sandwich', 2, '[{\"changed\": {\"fields\": [\"Menu\"]}}]', 7, 1),
(30, '2024-04-21 05:24:14.474918', '14', 'Fast-Food[Non-veg]', 1, '[{\"added\": {}}]', 6, 1),
(31, '2024-04-21 05:24:38.783267', '15', 'Soft-Drinks[Drinks]', 1, '[{\"added\": {}}]', 6, 1),
(32, '2024-04-21 05:25:26.389001', '7', 'Coca Cola', 2, '[{\"changed\": {\"fields\": [\"Menu\"]}}]', 7, 1),
(33, '2024-04-21 05:25:42.133783', '4', 'Chicken Tikka Pizza', 2, '[{\"changed\": {\"fields\": [\"Menu\"]}}]', 7, 1),
(34, '2024-04-21 05:25:53.635221', '2', 'Chicken Burger', 2, '[{\"changed\": {\"fields\": [\"Menu\"]}}]', 7, 1),
(35, '2024-04-21 05:26:09.648515', '11', 'Soft Drinks[Drinks]', 3, '', 6, 1),
(36, '2024-04-21 05:26:09.701861', '10', 'Fast Food[Veg]', 3, '', 6, 1),
(37, '2024-04-21 05:26:09.761803', '6', 'Fast Food[Non-veg]', 3, '', 6, 1);

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
(4, 'contenttypes', 'contenttype'),
(9, 'myapp', 'cartitem'),
(8, 'myapp', 'customuser'),
(7, 'myapp', 'item'),
(6, 'myapp', 'menu'),
(10, 'myapp', 'order'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-18 08:27:38.705421'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-04-18 08:27:39.348504'),
(3, 'auth', '0001_initial', '2024-04-18 08:27:43.911033'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-04-18 08:27:44.857525'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-04-18 08:27:44.889468'),
(6, 'auth', '0004_alter_user_username_opts', '2024-04-18 08:27:44.933436'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-04-18 08:27:44.984408'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-04-18 08:27:45.045131'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-18 08:27:45.084435'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-04-18 08:27:45.133329'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-18 08:27:45.201018'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-04-18 08:27:45.424086'),
(13, 'auth', '0011_update_proxy_permissions', '2024-04-18 08:27:45.512353'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-18 08:27:45.800694'),
(15, 'myapp', '0001_initial', '2024-04-18 08:27:58.666346'),
(16, 'admin', '0001_initial', '2024-04-18 08:28:01.695268'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-04-18 08:28:01.778983'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-18 08:28:01.830478'),
(19, 'myapp', '0002_alter_menu_options_alter_menu_menu_catagory', '2024-04-18 08:28:01.972179'),
(20, 'sessions', '0001_initial', '2024-04-18 08:28:02.879754'),
(21, 'myapp', '0003_order', '2024-04-18 18:37:20.071824');

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
('6ll7a3kxplffhav9mepetnzqy586baef', '.eJxVjEEOwiAQRe_C2hCkIOLSfc9AZpgZqRpISrsy3l2bdKHb_977L5VgXUpaO89pInVRgzr8bgj5wXUDdId6azq3uswT6k3RO-16bMTP6-7-HRTo5Vs7ilbiYCJlQCODAxsCMmVzEsfBntGJ984yMWAUIYhZGI4IID47Vu8PDac55A:1rxNSb:tL_dR1WfEoV1PywLSMWw1KV6F4frnLYvVbr5_sEbeFA', '2024-05-02 08:49:37.195185'),
('soq0n8px8v3bygpn0fipx6sgtdtdw4u6', '.eJxVjEEOwiAQRe_C2hCkIOLSfc9AZpgZqRpISrsy3l2bdKHb_977L5VgXUpaO89pInVRgzr8bgj5wXUDdId6azq3uswT6k3RO-16bMTP6-7-HRTo5Vs7ilbiYCJlQCODAxsCMmVzEsfBntGJ984yMWAUIYhZGI4IID47Vu8PDac55A:1rxNTt:f1MQqX7M38zLqRYSRsWeuDoiVrlScpuXT3XWeYIiYPA', '2024-05-02 08:50:57.835126');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_cartitem`
--

CREATE TABLE `myapp_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `date_added` datetime(6) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_customuser`
--

CREATE TABLE `myapp_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_customuser`
--

INSERT INTO `myapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `mobile`, `address`) VALUES
(1, 'pbkdf2_sha256$600000$jJyKMVfCQ99wbR3KcxlDtQ$dhkZ63ConXCB46KN6NeOTLiAiKSENN3+vW0hjeJuAbo=', '2024-04-21 05:22:26.961392', 1, 'admin', '', '', 'shovanvsk@gmail.com', 1, 1, '2024-04-18 08:29:32.707190', '', ''),
(2, 'pbkdf2_sha256$600000$dvYckZBvqklodXbl82uRt6$Ctmd+AYuFggz8iJMDP+YoTBON+/04JTiYEoBD70Kr4g=', '2024-04-18 18:37:42.604380', 0, 'shovan', '', '', 'shovan.pal.mca24@heritageit.edu.in', 0, 1, '2024-04-18 08:41:21.819520', '', ''),
(3, 'pbkdf2_sha256$600000$hAr64QuSP66HZUlUJspRv3$mbarNYqE0isbDFyMq2ObW1oqcqk8WJMEo2uVAmhyroQ=', '2024-04-18 18:38:15.295212', 0, 'shovan1', 'Shovan', 'Pal', 'draculavsk@gmail.com', 0, 1, '2024-04-18 08:48:14.930235', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_customuser_groups`
--

CREATE TABLE `myapp_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_customuser_user_permissions`
--

CREATE TABLE `myapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_item`
--

CREATE TABLE `myapp_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_item`
--

INSERT INTO `myapp_item` (`id`, `name`, `description`, `price`, `image`, `menu_id`) VALUES
(2, 'Chicken Burger', 'na', '50.00', 'item_image/b1_Ts3jBLK.png', 14),
(3, 'Vegetable Sandwich', 'Na', '40.00', 'item_image/vs.png', 13),
(4, 'Chicken Tikka Pizza', 'na', '290.00', 'item_image/cp.png', 14),
(5, 'Fried rice and Chili chicken', 'na', '250.00', 'item_image/fc.jpg', 8),
(6, 'Chicken Noodls and Chilli chicken', 'na', '250.00', 'item_image/nc.jpg', 8),
(7, 'Coca Cola', 'na', '35.00', 'item_image/cc.png', 15);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_menu`
--

CREATE TABLE `myapp_menu` (
  `id` bigint(20) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_catagory` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_menu`
--

INSERT INTO `myapp_menu` (`id`, `menu_name`, `menu_catagory`) VALUES
(8, 'chinese', 'Non-veg'),
(13, 'Fast-Food', 'Veg'),
(14, 'Fast-Food', 'Non-veg'),
(15, 'Soft-Drinks', 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_order`
--

CREATE TABLE `myapp_order` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `date_ordered` datetime(6) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_myapp_customuser_id` (`user_id`);

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
-- Indexes for table `myapp_cartitem`
--
ALTER TABLE `myapp_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_cartitem_item_id_3131e44a_fk_myapp_item_id` (`item_id`),
  ADD KEY `myapp_cartitem_user_id_eb2b3823_fk_myapp_customuser_id` (`user_id`);

--
-- Indexes for table `myapp_customuser`
--
ALTER TABLE `myapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `myapp_customuser_groups`
--
ALTER TABLE `myapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `myapp_customuser_groups_customuser_id_group_id_8dfb17af_uniq` (`customuser_id`,`group_id`),
  ADD KEY `myapp_customuser_groups_group_id_9a436a56_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `myapp_customuser_user_permissions`
--
ALTER TABLE `myapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `myapp_customuser_user_pe_customuser_id_permission_a9e136bb_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `myapp_customuser_use_permission_id_4ffda77e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `myapp_item`
--
ALTER TABLE `myapp_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_item_menu_id_5a3cd7ee_fk_myapp_menu_id` (`menu_id`);

--
-- Indexes for table `myapp_menu`
--
ALTER TABLE `myapp_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_order`
--
ALTER TABLE `myapp_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_order_product_id_46d28c6c_fk_myapp_item_id` (`product_id`),
  ADD KEY `myapp_order_user_id_98783cea_fk_myapp_customuser_id` (`user_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `myapp_cartitem`
--
ALTER TABLE `myapp_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myapp_customuser`
--
ALTER TABLE `myapp_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myapp_customuser_groups`
--
ALTER TABLE `myapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_customuser_user_permissions`
--
ALTER TABLE `myapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_item`
--
ALTER TABLE `myapp_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `myapp_menu`
--
ALTER TABLE `myapp_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `myapp_order`
--
ALTER TABLE `myapp_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`);

--
-- Constraints for table `myapp_cartitem`
--
ALTER TABLE `myapp_cartitem`
  ADD CONSTRAINT `myapp_cartitem_item_id_3131e44a_fk_myapp_item_id` FOREIGN KEY (`item_id`) REFERENCES `myapp_item` (`id`),
  ADD CONSTRAINT `myapp_cartitem_user_id_eb2b3823_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`);

--
-- Constraints for table `myapp_customuser_groups`
--
ALTER TABLE `myapp_customuser_groups`
  ADD CONSTRAINT `myapp_customuser_gro_customuser_id_4b46b787_fk_myapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `myapp_customuser` (`id`),
  ADD CONSTRAINT `myapp_customuser_groups_group_id_9a436a56_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `myapp_customuser_user_permissions`
--
ALTER TABLE `myapp_customuser_user_permissions`
  ADD CONSTRAINT `myapp_customuser_use_customuser_id_afabd7b0_fk_myapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `myapp_customuser` (`id`),
  ADD CONSTRAINT `myapp_customuser_use_permission_id_4ffda77e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `myapp_item`
--
ALTER TABLE `myapp_item`
  ADD CONSTRAINT `myapp_item_menu_id_5a3cd7ee_fk_myapp_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `myapp_menu` (`id`);

--
-- Constraints for table `myapp_order`
--
ALTER TABLE `myapp_order`
  ADD CONSTRAINT `myapp_order_product_id_46d28c6c_fk_myapp_item_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_item` (`id`),
  ADD CONSTRAINT `myapp_order_user_id_98783cea_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
