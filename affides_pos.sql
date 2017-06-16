-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 15 Juin 2017 à 17:22
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

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
(15, 11, '2017-06-15 17:16:54', 1);

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
(5, 'Champagne', 'Bar'),
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
(43, 15, 23, 2, '2017-06-15 17:16:54');

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
(1, 'veronique', 'veronique', 'veronique@black.cm', 'veronique@black.cm', 1, NULL, '$2y$13$4R3aQxO8YXCwTkLtWqi/i.vfT4Qy1uhRSkFYzK9Itz/27WIljIHly', NULL, NULL, NULL, 'a:0:{}', '#F39C12'),
(2, 'josee', 'josee', 'josee@black.cm', 'josee@black.cm', 1, NULL, '$2y$13$g2okr/hRmJf8YOszTGDsJuNO314nMEh6EDIcn87tAKgBnwgbPKHsC', '2017-06-15 13:29:14', NULL, NULL, 'a:0:{}', '#50C1CF'),
(3, 'sonia', 'sonia', 'sonia@black.cm', 'sonia@black.cm', 1, NULL, '$2y$13$2nqV0ZHMZpbldf1rEKd3OeiTeLTK2LvJUghRl4NLLV5NN/pF1HHMa', NULL, NULL, NULL, 'a:0:{}', '#97a005'),
(4, 'joseph', 'joseph', 'joseph@black.cm', 'joseph@black.cm', 1, NULL, '$2y$13$ep8/okfS.YYYgQtM0JGu6O.XMDdcjP9.6FTitlNnf5u7q0d.kUgyG', '2017-06-15 13:39:36', NULL, NULL, 'a:0:{}', '#E74C3C'),
(5, 'achille', 'achille', 'achille@black.cm', 'achille@black.cm', 1, NULL, '$2y$13$BIn3CBLSQS0IvT94JD.Ai.DrWRAmoOJ6mBmpkvpxUo7QQo6w378zC', '2017-06-15 10:54:21', NULL, NULL, 'a:0:{}', '#9B59B6');

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
(1, 1, NULL, 'sprite', 'Sprite', 1500, 208, 18, 24, 1, 1, NULL, NULL, NULL, NULL),
(2, 1, NULL, 'fanta', 'Fanta', 1500, 188, 23, 6, 1, 1, NULL, NULL, NULL, NULL),
(3, 1, NULL, 'sch_soda', 'Schweppes Soda', 1500, 240, -5, 5, 1, 1, NULL, NULL, NULL, NULL),
(4, 1, NULL, 'cafe', 'Cafe', 1500, 500, 57, 10, 1, 1, NULL, NULL, NULL, NULL),
(5, 1, NULL, 'the', 'The', 1500, 500, 84, 10, 1, 1, NULL, NULL, NULL, NULL),
(6, 1, NULL, 'tan_pm', 'Tangui PM', 1000, 158, 7, 10, 1, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, 'mth_e', 'Menthe à eau', 0, 0, -6, 0, 1, 1, NULL, NULL, NULL, NULL),
(8, 1, NULL, 'Diabo', 'diabolo', 1500, 400, -12, NULL, 0, 4, NULL, NULL, NULL, NULL),
(9, 3, NULL, 'mer_btle', 'Merlot - Btle', 15000, 3700, 3, 1, 1, 2, 6, NULL, NULL, NULL),
(10, 3, NULL, 'mer_ver', 'Merlot - verre', 3500, 740, -2, NULL, 0, 3, NULL, 1, NULL, 'mer_btle'),
(11, 3, NULL, 'medoc', 'Medoc', 20000, 7600, 5, 1, 1, 1, NULL, NULL, NULL, NULL),
(12, 3, NULL, 'ca_sauv', 'Cabernet Sauvignon Cavior', 20000, 8500, 4, 1, 1, 1, NULL, NULL, NULL, NULL),
(13, 3, NULL, 'H_med', 'Haut-Medoc', 25000, 11500, 7, 3, 1, 1, NULL, NULL, NULL, NULL),
(14, 3, NULL, 'cha_btl', 'Chardonnay - Btle', 15000, 4500, 10, 4, 1, 2, 6, NULL, NULL, NULL),
(15, 3, NULL, 'cha_ve', 'Chardonnay -verre', 3000, 900, -1, NULL, 0, 3, NULL, 1, NULL, 'cha_btl'),
(16, 2, NULL, 'bal_btl', 'Ballantine\'s - Btlle', 25000, 7200, 3, 2, 1, 2, 6, NULL, NULL, NULL),
(17, 2, NULL, 'bal_1/2', 'Ballantine\'s - 1/2Btlle', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'bal_btl'),
(18, 2, NULL, 'bal_con', 'Ballantine\'s - conso', 2500, 514, NULL, NULL, 0, 3, NULL, 1, NULL, 'bal_btl'),
(19, 2, NULL, 'CH12_B', 'Chivas 12 Years - Btlle', 35000, 15300, 10, 8, 1, 2, 6, NULL, NULL, NULL),
(20, 2, NULL, 'CH12_1/2', 'Chivas 12 Years - 1/2Btlle', 18000, 7650, NULL, NULL, 0, 3, NULL, 2, NULL, 'CH12_B'),
(21, 2, NULL, 'CH12_C', 'Chivas 12 Years - Conso', 3500, 1093, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH12_B'),
(22, 10, NULL, 'BrB', 'Brochettes de boeuf', 1000, 540, -1, 0, 0, 1, NULL, NULL, NULL, NULL),
(23, 10, NULL, 'Pr_plan', 'Portion frittes plantain', 1000, 200, -5, NULL, 0, 1, NULL, NULL, NULL, NULL),
(24, 10, NULL, 'Pr_pom', 'Portion frittes pommes', 1000, 413, -2, NULL, 0, 1, NULL, NULL, NULL, NULL),
(25, 10, NULL, 'PL_1/4', '1/4 Poulets + frittes plantain', 3000, 1413, -2, NULL, 0, 1, NULL, NULL, NULL, NULL),
(26, 10, NULL, 'PL_1/2P', '1/2 Poulets + frittes plantain', 5000, 2200, -1, NULL, 0, 1, NULL, NULL, NULL, NULL),
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
(6, 'I-6', 'Interieur', 1),
(7, 'I-7', 'Interieur', 0),
(8, 'I-8', 'Interieur', 0),
(9, 'I-9', 'Interieur', 0),
(10, 'I-10', 'Interieur', 0),
(11, 'I-11', 'Interieur', 1),
(12, 'I-12', 'Interieur', 1),
(13, 'I-13', 'Interieur', 0),
(14, 'I-14', 'Interieur', 0),
(15, 'I-15', 'Interieur', 0),
(16, 'I-16', 'Interieur', 0),
(17, 'I-17', 'Interieur', 0),
(18, 'I-18', 'Interieur', 0),
(19, 'I-19', 'Interieur', 1),
(20, 'I-20', 'Interieur', 0),
(21, 'I-21', 'Interieur', 1),
(22, 'I-22', 'Interieur', 0),
(23, 'I-23', 'Interieur', 0),
(24, 'I-24', 'Interieur', 0),
(25, 'I-25', 'Interieur', 1),
(26, 'I-26', 'Interieur', 0),
(27, 'I-27', 'Interieur', 0),
(28, 'I-28', 'Interieur', 0),
(29, 'I-29', 'Interieur', 0),
(30, 'I-30', 'Interieur', 0),
(31, 'I-31', 'Interieur', 0),
(32, 'I-32', 'Interieur', 0),
(33, 'I-33', 'Interieur', 0),
(34, 'I-34', 'Interieur', 1),
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
(3, 5, 11, 1, '2017-06-15 15:39:19', NULL, NULL),
(4, 5, 12, 1, '2017-06-15 15:44:00', NULL, NULL),
(5, 5, 25, 1, '2017-06-15 15:46:24', NULL, NULL),
(6, 5, 21, 1, '2017-06-15 15:47:42', NULL, NULL),
(7, 5, 19, 1, '2017-06-15 15:52:09', NULL, NULL),
(8, 4, 51, 0, '2017-06-15 15:55:10', 7500, 'espece'),
(9, 5, 6, 1, '2017-06-15 16:27:47', NULL, NULL),
(10, 5, 34, 1, '2017-06-15 16:31:28', NULL, NULL),
(11, 4, 60, 1, '2017-06-15 16:51:44', NULL, NULL),
(12, 4, 1, 0, '2017-06-15 16:53:55', 6000, 'espece'),
(13, 4, 81, 1, '2017-06-15 17:03:20', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
