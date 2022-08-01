-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2022 at 04:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live-chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `app_lang_code`, `rtl`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en', 1, 1, '2022-07-31 23:45:20', '2022-07-31 23:45:20'),
(2, 'Bangla', 'bn', 'bn', 1, 1, '2022-07-31 23:45:52', '2022-07-31 23:45:52'),
(3, 'Hindi', 'hi', 'hi', 1, 1, '2022-08-01 07:54:46', '2022-08-01 07:54:46'),
(6, 'Bihari languages', 'bh', 'bh', 1, 1, '2022-08-01 08:13:39', '2022-08-01 08:13:39'),
(7, 'AB Siddique', 'ab', 'ab', 1, 1, '2022-08-01 08:34:39', '2022-08-01 08:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_01_045214_create_translates_table', 2),
(6, '2022_08_01_050118_create_languages_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translates`
--

CREATE TABLE `translates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translates`
--

INSERT INTO `translates` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(8, 'bn', 'wake_up_ict', 'ওয়েক আপ', '2022-07-31 23:53:32', '2022-07-31 23:53:32'),
(9, 'bn', 'welcome', 'স্বাগতম', '2022-07-31 23:53:32', '2022-07-31 23:53:32'),
(11, 'en', 'key', 'Key', '2022-08-01 01:24:32', '2022-08-01 02:10:06'),
(12, 'en', 'value', 'Value', '2022-08-01 01:24:32', '2022-08-01 01:24:32'),
(13, 'en', 'copy_translations', 'Copy Translations', '2022-08-01 01:25:24', '2022-08-01 01:25:24'),
(14, 'en', 'save', 'Save', '2022-08-01 01:25:24', '2022-08-01 01:25:24'),
(15, 'en', 'welcome', 'welcome', '2022-08-01 01:54:29', '2022-08-01 01:54:29'),
(16, 'bn', 'key', 'কি', '2022-08-01 02:32:37', '2022-08-01 07:51:19'),
(17, 'bn', 'value', 'ভেলু', '2022-08-01 02:32:37', '2022-08-01 03:37:14'),
(18, 'bn', 'copy_translations', 'কপি ট্রান্সলেট', '2022-08-01 02:32:37', '2022-08-01 02:32:37'),
(19, 'bn', 'save', 'সেভ', '2022-08-01 02:32:37', '2022-08-01 02:32:55'),
(20, 'en', 'wake_up_ict', 'Wake Up Ict', '2022-08-01 03:37:53', '2022-08-01 03:37:53'),
(21, 'en', 'my_name_is_noyon', 'My name is Noyon', '2022-08-01 04:24:06', '2022-08-01 04:24:06'),
(22, 'bn', 'my_name_is_noyon', 'হেই নয়ন', '2022-08-01 04:24:51', '2022-08-01 07:28:47'),
(23, 'en', 'name', 'Name', '2022-08-01 04:57:00', '2022-08-01 04:57:00'),
(24, 'en', 'code', 'Code', '2022-08-01 04:57:00', '2022-08-01 04:57:00'),
(25, 'en', 'flutter_app_lang_code', 'Flutter App Lang Code', '2022-08-01 05:48:31', '2022-08-01 05:48:31'),
(26, 'en', 'links_for_iso_6391_codes', 'Links for ISO 639-1 codes', '2022-08-01 05:48:31', '2022-08-01 05:48:31'),
(27, 'en', 'put_iso_6391_code_for_your_language', 'Put ISO 639-1 code for your language', '2022-08-01 05:48:31', '2022-08-01 05:48:31'),
(28, 'bn', 'name', 'নাম', '2022-08-01 07:22:51', '2022-08-01 07:22:51'),
(29, 'bn', 'code', 'কোড', '2022-08-01 07:22:51', '2022-08-01 07:23:52'),
(30, 'bn', 'flutter_app_lang_code', 'ফ্লাটার অ্যাপ', '2022-08-01 07:22:51', '2022-08-01 07:33:44'),
(31, 'bn', 'links_for_iso_6391_codes', NULL, '2022-08-01 07:22:51', '2022-08-01 07:22:51'),
(32, 'bn', 'put_iso_6391_code_for_your_language', NULL, '2022-08-01 07:22:51', '2022-08-01 07:22:51'),
(33, 'en', 'enter_name', 'Enter Name', '2022-08-01 07:52:45', '2022-08-01 07:52:45'),
(34, 'en', 'app_lang_code', 'app_lang_code', '2022-08-01 07:53:08', '2022-08-01 07:53:08'),
(35, 'en', 'submit', 'Submit', '2022-08-01 07:53:14', '2022-08-01 07:53:14'),
(36, 'bn', 'enter_name', 'নাম লিখুন', '2022-08-01 07:53:54', '2022-08-01 07:53:54'),
(37, 'bn', 'app_lang_code', NULL, '2022-08-01 07:53:54', '2022-08-01 07:53:54'),
(38, 'bn', 'submit', NULL, '2022-08-01 07:53:54', '2022-08-01 07:53:54'),
(39, 'dsf', 'key', 'dfds', '2022-08-01 07:59:11', '2022-08-01 08:05:01'),
(40, 'dsf', 'value', 'd', '2022-08-01 07:59:11', '2022-08-01 08:05:01'),
(41, 'dsf', 'copy_translations', 'd', '2022-08-01 07:59:11', '2022-08-01 08:05:01'),
(42, 'dsf', 'save', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(43, 'dsf', 'welcome', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(44, 'dsf', 'wake_up_ict', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(45, 'dsf', 'my_name_is_noyon', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(46, 'dsf', 'name', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(47, 'dsf', 'code', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(48, 'dsf', 'flutter_app_lang_code', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(49, 'dsf', 'links_for_iso_6391_codes', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(50, 'dsf', 'put_iso_6391_code_for_your_language', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(51, 'dsf', 'enter_name', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(52, 'dsf', 'app_lang_code', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(53, 'dsf', 'submit', NULL, '2022-08-01 07:59:11', '2022-08-01 07:59:11'),
(54, 'hi', 'key', 'dfds', '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(55, 'hi', 'value', 'd', '2022-08-01 08:03:42', '2022-08-01 08:03:47'),
(56, 'hi', 'copy_translations', 'dd', '2022-08-01 08:03:42', '2022-08-01 08:23:48'),
(57, 'hi', 'save', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(58, 'hi', 'welcome', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(59, 'hi', 'wake_up_ict', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(60, 'hi', 'my_name_is_noyon', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(61, 'hi', 'name', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(62, 'hi', 'code', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(63, 'hi', 'flutter_app_lang_code', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(64, 'hi', 'links_for_iso_6391_codes', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(65, 'hi', 'put_iso_6391_code_for_your_language', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(66, 'hi', 'enter_name', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(67, 'hi', 'app_lang_code', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(68, 'hi', 'submit', NULL, '2022-08-01 08:03:42', '2022-08-01 08:03:42'),
(69, 'bh', 'key', 'dfds', '2022-08-01 08:08:15', '2022-08-01 08:08:25'),
(70, 'bh', 'value', 'd', '2022-08-01 08:08:15', '2022-08-01 08:08:25'),
(71, 'bh', 'copy_translations', 'dddd', '2022-08-01 08:08:15', '2022-08-01 08:23:59'),
(72, 'bh', 'save', 'dsdfsdfa', '2022-08-01 08:08:15', '2022-08-01 08:24:07'),
(73, 'bh', 'welcome', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(74, 'bh', 'wake_up_ict', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(75, 'bh', 'my_name_is_noyon', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(76, 'bh', 'name', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(77, 'bh', 'code', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(78, 'bh', 'flutter_app_lang_code', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(79, 'bh', 'links_for_iso_6391_codes', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(80, 'bh', 'put_iso_6391_code_for_your_language', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(81, 'bh', 'enter_name', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(82, 'bh', 'app_lang_code', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(83, 'bh', 'submit', NULL, '2022-08-01 08:08:15', '2022-08-01 08:08:15'),
(84, 'ab', 'key', 'Bal', '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(85, 'ab', 'value', 'Chal', '2022-08-01 08:34:58', '2022-08-01 08:35:11'),
(86, 'ab', 'copy_translations', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(87, 'ab', 'save', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(88, 'ab', 'welcome', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(89, 'ab', 'wake_up_ict', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(90, 'ab', 'my_name_is_noyon', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(91, 'ab', 'name', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(92, 'ab', 'code', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(93, 'ab', 'flutter_app_lang_code', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(94, 'ab', 'links_for_iso_6391_codes', NULL, '2022-08-01 08:34:58', '2022-08-01 08:34:58'),
(95, 'ab', 'put_iso_6391_code_for_your_language', NULL, '2022-08-01 08:34:59', '2022-08-01 08:34:59'),
(96, 'ab', 'enter_name', NULL, '2022-08-01 08:34:59', '2022-08-01 08:34:59'),
(97, 'ab', 'app_lang_code', NULL, '2022-08-01 08:34:59', '2022-08-01 08:34:59'),
(98, 'ab', 'submit', NULL, '2022-08-01 08:34:59', '2022-08-01 08:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ariful', 'admin@demo.com', NULL, '$2y$10$mi8ZqsSn1UtIEHO9jic7/e4BHJzBhgUQA7FWbpTMUX1GokjE5.Vre', 'CRbHSjpFNP8GpvnnpiSReqVqlCoHbF4DNGuwO1Dz3WX9HY9bcG9yvmYUwXEJ', '2022-07-27 01:33:54', '2022-07-27 01:33:54'),
(2, 'Something', 'something@gmail.com', NULL, '$2y$10$erXij66R8Al/ycl5Q8WXNO1PdrXchK77/0HTGZcAVecVRzQwbV4bq', NULL, '2022-07-30 00:28:04', '2022-07-30 00:28:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translates`
--
ALTER TABLE `translates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
