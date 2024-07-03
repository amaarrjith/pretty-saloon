-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 01:31 PM
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
-- Database: `db_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_adminuser`
--

CREATE TABLE `admin_app_adminuser` (
  `adminid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `adminame` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_adminuser`
--

INSERT INTO `admin_app_adminuser` (`adminid`, `username`, `password`, `adminame`) VALUES
(1, 'admin', 'admin', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_beauticians`
--

CREATE TABLE `admin_app_beauticians` (
  `beauticianid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_beauticians`
--

INSERT INTO `admin_app_beauticians` (`beauticianid`, `name`, `role`, `description`, `image`) VALUES
(1, 'STAFF 1 ', 'STYLISH', 'Beauticians are highly skilled service-oriented individuals who provide well-rounded cosmetic services to enhance customer appearance and boost their confidence. They may style hair, apply makeup, and provide hair removal and brow-enhancing treatments. They may also give guidance about proper hair and skin care.', 'images/work-5_89pOi4n.jpg'),
(2, 'STAFF 2', 'STYLISH', 'Beauticians are highly skilled service-oriented individuals who provide well-rounded cosmetic services to enhance customer appearance and boost their confidence. They may style hair, apply makeup, and provide hair removal and brow-enhancing treatments. They may also give guidance about proper hair and skin care.', 'images/work-4_YtCvq6n_lzucUGG_m5A7rQI.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_categories`
--

CREATE TABLE `admin_app_categories` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(100) NOT NULL,
  `categoryimage` varchar(100) NOT NULL,
  `categorydescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_categories`
--

INSERT INTO `admin_app_categories` (`categoryid`, `categoryname`, `categoryimage`, `categorydescription`) VALUES
(1, 'HAIR STYLE ', 'images/hair-cutting_hjkp87H.png', 'A hairstyle, hairdo, haircut or coiffure refers to the styling of hair, usually on the human head but sometimes on the face or body. '),
(2, 'FACIAL TREATMENTS', 'images/skincare_W8e4HBS_DIyKbho.png', 'A facial is a family of skin care treatments for the face, including steam, exfoliation (physical and chemical), extraction, creams, lotions, facial masks, peels, and massage'),
(3, 'OTHER SKIN TREATMENTS', 'images/beauty-treatment_WZzDY0J.png', 'A chemical solution is applied to the skin that causes it to exfoliate and eventually peel off, revealing new, smoother skin.');

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_package`
--

CREATE TABLE `admin_app_package` (
  `packageid` int(11) NOT NULL,
  `packagename` varchar(50) NOT NULL,
  `packagerate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_package`
--

INSERT INTO `admin_app_package` (`packageid`, `packagename`, `packagerate`) VALUES
(1, 'BASIC PACKAGE', 2500),
(2, 'SILVER PACKAGE', 5000),
(3, 'GOLDEN PACKAGE', 6500),
(4, 'DIAMOND PACKAGE', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_packagebooking`
--

CREATE TABLE `admin_app_packagebooking` (
  `bookingid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `packagename` varchar(50) NOT NULL,
  `packagerate` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_packagebooking`
--

INSERT INTO `admin_app_packagebooking` (`bookingid`, `name`, `phone`, `date`, `time`, `packagename`, `packagerate`, `status`) VALUES
(1, 'Amarjith', '7907712617', '2024-07-03', '19:52:00', 'NULL', 0, 'done'),
(2, 'Amarjith', '7907712617', '2024-07-08', '20:55:00', 'NULL', 0, 'booked'),
(3, 'Amarjith', '7907712617', '2024-07-10', '17:52:00', 'NULL', 0, 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_packagelist`
--

CREATE TABLE `admin_app_packagelist` (
  `packagelistid` int(11) NOT NULL,
  `packageid` int(11) NOT NULL,
  `subcategoryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_packagelist`
--

INSERT INTO `admin_app_packagelist` (`packagelistid`, `packageid`, `subcategoryname`) VALUES
(1, 1, 'HAIR CUTTING'),
(2, 1, 'PAPPAYA FACIAL'),
(3, 1, 'BEAUTY SPOTTING'),
(4, 1, 'LIP OR EYEBROW TATOOING'),
(5, 2, 'HAIR STRAIGHTENING'),
(6, 2, 'ALMOND FACIAL'),
(7, 2, 'DRY DAMAGED SKIN TREATMENT'),
(8, 2, 'BEAUTY SPOTTING'),
(9, 3, 'HAIR CUTTING'),
(10, 3, 'DRY DAMAGED SKIN TREATMENT'),
(11, 3, 'GOLDEN FACIAL'),
(12, 3, 'BEAUTY SPOTTING'),
(13, 4, 'HAIR CUTTING'),
(14, 4, 'HAIR LAYERING'),
(15, 4, 'PEARL FACIAL'),
(16, 4, 'DRY DAMAGED SKIN TREATMENT');

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_subcategories`
--

CREATE TABLE `admin_app_subcategories` (
  `subcategoryid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategoryname` varchar(100) NOT NULL,
  `rate` int(11) NOT NULL,
  `subcategorydescription` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_app_subcategories`
--

INSERT INTO `admin_app_subcategories` (`subcategoryid`, `categoryid`, `subcategoryname`, `rate`, `subcategorydescription`) VALUES
(1, 1, 'HAIR CUTTING', 500, 'Haircutting (also hair shaping) - is the process of cutting, tapering, texturizing and thinning using any hair cutting tools in order to create a shape. '),
(2, 1, 'HAIR LAYERING', 2500, 'The layered hair effect is achieved by taking sections of hair vertically across the head, pulling it perpendicular to the head, and cutting straight across.'),
(3, 1, 'HAIR STRAIGHTENING', 1000, 'Hair straightening is a hair styling technique used since the 1890s involving the flattening and straightening of hair in order to give it a smooth, streamlined, and sleek appearance. '),
(4, 2, 'PAPPAYA FACIAL', 600, 'Basically, a facial that uses papaya as an active ingredient is known as a papaya facial. Papaya has many healing, whitening, and exfoliating properties, thus making it the ideal natural beauty enhancer.'),
(5, 2, 'ALMOND FACIAL', 800, 'This treatment will reduce dryness, improves hydration and making skin more radiant and moisturised. Cleansing Milk - It Removes Debris, Impurities And Make-Up While Hydrating Nourishing And Refreshing The Skin. A Well Balanced Lotion That Removes Impurities Caused By Pollution.'),
(6, 2, 'GOLDEN FACIAL', 1000, 'In the general context, a gold facial involves the use of massaging sheets of 24-karat gold leaf. These are placed on the facial skin. It may also involve the use of colloidal gold, which is a liquid solution containing suspended gold nanoparticles.'),
(7, 2, 'PEARL FACIAL', 1200, 'Pearl Facial Kit works by exfoliating, brightening, and nourishing the skin using pearl powder and other beneficial ingredients for a radiant and rejuvenated complexion.'),
(8, 3, 'DRY DAMAGED SKIN TREATMENT', 2500, 'Dry skin often responds well to lifestyle measures, such as using moisturizers and avoiding long, hot showers and baths. If you have very dry skin, your doctor may recommend a moisturizing product formulated for your needs.'),
(9, 3, 'BEAUTY SPOTTING', 500, 'Beauty is always there, it\'s just a matter of seeing it for yourself! You are art, you are impressive, you are strong, you are capable, you are beautiful.'),
(10, 3, 'LIP OR EYEBROW TATOOING', 1000, 'Lip tattooing is a semi-permanent cosmetic make-up technique which is great for adjusting the irregular shape and color of the lips and to lighten dark lips.');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add beauticians', 7, 'add_beauticians'),
(26, 'Can change beauticians', 7, 'change_beauticians'),
(27, 'Can delete beauticians', 7, 'delete_beauticians'),
(28, 'Can view beauticians', 7, 'view_beauticians'),
(29, 'Can add categories', 8, 'add_categories'),
(30, 'Can change categories', 8, 'change_categories'),
(31, 'Can delete categories', 8, 'delete_categories'),
(32, 'Can view categories', 8, 'view_categories'),
(33, 'Can add package', 9, 'add_package'),
(34, 'Can change package', 9, 'change_package'),
(35, 'Can delete package', 9, 'delete_package'),
(36, 'Can view package', 9, 'view_package'),
(37, 'Can add package list', 10, 'add_packagelist'),
(38, 'Can change package list', 10, 'change_packagelist'),
(39, 'Can delete package list', 10, 'delete_packagelist'),
(40, 'Can view package list', 10, 'view_packagelist'),
(41, 'Can add sub categories', 11, 'add_subcategories'),
(42, 'Can change sub categories', 11, 'change_subcategories'),
(43, 'Can delete sub categories', 11, 'delete_subcategories'),
(44, 'Can view sub categories', 11, 'view_subcategories'),
(45, 'Can add package booking', 12, 'add_packagebooking'),
(46, 'Can change package booking', 12, 'change_packagebooking'),
(47, 'Can delete package booking', 12, 'delete_packagebooking'),
(48, 'Can view package booking', 12, 'view_packagebooking'),
(49, 'Can add adminuser', 13, 'add_adminuser'),
(50, 'Can change adminuser', 13, 'change_adminuser'),
(51, 'Can delete adminuser', 13, 'delete_adminuser'),
(52, 'Can view adminuser', 13, 'view_adminuser');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(13, 'admin_app', 'adminuser'),
(7, 'admin_app', 'beauticians'),
(8, 'admin_app', 'categories'),
(9, 'admin_app', 'package'),
(12, 'admin_app', 'packagebooking'),
(10, 'admin_app', 'packagelist'),
(11, 'admin_app', 'subcategories'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-07-02 09:40:41.640690'),
(2, 'auth', '0001_initial', '2024-07-02 09:40:42.217537'),
(3, 'admin', '0001_initial', '2024-07-02 09:40:42.381161'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-07-02 09:40:42.399161'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-02 09:40:42.467747'),
(6, 'admin_app', '0001_initial', '2024-07-02 09:40:42.566105'),
(7, 'admin_app', '0002_rename_subcategoryid_packagelist_subcategoryname', '2024-07-02 09:40:42.585785'),
(8, 'admin_app', '0003_subcategories_subcategorydescription', '2024-07-02 09:40:42.615778'),
(9, 'admin_app', '0004_packagebooking', '2024-07-02 09:40:42.642701'),
(10, 'admin_app', '0005_rename_first_name_packagebooking_name_and_more', '2024-07-02 09:40:42.682402'),
(11, 'admin_app', '0006_packagebooking_status', '2024-07-02 09:40:42.713511'),
(12, 'admin_app', '0007_adminuser', '2024-07-02 09:40:42.738602'),
(13, 'admin_app', '0008_adminuser_adminame', '2024-07-02 09:40:42.770887'),
(14, 'contenttypes', '0002_remove_content_type_name', '2024-07-02 09:40:42.876449'),
(15, 'auth', '0002_alter_permission_name_max_length', '2024-07-02 09:40:42.949805'),
(16, 'auth', '0003_alter_user_email_max_length', '2024-07-02 09:40:42.981896'),
(17, 'auth', '0004_alter_user_username_opts', '2024-07-02 09:40:43.004192'),
(18, 'auth', '0005_alter_user_last_login_null', '2024-07-02 09:40:43.069747'),
(19, 'auth', '0006_require_contenttypes_0002', '2024-07-02 09:40:43.074733'),
(20, 'auth', '0007_alter_validators_add_error_messages', '2024-07-02 09:40:43.100720'),
(21, 'auth', '0008_alter_user_username_max_length', '2024-07-02 09:40:43.133442'),
(22, 'auth', '0009_alter_user_last_name_max_length', '2024-07-02 09:40:43.164126'),
(23, 'auth', '0010_alter_group_name_max_length', '2024-07-02 09:40:43.197877'),
(24, 'auth', '0011_update_proxy_permissions', '2024-07-02 09:40:43.225851'),
(25, 'auth', '0012_alter_user_first_name_max_length', '2024-07-02 09:40:43.259319'),
(26, 'sessions', '0001_initial', '2024-07-02 09:40:43.307100'),
(27, 'admin_app', '0009_rename_packagebooking_packagebookings', '2024-07-03 10:20:33.640521'),
(28, 'admin_app', '0010_rename_packagebookings_packagebooking', '2024-07-03 10:20:33.715704'),
(29, 'admin_app', '0011_alter_beauticians_description', '2024-07-03 11:18:34.921721');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('309njbrchzvx22qsylkwzmdtxucse391', 'eyJhZG1pbmFtZSI6IkFETUlOIiwidXNlcm5hbWUiOiJhZG1pbiJ9:1sOadt:KKryjNWnphumB6DpClx87gGxHwZgGCVwC8CVvPGpFAc', '2024-07-16 10:21:45.157764'),
('or413tg0bfznityc65apm74o38sqnb5d', 'eyJhZG1pbmFtZSI6IkFETUlOIiwidXNlcm5hbWUiOiJhZG1pbiJ9:1sOa41:VXBP_uamPN26V4Q10MSaf0usCrCB5Ei7rrwJCmvKT5A', '2024-07-16 09:44:41.691956'),
('vpb06qllpudpovha3iixltkytukcsdzr', 'eyJhZG1pbmFtZSI6IkFETUlOIiwidXNlcm5hbWUiOiJhZG1pbiJ9:1sOst8:ZK6luivIsoCSE_POdRoE-5-jfTqFF8JwQva7u3dtR3A', '2024-07-17 05:50:42.886661');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_app_adminuser`
--
ALTER TABLE `admin_app_adminuser`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `admin_app_beauticians`
--
ALTER TABLE `admin_app_beauticians`
  ADD PRIMARY KEY (`beauticianid`);

--
-- Indexes for table `admin_app_categories`
--
ALTER TABLE `admin_app_categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `admin_app_package`
--
ALTER TABLE `admin_app_package`
  ADD PRIMARY KEY (`packageid`);

--
-- Indexes for table `admin_app_packagebooking`
--
ALTER TABLE `admin_app_packagebooking`
  ADD PRIMARY KEY (`bookingid`);

--
-- Indexes for table `admin_app_packagelist`
--
ALTER TABLE `admin_app_packagelist`
  ADD PRIMARY KEY (`packagelistid`);

--
-- Indexes for table `admin_app_subcategories`
--
ALTER TABLE `admin_app_subcategories`
  ADD PRIMARY KEY (`subcategoryid`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_app_adminuser`
--
ALTER TABLE `admin_app_adminuser`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_app_beauticians`
--
ALTER TABLE `admin_app_beauticians`
  MODIFY `beauticianid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_app_categories`
--
ALTER TABLE `admin_app_categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_app_package`
--
ALTER TABLE `admin_app_package`
  MODIFY `packageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_app_packagebooking`
--
ALTER TABLE `admin_app_packagebooking`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_app_packagelist`
--
ALTER TABLE `admin_app_packagelist`
  MODIFY `packagelistid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `admin_app_subcategories`
--
ALTER TABLE `admin_app_subcategories`
  MODIFY `subcategoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
