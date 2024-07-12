-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 31 jan. 2023 à 01:18
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stockmang_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `cashes`
--

CREATE TABLE `cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fournisseur_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `date_payment` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cashes`
--

INSERT INTO `cashes` (`id`, `client_id`, `fournisseur_id`, `order_id`, `date_payment`, `amount`, `viewed`, `payment_status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(6, 2, NULL, 12, '2023-01-28 17:25:54', 6000.00, 0, 'paid', 1, '2023-01-28 17:25:54', '2023-01-28 17:27:55'),
(7, 1, NULL, 16, '2023-01-28 19:20:47', 66596.00, 0, 'paid', 1, '2023-01-28 19:20:47', '2023-01-28 19:22:46'),
(8, 2, NULL, 15, '2023-01-28 23:55:29', 120.00, 0, 'paid', 1, '2023-01-28 23:55:29', '2023-01-28 23:55:35'),
(9, 2, NULL, 15, '2023-01-29 00:49:26', 2555.00, 0, 'paid', 1, '2023-01-29 00:49:09', '2023-01-29 00:51:56'),
(10, 2, NULL, 15, '2023-02-10 22:00:00', 111.00, 0, 'paid', 1, '2023-01-29 01:11:41', '2023-01-29 01:22:13'),
(11, 2, NULL, 15, '2023-01-02 22:00:00', 1210.00, 0, 'paid', 1, '2023-01-29 22:39:01', '2023-01-29 22:39:17'),
(12, 2, NULL, 15, '2023-01-04 22:00:00', 475.00, 0, 'paid', 1, '2023-01-29 22:52:13', '2023-01-29 22:52:24'),
(13, 3, NULL, 21, '2001-01-31 23:00:00', 798.00, 0, 'paid', 1, '2023-01-29 22:54:04', '2023-01-29 23:26:49'),
(14, NULL, 5, 17, '2001-01-31 23:00:00', 876.00, 0, 'paid', 1, '2023-01-29 23:13:06', '2023-01-29 23:21:16');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cheques`
--

CREATE TABLE `cheques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fournisseur_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `date_decaissement` timestamp NULL DEFAULT NULL,
  `date_encaissement` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `name_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_cheque` int(11) NOT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A DEPOSER',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheques`
--

INSERT INTO `cheques` (`id`, `client_id`, `fournisseur_id`, `order_id`, `date_decaissement`, `date_encaissement`, `amount`, `name_bank`, `num_cheque`, `viewed`, `status`, `payment_status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 16, NULL, '2023-01-31 22:00:00', 55.00, 'gfg', 5255, 0, 'ENCAISSE', 'paid', 1, '2023-01-28 01:52:44', '2023-01-28 01:53:22'),
(2, 1, NULL, 16, NULL, '2023-02-06 22:00:00', 55.00, 'gfg', 5255, 0, 'ENCAISSE', 'paid', 0, '2023-01-28 01:53:14', '2023-01-28 01:53:14'),
(3, 2, NULL, 12, NULL, '2023-01-31 14:00:00', 323.00, 'gfg', 2626, 0, 'ENCAISSE', 'paid', 1, '2023-01-28 17:28:10', '2023-01-29 23:18:45'),
(4, 2, NULL, 15, NULL, NULL, 4564.00, 'gfg', 25569, 0, 'ENCAISSE', 'paid', 1, '2023-01-28 23:55:47', '2023-01-28 23:56:04'),
(5, 2, NULL, 15, NULL, '2001-01-31 23:00:00', 12.00, '100', 2, 0, 'ENCAISSE', 'paid', 1, '2023-01-29 22:39:35', '2023-01-29 22:39:56'),
(6, 3, NULL, 21, NULL, '2001-01-31 23:00:00', 5656.00, '5656', 5656, 0, 'ENCAISSE', 'paid', 1, '2023-01-29 23:33:05', '2023-01-30 13:13:58'),
(7, NULL, 5, 11, '2001-01-31 23:00:00', NULL, 5665.00, '5656', 5656, 0, 'ENCAISSE', 'paid', 0, '2023-01-29 23:33:49', '2023-01-29 23:33:55');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `cin`, `name`, `email`, `adresse`, `phone`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, NULL, 'abderrahmane ouhna', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-20 23:57:11', '2023-01-20 23:57:11'),
(2, NULL, 'ouhna', 'abdo.sbeta.11@gmail.com', '356 av dakhla  c d casa', '0677873814', 0, '2023-01-21 14:02:02', '2023-01-21 14:02:02'),
(3, NULL, 'dsdsq', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:33:16', '2023-01-23 14:33:16'),
(4, NULL, '&&&ééé', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:36:39', '2023-01-23 14:36:43'),
(5, NULL, 'abdouu2', 'abdo.sbeta.11@gmail.com', '356 av dakhla  c d casa', '0677873814', 0, '2023-01-30 22:53:23', '2023-01-30 22:53:23');

-- --------------------------------------------------------

--
-- Structure de la table `credits`
--

CREATE TABLE `credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fournisseur_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `date_payment` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `approaching_date` timestamp NULL DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `credits`
--

INSERT INTO `credits` (`id`, `client_id`, `fournisseur_id`, `order_id`, `date_payment`, `amount`, `approaching_date`, `viewed`, `payment_status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 16, '2023-01-28 01:53:34', 65566.00, '2023-01-02 22:00:00', 0, 'paid', 1, '2023-01-28 01:53:34', '2023-01-28 01:56:09'),
(2, 2, NULL, 12, '2023-01-28 01:54:55', 2552.00, '2023-01-22 22:00:00', 0, 'paid', 1, '2023-01-28 01:54:56', '2023-01-28 13:29:53'),
(3, 2, NULL, 12, '2023-01-28 01:55:47', 2552.00, '2023-02-10 22:00:00', 0, 'paid', 0, '2023-01-28 01:55:47', '2023-01-28 01:55:47'),
(4, 1, NULL, 16, '2023-01-28 19:40:02', 1000.00, '2023-03-15 22:00:00', 0, 'paid', 1, '2023-01-28 19:24:53', '2023-01-28 19:43:36'),
(5, 2, NULL, 15, '2023-01-28 23:56:14', 156156.00, '2023-01-09 22:00:00', 0, 'paid', 1, '2023-01-28 23:56:14', '2023-01-28 23:56:18'),
(6, 2, NULL, 15, NULL, 65.00, '2023-01-04 22:00:00', 0, 'unpaid', 1, '2023-01-28 23:56:30', '2023-01-28 23:56:34'),
(7, 2, NULL, 15, '2023-01-29 22:40:14', 2212.00, '2023-01-01 22:00:00', 0, 'paid', 1, '2023-01-29 22:40:14', '2023-01-29 22:40:26');

-- --------------------------------------------------------

--
-- Structure de la table `employers`
--

CREATE TABLE `employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double(8,2) NOT NULL DEFAULT 0.00,
  `rest` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employers`
--

INSERT INTO `employers` (`id`, `cin`, `name`, `email`, `adresse`, `phone`, `salary`, `rest`, `payment_status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, NULL, 'abderrahmane ouhna', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 5000.00, 5000.00, 'unpaid', 0, '2023-01-25 10:43:15', '2023-01-25 10:43:15');

-- --------------------------------------------------------

--
-- Structure de la table `employer_states`
--

CREATE TABLE `employer_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_payment` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `cin`, `name`, `email`, `adresse`, `phone`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, NULL, 'abderrahmane wahna', 'abderrahmane.ouhna@gmail.com', '410 av dakhla  c d casa', '0666385831', 0, '2023-01-23 14:29:33', '2023-01-23 14:29:33'),
(2, NULL, 'ouhna22', 'abdo.sbeta.11@gmail.com', '356 av dakhla  c d casa', '0677873814', 0, '2023-01-23 14:31:06', '2023-01-23 14:31:10'),
(3, NULL, 'OUHNA ABDERRAHMANE', 'abderrahmane.ouhna@gmail.com', '356 av dakhla c d casa', '0677873819', 0, '2023-01-23 14:32:07', '2023-01-23 14:32:07'),
(4, NULL, 'ddd', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:32:48', '2023-01-23 14:32:48'),
(5, NULL, 'aaaaaaaa', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:34:02', '2023-01-23 14:34:02'),
(6, NULL, '11', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:35:45', '2023-01-23 14:35:45'),
(7, NULL, '2222', 'abdo.sbeta.11@gmail.com', '356 av dakhla  c d casa', '0677873814', 0, '2023-01-23 14:38:28', '2023-01-23 14:38:28'),
(8, NULL, '3333', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-23 14:39:12', '2023-01-23 14:39:12'),
(9, NULL, 'youssef', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-24 22:35:47', '2023-01-24 22:35:47'),
(10, NULL, 'youssef22', 'abderrahmane.ouhna@gmail.com', '356 av dakhla  c d casa', '0677873819', 0, '2023-01-24 22:37:16', '2023-01-24 22:37:16');

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `due_date` timestamp NULL DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_invoice` enum('quote','invoice') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'quote',
  `in_out` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'out',
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `transaction_date`, `due_date`, `notes`, `type_invoice`, `in_out`, `viewed`, `is_deleted`, `created_at`, `updated_at`) VALUES
(6, 7, '2023-01-23 11:43:37', '2001-01-31 23:00:00', 'aaa', 'quote', 'out', 0, 0, '2023-01-23 14:43:37', '2023-01-30 09:29:24'),
(7, 8, '2023-01-31 22:00:00', NULL, 'aa', 'quote', 'out', 0, 0, '2023-01-23 14:45:50', '2023-01-23 14:45:50'),
(8, 9, '2023-02-02 22:00:00', NULL, NULL, 'quote', 'out', 0, 0, '2023-01-23 14:47:25', '2023-01-23 14:47:25'),
(9, 10, '2023-01-29 14:56:20', NULL, 'dqsdqsd', 'quote', 'out', 0, 1, '2023-01-23 14:48:26', '2023-01-29 13:56:20'),
(10, 15, '2001-01-31 23:00:00', '2001-01-31 23:00:00', NULL, 'invoice', 'out', 0, 0, '2023-01-25 03:02:35', '2023-01-29 23:11:29'),
(11, 17, '2001-01-31 23:00:00', '2023-01-29 23:11:45', NULL, 'invoice', 'in', 0, 0, '2023-01-25 03:14:07', '2023-01-29 23:11:45'),
(12, 11, '2023-02-03 19:00:00', NULL, NULL, 'invoice', 'in', 0, 0, '2023-01-29 22:00:21', '2023-01-29 22:00:21'),
(13, 12, '2023-01-30 00:18:45', NULL, NULL, 'invoice', 'in', 0, 1, '2023-01-29 22:02:29', '2023-01-29 23:18:45'),
(14, 18, '2023-01-30 00:18:48', NULL, NULL, 'invoice', 'in', 0, 1, '2023-01-29 22:03:09', '2023-01-29 23:18:48'),
(15, 19, '2023-01-30 00:18:51', NULL, NULL, 'invoice', 'in', 0, 1, '2023-01-29 22:04:40', '2023-01-29 23:18:51'),
(16, 20, '2023-01-30 00:18:53', NULL, NULL, 'invoice', 'in', 0, 1, '2023-01-29 22:06:47', '2023-01-29 23:18:53'),
(17, 21, '2023-01-29 22:08:49', NULL, NULL, 'invoice', 'out', 0, 0, '2023-01-29 22:08:54', '2023-01-29 22:08:54'),
(18, 24, '2023-01-30 09:00:41', NULL, NULL, 'quote', 'out', 0, 0, '2023-01-30 09:00:41', '2023-01-30 09:00:41');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_12_18_002029_create_clients_table', 1),
(11, '2022_12_18_003000_create_fournisseurs_table', 1),
(12, '2022_12_18_011206_create_roles_table', 1),
(13, '2022_12_19_143522_create_categories_table', 1),
(14, '2022_12_19_143740_create_orders_table', 1),
(15, '2022_12_19_143758_create_invoices_table', 1),
(16, '2022_12_19_143807_create_products_table', 1),
(17, '2022_12_19_143810_create_credits_table', 1),
(18, '2022_12_19_143820_create_traites_table', 1),
(19, '2022_12_19_143840_create_order_details_table', 1),
(20, '2022_12_19_143842_create_services_table', 1),
(21, '2022_12_19_143900_create_cheques_table', 1),
(22, '2022_12_20_133000_create_employers_table', 1),
(23, '2022_12_20_133121_create_employer_states_table', 1),
(24, '2023_01_15_233632_create_cashes_table', 1),
(25, '2023_01_17_170626_create_traite_details_table', 1),
(26, '2023_01_20_152420_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('8a6678cb90a804022a9ac2391719f6d2bd6d1bd84d28bb1f61c18877c037aa58a88f264b57a45aba', 1, 1, 'abdo.sbeta.00@gmail.com_2023-01-20 19:26:29', '[\"manager\"]', 0, '2023-01-20 18:26:30', '2023-01-20 18:26:30', '2024-01-20 19:26:30'),
('cc0f2fb5882221fe472f0595f49e8c274a748cf43d44d7e092e5c7923e85d2ee42121b547372e9da', 1, 1, 'abdo.sbeta.00@gmail.com_2023-01-20 19:26:32', '[\"manager\"]', 0, '2023-01-20 18:26:32', '2023-01-20 18:26:32', '2024-01-20 19:26:32'),
('e166b1fcf2952e408ae403bdc45b75dda2ac3ad828f6fadfaaad8f54fde1a6697dadaf61c7f73f71', 1, 1, 'abdo.sbeta.00@gmail.com_2023-01-20 20:54:50', '[\"manager\"]', 0, '2023-01-20 19:54:50', '2023-01-20 19:54:50', '2024-01-20 20:54:50');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'UfsaV2mopWmHkyxuTO5MnzK43oKD7ve3nH3L5alT', NULL, 'http://localhost', 1, 0, 0, '2023-01-20 18:26:00', '2023-01-20 18:26:00'),
(2, NULL, 'Laravel Password Grant Client', 'NGBGMlRgN4Ac8EOw02lFDNjIgG8olYFMAOAdWkP3', 'users', 'http://localhost', 0, 1, 0, '2023-01-20 18:26:00', '2023-01-20 18:26:00');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-01-20 18:26:00', '2023-01-20 18:26:00');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fournisseur_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` enum('credit','cheque','cash','traite','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `grand_total` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `tax` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `type_order` enum('sale','simple_sale','quote','purchase','invoice') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `fournisseur_id`, `payment_type`, `payment_status`, `grand_total`, `discount`, `tax`, `date`, `viewed`, `type_order`, `is_deleted`, `created_at`, `updated_at`) VALUES
(7, 1, NULL, '', 'unpaid', 2400.00, 0.00, 0, '2023-01-23 11:43:37', 0, 'quote', 0, '2023-01-23 14:43:37', '2023-01-30 09:29:23'),
(8, 1, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-31 22:00:00', 0, 'quote', 0, '2023-01-23 14:45:50', '2023-01-23 14:45:50'),
(9, 2, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-02-02 22:00:00', 0, 'quote', 0, '2023-01-23 14:47:25', '2023-01-23 14:47:25'),
(10, 2, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-02-01 22:00:00', 0, 'quote', 1, '2023-01-23 14:48:26', '2023-01-29 13:56:20'),
(11, NULL, 5, 'cheque', 'paid', 876.90, 2.00, 10, '2023-02-03 19:00:00', 0, 'invoice', 0, '2023-01-23 14:49:48', '2023-01-29 23:33:55'),
(12, 2, NULL, 'cheque', 'paid', 872.88, 22.00, 12, '2023-02-04 21:00:00', 0, 'invoice', 1, '2023-01-23 15:25:56', '2023-01-29 23:18:45'),
(13, 1, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-11 22:00:00', 0, 'simple_sale', 0, '2023-01-25 02:17:32', '2023-01-25 02:17:32'),
(14, 1, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-25 02:20:28', 0, 'simple_sale', 0, '2023-01-25 02:20:28', '2023-01-25 02:20:28'),
(15, 2, NULL, '', 'unpaid', 700.00, 99.00, 0, '2001-01-31 23:00:00', 0, 'invoice', 0, '2023-01-25 03:02:35', '2023-01-29 23:11:29'),
(16, 1, NULL, '', 'unpaid', 1598.00, 0.00, 0, '2001-01-31 23:00:00', 0, 'sale', 1, '2023-01-25 03:10:05', '2023-01-29 13:56:07'),
(17, NULL, 5, '', 'unpaid', 876.90, 2.00, 10, '2001-01-31 23:00:00', 0, 'invoice', 0, '2023-01-25 03:14:07', '2023-01-29 23:21:16'),
(18, 3, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-06-30 22:00:00', 0, 'invoice', 1, '2023-01-28 19:32:54', '2023-01-29 23:18:48'),
(19, 1, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-29 22:04:30', 0, 'invoice', 1, '2023-01-29 22:04:30', '2023-01-29 23:18:51'),
(20, 3, NULL, '', 'unpaid', 3196.00, 0.00, 0, '2023-01-29 22:06:41', 0, 'invoice', 1, '2023-01-29 22:06:41', '2023-01-29 23:18:53'),
(21, 3, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-29 22:08:49', 0, 'invoice', 0, '2023-01-29 22:08:49', '2023-01-30 13:13:59'),
(22, NULL, 2, '', 'unpaid', 799.00, 0.00, 0, '2023-01-29 22:02:18', 0, 'purchase', 0, '2023-01-29 23:02:19', '2023-01-29 23:02:25'),
(23, 2, NULL, '', 'unpaid', 799.00, 0.00, 0, '2023-01-29 22:02:42', 0, 'sale', 0, '2023-01-29 23:02:43', '2023-01-29 23:02:49'),
(24, 1, NULL, '', 'unpaid', 1600.00, 0.00, 0, '2023-01-30 09:00:41', 0, 'quote', 0, '2023-01-30 09:00:41', '2023-01-30 09:00:41'),
(25, NULL, NULL, '', 'unpaid', 2400.00, 0.00, 0, '2023-02-10 22:00:00', 0, 'simple_sale', 0, '2023-01-30 10:09:58', '2023-01-30 10:09:58'),
(26, NULL, NULL, '', 'unpaid', 1600.00, 0.00, 0, '2023-12-07 23:00:00', 0, 'simple_sale', 1, '2023-01-30 10:13:12', '2023-01-30 10:20:59'),
(27, 2, NULL, '', 'unpaid', 700.00, 0.00, 0, '2023-01-30 15:26:10', 0, 'sale', 0, '2023-01-30 15:26:11', '2023-01-30 15:26:11'),
(28, 1, NULL, '', 'unpaid', 600.00, 0.00, 0, '2023-01-30 22:51:48', 0, 'sale', 0, '2023-01-30 22:51:49', '2023-01-30 22:51:49'),
(29, 5, NULL, '', 'unpaid', 700.00, 0.00, 0, '2023-01-30 22:53:33', 0, 'sale', 0, '2023-01-30 22:53:33', '2023-01-30 22:53:33'),
(30, 2, NULL, '', 'unpaid', 1000.00, 0.00, 0, '2023-01-30 21:56:44', 0, 'sale', 0, '2023-01-30 22:56:44', '2023-01-30 22:57:09');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `discount`, `created_at`, `updated_at`) VALUES
(22, 7, 1, 2, 0.00, '2023-01-23 14:43:37', '2023-01-30 09:24:59'),
(23, 8, 1, 1, 0.00, '2023-01-23 14:45:50', '2023-01-23 14:45:50'),
(24, 9, 1, 1, 0.00, '2023-01-23 14:47:25', '2023-01-23 14:47:25'),
(25, 10, 1, 1, 0.00, '2023-01-23 14:48:26', '2023-01-23 14:48:26'),
(26, 11, 1, 1, 0.00, '2023-01-23 14:49:48', '2023-01-25 00:15:18'),
(27, 12, 1, 1, 0.00, '2023-01-23 15:25:56', '2023-01-24 23:04:30'),
(28, 13, 1, 1, 0.00, '2023-01-25 02:17:32', '2023-01-25 02:17:32'),
(29, 14, 1, 1, 0.00, '2023-01-25 02:20:28', '2023-01-25 02:20:28'),
(30, 15, 1, 1, 0.00, '2023-01-25 03:02:35', '2023-01-25 03:02:35'),
(31, 16, 1, 2, 0.00, '2023-01-25 03:10:05', '2023-01-25 03:10:05'),
(32, 17, 1, 1, 0.00, '2023-01-25 03:14:07', '2023-01-25 03:14:07'),
(33, 18, 1, 1, 0.00, '2023-01-28 19:32:54', '2023-01-28 19:32:54'),
(34, 19, 1, 1, 0.00, '2023-01-29 22:04:30', '2023-01-29 22:04:30'),
(35, 20, 1, 3, 0.00, '2023-01-29 22:06:41', '2023-01-29 22:06:41'),
(36, 20, 1, 1, 0.00, '2023-01-29 22:06:41', '2023-01-29 22:06:41'),
(37, 21, 1, 1, 0.00, '2023-01-29 22:08:49', '2023-01-29 22:08:49'),
(38, 22, 1, 1, 0.00, '2023-01-29 23:02:19', '2023-01-29 23:02:19'),
(39, 23, 1, 1, 0.00, '2023-01-29 23:02:43', '2023-01-29 23:02:43'),
(40, 24, 1, 2, 0.00, '2023-01-30 09:00:41', '2023-01-30 09:00:41'),
(44, 7, 1, 1, 0.00, '2023-01-30 09:29:16', '2023-01-30 09:29:16'),
(45, 25, 1, 3, -199.00, '2023-01-30 10:09:58', '2023-01-30 23:02:31'),
(46, 26, 1, 1, 0.00, '2023-01-30 10:13:12', '2023-01-30 10:13:12'),
(47, 26, 1, 1, 0.00, '2023-01-30 10:16:21', '2023-01-30 10:16:21'),
(48, 26, 1, 1, 0.00, '2023-01-30 10:17:20', '2023-01-30 10:17:20'),
(49, 26, 1, 1, 0.00, '2023-01-30 10:17:31', '2023-01-30 10:17:31'),
(50, 26, 1, 1, 0.00, '2023-01-30 10:17:50', '2023-01-30 10:17:50'),
(51, 26, 1, 1, 0.00, '2023-01-30 10:20:02', '2023-01-30 10:20:02'),
(52, 27, 1, 1, 0.00, '2023-01-30 15:26:11', '2023-01-30 15:26:11'),
(53, 28, 1, 1, 0.00, '2023-01-30 22:51:49', '2023-01-30 22:51:49'),
(54, 29, 1, 1, 0.00, '2023-01-30 22:53:33', '2023-01-30 22:53:33'),
(55, 30, 1, 2, 299.00, '2023-01-30 22:56:44', '2023-01-30 22:57:06');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
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
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photos` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL DEFAULT 0.00,
  `low_stock_quantity` int(11) NOT NULL DEFAULT 1,
  `buying_price` double(8,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `photos`, `description`, `unit_price`, `low_stock_quantity`, `buying_price`, `stock`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'abderrahmane wahna', NULL, NULL, NULL, 799.00, 5, 300.00, 998, 0, '2023-01-20 23:57:28', '2023-01-30 10:20:59');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'manager', '2023-01-20 18:26:29', '2023-01-20 18:26:29');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stock Managements',
  `appTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Drogree Stock Managements',
  `appLogoImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appBgLoginImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appAdresse` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appPhone1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appPhone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appFixe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `appName`, `appTitle`, `appLogoImage`, `appBgLoginImage`, `appAdresse`, `appPhone1`, `appPhone2`, `appFixe`, `created_at`, `updated_at`) VALUES
(3, 'Stock Managements', 'Drogree Stock Manafdsgements', '22063898610_1674245116.jpg', 'Capture d’écran 2022-10-10 0255272044640662_1674245140.png', 'sbata av dakhla  c d casa', '+212677873819', '0666375730', '0522222200', '2023-01-20 19:05:42', '2023-01-20 19:05:42');

-- --------------------------------------------------------

--
-- Structure de la table `traites`
--

CREATE TABLE `traites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fournisseur_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `nbr_traites` int(11) NOT NULL DEFAULT 0,
  `amount_paid` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traites`
--

INSERT INTO `traites` (`id`, `client_id`, `fournisseur_id`, `order_id`, `nbr_traites`, `amount_paid`, `payment_status`, `viewed`, `is_deleted`, `created_at`, `updated_at`) VALUES
(13, 1, NULL, 16, 4, 400.00, 'unpaid', 0, 1, '2023-01-28 22:12:41', '2023-01-28 22:48:58'),
(14, 1, NULL, 16, 4, 1200.00, 'paid', 0, 1, '2023-01-28 22:49:22', '2023-01-28 23:46:05'),
(15, 2, NULL, 15, 1, 0.00, 'paid', 0, 1, '2023-01-28 23:56:51', '2023-01-28 23:56:58'),
(16, 2, NULL, 15, 4, 0.00, 'unpaid', 0, 1, '2023-01-29 01:22:44', '2023-01-29 01:54:56'),
(17, 2, NULL, 15, 2, 100.00, 'paid', 0, 1, '2023-01-29 22:40:50', '2023-01-29 22:41:13');

-- --------------------------------------------------------

--
-- Structure de la table `traite_details`
--

CREATE TABLE `traite_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `traite_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `approaching_date` timestamp NULL DEFAULT NULL,
  `date_payment` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traite_details`
--

INSERT INTO `traite_details` (`id`, `traite_id`, `amount`, `approaching_date`, `date_payment`, `payment_status`, `created_at`, `updated_at`) VALUES
(14, 14, 300.00, '2023-01-30 21:00:00', '2023-01-28 23:17:50', 'paid', '2023-01-28 22:49:22', '2023-01-28 23:17:50'),
(15, 14, 400.00, '2023-01-16 21:00:00', '2023-01-28 23:17:54', 'paid', '2023-01-28 22:49:22', '2023-01-28 23:17:54'),
(27, 14, 200.00, '2023-01-30 21:00:00', '2023-01-28 23:41:48', 'paid', '2023-01-28 23:25:25', '2023-01-28 23:41:48'),
(28, 14, 300.00, '2023-01-30 21:00:00', '2023-01-28 23:42:20', 'paid', '2023-01-28 23:42:10', '2023-01-28 23:42:20'),
(30, 15, 55.00, '2023-01-01 22:00:00', '2023-01-28 23:56:51', 'paid', '2023-01-28 23:56:51', '2023-01-28 23:56:51'),
(31, 16, 100.00, '2023-01-28 23:00:00', '2023-01-29 01:22:44', 'paid', '2023-01-29 01:22:44', '2023-01-29 01:52:00'),
(32, 16, 200.00, '2023-01-11 22:00:00', NULL, 'unpaid', '2023-01-29 01:22:44', '2023-01-29 01:22:44'),
(33, 16, 300.00, '2023-02-03 22:00:00', NULL, 'unpaid', '2023-01-29 01:22:44', '2023-01-29 01:22:44'),
(34, 16, 200.00, '2023-01-01 23:00:00', NULL, 'unpaid', '2023-01-29 01:51:49', '2023-01-29 01:54:51'),
(35, 17, 120.00, '2001-01-31 23:00:00', '2023-01-29 22:40:50', 'paid', '2023-01-29 22:40:50', '2023-01-29 22:40:50'),
(36, 17, 100.00, '2001-01-31 23:00:00', '2023-01-29 22:41:04', 'paid', '2023-01-29 22:40:50', '2023-01-29 22:41:04');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `avatare` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `avatare`, `cin`, `phone`, `adresse`, `is_deleted`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'abdou', 'abdo.sbeta.00@gmail.com', NULL, '$2y$10$UpQjr1Gqw8bVOLBq8hyXnerR1xDx1nFvHpgesQjYThlyASt/8AaV6', 1, NULL, NULL, NULL, NULL, 0, NULL, '2023-01-20 18:26:29', '2023-01-20 18:26:29');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashes_client_id_foreign` (`client_id`),
  ADD KEY `cashes_fournisseur_id_foreign` (`fournisseur_id`),
  ADD KEY `cashes_order_id_foreign` (`order_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cheques_client_id_foreign` (`client_id`),
  ADD KEY `cheques_fournisseur_id_foreign` (`fournisseur_id`),
  ADD KEY `cheques_order_id_foreign` (`order_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credits_client_id_foreign` (`client_id`),
  ADD KEY `credits_fournisseur_id_foreign` (`fournisseur_id`),
  ADD KEY `credits_order_id_foreign` (`order_id`);

--
-- Index pour la table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employer_states`
--
ALTER TABLE `employer_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_states_employer_id_foreign` (`employer_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_fournisseur_id_foreign` (`fournisseur_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`user_id`,`role`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traites`
--
ALTER TABLE `traites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traites_client_id_foreign` (`client_id`),
  ADD KEY `traites_fournisseur_id_foreign` (`fournisseur_id`),
  ADD KEY `traites_order_id_foreign` (`order_id`);

--
-- Index pour la table `traite_details`
--
ALTER TABLE `traite_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traite_details_traite_id_foreign` (`traite_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cashes`
--
ALTER TABLE `cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `employer_states`
--
ALTER TABLE `employer_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `traites`
--
ALTER TABLE `traites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `traite_details`
--
ALTER TABLE `traite_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD CONSTRAINT `cashes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cashes_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cashes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cheques_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cheques_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cheques_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credits_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `credits_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `credits_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `employer_states`
--
ALTER TABLE `employer_states`
  ADD CONSTRAINT `employer_states_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `traites`
--
ALTER TABLE `traites`
  ADD CONSTRAINT `traites_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `traites_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `traites_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `traite_details`
--
ALTER TABLE `traite_details`
  ADD CONSTRAINT `traite_details_traite_id_foreign` FOREIGN KEY (`traite_id`) REFERENCES `traites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
