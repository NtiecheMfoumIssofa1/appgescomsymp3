-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 29 Juin 2017 à 18:46
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `affides_pos`
--

-- --------------------------------------------------------

--
-- Structure de la table `boncommande`
--

CREATE TABLE `boncommande` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `annule` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `boncommande`
--

INSERT INTO `boncommande` (`id`, `ticket_id`, `date`, `annule`) VALUES
(1, 1, '2017-06-15 13:40:40', 1),
(2, 2, '2017-06-15 15:31:51', 1),
(3, 3, '2017-06-15 15:39:19', 1),
(4, 4, '2017-06-15 15:44:00', 1),
(5, 5, '2017-06-15 15:46:24', 1),
(6, 6, '2017-06-15 15:47:42', 1),
(7, 6, '2017-06-15 15:50:24', 1),
(8, 7, '2017-06-15 15:52:09', 1),
(9, 8, '2017-06-15 15:55:10', 1),
(10, 9, '2017-06-15 16:27:47', 1),
(11, 10, '2017-06-15 16:31:28', 1),
(12, 11, '2017-06-15 16:51:44', 1),
(13, 12, '2017-06-15 16:53:55', 1),
(14, 13, '2017-06-15 17:03:20', 1),
(15, 11, '2017-06-15 17:16:54', 1),
(16, 14, '2017-06-16 06:26:30', 1),
(17, 14, '2017-06-16 06:31:20', 1),
(18, 15, '2017-06-16 06:33:15', 1),
(19, 15, '2017-06-16 06:52:58', 1),
(20, 15, '2017-06-16 06:53:57', 1),
(21, 15, '2017-06-16 07:05:06', 1),
(22, 15, '2017-06-16 07:06:02', 1),
(23, 15, '2017-06-16 07:15:56', 1),
(24, 15, '2017-06-16 07:16:33', 1),
(25, 16, '2017-06-16 07:52:56', 1),
(26, 17, '2017-06-16 07:53:55', 1),
(27, 4, '2017-06-16 08:27:54', 1),
(28, 18, '2017-06-16 11:13:00', 1),
(29, 19, '2017-06-16 12:00:07', 1),
(30, 20, '2017-06-16 12:35:38', 1),
(31, 21, '2017-06-16 12:39:08', 1),
(32, 22, '2017-06-20 13:52:31', 1),
(33, 23, '2017-06-20 14:03:20', 1),
(34, 23, '2017-06-20 14:03:25', 1),
(35, 24, '2017-06-20 14:04:28', 1),
(36, 24, '2017-06-20 14:04:35', 1),
(37, 25, '2017-06-20 14:05:13', 1),
(38, 25, '2017-06-20 14:05:20', 1),
(39, 26, '2017-06-20 14:06:05', 1),
(40, 27, '2017-06-20 20:53:01', 1),
(41, 28, '2017-06-20 20:55:32', 1),
(42, 29, '2017-06-21 02:11:19', 1),
(43, 30, '2017-06-21 13:21:43', 1),
(44, 31, '2017-06-21 13:22:41', 1),
(45, 32, '2017-06-21 13:23:14', 1),
(46, 33, '2017-06-21 13:23:48', 1),
(47, 34, '2017-06-21 13:24:18', 1),
(48, 35, '2017-06-21 13:25:07', 1),
(49, 36, '2017-06-21 13:25:42', 1),
(50, 37, '2017-06-21 13:29:43', 1),
(51, 37, '2017-06-21 13:31:06', 1),
(52, 38, '2017-06-21 13:37:27', 1),
(53, 39, '2017-06-22 10:02:50', 1),
(54, 40, '2017-06-22 10:06:51', 1),
(55, 40, '2017-06-22 10:08:09', 1),
(56, 40, '2017-06-22 10:08:52', 1),
(57, 41, '2017-06-22 10:25:44', 1),
(58, 42, '2017-06-22 10:40:29', 1),
(59, 43, '2017-06-22 10:43:14', 1),
(60, 44, '2017-06-22 10:50:35', 1),
(61, 45, '2017-06-22 10:50:47', 1),
(62, 46, '2017-06-22 11:54:15', 1),
(63, 35, '2017-06-22 11:55:19', 1),
(64, 47, '2017-06-22 12:01:34', 1),
(65, 48, '2017-06-22 12:01:56', 1),
(66, 49, '2017-06-22 12:02:19', 1),
(67, 50, '2017-06-22 12:02:35', 1),
(68, 51, '2017-06-22 12:13:12', 1),
(69, 52, '2017-06-22 12:21:04', 1),
(70, 53, '2017-06-22 12:21:35', 1),
(71, 54, '2017-06-22 12:22:32', 1),
(72, 55, '2017-06-22 12:23:46', 1),
(73, 55, '2017-06-22 12:27:37', 1),
(74, 55, '2017-06-22 12:29:56', 1),
(75, 56, '2017-06-22 12:56:07', 1),
(76, 57, '2017-06-22 12:56:33', 1),
(77, 58, '2017-06-22 13:13:05', 1),
(78, 59, '2017-06-22 13:13:58', 1),
(79, 60, '2017-06-22 13:15:55', 1),
(80, 60, '2017-06-22 13:16:24', 1),
(81, 61, '2017-06-22 13:18:26', 1),
(82, 61, '2017-06-22 13:19:01', 1),
(83, 62, '2017-06-22 13:19:50', 1),
(84, 63, '2017-06-22 13:20:17', 1),
(85, 63, '2017-06-22 13:20:17', 1),
(86, 64, '2017-06-22 13:27:48', 1),
(87, 65, '2017-06-22 13:28:11', 1),
(88, 66, '2017-06-22 13:40:28', 1),
(89, 67, '2017-06-22 13:41:12', 1),
(90, 68, '2017-06-22 13:58:29', 1),
(91, 68, '2017-06-22 13:58:44', 1),
(92, 69, '2017-06-22 14:00:35', 1),
(93, 69, '2017-06-22 14:00:39', 1),
(94, 70, '2017-06-22 14:01:48', 1),
(95, 71, '2017-06-22 14:06:23', 1),
(96, 72, '2017-06-22 14:08:08', 1),
(97, 73, '2017-06-22 14:29:32', 1),
(98, 74, '2017-06-22 15:13:41', 1),
(99, 75, '2017-06-22 15:34:57', 1),
(100, 76, '2017-06-27 15:01:33', 1),
(101, 77, '2017-06-27 15:49:59', 1),
(102, 78, '2017-06-27 16:04:34', 1),
(103, 79, '2017-06-28 15:01:40', 1),
(104, 80, '2017-06-28 15:02:13', 1),
(105, 81, '2017-06-28 15:02:46', 1),
(106, 82, '2017-06-28 15:03:17', 1),
(107, 83, '2017-06-28 15:15:59', 1),
(108, 84, '2017-06-28 15:16:32', 1),
(109, 85, '2017-06-28 15:16:55', 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `impression` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `impression`) VALUES
(1, 'Boissons', 'Bar'),
(2, 'Whisky', 'Bar'),
(3, 'vin', 'Bar'),
(4, 'liqueurs', 'Bar'),
(6, 'Rhum', 'Bar'),
(7, 'Vodka', 'Bar'),
(8, 'Cocktail', 'Bar'),
(9, 'Cognac', 'Bar'),
(10, 'Plats', 'Cuisine'),
(11, 'Chicha', 'Chicha'),
(12, 'Offre', 'Bar');

-- --------------------------------------------------------

--
-- Structure de la table `commandeprod`
--

CREATE TABLE `commandeprod` (
  `id` int(11) NOT NULL,
  `bon_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `commandeprod`
--

INSERT INTO `commandeprod` (`id`, `bon_id`, `produit_id`, `quantite`, `date`) VALUES
(1, 1, 2, 2, '2017-06-15 13:40:40'),
(2, 1, 8, 1, '2017-06-15 13:40:40'),
(3, 1, 3, 1, '2017-06-15 13:40:40'),
(4, 1, 4, 1, '2017-06-15 13:40:40'),
(5, 2, 8, 1, '2017-06-15 15:31:51'),
(6, 2, 7, 2, '2017-06-15 15:31:51'),
(7, 3, 4, 1, '2017-06-15 15:39:19'),
(8, 3, 5, 2, '2017-06-15 15:39:19'),
(9, 3, 6, 1, '2017-06-15 15:39:19'),
(10, 4, 2, 4, '2017-06-15 15:44:00'),
(11, 4, 8, 1, '2017-06-15 15:44:00'),
(12, 4, 10, 1, '2017-06-15 15:44:00'),
(13, 5, 5, 2, '2017-06-15 15:46:24'),
(14, 5, 6, 2, '2017-06-15 15:46:24'),
(15, 6, 3, 1, '2017-06-15 15:47:42'),
(16, 6, 4, 1, '2017-06-15 15:47:42'),
(17, 7, 10, 1, '2017-06-15 15:50:24'),
(18, 7, 11, 1, '2017-06-15 15:50:24'),
(19, 7, 15, 1, '2017-06-15 15:50:24'),
(20, 8, 2, 1, '2017-06-15 15:52:09'),
(21, 8, 3, 1, '2017-06-15 15:52:09'),
(22, 8, 8, 4, '2017-06-15 15:52:09'),
(23, 9, 2, 1, '2017-06-15 15:55:10'),
(24, 9, 3, 1, '2017-06-15 15:55:10'),
(25, 9, 8, 3, '2017-06-15 15:55:10'),
(26, 10, 2, 1, '2017-06-15 16:27:47'),
(27, 10, 3, 1, '2017-06-15 16:27:47'),
(28, 10, 26, 1, '2017-06-15 16:27:47'),
(29, 10, 25, 2, '2017-06-15 16:27:47'),
(30, 11, 2, 1, '2017-06-15 16:31:28'),
(31, 11, 1, 1, '2017-06-15 16:31:28'),
(32, 11, 7, 3, '2017-06-15 16:31:28'),
(33, 11, 22, 1, '2017-06-15 16:31:28'),
(34, 11, 23, 3, '2017-06-15 16:31:28'),
(35, 11, 24, 2, '2017-06-15 16:31:28'),
(36, 12, 4, 3, '2017-06-15 16:51:44'),
(37, 13, 8, 2, '2017-06-15 16:53:55'),
(38, 13, 7, 1, '2017-06-15 16:53:55'),
(39, 13, 1, 1, '2017-06-15 16:53:55'),
(40, 13, 2, 1, '2017-06-15 16:53:55'),
(41, 14, 1, 2, '2017-06-15 17:03:20'),
(42, 14, 2, 2, '2017-06-15 17:03:20'),
(43, 15, 23, 2, '2017-06-15 17:16:54'),
(44, 16, 10, 1, '2017-06-16 06:26:30'),
(45, 17, 10, 2, '2017-06-16 06:31:20'),
(46, 18, 21, 2, '2017-06-16 06:33:15'),
(47, 19, 10, 2, '2017-06-16 06:52:58'),
(48, 20, 10, 2, '2017-06-16 06:53:57'),
(49, 21, 21, 2, '2017-06-16 07:05:06'),
(50, 22, 21, 2, '2017-06-16 07:06:02'),
(51, 23, 17, 1, '2017-06-16 07:15:56'),
(52, 24, 17, 1, '2017-06-16 07:16:33'),
(53, 25, 10, 2, '2017-06-16 07:52:56'),
(54, 26, 21, 4, '2017-06-16 07:53:55'),
(55, 27, 15, 1, '2017-06-16 08:27:54'),
(56, 28, 25, 4, '2017-06-16 11:13:00'),
(57, 28, 24, 1, '2017-06-16 11:13:00'),
(58, 29, 8, 3, '2017-06-16 12:00:07'),
(59, 30, 1, 2, '2017-06-16 12:35:38'),
(60, 30, 8, 2, '2017-06-16 12:35:38'),
(61, 30, 3, 1, '2017-06-16 12:35:38'),
(62, 31, 2, 1, '2017-06-16 12:39:08'),
(63, 31, 22, 5, '2017-06-16 12:39:08'),
(64, 31, 26, 1, '2017-06-16 12:39:08'),
(65, 32, 2, 1, '2017-06-20 13:52:31'),
(66, 32, 14, 1, '2017-06-20 13:52:31'),
(67, 32, 15, 2, '2017-06-20 13:52:31'),
(68, 33, 5, 1, '2017-06-20 14:03:20'),
(69, 33, 4, 2, '2017-06-20 14:03:20'),
(70, 34, 5, 1, '2017-06-20 14:03:25'),
(71, 34, 4, 2, '2017-06-20 14:03:25'),
(72, 35, 3, 1, '2017-06-20 14:04:28'),
(73, 35, 5, 1, '2017-06-20 14:04:28'),
(74, 35, 6, 2, '2017-06-20 14:04:28'),
(75, 36, 3, 1, '2017-06-20 14:04:35'),
(76, 36, 5, 1, '2017-06-20 14:04:35'),
(77, 36, 6, 2, '2017-06-20 14:04:35'),
(78, 37, 3, 1, '2017-06-20 14:05:13'),
(79, 37, 4, 1, '2017-06-20 14:05:13'),
(80, 37, 10, 1, '2017-06-20 14:05:13'),
(81, 38, 3, 1, '2017-06-20 14:05:20'),
(82, 38, 4, 1, '2017-06-20 14:05:20'),
(83, 38, 10, 1, '2017-06-20 14:05:20'),
(84, 39, 2, 1, '2017-06-20 14:06:05'),
(85, 39, 3, 1, '2017-06-20 14:06:05'),
(86, 39, 5, 1, '2017-06-20 14:06:05'),
(87, 40, 5, 4, '2017-06-20 20:53:01'),
(88, 40, 6, 1, '2017-06-20 20:53:01'),
(89, 40, 4, 1, '2017-06-20 20:53:01'),
(90, 41, 3, 1, '2017-06-20 20:55:32'),
(91, 41, 2, 1, '2017-06-20 20:55:32'),
(92, 42, 2, 4, '2017-06-21 02:11:20'),
(93, 43, 1, 1, '2017-06-21 13:21:43'),
(94, 43, 2, 1, '2017-06-21 13:21:43'),
(95, 43, 7, 1, '2017-06-21 13:21:43'),
(96, 43, 8, 3, '2017-06-21 13:21:43'),
(97, 44, 23, 1, '2017-06-21 13:22:41'),
(98, 44, 24, 4, '2017-06-21 13:22:41'),
(99, 44, 27, 1, '2017-06-21 13:22:41'),
(100, 44, 22, 1, '2017-06-21 13:22:41'),
(101, 45, 3, 1, '2017-06-21 13:23:14'),
(102, 45, 4, 4, '2017-06-21 13:23:14'),
(103, 46, 2, 1, '2017-06-21 13:23:48'),
(104, 46, 3, 1, '2017-06-21 13:23:48'),
(105, 46, 4, 1, '2017-06-21 13:23:48'),
(106, 46, 8, 3, '2017-06-21 13:23:48'),
(107, 47, 13, 1, '2017-06-21 13:24:18'),
(108, 47, 14, 1, '2017-06-21 13:24:18'),
(109, 48, 27, 3, '2017-06-21 13:25:07'),
(110, 48, 22, 8, '2017-06-21 13:25:07'),
(111, 49, 6, 3, '2017-06-21 13:25:42'),
(112, 50, 6, 2, '2017-06-21 13:29:43'),
(113, 50, 5, 1, '2017-06-21 13:29:43'),
(114, 51, 7, 1, '2017-06-21 13:31:06'),
(115, 51, 1, 2, '2017-06-21 13:31:06'),
(116, 52, 4, 2, '2017-06-21 13:37:27'),
(117, 53, 1, 1, '2017-06-22 10:02:50'),
(118, 53, 2, 2, '2017-06-22 10:02:50'),
(119, 54, 17, 1, '2017-06-22 10:06:51'),
(120, 55, 21, 1, '2017-06-22 10:08:09'),
(121, 55, 20, 1, '2017-06-22 10:08:09'),
(122, 55, 10, 1, '2017-06-22 10:08:09'),
(123, 56, 7, 1, '2017-06-22 10:08:52'),
(124, 56, 8, 1, '2017-06-22 10:08:52'),
(125, 57, 2, 1, '2017-06-22 10:25:44'),
(126, 57, 3, 1, '2017-06-22 10:25:44'),
(127, 58, 10, 1, '2017-06-22 10:40:29'),
(128, 58, 11, 1, '2017-06-22 10:40:29'),
(129, 59, 3, 1, '2017-06-22 10:43:14'),
(130, 59, 19, 2, '2017-06-22 10:43:14'),
(131, 60, 3, 1, '2017-06-22 10:50:36'),
(132, 60, 4, 1, '2017-06-22 10:50:36'),
(133, 61, 6, 1, '2017-06-22 10:50:47'),
(134, 61, 5, 1, '2017-06-22 10:50:47'),
(135, 62, 1, 1, '2017-06-22 11:54:15'),
(136, 62, 2, 1, '2017-06-22 11:54:15'),
(137, 62, 3, 1, '2017-06-22 11:54:15'),
(138, 62, 8, 2, '2017-06-22 11:54:15'),
(139, 63, 19, 1, '2017-06-22 11:55:20'),
(140, 63, 20, 1, '2017-06-22 11:55:20'),
(141, 64, 17, 1, '2017-06-22 12:01:34'),
(142, 64, 16, 6, '2017-06-22 12:01:34'),
(143, 64, 19, 3, '2017-06-22 12:01:34'),
(144, 64, 20, 3, '2017-06-22 12:01:34'),
(145, 65, 27, 4, '2017-06-22 12:01:56'),
(146, 65, 25, 1, '2017-06-22 12:01:56'),
(147, 65, 22, 4, '2017-06-22 12:01:56'),
(148, 66, 8, 3, '2017-06-22 12:02:19'),
(149, 66, 2, 1, '2017-06-22 12:02:19'),
(150, 66, 3, 1, '2017-06-22 12:02:19'),
(151, 67, 4, 1, '2017-06-22 12:02:35'),
(152, 67, 3, 1, '2017-06-22 12:02:35'),
(153, 67, 5, 2, '2017-06-22 12:02:35'),
(154, 68, 4, 1, '2017-06-22 12:13:12'),
(155, 68, 5, 1, '2017-06-22 12:13:12'),
(156, 69, 22, 2, '2017-06-22 12:21:04'),
(157, 69, 23, 2, '2017-06-22 12:21:04'),
(158, 69, 24, 1, '2017-06-22 12:21:04'),
(159, 70, 23, 2, '2017-06-22 12:21:35'),
(160, 70, 24, 1, '2017-06-22 12:21:35'),
(161, 71, 27, 2, '2017-06-22 12:22:32'),
(162, 71, 26, 1, '2017-06-22 12:22:32'),
(163, 72, 26, 1, '2017-06-22 12:23:46'),
(164, 72, 27, 1, '2017-06-22 12:23:46'),
(165, 73, 22, 1, '2017-06-22 12:27:37'),
(166, 74, 23, 1, '2017-06-22 12:29:56'),
(167, 75, 26, 3, '2017-06-22 12:56:07'),
(168, 75, 27, 2, '2017-06-22 12:56:07'),
(169, 76, 27, 10, '2017-06-22 12:56:33'),
(170, 77, 17, 1, '2017-06-22 13:13:05'),
(171, 78, 18, 1, '2017-06-22 13:13:58'),
(172, 79, 10, 1, '2017-06-22 13:15:55'),
(173, 79, 15, 1, '2017-06-22 13:15:55'),
(174, 79, 20, 1, '2017-06-22 13:15:55'),
(175, 79, 21, 1, '2017-06-22 13:15:55'),
(176, 80, 25, 1, '2017-06-22 13:16:24'),
(177, 80, 26, 1, '2017-06-22 13:16:24'),
(178, 81, 17, 1, '2017-06-22 13:18:26'),
(179, 82, 18, 3, '2017-06-22 13:19:01'),
(180, 83, 18, 1, '2017-06-22 13:19:50'),
(181, 84, 23, 2, '2017-06-22 13:20:17'),
(182, 84, 24, 1, '2017-06-22 13:20:17'),
(183, 84, 22, 2, '2017-06-22 13:20:17'),
(184, 84, 25, 1, '2017-06-22 13:20:17'),
(185, 85, 23, 2, '2017-06-22 13:20:17'),
(186, 85, 24, 1, '2017-06-22 13:20:17'),
(187, 85, 22, 2, '2017-06-22 13:20:17'),
(188, 85, 25, 1, '2017-06-22 13:20:17'),
(189, 86, 4, 3, '2017-06-22 13:27:48'),
(190, 87, 27, 3, '2017-06-22 13:28:11'),
(191, 87, 23, 1, '2017-06-22 13:28:11'),
(192, 88, 26, 1, '2017-06-22 13:40:28'),
(193, 88, 25, 1, '2017-06-22 13:40:28'),
(194, 88, 27, 1, '2017-06-22 13:40:28'),
(195, 89, 25, 2, '2017-06-22 13:41:13'),
(196, 89, 26, 1, '2017-06-22 13:41:13'),
(197, 89, 27, 1, '2017-06-22 13:41:13'),
(198, 90, 1, 1, '2017-06-22 13:58:29'),
(199, 90, 2, 1, '2017-06-22 13:58:29'),
(200, 90, 3, 1, '2017-06-22 13:58:29'),
(201, 90, 26, 1, '2017-06-22 13:58:29'),
(202, 90, 25, 1, '2017-06-22 13:58:29'),
(203, 90, 24, 1, '2017-06-22 13:58:29'),
(204, 90, 30, 1, '2017-06-22 13:58:29'),
(205, 90, 31, 1, '2017-06-22 13:58:29'),
(206, 91, 1, 1, '2017-06-22 13:58:44'),
(207, 91, 2, 1, '2017-06-22 13:58:44'),
(208, 91, 3, 1, '2017-06-22 13:58:44'),
(209, 91, 26, 1, '2017-06-22 13:58:44'),
(210, 91, 25, 1, '2017-06-22 13:58:44'),
(211, 91, 24, 1, '2017-06-22 13:58:44'),
(212, 91, 30, 1, '2017-06-22 13:58:44'),
(213, 91, 31, 1, '2017-06-22 13:58:44'),
(214, 92, 31, 1, '2017-06-22 14:00:35'),
(215, 93, 31, 1, '2017-06-22 14:00:39'),
(216, 94, 1, 1, '2017-06-22 14:01:49'),
(217, 94, 2, 1, '2017-06-22 14:01:49'),
(218, 94, 31, 1, '2017-06-22 14:01:49'),
(219, 94, 32, 1, '2017-06-22 14:01:49'),
(220, 94, 25, 1, '2017-06-22 14:01:49'),
(221, 94, 26, 1, '2017-06-22 14:01:49'),
(222, 95, 2, 3, '2017-06-22 14:06:23'),
(223, 95, 1, 2, '2017-06-22 14:06:23'),
(224, 95, 4, 1, '2017-06-22 14:06:23'),
(225, 95, 10, 1, '2017-06-22 14:06:23'),
(226, 95, 31, 2, '2017-06-22 14:06:23'),
(227, 96, 2, 1, '2017-06-22 14:08:08'),
(228, 96, 3, 1, '2017-06-22 14:08:08'),
(229, 96, 1, 1, '2017-06-22 14:08:08'),
(230, 96, 7, 1, '2017-06-22 14:08:08'),
(231, 96, 20, 1, '2017-06-22 14:08:08'),
(232, 96, 19, 1, '2017-06-22 14:08:08'),
(233, 96, 18, 1, '2017-06-22 14:08:09'),
(234, 96, 27, 2, '2017-06-22 14:08:09'),
(235, 96, 23, 2, '2017-06-22 14:08:09'),
(236, 96, 32, 1, '2017-06-22 14:08:09'),
(237, 96, 31, 1, '2017-06-22 14:08:09'),
(238, 96, 30, 1, '2017-06-22 14:08:09'),
(239, 97, 1, 2, '2017-06-22 14:29:33'),
(240, 97, 2, 2, '2017-06-22 14:29:33'),
(241, 97, 10, 3, '2017-06-22 14:29:33'),
(242, 97, 25, 2, '2017-06-22 14:29:33'),
(243, 97, 26, 1, '2017-06-22 14:29:33'),
(244, 97, 28, 1, '2017-06-22 14:29:33'),
(245, 97, 29, 1, '2017-06-22 14:29:33'),
(246, 98, 1, 1, '2017-06-22 15:13:41'),
(247, 98, 2, 1, '2017-06-22 15:13:41'),
(248, 98, 7, 1, '2017-06-22 15:13:41'),
(249, 98, 3, 1, '2017-06-22 15:13:41'),
(250, 98, 26, 1, '2017-06-22 15:13:41'),
(251, 98, 27, 1, '2017-06-22 15:13:41'),
(252, 98, 25, 1, '2017-06-22 15:13:41'),
(253, 98, 24, 1, '2017-06-22 15:13:41'),
(254, 98, 29, 1, '2017-06-22 15:13:41'),
(255, 98, 30, 1, '2017-06-22 15:13:41'),
(256, 99, 8, 1, '2017-06-22 15:34:57'),
(257, 99, 17, 1, '2017-06-22 15:34:57'),
(258, 99, 18, 1, '2017-06-22 15:34:57'),
(259, 99, 19, 1, '2017-06-22 15:34:57'),
(260, 100, 8, 1, '2017-06-27 15:01:33'),
(261, 100, 1, 1, '2017-06-27 15:01:33'),
(262, 100, 25, 1, '2017-06-27 15:01:33'),
(263, 100, 32, 1, '2017-06-27 15:01:33'),
(264, 101, 2, 1, '2017-06-27 15:49:59'),
(265, 102, 3, 1, '2017-06-27 16:04:34'),
(266, 102, 4, 1, '2017-06-27 16:04:34'),
(267, 103, 38, 1, '2017-06-28 15:01:40'),
(268, 104, 2, 1, '2017-06-28 15:02:13'),
(269, 105, 8, 1, '2017-06-28 15:02:46'),
(270, 106, 5, 1, '2017-06-28 15:03:17'),
(271, 107, 2, 1, '2017-06-28 15:15:59'),
(272, 107, 35, 1, '2017-06-28 15:15:59'),
(273, 108, 40, 1, '2017-06-28 15:16:32'),
(274, 109, 75, 1, '2017-06-28 15:16:55');

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `couleur` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `employes`
--

INSERT INTO `employes` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `couleur`) VALUES
(1, 'veronique', 'veronique', 'veronique@black.cm', 'veronique@black.cm', 1, NULL, '$2y$13$4R3aQxO8YXCwTkLtWqi/i.vfT4Qy1uhRSkFYzK9Itz/27WIljIHly', '2017-06-28 16:06:21', NULL, NULL, 'a:0:{}', '#F39C12'),
(2, 'josee', 'josee', 'josee@black.cm', 'josee@black.cm', 1, NULL, '$2y$13$g2okr/hRmJf8YOszTGDsJuNO314nMEh6EDIcn87tAKgBnwgbPKHsC', '2017-06-20 20:52:48', NULL, NULL, 'a:0:{}', '#50C1CF'),
(3, 'sonia', 'sonia', 'sonia@black.cm', 'sonia@black.cm', 1, NULL, '$2y$13$2nqV0ZHMZpbldf1rEKd3OeiTeLTK2LvJUghRl4NLLV5NN/pF1HHMa', '2017-06-28 15:15:24', NULL, NULL, 'a:1:{i:0;s:11:"ROLE_CAISSE";}', '#97a005'),
(4, 'joseph', 'joseph', 'joseph@black.cm', 'joseph@black.cm', 1, NULL, '$2y$13$ep8/okfS.YYYgQtM0JGu6O.XMDdcjP9.6FTitlNnf5u7q0d.kUgyG', '2017-06-22 15:13:04', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', '#E74C3C'),
(5, 'achille', 'achille', 'achille@black.cm', 'achille@black.cm', 1, NULL, '$2y$13$BIn3CBLSQS0IvT94JD.Ai.DrWRAmoOJ6mBmpkvpxUo7QQo6w378zC', '2017-06-29 14:54:52', NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', '#9B59B6');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `adresse`) VALUES
(1, 'Guiness', 'Yaoundé , tel:6760001'),
(2, 'Brasserie', '222 222 22');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Prixvente` int(11) NOT NULL,
  `prixachat` int(11) NOT NULL,
  `qtestock` int(11) DEFAULT NULL,
  `qtemin` int(11) DEFAULT NULL,
  `gerstock` tinyint(1) NOT NULL,
  `typeproduit` smallint(6) NOT NULL,
  `qtepart` smallint(6) DEFAULT NULL,
  `nbrediv` smallint(6) DEFAULT NULL,
  `divvendu` smallint(6) DEFAULT NULL,
  `prodparent` longtext COLLATE utf8_unicode_ci,
  `fournisseur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `thumbnail_id`, `code`, `designation`, `Prixvente`, `prixachat`, `qtestock`, `qtemin`, `gerstock`, `typeproduit`, `qtepart`, `nbrediv`, `divvendu`, `prodparent`, `fournisseur_id`) VALUES
(1, 1, 5, 'sprite', 'Sprite', 1500, 208, 11, 24, 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 1, 6, 'fanta', 'Fanta', 1500, 188, 45, 6, 1, 1, NULL, NULL, NULL, NULL, NULL),
(3, 1, 8, 'sch_soda', 'Schweppes Soda', 1500, 240, 13, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(4, 1, 7, 'cafe', 'Cafe', 1500, 500, 35, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(5, 1, NULL, 'the', 'The', 1500, 500, 69, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(6, 1, NULL, 'tan_pm', 'Tangui PM', 1000, 158, 46, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(7, 1, NULL, 'mth_e', 'Menthe à eau', 0, 0, -11, 0, 1, 1, NULL, NULL, NULL, NULL, NULL),
(8, 1, NULL, 'Diabo', 'diabolo', 1500, 400, -32, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(9, 3, NULL, 'mer_btle', 'Merlot - Btle', 15000, 3700, 20, 1, 1, 2, 6, NULL, 0, NULL, NULL),
(10, 3, NULL, 'mer_ver', 'Merlot - verre', 3500, 740, -2, NULL, 0, 3, NULL, 1, NULL, 'mer_btle', NULL),
(11, 3, NULL, 'medoc', 'Medoc', 20000, 7600, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(12, 3, 1, 'ca_sauv', 'Cabernet Sauvignon Cavior', 20000, 8500, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(13, 3, NULL, 'H_med', 'Haut-Medoc', 25000, 11500, 6, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(14, 3, 2, 'cha_btl', 'Chardonnay - Btle', 15000, 4500, 8, 4, 1, 2, 6, NULL, 4, NULL, NULL),
(15, 3, NULL, 'cha_ve', 'Chardonnay -verre', 3000, 900, -1, NULL, 0, 3, NULL, 1, NULL, 'cha_btl', NULL),
(16, 2, 9, 'bal_btl', 'Ballantine\'s', 25000, 7200, 19, 2, 1, 2, 14, NULL, 10, NULL, NULL),
(17, 2, 10, 'bal_1/2', '1/2 Ballantine\'s', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'bal_btl', NULL),
(18, 2, 3, 'bal_con', 'conso Ballantine\'s', 2500, 514, NULL, NULL, 0, 3, NULL, 1, NULL, 'bal_btl', NULL),
(19, 2, 4, 'CH12_B', 'Chivas 12 Years', 35000, 15300, 22, 8, 1, 2, 6, NULL, 3, NULL, NULL),
(20, 2, NULL, 'CH12_1/2', '1/2 Chivas 12 Years', 18000, 7650, NULL, NULL, 0, 3, NULL, 2, NULL, 'CH12_B', NULL),
(21, 2, NULL, 'CH12_C', 'Conso Chivas 12 Years', 3500, 1093, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH12_B', NULL),
(22, 10, NULL, 'BrB', 'Brochettes de boeuf', 1000, 540, -26, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(23, 10, NULL, 'Pr_plan', 'Portion frittes plantain', 1000, 200, -18, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(24, 10, NULL, 'Pr_pom', 'Portion frittes pommes', 1000, 413, -14, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(25, 10, NULL, 'PL_1/4P', '1/4 Poulets + frittes plantain', 3000, 1413, -20, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(26, 10, NULL, 'PL_1/2P', '1/2 Poulets + frittes plantain', 5000, 2200, -15, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(27, 10, NULL, 'PL_ENP', 'Poulets entier + frittes plantain', 10000, 4826, -31, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(28, 11, NULL, 'CHCM', 'Chicha Chwingum menthe', 3000, 2000, -1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(29, 11, NULL, 'CHCIM', 'Chicha Citron menthe', 3000, 2000, -2, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(30, 11, NULL, 'CHIM', 'Chicha menthe', 3000, 2000, -4, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(31, 11, NULL, 'CHIPO', 'Chicha Pomme', 3000, 2000, -8, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(32, 11, NULL, 'CHIPOM', 'Chicha Pomme menthe', 3000, 2000, -3, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(33, 12, NULL, 'CCGM', 'Coca GM', 0, 0, 20, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(34, 12, NULL, 'TOSGM', 'Top Soda GM', 0, 0, 20, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(35, 1, NULL, 'test', 'test', 2, 1, 0, 1, 1, 1, NULL, NULL, NULL, NULL, 1),
(36, 1, NULL, 'PEPM', 'Perrier PM', 2000, 1000, 10, 6, 1, 1, NULL, NULL, NULL, NULL, NULL),
(37, 1, NULL, 'MTHL', 'Menthe au lait', 2500, 0, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(38, 1, NULL, 'CCLA', 'Coca cola', 1500, 188, 9, 24, 1, 1, NULL, NULL, NULL, NULL, 2),
(39, 1, NULL, 'CCLAZ', 'Coca cola zero', 1500, 383, 10, 6, 1, 1, NULL, NULL, NULL, NULL, 2),
(40, 1, NULL, 'sch_ton', 'schweppes tonic', 1500, 240, 9, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(41, 1, NULL, 'ORGNA', 'Orangina', 1500, 293, 0, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(42, 1, NULL, 'ETK_CL', 'Eteki Classique', 2000, 833, 0, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(43, 1, NULL, 'ETK_WI', 'Eteki Wildberry', 2000, 833, 0, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(44, 1, NULL, 'RBULL', 'Red bull', 2000, 875, 30, 14, 1, 1, NULL, NULL, NULL, NULL, NULL),
(45, 1, NULL, 'MLTG', 'Malta Guinness', 2000, 467, 10, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(46, 1, NULL, 'SMIBL', 'Smirnoff Ice Black', 2000, 508, 10, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(47, 1, NULL, '33EXP', '33 Export', 2000, 302, 10, 12, 1, 1, NULL, NULL, NULL, NULL, 2),
(48, 1, NULL, 'B_LIGHT', 'Beaufort Light', 2000, 433, 10, 8, 1, 1, NULL, NULL, NULL, NULL, 2),
(49, 1, NULL, 'CSTL', 'Castel', 2000, 256, 10, 12, 1, 1, NULL, NULL, NULL, NULL, 2),
(50, 1, NULL, 'HNKEN', 'Heineken', 2000, 613, 100, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(51, 1, NULL, 'BDWSR', 'Budweiser', 2000, 650, 0, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(52, 1, NULL, 'MAHOU', 'Mahou', 2000, 583, 0, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(53, 1, NULL, 'GNESS', 'Guiness', 2000, 550, 63, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(54, 1, NULL, 'TTNPM', 'Top Tonic PM', 1500, 202, 8, 4, 1, 1, NULL, NULL, NULL, NULL, 2),
(55, 3, NULL, 'SVGN', 'Sauvignon', 17500, 4500, 7, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(56, 3, NULL, 'CHSCV', 'Chardonnay Sweet Cavior', 20000, 8500, 5, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(57, 3, NULL, 'PRSCO', 'Prosecco', 15000, 0, 10, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(58, 3, NULL, 'JPCHNT', 'Jp Chenet', 15000, 5500, 10, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(59, 3, NULL, 'CTPROV', 'Cote de Provence', 17500, 6600, 4, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(60, 3, NULL, 'TTGER37', 'Taitinger(37,5 cl)', 22500, 12500, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(61, 3, NULL, 'TTGER', 'Taitinger', 45000, 21667, 4, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(62, 3, NULL, 'MOETB', 'Moet Brut', 45000, 23333, 5, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(63, 3, NULL, 'MOETN', 'Moet Nectar', 60000, 35000, 5, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(64, 3, NULL, 'VVECLIC', 'Veuve Clicquot', 60000, 35000, 3, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(65, 3, NULL, 'RNTB', 'Ruinart Blanc', 70000, 45000, 0, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(66, 3, NULL, 'DPERGN', 'Dom Pérignon', 150000, 86667, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(67, 3, NULL, 'CHMCR', 'Champagne Cristal', 225000, 150000, 1, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(68, 12, NULL, 'CFEO', 'Cafe', 0, 500, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(69, 12, NULL, 'THEO', 'The', 0, 500, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(70, 12, NULL, 'EAUSPT', 'Eau Supermont', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(71, 12, NULL, 'GLCS', 'Glacons', 0, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(72, 12, NULL, 'TNICO', 'Tonic', 0, 0, 50, 124, 1, 1, NULL, NULL, NULL, NULL, NULL),
(73, 10, NULL, 'PL_1/4PO', '1/4 Poulets + frittes pommes', 3000, 1200, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(74, 10, NULL, 'PL_1/2PO', '1/2 Poulets + frittes pommes', 5000, 2413, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(75, 10, NULL, 'PL_ENPO', 'Poulet entier+frittes pommes', 10000, 4826, -1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(76, 9, NULL, 'ARGNC', 'Armagnac', 0, 0, 10, 20, 1, 2, 14, NULL, NULL, NULL, NULL),
(77, 9, NULL, 'ARMGCO', 'conso Armagnac', 4000, 1154, NULL, NULL, 0, 5, NULL, NULL, NULL, NULL, NULL),
(78, 9, NULL, 'GRDMBtl', 'Grand Marnier', 40000, 25000, 1, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(79, 9, NULL, 'GRDMCO', 'Conso Grand Marnier', 4000, 1923, NULL, NULL, 0, 3, NULL, 1, NULL, 'GRDMBtl', NULL),
(80, 9, NULL, 'RMYMB', 'Remy martin', 40000, 27500, 4, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(81, 9, NULL, 'RMYMC', 'Conso Remy Martin', 4000, 2115, NULL, NULL, 0, 3, NULL, 1, NULL, 'RMYMB', NULL),
(82, 7, NULL, 'ABSLT', 'Absolut', 25000, 8700, 3, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(83, 7, NULL, 'ABSLT1/2', '1/2 Absolut', 15000, 4350, NULL, NULL, 0, 3, NULL, 2, NULL, 'ABSLT', NULL),
(84, 7, NULL, 'ABSLTC', 'Conso Absolut', 2500, 621, NULL, NULL, 0, 3, NULL, 1, NULL, 'ABSLT', NULL),
(85, 7, NULL, 'ABSLTA', 'Absolut Aromatisée', 25000, 8700, 0, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(86, 7, NULL, 'ABSLTA1/2', '1/2 Absolut Aromatisée', 15000, 4350, NULL, NULL, 0, 3, NULL, 2, NULL, 'ABSLTA', NULL),
(87, 7, NULL, 'ABSLTAC', 'Conso Absolut Aromatisée', 2500, 621, NULL, NULL, 0, 3, NULL, 1, NULL, 'ABSLTA', NULL),
(88, 7, NULL, 'SMRD', 'Smirnoff Red', 25000, 5250, 2, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(89, 7, NULL, 'SMRD1/2', '1/2 Smirnoff Red', 15000, 2625, NULL, NULL, 0, 3, NULL, 2, NULL, 'SMRD', NULL),
(90, 7, NULL, 'SMRDC', 'Conso Smirnoff Red', 2500, 375, NULL, NULL, 0, 3, NULL, 1, NULL, 'SMRD', NULL),
(91, 7, NULL, 'CIROC', 'Ciroc', 35000, 17900, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(92, 6, NULL, 'BCRDI', 'Bacardi', 25000, 10000, 0, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(93, 6, NULL, 'BCRDI1/2', '1/2 Bacardi', 15000, 5000, NULL, NULL, 0, 3, NULL, 2, NULL, 'BCRDI', NULL),
(94, 6, NULL, 'BCRDIC', 'Conso Bacardi', 2500, 556, NULL, NULL, 0, 3, NULL, 1, NULL, 'BCRDI', NULL),
(95, 6, NULL, 'HVNA3', 'Havana 3 years', 25000, 8250, 5, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(96, 6, NULL, 'HVNA31/2', '1/2 Havana 3 years', 15000, 4125, NULL, NULL, 0, 3, NULL, 2, NULL, 'HVNA3', NULL),
(97, 6, NULL, 'HVNA3C', 'Conso Havana 3 years', 2500, 663, NULL, NULL, 0, 3, NULL, 1, NULL, 'HVNA3', NULL),
(98, 6, NULL, 'HVNA7', 'Havana 7 years', 35000, 16200, 0, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(99, 6, NULL, 'HVNA7C', 'Conso Havana 7 years', 3000, 1246, NULL, NULL, 0, 3, NULL, 1, NULL, 'HVNA7', NULL),
(100, 2, NULL, 'balbrsl', 'Ballantine\'s Brasil', 25000, 7200, 0, 5, 1, 2, 14, NULL, NULL, NULL, NULL),
(101, 2, NULL, 'balbrsl1/2', '1/2 Ballantine\'s Brasil', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'balbrsl', NULL),
(102, 2, NULL, 'BalbrslC', 'conso Ballantine\'s Brasil', 2500, 554, NULL, NULL, 0, 3, NULL, 1, NULL, 'balbrsl', NULL),
(103, 2, NULL, 'BALS12', 'Ballantine\'s 12 years', 35000, 7200, 6, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(104, 2, NULL, 'BALS121/2', '1/2 Ballantine\'s 12 years', 18000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'BALS12', NULL),
(105, 2, NULL, 'BALS12C', 'Conso Ballantine\'s 12 years', 3500, 1043, NULL, NULL, 0, 3, NULL, 1, NULL, 'BALS12', NULL),
(106, 2, NULL, 'CH18_B', 'Chivas 18 Years', 80000, 43000, 1, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(107, 2, NULL, 'CH18_C', 'Conso Chivas 18 Years', 7000, 3071, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH18_B', NULL),
(108, 2, NULL, 'CHR18', 'Chivas Royal Salute 18 years', 140000, 94667, 0, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(109, 2, NULL, 'GLFD12', 'Glenfiddich 12 years', 40000, 19500, 3, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(110, 2, NULL, 'GLFD121/2', '1/2 Glenfiddich 12 years', 20000, 9750, NULL, NULL, 0, 3, NULL, 2, NULL, 'GLFD12', NULL),
(111, 2, NULL, 'GLFD12C', 'Conso Glenfiddich 12 years', 3500, 1393, NULL, NULL, 0, 3, NULL, 1, NULL, 'GLFD12', NULL),
(112, 2, NULL, 'GLFD18', 'Glenfiddich 18 years', 70000, 33000, 5, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(113, 2, NULL, 'JADLS', 'Jack Daniel\'s', 35000, 10333, 12, 8, 1, 2, 14, NULL, NULL, NULL, NULL),
(114, 2, NULL, 'JADLS1/2', '1/2 Jack Daniel\'s', 18000, 5167, NULL, NULL, 0, 3, NULL, 2, NULL, 'JADLS', NULL),
(115, 2, NULL, 'JADLSC', 'Conso Jack Daniel\'s', 3500, 795, NULL, NULL, 0, 3, NULL, 1, NULL, 'JADLS', NULL),
(116, 2, NULL, 'J&B_btle', 'J&B', 25000, 7336, 4, 4, 1, 2, 14, NULL, NULL, NULL, NULL),
(117, 2, NULL, 'J&B_1/2', '1/2 J&B', 15000, 3668, NULL, NULL, 0, 3, NULL, 2, NULL, 'J&B_btle', NULL),
(118, 1, NULL, 'J&B_C', 'Conso J&B', 2500, 524, NULL, NULL, 0, 3, NULL, 1, NULL, 'J&B_btle', NULL),
(119, 2, NULL, 'JDLSH', 'Jack Daniel\'s Honey', 35000, 13333, 5, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(120, 2, NULL, 'JDLSH1/2', '1/2 Jack daniel\'s Honey', 18000, 6667, NULL, NULL, 0, 3, NULL, 2, NULL, 'JDLSH', NULL),
(121, 2, NULL, 'JDLSHC', 'Conso Jack Daniel\'s Honey', 3500, 1026, NULL, NULL, 0, 3, NULL, 1, NULL, 'JDLSH', NULL),
(122, 2, NULL, 'JWRL', 'JW Red Label', 25000, 7336, 5, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(123, 2, NULL, 'JWRL1/2', '1/2 JW Red Label', 15000, 3668, NULL, NULL, 0, 3, NULL, 2, NULL, 'JWRL', NULL),
(124, 2, NULL, 'JWRLC', 'Conso JW Red Label', 2500, 524, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWRL', NULL),
(125, 2, NULL, 'JWBL', 'JW Black label', 35000, 14510, 8, 8, 1, 2, 14, NULL, NULL, NULL, NULL),
(126, 2, NULL, 'JWBL1/2', '1/2 JW Black Label', 18000, 7255, NULL, NULL, 0, 3, NULL, 2, NULL, 'JWBL', NULL),
(127, 2, NULL, 'JWBLC', 'Conso JW Black Label', 3500, 1036, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWBL', NULL),
(128, 2, NULL, 'JWDBL', 'JW Double Black Label', 50000, 21800, 0, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(129, 2, NULL, 'JWDBLC', 'Conso JW Double Black Label', 5000, 1557, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWDBL', NULL),
(130, 2, NULL, 'JWGRL', 'JW Gold Reserve Label', 70000, 34800, 0, 0, 1, 2, 14, NULL, NULL, NULL, NULL),
(131, 2, NULL, 'JWGRLC', 'Conso JW Gold Reserve Label', 7000, 2486, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWGRL', NULL),
(132, 2, NULL, 'JWPLT', 'JW Platinium', 80000, 3321, 0, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(133, 2, NULL, 'JWBLUL', 'JW Blue Label', 200000, 113500, 2, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(134, 4, NULL, 'BLCRCC', 'Conso Blue Curacao', 2500, 654, 23, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(135, 4, NULL, 'GET27C', 'Conso Get 27', 2500, 833, 10, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(136, 4, NULL, 'GET31C', 'Conso GET 31', 2500, 556, 10, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(137, 4, NULL, 'MABRZD', 'Conso Marie Brizzard', 2500, 679, 11, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(138, 4, NULL, 'PAST51', 'Conso Pastis 51', 2500, 492, 8, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(139, 4, NULL, 'RCARD', 'Conso Ricard', 2500, 506, 17, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(140, 4, NULL, 'GNGDN', 'Gin Gordon', 20000, 6046, 2, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(141, 4, NULL, 'GNGDNC', 'Conso Gin Gordon', 2500, 432, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNGDN', NULL),
(142, 4, NULL, 'GNGDN1/2', '1/2 Gin Gordon', 12000, 3023, NULL, NULL, 0, 3, NULL, 2, NULL, 'GNGDN', NULL),
(143, 4, NULL, 'GNBETR', 'Gin Beefeater', 20000, 6000, 0, 5, 1, 2, 14, NULL, NULL, NULL, NULL),
(144, 4, NULL, 'GNBETR1/2', '1/2 Gin Beefeater', 12000, 0, NULL, NULL, 0, 3, NULL, 2, NULL, 'GNBETR', NULL),
(145, 4, NULL, 'GNBETRC', 'Conso Gin Beefeater', 2500, 0, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNBETR', NULL),
(146, 4, NULL, 'MRTNB', 'Martini Blanc', 22500, 6100, 1, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(147, 4, NULL, 'MRTNB1/2', '1/2 Martini Blanc', 12500, 3050, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNB', NULL),
(148, 4, NULL, 'MRTNBC', 'Conso Martini Blanc', 2500, 339, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNB', NULL),
(149, 4, NULL, 'MRTND', 'Martini Dry', 22500, 6000, 4, 5, 1, 2, 14, NULL, NULL, NULL, NULL),
(150, 4, NULL, 'MRTND1/2', '1/2 Martini Dry', 12500, 3000, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTND', NULL),
(151, 4, NULL, 'MRTNDC', 'Conso Martini Dry', 2500, 333, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTND', NULL),
(152, 4, NULL, 'MRTNRS', 'Martini Rose', 22500, 7000, 6, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(153, 4, NULL, 'MRTNRS1/2', '1/2 Martini Rose', 12500, 3500, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNRS', NULL),
(154, 4, NULL, 'MRTNRSC', 'Conso Martini Rose', 2500, 389, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNRS', NULL),
(155, 4, NULL, 'MRTNR', 'Martini Rouge', 22500, 6100, 2, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(156, 4, NULL, 'MRTNR1/2', '1/2 Martini Rouge', 12500, 3050, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNR', NULL),
(157, 4, NULL, 'MRTNRC', 'Conso Martini Rouge', 2500, 339, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNR', NULL),
(158, 4, NULL, 'BLYS', 'Baileys', 25000, 7658, 5, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(159, 4, NULL, 'BLYS1/2', '1/2 Baileys', 15000, 3829, NULL, NULL, 0, 3, NULL, 2, NULL, 'BLYS', NULL),
(160, 4, NULL, 'BLYSC', 'Conso Baileys', 2500, 547, NULL, NULL, 0, 3, NULL, 1, NULL, 'BLYS', NULL),
(161, 4, NULL, 'MLBU', 'Malibu', 25000, 10000, 2, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(162, 4, NULL, 'MLBUC', 'Conso Malibu', 2500, 714, NULL, NULL, 0, 3, NULL, 1, NULL, 'MLBU', NULL),
(163, 4, NULL, 'TQLBL', 'Tequila Blanc', 25000, 5500, 2, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(164, 4, NULL, 'TQLBLC', 'Conso Tequila Blanc', 2500, 423, NULL, NULL, 0, 3, NULL, 1, NULL, 'TQLBL', NULL),
(165, 4, NULL, 'CMPRI', 'Campari', 25000, 8000, 2, 4, 1, 2, 14, NULL, NULL, NULL, NULL),
(166, 4, NULL, 'CMPRIC', 'Conso Campari', 2500, 444, NULL, NULL, 0, 3, NULL, 1, NULL, 'CMPRI', NULL),
(167, 4, NULL, 'CNTR', 'Conso Cointreau', 3000, 1269, 19, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(168, 4, NULL, 'GNTQR', 'Gin Tanqueray', 35000, 11700, 2, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(169, 4, NULL, 'GNTQRC', 'Conso Gin Tanqueray', 3500, 836, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNTQR', NULL),
(170, 4, NULL, 'PRTBL', 'Conso Porto Blanc', 3000, 714, 18, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(171, 4, NULL, 'PRTRO', 'Conso Porto Rouge', 3000, 786, 11, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(172, 8, NULL, 'AMRC', 'Americano', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(173, 8, NULL, 'CPRNHA', 'Caipirinha', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(174, 8, NULL, 'MRGRTA', 'Margarita', 5000, 3000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(175, 8, NULL, 'PNCLDA', 'Pina Colada', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(176, 8, NULL, 'TQLSNR', 'Tequila Sunrise', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(177, 8, NULL, 'MOJITO', 'MOJITO', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(178, 8, NULL, 'B52', 'B52', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(179, 8, NULL, 'CSMPLT', 'Cosmopolitan', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(180, 8, NULL, 'DAQRI', 'Daiquiri', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(181, 8, NULL, 'MNTHAN', 'Manhattan', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(182, 8, NULL, 'MTNCKT', 'Martini Cocktail', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(183, 8, NULL, 'NEGRONI', 'Negroni', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(184, 8, NULL, 'LNGISIT', 'Long Island Ice-Tea', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(185, 8, NULL, 'MEXIT', 'Mexican Ice tea', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(186, 8, NULL, 'BLWHITE', 'Black&White', 4000, 1000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(187, 8, NULL, 'FLRDA', 'Florida', 4000, 1000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(188, 8, NULL, 'VRMJTO', 'Virgin Mojito', 4000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(189, 8, NULL, 'VRETKJ', 'Virgin Etekjito', 4000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(190, 8, NULL, 'BLTKI', 'Blueteki', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(191, 8, NULL, 'ETEKJITO', 'Etekjito', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(192, 8, NULL, 'ETKSAMB', 'Eteki Samba', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(193, 8, NULL, 'ETKBB', 'Eteki Boom Boom (4shots)', 8000, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product_product`
--

CREATE TABLE `product_product` (
  `product_source` int(11) NOT NULL,
  `product_target` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product_product`
--

INSERT INTO `product_product` (`product_source`, `product_target`) VALUES
(8, 1),
(172, 157),
(172, 166),
(174, 164),
(174, 167),
(175, 97),
(175, 162),
(176, 164),
(177, 1),
(177, 97),
(178, 79),
(178, 160),
(179, 167),
(180, 97),
(181, 21),
(181, 157),
(182, 141),
(182, 151),
(183, 141),
(183, 157),
(183, 166),
(184, 38),
(184, 97),
(184, 141),
(184, 167),
(185, 38),
(185, 97),
(185, 141),
(185, 164),
(188, 1),
(189, 43),
(190, 43),
(190, 134),
(190, 162),
(191, 42),
(191, 97),
(192, 42),
(192, 102),
(192, 167),
(193, 43);

-- --------------------------------------------------------

--
-- Structure de la table `stockoperation`
--

CREATE TABLE `stockoperation` (
  `id` int(11) NOT NULL,
  `idtrans` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `idprod` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `quantiteprec` int(11) NOT NULL,
  `cause` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `stockoperation`
--

INSERT INTO `stockoperation` (`id`, `idtrans`, `date`, `idprod`, `quantite`, `quantiteprec`, `cause`, `prod`, `type`) VALUES
(1, 'EN594bb18d26b59', '2017-06-22', 16, 20, -5, NULL, 'Ballantine\'s - Btlle', 1),
(2, 'EN594bb2301792c', '2017-06-22', 3, 40, -20, NULL, 'Schweppes Soda', 1),
(3, 'EN594bb2301792c', '2017-06-22', 6, 50, -4, NULL, 'Tangui PM', 1),
(4, 'EN594bb2301792c', '2017-06-22', 2, 50, 8, NULL, 'Fanta', 1),
(5, 'EN594bb5ed5dccb', '2017-06-22', 19, 20, -1, NULL, 'Chivas 12 Years - Btlle', 1),
(6, 'EN594bb60b9998e', '2017-06-22', 9, 20, 1, NULL, 'Merlot - Btle', 1),
(7, 'EN594bd6f5805ca', '2017-06-22', 19, 5, 17, NULL, 'Chivas 12 Years - Btlle', 1),
(8, 'EN594bd6f5805ca', '2017-06-22', 16, 5, 14, NULL, 'Ballantine\'s - Btlle', 1),
(9, 'EN594bd6f5805ca', '2017-06-22', 1, 10, 2, NULL, 'Sprite', 1),
(10, 'ST594bd743db29f', '2017-06-22', 3, -2, 16, 'Produit endommagé', 'Schweppes Soda', 2);

-- --------------------------------------------------------

--
-- Structure de la table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `occupe` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `tables`
--

INSERT INTO `tables` (`id`, `nom`, `lieu`, `occupe`) VALUES
(1, 'I-1', 'Interieur', 1),
(2, 'I-2', 'Interieur', 0),
(3, 'I-3', 'Interieur', 0),
(4, 'I-4', 'Interieur', 1),
(5, 'I-5', 'Interieur', 1),
(6, 'I-6', 'Interieur', 0),
(7, 'I-7', 'Interieur', 1),
(8, 'I-8', 'Interieur', 1),
(9, 'I-9', 'Interieur', 0),
(10, 'I-10', 'Interieur', 1),
(11, 'I-11', 'Interieur', 0),
(12, 'I-12', 'Interieur', 0),
(13, 'I-13', 'Interieur', 1),
(14, 'I-14', 'Interieur', 0),
(15, 'I-15', 'Interieur', 0),
(16, 'I-16', 'Interieur', 0),
(17, 'I-17', 'Interieur', 0),
(18, 'I-18', 'Interieur', 1),
(19, 'I-19', 'Interieur', 1),
(20, 'I-20', 'Interieur', 0),
(21, 'I-21', 'Interieur', 1),
(22, 'I-22', 'Interieur', 1),
(23, 'I-23', 'Interieur', 1),
(24, 'I-24', 'Interieur', 0),
(25, 'I-25', 'Interieur', 0),
(26, 'I-26', 'Interieur', 1),
(27, 'I-27', 'Interieur', 0),
(28, 'I-28', 'Interieur', 1),
(29, 'I-29', 'Interieur', 0),
(30, 'I-30', 'Interieur', 0),
(31, 'I-31', 'Interieur', 1),
(32, 'I-32', 'Interieur', 0),
(33, 'I-33', 'Interieur', 0),
(34, 'I-34', 'Interieur', 0),
(35, 'I-35', 'Interieur', 1),
(36, 'I-36', 'Interieur', 0),
(37, 'I-37', 'Interieur', 0),
(38, 'I-38', 'Interieur', 0),
(39, 'I-39', 'Interieur', 0),
(40, 'I-40', 'Interieur', 0),
(41, 'I-41', 'Interieur', 0),
(42, 'I-42', 'Interieur', 0),
(43, 'I-43', 'Interieur', 0),
(44, 'I-44', 'Interieur', 0),
(45, 'I-45', 'Interieur', 0),
(46, 'I-46', 'Interieur', 0),
(47, 'I-47', 'Interieur', 0),
(48, 'I-48', 'Interieur', 0),
(49, 'I-49', 'Interieur', 0),
(50, 'I-50', 'Interieur', 0),
(51, 'I-51', 'Interieur', 0),
(52, 'I-52', 'Interieur', 1),
(53, 'I-53', 'Interieur', 0),
(54, 'I-54', 'Interieur', 0),
(55, 'I-55', 'Interieur', 0),
(56, 'I-56', 'Interieur', 0),
(57, 'I-57', 'Interieur', 0),
(58, 'I-58', 'Interieur', 0),
(59, 'I-59', 'Interieur', 0),
(60, 'I-60', 'Interieur', 1),
(61, 'I-61', 'Interieur', 0),
(62, 'I-62', 'Interieur', 0),
(63, 'I-63', 'Interieur', 1),
(64, 'I-64', 'Interieur', 0),
(65, 'I-65', 'Interieur', 0),
(66, 'I-66', 'Interieur', 0),
(67, 'I-67', 'Interieur', 0),
(68, 'I-68', 'Interieur', 1),
(69, 'I-69', 'Interieur', 0),
(70, 'I-70', 'Interieur', 0),
(71, 'I-71', 'Interieur', 0),
(72, 'I-72', 'Interieur', 0),
(73, 'I-73', 'Interieur', 0),
(74, 'I-74', 'Interieur', 0),
(75, 'I-75', 'Interieur', 0),
(76, 'I-76', 'Interieur', 0),
(77, 'I-77', 'Interieur', 0),
(78, 'I-78', 'Interieur', 1),
(79, 'I-79', 'Interieur', 0),
(80, 'I-80', 'Interieur', 0),
(81, 'C-1', 'Couloir', 1),
(82, 'C-2', 'Couloir', 0),
(83, 'C-3', 'Couloir', 0),
(84, 'C-4', 'Couloir', 0),
(85, 'C-5', 'Couloir', 1),
(86, 'C-6', 'Couloir', 0),
(87, 'C-7', 'Couloir', 0),
(88, 'C-8', 'Couloir', 0),
(89, 'C-9', 'Couloir', 0),
(90, 'C-10', 'Couloir', 0),
(91, 'C-11', 'Couloir', 0),
(92, 'C-12', 'Couloir', 0),
(93, 'C-13', 'Couloir', 0),
(94, 'C-14', 'Couloir', 0),
(95, 'C-15', 'Couloir', 0),
(96, 'C-16', 'Couloir', 0),
(97, 'C-17', 'Couloir', 0),
(98, 'C-18', 'Couloir', 0),
(99, 'C-19', 'Couloir', 0),
(100, 'C-20', 'Couloir', 0),
(101, 'C-21', 'Couloir', 0),
(102, 'C-22', 'Couloir', 0),
(103, 'C-23', 'Couloir', 0),
(104, 'C-24', 'Couloir', 0),
(105, 'C-25', 'Couloir', 0),
(106, 'C-26', 'Couloir', 0),
(107, 'C-27', 'Couloir', 0),
(108, 'C-28', 'Couloir', 0),
(109, 'C-29', 'Couloir', 0),
(110, 'C-30', 'Couloir', 0),
(111, 'C-31', 'Couloir', 0),
(112, 'C-32', 'Couloir', 0),
(113, 'C-33', 'Couloir', 0),
(114, 'C-34', 'Couloir', 0),
(115, 'C-35', 'Couloir', 0),
(116, 'C-36', 'Couloir', 0),
(117, 'C-37', 'Couloir', 0),
(118, 'C-38', 'Couloir', 0),
(119, 'C-39', 'Couloir', 0),
(120, 'C-40', 'Couloir', 0),
(121, 'C-41', 'Couloir', 0),
(122, 'C-42', 'Couloir', 0),
(123, 'C-43', 'Couloir', 0),
(124, 'C-44', 'Couloir', 0),
(125, 'C-45', 'Couloir', 0),
(126, 'C-46', 'Couloir', 0),
(127, 'C-47', 'Couloir', 0),
(128, 'C-48', 'Couloir', 0),
(129, 'C-49', 'Couloir', 0),
(130, 'C-50', 'Couloir', 0),
(131, 'C-51', 'Couloir', 0),
(132, 'C-52', 'Couloir', 0),
(133, 'C-53', 'Couloir', 0),
(134, 'C-54', 'Couloir', 0),
(135, 'C-55', 'Couloir', 0),
(136, 'C-56', 'Couloir', 0),
(137, 'C-57', 'Couloir', 0),
(138, 'C-58', 'Couloir', 0),
(139, 'C-59', 'Couloir', 0),
(140, 'C-60', 'Couloir', 0),
(141, 'C-61', 'Couloir', 0),
(142, 'C-62', 'Couloir', 0),
(143, 'C-63', 'Couloir', 0),
(144, 'C-64', 'Couloir', 0),
(145, 'C-65', 'Couloir', 0),
(146, 'C-66', 'Couloir', 0),
(147, 'C-67', 'Couloir', 0),
(148, 'C-68', 'Couloir', 0),
(149, 'C-69', 'Couloir', 0),
(150, 'C-70', 'Couloir', 0),
(151, 'C-71', 'Couloir', 0),
(152, 'C-72', 'Couloir', 0),
(153, 'C-73', 'Couloir', 0),
(154, 'C-74', 'Couloir', 0),
(155, 'C-75', 'Couloir', 0),
(156, 'C-76', 'Couloir', 0),
(157, 'C-77', 'Couloir', 0),
(158, 'C-78', 'Couloir', 0),
(159, 'C-79', 'Couloir', 0),
(160, 'C-80', 'Couloir', 0),
(161, 'T-1', 'Terasse', 0),
(162, 'T-2', 'Terasse', 0),
(163, 'T-3', 'Terasse', 0),
(164, 'T-4', 'Terasse', 0),
(165, 'T-5', 'Terasse', 0),
(166, 'T-6', 'Terasse', 0),
(167, 'T-7', 'Terasse', 0),
(168, 'T-8', 'Terasse', 0),
(169, 'T-9', 'Terasse', 0),
(170, 'T-10', 'Terasse', 0),
(171, 'T-11', 'Terasse', 0),
(172, 'T-12', 'Terasse', 0),
(173, 'T-13', 'Terasse', 0),
(174, 'T-14', 'Terasse', 0),
(175, 'T-15', 'Terasse', 0),
(176, 'T-16', 'Terasse', 0),
(177, 'T-17', 'Terasse', 0),
(178, 'T-18', 'Terasse', 0),
(179, 'T-19', 'Terasse', 0),
(180, 'T-20', 'Terasse', 0),
(181, 'T-21', 'Terasse', 0),
(182, 'T-22', 'Terasse', 0),
(183, 'T-23', 'Terasse', 0),
(184, 'T-24', 'Terasse', 0),
(185, 'T-25', 'Terasse', 0),
(186, 'T-26', 'Terasse', 0),
(187, 'T-27', 'Terasse', 0),
(188, 'T-28', 'Terasse', 0),
(189, 'T-29', 'Terasse', 0),
(190, 'T-30', 'Terasse', 1),
(191, 'T-31', 'Terasse', 0),
(192, 'T-32', 'Terasse', 0),
(193, 'T-33', 'Terasse', 0),
(194, 'T-34', 'Terasse', 0),
(195, 'T-35', 'Terasse', 0),
(196, 'T-36', 'Terasse', 0),
(197, 'T-37', 'Terasse', 0),
(198, 'T-38', 'Terasse', 0),
(199, 'T-39', 'Terasse', 0),
(200, 'T-40', 'Terasse', 0),
(201, 'T-41', 'Terasse', 0),
(202, 'T-42', 'Terasse', 0),
(203, 'T-43', 'Terasse', 0),
(204, 'T-44', 'Terasse', 0),
(205, 'T-45', 'Terasse', 0),
(206, 'T-46', 'Terasse', 0),
(207, 'T-47', 'Terasse', 0),
(208, 'T-48', 'Terasse', 0),
(209, 'T-49', 'Terasse', 0),
(210, 'T-50', 'Terasse', 0),
(211, 'T-51', 'Terasse', 0),
(212, 'T-52', 'Terasse', 0),
(213, 'T-53', 'Terasse', 0),
(214, 'T-54', 'Terasse', 0),
(215, 'T-55', 'Terasse', 0),
(216, 'T-56', 'Terasse', 0),
(217, 'T-57', 'Terasse', 0),
(218, 'T-58', 'Terasse', 0),
(219, 'T-59', 'Terasse', 0),
(220, 'T-60', 'Terasse', 0),
(221, 'T-61', 'Terasse', 0),
(222, 'T-62', 'Terasse', 0),
(223, 'T-63', 'Terasse', 0),
(224, 'T-64', 'Terasse', 0),
(225, 'T-65', 'Terasse', 0),
(226, 'T-66', 'Terasse', 0),
(227, 'T-67', 'Terasse', 0),
(228, 'T-68', 'Terasse', 0),
(229, 'T-69', 'Terasse', 0),
(230, 'T-70', 'Terasse', 0),
(231, 'T-71', 'Terasse', 0),
(232, 'T-72', 'Terasse', 0),
(233, 'T-73', 'Terasse', 0),
(234, 'T-74', 'Terasse', 0),
(235, 'T-75', 'Terasse', 0),
(236, 'T-76', 'Terasse', 0),
(237, 'T-77', 'Terasse', 0),
(238, 'T-78', 'Terasse', 0),
(239, 'T-79', 'Terasse', 0),
(240, 'T-80', 'Terasse', 0);

-- --------------------------------------------------------

--
-- Structure de la table `thumbnail`
--

CREATE TABLE `thumbnail` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `thumbnail`
--

INSERT INTO `thumbnail` (`id`, `url`, `alt`) VALUES
(1, 'cabernetsauvignon.jpg', 'cabernetsauvignon.jpg'),
(2, 'chadornay.jpg', 'chadornay.jpg'),
(3, 'consbalantine.jpg', 'consbalantine.jpg'),
(4, 'chivas12.jpg', 'chivas12.jpg'),
(5, 'sprite.jpg', 'sprite.jpg'),
(6, 'fanta.jpg', 'fanta.jpg'),
(7, 'cafe.jpg', 'cafe.jpg'),
(8, 'scheepes.jpg', 'scheepes.jpg'),
(9, 'balantine.jpg', 'balantine.jpg'),
(10, 'balantine.jpg', 'balantine.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `employes_id` int(11) NOT NULL,
  `tables_id` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `prix` int(11) DEFAULT NULL,
  `mode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ticket`
--

INSERT INTO `ticket` (`id`, `employes_id`, `tables_id`, `etat`, `date`, `prix`, `mode`) VALUES
(1, 4, 3, 0, '2017-06-15 13:40:40', 7500, 'especes'),
(2, 4, 190, 1, '2017-06-15 15:31:51', NULL, NULL),
(3, 5, 11, 0, '2017-06-15 15:39:19', 5500, 'especes'),
(4, 5, 12, 0, '2017-06-15 15:44:00', 14000, 'especes'),
(5, 5, 25, 0, '2017-06-15 15:46:24', 5000, 'especes'),
(6, 5, 21, 0, '2017-06-15 15:47:42', 29500, 'especes'),
(7, 5, 19, 0, '2017-06-15 15:52:09', 9000, 'especes'),
(8, 4, 51, 0, '2017-06-15 15:55:10', 7500, 'especes'),
(9, 5, 6, 0, '2017-06-15 16:27:47', 14000, 'especes'),
(10, 5, 34, 0, '2017-06-15 16:31:28', 9000, 'especes'),
(11, 4, 60, 1, '2017-06-15 16:51:44', NULL, NULL),
(12, 4, 1, 0, '2017-06-15 16:53:55', 6000, 'especes'),
(13, 4, 81, 1, '2017-06-15 17:03:20', NULL, NULL),
(14, 5, 3, 0, '2017-06-16 06:26:30', 10500, 'especes'),
(15, 5, 4, 0, '2017-06-16 06:33:15', 65000, 'especes'),
(16, 5, 5, 0, '2017-06-16 07:52:56', 7000, 'especes'),
(17, 5, 25, 0, '2017-06-16 07:53:55', 14000, 'especes'),
(18, 5, 17, 0, '2017-06-16 11:13:00', 13000, 'especes'),
(19, 5, 30, 0, '2017-06-16 12:00:07', 4500, 'Orange Money'),
(20, 2, 11, 0, '2017-06-16 12:35:38', 7500, 'especes'),
(21, 2, 61, 0, '2017-06-16 12:39:08', 11500, 'especes'),
(22, 5, 13, 0, '2017-06-20 13:52:31', 22500, 'especes'),
(23, 5, 8, 0, '2017-06-20 14:03:20', 9000, 'especes'),
(24, 5, 11, 0, '2017-06-20 14:04:28', 10000, 'especes'),
(25, 5, 20, 0, '2017-06-20 14:05:13', 13000, 'especes'),
(26, 5, 19, 0, '2017-06-20 14:06:05', 4500, 'especes'),
(27, 2, 9, 0, '2017-06-20 20:53:01', 8500, 'especes'),
(28, 2, 12, 0, '2017-06-20 20:55:32', 3000, 'especes'),
(29, 2, 7, 0, '2017-06-21 02:11:19', 6000, 'especes'),
(30, 3, 10, 0, '2017-06-21 13:21:43', 7500, 'especes'),
(31, 3, 8, 0, '2017-06-21 13:22:41', 16000, 'especes'),
(32, 1, 16, 0, '2017-06-21 13:23:14', 7500, 'especes'),
(33, 1, 1, 0, '2017-06-21 13:23:48', 9000, 'especes'),
(34, 1, 20, 0, '2017-06-21 13:24:18', 40000, 'especes'),
(35, 1, 7, 0, '2017-06-21 13:25:07', 91000, 'Carte'),
(36, 1, 18, 0, '2017-06-21 13:25:42', 3000, 'especes'),
(37, 3, 20, 0, '2017-06-21 13:29:43', 6500, 'especes'),
(38, 3, 18, 1, '2017-06-21 13:37:27', NULL, NULL),
(39, 5, 15, 0, '2017-06-22 10:02:50', 4500, 'Orange Money'),
(40, 5, 12, 0, '2017-06-22 10:06:51', 41500, 'especes'),
(41, 5, 8, 0, '2017-06-22 10:25:44', 3000, 'especes'),
(42, 5, 16, 0, '2017-06-22 10:40:29', 23500, 'Carte'),
(43, 5, 15, 0, '2017-06-22 10:43:14', 71500, 'especes'),
(44, 3, 11, 0, '2017-06-22 10:50:35', 3000, 'Orange Money'),
(45, 3, 21, 0, '2017-06-22 10:50:47', 2500, 'especes'),
(46, 1, 13, 0, '2017-06-22 11:54:15', 7500, 'Orange Money'),
(47, 1, 6, 0, '2017-06-22 12:01:34', 324000, 'especes'),
(48, 1, 19, 1, '2017-06-22 12:01:56', NULL, NULL),
(49, 1, 11, 0, '2017-06-22 12:02:19', 7500, 'especes'),
(50, 1, 20, 0, '2017-06-22 12:02:35', 6000, 'especes'),
(51, 1, 50, 0, '2017-06-22 12:13:12', 3000, 'especes'),
(52, 3, 1, 0, '2017-06-22 12:21:04', 5000, 'especes'),
(53, 3, 68, 1, '2017-06-22 12:21:35', NULL, NULL),
(54, 3, 30, 0, '2017-06-22 12:22:32', 25000, 'Credit'),
(55, 5, 7, 0, '2017-06-22 12:23:46', 17000, 'especes'),
(56, 1, 9, 0, '2017-06-22 12:56:07', 35000, 'Credit'),
(57, 1, 1, 1, '2017-06-22 12:56:33', NULL, NULL),
(58, 5, 12, 0, '2017-06-22 13:13:05', 15000, 'Orange Money'),
(59, 5, 21, 1, '2017-06-22 13:13:58', NULL, NULL),
(60, 5, 16, 0, '2017-06-22 13:15:55', 36000, 'especes'),
(61, 5, 3, 0, '2017-06-22 13:18:26', 22500, 'especes'),
(62, 5, 10, 1, '2017-06-22 13:19:50', NULL, NULL),
(63, 5, 39, 0, '2017-06-22 13:20:17', 16000, 'Orange Money'),
(64, 5, 14, 0, '2017-06-22 13:27:48', 4500, 'Carte'),
(65, 5, 35, 1, '2017-06-22 13:28:11', NULL, NULL),
(66, 5, 23, 1, '2017-06-22 13:40:28', NULL, NULL),
(67, 5, 4, 1, '2017-06-22 13:41:12', NULL, NULL),
(68, 5, 7, 1, '2017-06-22 13:58:29', NULL, NULL),
(69, 5, 26, 1, '2017-06-22 14:00:35', NULL, NULL),
(70, 5, 50, 0, '2017-06-22 14:01:48', 17000, 'Orange Money'),
(71, 1, 170, 0, '2017-06-22 14:06:23', 18500, 'Credit'),
(72, 5, 20, 0, '2017-06-22 14:08:08', 91000, 'especes'),
(73, 1, 51, 0, '2017-06-22 14:29:32', 33500, 'especes'),
(74, 1, 20, 0, '2017-06-22 15:13:41', 29500, 'especes'),
(75, 5, 13, 1, '2017-06-22 15:34:57', NULL, NULL),
(76, 3, 48, 0, '2017-06-27 15:01:33', 9000, 'especes'),
(77, 3, 63, 1, '2017-06-27 15:49:59', NULL, NULL),
(78, 3, 28, 1, '2017-06-27 16:04:34', NULL, NULL),
(79, 3, 5, 1, '2017-06-28 15:01:40', NULL, NULL),
(80, 3, 8, 1, '2017-06-28 15:02:13', NULL, NULL),
(81, 3, 52, 1, '2017-06-28 15:02:46', NULL, NULL),
(82, 3, 85, 1, '2017-06-28 15:03:17', NULL, NULL),
(83, 3, 22, 1, '2017-06-28 15:15:59', NULL, NULL),
(84, 3, 31, 1, '2017-06-28 15:16:32', NULL, NULL),
(85, 3, 78, 1, '2017-06-28 15:16:55', NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `boncommande`
--
ALTER TABLE `boncommande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DCBAE2CA700047D2` (`ticket_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF8F1F3DAD65737C` (`bon_id`),
  ADD KEY `IDX_FF8F1F3DF347EFB` (`produit_id`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A94BC0F092FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_A94BC0F0A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_A94BC0F0C05FB297` (`confirmation_token`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D34A04ADFDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`),
  ADD KEY `IDX_D34A04AD670C757F` (`fournisseur_id`);

--
-- Index pour la table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`product_source`,`product_target`),
  ADD KEY `IDX_2931F1D3DF63ED7` (`product_source`),
  ADD KEY `IDX_2931F1D24136E58` (`product_target`);

--
-- Index pour la table `stockoperation`
--
ALTER TABLE `stockoperation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `thumbnail`
--
ALTER TABLE `thumbnail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_97A0ADA3F971F91F` (`employes_id`),
  ADD KEY `IDX_97A0ADA385405FD2` (`tables_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `boncommande`
--
ALTER TABLE `boncommande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;
--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT pour la table `stockoperation`
--
ALTER TABLE `stockoperation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT pour la table `thumbnail`
--
ALTER TABLE `thumbnail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `boncommande`
--
ALTER TABLE `boncommande`
  ADD CONSTRAINT `FK_DCBAE2CA700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

--
-- Contraintes pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  ADD CONSTRAINT `FK_FF8F1F3DAD65737C` FOREIGN KEY (`bon_id`) REFERENCES `boncommande` (`id`),
  ADD CONSTRAINT `FK_FF8F1F3DF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_D34A04ADFDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `thumbnail` (`id`);

--
-- Contraintes pour la table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `FK_2931F1D24136E58` FOREIGN KEY (`product_target`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2931F1D3DF63ED7` FOREIGN KEY (`product_source`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA385405FD2` FOREIGN KEY (`tables_id`) REFERENCES `tables` (`id`),
  ADD CONSTRAINT `FK_97A0ADA3F971F91F` FOREIGN KEY (`employes_id`) REFERENCES `employes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
