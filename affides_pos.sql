-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Jeu 22 Juin 2017 à 10:28
-- Version du serveur :  5.6.35
-- Version de PHP :  7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

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
(43, 30, '2017-06-21 14:34:43', 1),
(44, 31, '2017-06-21 14:39:18', 1),
(45, 32, '2017-06-21 15:12:18', 1),
(46, 33, '2017-06-21 15:12:33', 1),
(47, 34, '2017-06-21 15:15:17', 1),
(48, 35, '2017-06-21 15:18:45', 1),
(49, 36, '2017-06-21 15:19:07', 1),
(50, 36, '2017-06-21 15:19:20', 1),
(51, 36, '2017-06-21 15:19:30', 1),
(52, 37, '2017-06-21 21:25:00', 1),
(53, 38, '2017-06-21 21:36:59', 1),
(54, 39, '2017-06-21 21:43:18', 1),
(55, 40, '2017-06-21 21:43:25', 1),
(56, 41, '2017-06-21 21:43:56', 1),
(57, 42, '2017-06-21 21:46:52', 1),
(58, 43, '2017-06-21 21:50:02', 1),
(59, 44, '2017-06-21 21:50:27', 1),
(60, 45, '2017-06-21 21:50:41', 1),
(61, 46, '2017-06-21 21:50:55', 1),
(62, 47, '2017-06-21 21:51:06', 1),
(63, 48, '2017-06-21 21:51:37', 1),
(64, 49, '2017-06-21 22:38:51', 1),
(65, 49, '2017-06-21 22:39:11', 1),
(66, 49, '2017-06-21 22:39:59', 1),
(67, 50, '2017-06-22 05:53:59', 1),
(68, 51, '2017-06-22 05:54:14', 1);

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
(93, 43, 3, 2, '2017-06-21 14:34:43'),
(94, 43, 4, 2, '2017-06-21 14:34:43'),
(95, 44, 6, 5, '2017-06-21 14:39:18'),
(96, 45, 21, 1, '2017-06-21 15:12:18'),
(97, 46, 20, 1, '2017-06-21 15:12:33'),
(98, 47, 18, 1, '2017-06-21 15:15:17'),
(99, 48, 17, 2, '2017-06-21 15:18:45'),
(100, 49, 21, 3, '2017-06-21 15:19:07'),
(101, 50, 10, 3, '2017-06-21 15:19:20'),
(102, 51, 15, 3, '2017-06-21 15:19:30'),
(103, 52, 2, 4, '2017-06-21 21:25:00'),
(104, 53, 2, 1, '2017-06-21 21:36:59'),
(105, 53, 1, 1, '2017-06-21 21:36:59'),
(106, 54, 3, 1, '2017-06-21 21:43:18'),
(107, 54, 4, 2, '2017-06-21 21:43:18'),
(108, 55, 6, 1, '2017-06-21 21:43:25'),
(109, 55, 4, 3, '2017-06-21 21:43:25'),
(110, 56, 6, 1, '2017-06-21 21:43:56'),
(111, 56, 3, 1, '2017-06-21 21:43:56'),
(112, 57, 2, 1, '2017-06-21 21:46:52'),
(113, 57, 3, 2, '2017-06-21 21:46:52'),
(114, 57, 11, 1, '2017-06-21 21:46:52'),
(115, 57, 12, 2, '2017-06-21 21:46:52'),
(116, 58, 1, 1, '2017-06-21 21:50:02'),
(117, 58, 2, 1, '2017-06-21 21:50:02'),
(118, 58, 6, 3, '2017-06-21 21:50:02'),
(119, 58, 5, 3, '2017-06-21 21:50:02'),
(120, 58, 8, 1, '2017-06-21 21:50:02'),
(121, 58, 18, 1, '2017-06-21 21:50:02'),
(122, 58, 21, 1, '2017-06-21 21:50:02'),
(123, 59, 9, 1, '2017-06-21 21:50:27'),
(124, 59, 10, 2, '2017-06-21 21:50:27'),
(125, 60, 17, 1, '2017-06-21 21:50:41'),
(126, 60, 16, 1, '2017-06-21 21:50:41'),
(127, 60, 20, 3, '2017-06-21 21:50:41'),
(128, 61, 1, 1, '2017-06-21 21:50:55'),
(129, 61, 10, 1, '2017-06-21 21:50:55'),
(130, 61, 14, 2, '2017-06-21 21:50:55'),
(131, 62, 4, 1, '2017-06-21 21:51:06'),
(132, 62, 10, 2, '2017-06-21 21:51:06'),
(133, 62, 9, 1, '2017-06-21 21:51:06'),
(134, 63, 6, 1, '2017-06-21 21:51:37'),
(135, 63, 5, 4, '2017-06-21 21:51:37'),
(136, 64, 6, 1, '2017-06-21 22:38:51'),
(137, 65, 6, 1, '2017-06-21 22:39:11'),
(138, 66, 6, 3, '2017-06-21 22:39:59'),
(139, 67, 4, 4, '2017-06-22 05:53:59'),
(140, 67, 3, 4, '2017-06-22 05:53:59'),
(141, 68, 3, 1, '2017-06-22 05:54:14'),
(142, 68, 2, 1, '2017-06-22 05:54:14'),
(143, 68, 17, 2, '2017-06-22 05:54:14'),
(144, 68, 16, 2, '2017-06-22 05:54:14');

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
(1, 'veronique', 'veronique', 'veronique@black.cm', 'veronique@black.cm', 1, NULL, '$2y$13$4R3aQxO8YXCwTkLtWqi/i.vfT4Qy1uhRSkFYzK9Itz/27WIljIHly', '2017-06-22 05:02:18', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '#F39C12'),
(2, 'josee', 'josee', 'josee@black.cm', 'josee@black.cm', 1, NULL, '$2y$13$g2okr/hRmJf8YOszTGDsJuNO314nMEh6EDIcn87tAKgBnwgbPKHsC', '2017-06-22 04:25:02', NULL, NULL, 'a:0:{}', '#50C1CF'),
(3, 'sonia', 'sonia', 'sonia@black.cm', 'sonia@black.cm', 1, NULL, '$2y$13$2nqV0ZHMZpbldf1rEKd3OeiTeLTK2LvJUghRl4NLLV5NN/pF1HHMa', NULL, NULL, NULL, 'a:0:{}', '#97a005'),
(4, 'joseph', 'joseph', 'joseph@black.cm', 'joseph@black.cm', 1, NULL, '$2y$13$ep8/okfS.YYYgQtM0JGu6O.XMDdcjP9.6FTitlNnf5u7q0d.kUgyG', '2017-06-15 13:39:36', NULL, NULL, 'a:0:{}', '#E74C3C'),
(5, 'achille', 'achille', 'achille@black.cm', 'achille@black.cm', 1, NULL, '$2y$13$BIn3CBLSQS0IvT94JD.Ai.DrWRAmoOJ6mBmpkvpxUo7QQo6w378zC', '2017-06-21 09:39:37', NULL, NULL, 'a:0:{}', '#9B59B6');

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
  `prodparent` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `thumbnail_id`, `code`, `designation`, `Prixvente`, `prixachat`, `qtestock`, `qtemin`, `gerstock`, `typeproduit`, `qtepart`, `nbrediv`, `divvendu`, `prodparent`) VALUES
(1, 1, 5, 'sprite', 'Sprite', 1500, 208, 13, 24, 1, 1, NULL, NULL, NULL, NULL),
(2, 1, 6, 'fanta', 'Fanta', 1500, 188, 7, 6, 1, 1, NULL, NULL, NULL, NULL),
(3, 1, 8, 'sch_soda', 'Schweppes Soda', 1500, 240, -23, 5, 1, 1, NULL, NULL, NULL, NULL),
(4, 1, 7, 'cafe', 'Cafe', 1500, 500, 38, 10, 1, 1, NULL, NULL, NULL, NULL),
(5, 1, NULL, 'the', 'The', 1500, 500, 68, 10, 1, 1, NULL, NULL, NULL, NULL),
(6, 1, NULL, 'tan_pm', 'Tangui PM', 1000, 158, -14, 10, 1, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, 'mth_e', 'Menthe à eau', 0, 0, -6, 0, 1, 1, NULL, NULL, NULL, NULL),
(8, 1, NULL, 'Diabo', 'diabolo', 1500, 400, -18, NULL, 0, 4, NULL, NULL, NULL, NULL),
(9, 3, NULL, 'mer_btle', 'Merlot - Btle', 15000, 3700, -2, 1, 1, 2, 6, NULL, 1, NULL),
(10, 3, NULL, 'mer_ver', 'Merlot - verre', 3500, 740, -2, NULL, 0, 3, NULL, 1, NULL, 'mer_btle'),
(11, 3, NULL, 'medoc', 'Medoc', 20000, 7600, 4, 1, 1, 1, NULL, NULL, NULL, NULL),
(12, 3, 1, 'ca_sauv', 'Cabernet Sauvignon Cavior', 20000, 8500, 2, 1, 1, 1, NULL, NULL, NULL, NULL),
(13, 3, NULL, 'H_med', 'Haut-Medoc', 25000, 11500, 7, 3, 1, 1, NULL, NULL, NULL, NULL),
(14, 3, 2, 'cha_btl', 'Chardonnay - Btle', 15000, 4500, 6, 4, 1, 2, 6, NULL, 0, NULL),
(15, 3, NULL, 'cha_ve', 'Chardonnay -verre', 3000, 900, -1, NULL, 0, 3, NULL, 1, NULL, 'cha_btl'),
(16, 2, 9, 'bal_btl', 'Ballantine\'s - Btlle', 25000, 7200, -3, 2, 1, 2, 6, NULL, 5, NULL),
(17, 2, 10, 'bal_1/2', 'Ballantine\'s - 1/2Btlle', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'bal_btl'),
(18, 2, 3, 'bal_con', 'Ballantine\'s - conso', 2500, 514, NULL, NULL, 0, 3, NULL, 1, NULL, 'bal_btl'),
(19, 2, 4, 'CH12_B', 'Chivas 12 Years - Btlle', 35000, 15300, 6, 8, 1, 2, 6, NULL, 3, NULL),
(20, 2, NULL, 'CH12_1/2', 'Chivas 12 Years - 1/2Btlle', 18000, 7650, NULL, NULL, 0, 3, NULL, 2, NULL, 'CH12_B'),
(21, 2, NULL, 'CH12_C', 'Chivas 12 Years - Conso', 3500, 1093, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH12_B'),
(22, 10, NULL, 'BrB', 'Brochettes de boeuf', 1000, 540, -6, 0, 0, 1, NULL, NULL, NULL, NULL),
(23, 10, NULL, 'Pr_plan', 'Portion frittes plantain', 1000, 200, -5, NULL, 0, 1, NULL, NULL, NULL, NULL),
(24, 10, NULL, 'Pr_pom', 'Portion frittes pommes', 1000, 413, -3, NULL, 0, 1, NULL, NULL, NULL, NULL),
(25, 10, NULL, 'PL_1/4', '1/4 Poulets + frittes plantain', 3000, 1413, -6, NULL, 0, 1, NULL, NULL, NULL, NULL),
(26, 10, NULL, 'PL_1/2P', '1/2 Poulets + frittes plantain', 5000, 2200, -2, NULL, 0, 1, NULL, NULL, NULL, NULL),
(27, 10, NULL, 'PL_ENP', 'Poulets entier + frittes plantain', 10000, 4826, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL);

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
(8, 1);

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
(1, 'I-1', 'Interieur', 0),
(2, 'I-2', 'Interieur', 0),
(3, 'I-3', 'Interieur', 0),
(4, 'I-4', 'Interieur', 0),
(5, 'I-5', 'Interieur', 0),
(6, 'I-6', 'Interieur', 0),
(7, 'I-7', 'Interieur', 0),
(8, 'I-8', 'Interieur', 0),
(9, 'I-9', 'Interieur', 0),
(10, 'I-10', 'Interieur', 0),
(11, 'I-11', 'Interieur', 0),
(12, 'I-12', 'Interieur', 0),
(13, 'I-13', 'Interieur', 0),
(14, 'I-14', 'Interieur', 0),
(15, 'I-15', 'Interieur', 0),
(16, 'I-16', 'Interieur', 0),
(17, 'I-17', 'Interieur', 0),
(18, 'I-18', 'Interieur', 0),
(19, 'I-19', 'Interieur', 0),
(20, 'I-20', 'Interieur', 0),
(21, 'I-21', 'Interieur', 0),
(22, 'I-22', 'Interieur', 0),
(23, 'I-23', 'Interieur', 0),
(24, 'I-24', 'Interieur', 0),
(25, 'I-25', 'Interieur', 0),
(26, 'I-26', 'Interieur', 0),
(27, 'I-27', 'Interieur', 0),
(28, 'I-28', 'Interieur', 0),
(29, 'I-29', 'Interieur', 0),
(30, 'I-30', 'Interieur', 0),
(31, 'I-31', 'Interieur', 0),
(32, 'I-32', 'Interieur', 0),
(33, 'I-33', 'Interieur', 0),
(34, 'I-34', 'Interieur', 0),
(35, 'I-35', 'Interieur', 0),
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
(52, 'I-52', 'Interieur', 0),
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
(63, 'I-63', 'Interieur', 0),
(64, 'I-64', 'Interieur', 0),
(65, 'I-65', 'Interieur', 0),
(66, 'I-66', 'Interieur', 0),
(67, 'I-67', 'Interieur', 0),
(68, 'I-68', 'Interieur', 0),
(69, 'I-69', 'Interieur', 0),
(70, 'I-70', 'Interieur', 0),
(71, 'I-71', 'Interieur', 0),
(72, 'I-72', 'Interieur', 0),
(73, 'I-73', 'Interieur', 0),
(74, 'I-74', 'Interieur', 0),
(75, 'I-75', 'Interieur', 0),
(76, 'I-76', 'Interieur', 0),
(77, 'I-77', 'Interieur', 0),
(78, 'I-78', 'Interieur', 0),
(79, 'I-79', 'Interieur', 0),
(80, 'I-80', 'Interieur', 0),
(81, 'C-1', 'Couloir', 1),
(82, 'C-2', 'Couloir', 0),
(83, 'C-3', 'Couloir', 0),
(84, 'C-4', 'Couloir', 0),
(85, 'C-5', 'Couloir', 0),
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
(1, 4, 3, 0, '2017-06-15 13:40:40', 7500, 'espece'),
(2, 4, 190, 1, '2017-06-15 15:31:51', NULL, NULL),
(3, 5, 11, 0, '2017-06-15 15:39:19', 5500, 'espece'),
(4, 5, 12, 0, '2017-06-15 15:44:00', 14000, 'espece'),
(5, 5, 25, 0, '2017-06-15 15:46:24', 5000, 'espece'),
(6, 5, 21, 0, '2017-06-15 15:47:42', 29500, 'espece'),
(7, 5, 19, 0, '2017-06-15 15:52:09', 9000, 'espece'),
(8, 4, 51, 0, '2017-06-15 15:55:10', 7500, 'espece'),
(9, 5, 6, 0, '2017-06-15 16:27:47', 14000, 'espece'),
(10, 5, 34, 0, '2017-06-15 16:31:28', 9000, 'espece'),
(11, 4, 60, 1, '2017-06-15 16:51:44', NULL, NULL),
(12, 4, 1, 0, '2017-06-15 16:53:55', 6000, 'espece'),
(13, 4, 81, 1, '2017-06-15 17:03:20', NULL, NULL),
(14, 5, 3, 0, '2017-06-16 06:26:30', 10500, 'espece'),
(15, 5, 4, 0, '2017-06-16 06:33:15', 65000, 'espece'),
(16, 5, 5, 0, '2017-06-16 07:52:56', 7000, 'espece'),
(17, 5, 25, 0, '2017-06-16 07:53:55', 14000, 'espece'),
(18, 5, 17, 0, '2017-06-16 11:13:00', 13000, 'espece'),
(19, 5, 30, 0, '2017-06-16 12:00:07', 4500, 'espece'),
(20, 2, 11, 0, '2017-06-16 12:35:38', 7500, 'espece'),
(21, 2, 61, 0, '2017-06-16 12:39:08', 11500, 'espece'),
(22, 5, 13, 0, '2017-06-20 13:52:31', 22500, 'espece'),
(23, 5, 8, 0, '2017-06-20 14:03:20', 9000, 'espece'),
(24, 5, 11, 0, '2017-06-20 14:04:28', 10000, 'espece'),
(25, 5, 20, 0, '2017-06-20 14:05:13', 13000, 'espece'),
(26, 5, 19, 0, '2017-06-20 14:06:05', 4500, 'espece'),
(27, 2, 9, 0, '2017-06-20 20:53:01', 8500, 'espece'),
(28, 2, 12, 0, '2017-06-20 20:55:32', 3000, 'espece'),
(29, 2, 7, 0, '2017-06-21 02:11:19', 6000, 'espece'),
(30, 5, 12, 0, '2017-06-21 14:34:43', 6000, 'espece'),
(31, 5, 20, 0, '2017-06-21 14:39:18', 5000, 'espece'),
(32, 5, 27, 0, '2017-06-21 15:12:18', 3500, 'Orange Money'),
(33, 5, 31, 0, '2017-06-21 15:12:33', 18000, 'Carte'),
(34, 5, 13, 0, '2017-06-21 15:15:17', 2500, 'espece'),
(35, 5, 12, 0, '2017-06-21 15:18:45', 30000, 'Orange Money'),
(36, 5, 9, 0, '2017-06-21 15:19:07', 30000, 'Carte'),
(37, 5, 8, 0, '2017-06-21 21:25:00', 6000, 'Orange Money'),
(38, 5, 3, 0, '2017-06-21 21:36:59', 3000, 'especes'),
(39, 5, 13, 0, '2017-06-21 21:43:18', 4500, 'especes'),
(40, 5, 27, 0, '2017-06-21 21:43:25', 5500, 'especes'),
(41, 5, 33, 0, '2017-06-21 21:43:56', 2500, 'Orange Money'),
(42, 5, 87, 0, '2017-06-21 21:46:52', 64500, 'especes'),
(43, 1, 8, 0, '2017-06-21 21:50:02', 18000, 'especes'),
(44, 1, 30, 0, '2017-06-21 21:50:27', 22000, 'especes'),
(45, 1, 19, 0, '2017-06-21 21:50:41', 94000, 'Carte'),
(46, 1, 92, 0, '2017-06-21 21:50:55', 35000, 'Carte'),
(47, 1, 28, 0, '2017-06-21 21:51:06', 23500, 'Orange Money'),
(48, 1, 41, 0, '2017-06-21 21:51:37', 7000, 'Orange Money'),
(49, 1, 12, 0, '2017-06-21 22:38:51', 5000, 'especes'),
(50, 1, 8, 0, '2017-06-22 05:53:59', 12000, 'Orange Money'),
(51, 1, 20, 0, '2017-06-22 05:54:14', 83000, 'especes');

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
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D34A04ADFDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `stockoperation`
--
ALTER TABLE `stockoperation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
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
