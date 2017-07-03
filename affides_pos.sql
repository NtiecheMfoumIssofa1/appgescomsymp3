-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 03 Juillet 2017 à 08:28
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
  `date` datetime NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(3, 'sonia', 'sonia', 'sonia@black.cm', 'sonia@black.cm', 1, NULL, '$2y$13$2nqV0ZHMZpbldf1rEKd3OeiTeLTK2LvJUghRl4NLLV5NN/pF1HHMa', '2017-06-28 15:15:24', NULL, NULL, 'a:1:{i:0;s:11:\"ROLE_CAISSE\";}', '#97a005'),
(4, 'joseph', 'joseph', 'joseph@black.cm', 'joseph@black.cm', 1, NULL, '$2y$13$ep8/okfS.YYYgQtM0JGu6O.XMDdcjP9.6FTitlNnf5u7q0d.kUgyG', '2017-06-22 15:13:04', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '#E74C3C'),
(5, 'achille', 'achille', 'achille@black.cm', 'achille@black.cm', 1, NULL, '$2y$13$BIn3CBLSQS0IvT94JD.Ai.DrWRAmoOJ6mBmpkvpxUo7QQo6w378zC', '2017-06-29 14:54:52', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '#9B59B6');

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
(1, 1, 5, 'sprite', 'Sprite', 1500, 208, 4, 24, 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 1, 6, 'fanta', 'Fanta', 1500, 188, 9, 6, 1, 1, NULL, NULL, NULL, NULL, NULL),
(3, 1, 8, 'sch_soda', 'Schweppes Soda', 1500, 240, NULL, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(4, 1, 7, 'cafe', 'Cafe', 1500, 500, NULL, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(5, 1, 170, 'the', 'The', 1500, 500, NULL, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(6, 1, 171, 'tan_pm', 'Tangui PM', 1000, 158, NULL, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(7, 1, 172, 'mth_e', 'Menthe à eau', 0, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL),
(8, 1, 12, 'Diabo', 'diabolo', 1500, 400, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(9, 3, 13, 'mer_btle', 'Merlot - Btle', 15000, 3700, NULL, 1, 1, 2, 6, NULL, 0, NULL, NULL),
(10, 3, 14, 'mer_ver', 'Merlot - verre', 3500, 740, NULL, NULL, 0, 3, NULL, 1, NULL, 'mer_btle', NULL),
(11, 3, 15, 'medoc', 'Medoc', 20000, 7600, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(12, 3, 1, 'ca_sauv', 'Cabernet Sauvignon Cavior', 20000, 8500, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(13, 3, NULL, 'H_med', 'Haut-Medoc', 25000, 11500, 6, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(14, 3, 2, 'cha_btl', 'Chardonnay - Btle', 15000, 4500, NULL, 4, 1, 2, 6, NULL, 4, NULL, NULL),
(15, 3, 16, 'cha_ve', 'Chardonnay -verre', 3000, 900, NULL, NULL, 0, 3, NULL, 1, NULL, 'cha_btl', NULL),
(16, 2, 9, 'bal_btl', 'Ballantine\'s', 25000, 7200, 5, 2, 1, 2, 14, NULL, 0, NULL, NULL),
(17, 2, 10, 'bal_1/2', '1/2 Ballantine\'s', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'bal_btl', NULL),
(18, 2, 3, 'bal_con', 'conso Ballantine\'s', 2500, 514, NULL, NULL, 0, 3, NULL, 1, NULL, 'bal_btl', NULL),
(19, 2, 4, 'CH12_B', 'Chivas 12 Years', 35000, 15300, NULL, 8, 1, 2, 6, NULL, 3, NULL, NULL),
(20, 2, 17, 'CH12_1/2', '1/2 Chivas 12 Years', 18000, 7650, NULL, NULL, 0, 3, NULL, 2, NULL, 'CH12_B', NULL),
(21, 2, 18, 'CH12_C', 'Conso Chivas 12 Years', 3500, 1093, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH12_B', NULL),
(22, 10, 156, 'BrB', 'Brochettes de boeuf', 1000, 540, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(23, 10, 157, 'Pr_plan', 'Portion fts plantain', 1000, 200, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(24, 10, 158, 'Pr_pom', 'Portion fts pommes', 1000, 413, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(25, 10, 159, 'PL_1/4P', '1/4 Poulets + fts plantain', 3000, 1413, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(26, 10, 160, 'PL_1/2P', '1/2 Poulets + fts plantain', 5000, 2200, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(27, 10, 161, 'PL_ENP', 'Poulets entier + fts plantain', 10000, 4826, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(28, 11, 165, 'CHCM', 'Chicha Chwingum menthe', 3000, 2000, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(29, 11, 166, 'CHCIM', 'Chicha Citron menthe', 3000, 2000, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(30, 11, 167, 'CHIM', 'Chicha menthe', 3000, 2000, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(31, 11, 168, 'CHIPO', 'Chicha Pomme', 3000, 2000, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(32, 11, 169, 'CHIPOM', 'Chicha Pomme menthe', 3000, 2000, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(33, 12, 19, 'CCGM', 'Coca GM', 0, 0, NULL, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(34, 12, 20, 'TOSGM', 'Top Soda GM', 0, 0, NULL, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(36, 1, 21, 'PEPM', 'Perrier PM', 2000, 1000, NULL, 6, 1, 1, NULL, NULL, NULL, NULL, NULL),
(37, 1, NULL, 'MTHL', 'Menthe au lait', 2500, 0, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(38, 1, 22, 'CCLA', 'Coca cola', 1500, 188, NULL, 24, 1, 1, NULL, NULL, NULL, NULL, 2),
(39, 1, 23, 'CCLAZ', 'Coca cola zero', 1500, 383, NULL, 6, 1, 1, NULL, NULL, NULL, NULL, 2),
(40, 1, NULL, 'sch_ton', 'schweppes tonic', 1500, 240, 9, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(41, 1, NULL, 'ORGNA', 'Orangina', 1500, 293, 0, 10, 1, 1, NULL, NULL, NULL, NULL, NULL),
(42, 1, NULL, 'ETK_CL', 'Eteki Classique', 2000, 833, 0, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(43, 1, NULL, 'ETK_WI', 'Eteki Wildberry', 2000, 833, 0, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(44, 1, 24, 'RBULL', 'Red bull', 2000, 875, NULL, 14, 1, 1, NULL, NULL, NULL, NULL, NULL),
(45, 1, 25, 'MLTG', 'Malta Guinness', 2000, 467, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(46, 1, 26, 'SMIBL', 'Smirnoff Ice Black', 2000, 508, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(47, 1, 27, '33EXP', '33 Export', 2000, 302, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, 2),
(48, 1, 28, 'B_LIGHT', 'Beaufort Light', 2000, 433, NULL, 8, 1, 1, NULL, NULL, NULL, NULL, 2),
(49, 1, 29, 'CSTL', 'Castel', 2000, 256, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, 2),
(50, 1, 30, 'HNKEN', 'Heineken', 2000, 613, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(51, 1, NULL, 'BDWSR', 'Budweiser', 2000, 650, 0, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(52, 1, NULL, 'MAHOU', 'Mahou', 2000, 583, 0, 12, 1, 1, NULL, NULL, NULL, NULL, NULL),
(53, 1, 31, 'GNESS', 'Guiness', 2000, 550, NULL, 12, 1, 1, NULL, NULL, NULL, NULL, 1),
(54, 1, 32, 'TTNPM', 'Top Tonic PM', 1500, 202, NULL, 4, 1, 1, NULL, NULL, NULL, NULL, 2),
(55, 3, 33, 'SVGN', 'Sauvignon', 17500, 4500, NULL, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(56, 3, 34, 'CHSCV', 'Chardonnay Sweet Cavior', 20000, 8500, NULL, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(57, 3, NULL, 'PRSCO', 'Prosecco', 15000, 0, 10, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(58, 3, 35, 'JPCHNT', 'Jp Chenet', 15000, 5500, NULL, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(59, 3, 36, 'CTPROV', 'Cote de Provence', 17500, 6600, NULL, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(60, 3, 37, 'TTGER37', 'Taitinger(37,5 cl)', 22500, 12500, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(61, 3, 38, 'TTGER', 'Taitinger', 45000, 21667, NULL, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(62, 3, 39, 'MOETB', 'Moet Brut', 45000, 23333, NULL, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(63, 3, 40, 'MOETN', 'Moet Nectar', 60000, 35000, NULL, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(64, 3, 41, 'VVECLIC', 'Veuve Clicquot', 60000, 35000, NULL, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(65, 3, NULL, 'RNTB', 'Ruinart Blanc', 70000, 45000, 0, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(66, 3, NULL, 'DPERGN', 'Dom Pérignon', 150000, 86667, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(67, 3, NULL, 'CHMCR', 'Champagne Cristal', 225000, 150000, 1, 4, 1, 1, NULL, NULL, NULL, NULL, NULL),
(68, 12, NULL, 'CFEO', 'Cafe', 0, 500, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(69, 12, NULL, 'THEO', 'The', 0, 500, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(70, 12, 42, 'EAUSPT', 'Eau Supermont', 0, 0, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL),
(71, 12, NULL, 'GLCS', 'Glacons', 0, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(72, 12, 43, 'TNICO', 'Tonic', 0, 0, NULL, 124, 1, 1, NULL, NULL, NULL, NULL, NULL),
(73, 10, 162, 'PL_1/4PO', '1/4 Poulets + fts pommes', 3000, 1200, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(74, 10, 163, 'PL_1/2PO', '1/2 Poulets + fts pommes', 5000, 2413, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(75, 10, 164, 'PL_ENPO', 'Poulet entier + fts pommes', 10000, 4826, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(77, 9, 45, 'ARMGCO', 'conso Armagnac', 4000, 1154, NULL, NULL, 0, 5, NULL, NULL, NULL, NULL, NULL),
(78, 9, 46, 'GRDMBtl', 'Grand Marnier', 40000, 25000, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(79, 9, 47, 'GRDMCO', 'Conso Grand Marnier', 4000, 1923, NULL, NULL, 0, 3, NULL, 1, NULL, 'GRDMBtl', NULL),
(80, 9, 48, 'RMYMB', 'Remy martin', 40000, 27500, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(81, 9, 49, 'RMYMC', 'Conso Remy Martin', 4000, 2115, NULL, NULL, 0, 3, NULL, 1, NULL, 'RMYMB', NULL),
(82, 7, 50, 'ABSLT', 'Absolut', 25000, 8700, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(83, 7, 51, 'ABSLT1/2', '1/2 Absolut', 15000, 4350, NULL, NULL, 0, 3, NULL, 2, NULL, 'ABSLT', NULL),
(84, 7, 52, 'ABSLTC', 'Conso Absolut', 2500, 621, NULL, NULL, 0, 3, NULL, 1, NULL, 'ABSLT', NULL),
(85, 7, 53, 'ABSLTA', 'Absolut Aromatisée', 25000, 8700, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(86, 7, 54, 'ABSLTA1/2', '1/2 Absolut Aromatisée', 15000, 4350, NULL, NULL, 0, 3, NULL, 2, NULL, 'ABSLTA', NULL),
(87, 7, 55, 'ABSLTAC', 'Conso Absolut Aromatisée', 2500, 621, NULL, NULL, 0, 3, NULL, 1, NULL, 'ABSLTA', NULL),
(88, 7, NULL, 'SMRD', 'Smirnoff Red', 25000, 5250, 2, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(89, 7, NULL, 'SMRD1/2', '1/2 Smirnoff Red', 15000, 2625, NULL, NULL, 0, 3, NULL, 2, NULL, 'SMRD', NULL),
(90, 7, NULL, 'SMRDC', 'Conso Smirnoff Red', 2500, 375, NULL, NULL, 0, 3, NULL, 1, NULL, 'SMRD', NULL),
(91, 7, 56, 'CIROC', 'Ciroc', 35000, 17900, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(92, 6, 57, 'BCRDI', 'Bacardi', 25000, 10000, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(93, 6, 58, 'BCRDI1/2', '1/2 Bacardi', 15000, 5000, NULL, NULL, 0, 3, NULL, 2, NULL, 'BCRDI', NULL),
(94, 6, 59, 'BCRDIC', 'Conso Bacardi', 2500, 556, NULL, NULL, 0, 3, NULL, 1, NULL, 'BCRDI', NULL),
(95, 6, 60, 'HVNA3', 'Havana 3 years', 25000, 8250, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(96, 6, 61, 'HVNA31/2', '1/2 Havana 3 years', 15000, 4125, NULL, NULL, 0, 3, NULL, 2, NULL, 'HVNA3', NULL),
(97, 6, 62, 'HVNA3C', 'Conso Havana 3 years', 2500, 663, NULL, NULL, 0, 3, NULL, 1, NULL, 'HVNA3', NULL),
(98, 6, 63, 'HVNA7', 'Havana 7 years', 35000, 16200, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(99, 6, 64, 'HVNA7C', 'Conso Havana 7 years', 3000, 1246, NULL, NULL, 0, 3, NULL, 1, NULL, 'HVNA7', NULL),
(100, 2, 65, 'balbrsl', 'Ballantine\'s Brasil', 25000, 7200, NULL, 5, 1, 2, 14, NULL, 7, NULL, NULL),
(101, 2, 66, 'balbrsl1/2', '1/2 Ballantine\'s Brasil', 15000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'balbrsl', NULL),
(102, 2, 67, 'BalbrslC', 'conso Ballantine\'s Brasil', 2500, 554, NULL, NULL, 0, 3, NULL, 1, NULL, 'balbrsl', NULL),
(103, 2, 68, 'BALS12', 'Ballantine\'s 12 years', 35000, 7200, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(104, 2, 69, 'BALS121/2', '1/2 Ballantine\'s 12 years', 18000, 3600, NULL, NULL, 0, 3, NULL, 2, NULL, 'BALS12', NULL),
(105, 2, 70, 'BALS12C', 'Conso Ballantine\'s 12 years', 3500, 1043, NULL, NULL, 0, 3, NULL, 1, NULL, 'BALS12', NULL),
(106, 2, 71, 'CH18_B', 'Chivas 18 Years', 80000, 43000, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(107, 2, 72, 'CH18_C', 'Conso Chivas 18 Years', 7000, 3071, NULL, NULL, 0, 3, NULL, 1, NULL, 'CH18_B', NULL),
(108, 2, 73, 'CHR18', 'Chivas Royal Salute 18 years', 140000, 94667, NULL, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(109, 2, 74, 'GLFD12', 'Glenfiddich 12 years', 40000, 19500, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(110, 2, 75, 'GLFD121/2', '1/2 Glenfiddich 12 years', 20000, 9750, NULL, NULL, 0, 3, NULL, 2, NULL, 'GLFD12', NULL),
(111, 2, 76, 'GLFD12C', 'Conso Glenfiddich 12 years', 3500, 1393, NULL, NULL, 0, 3, NULL, 1, NULL, 'GLFD12', NULL),
(112, 2, 11, 'GLFD18', 'Glenfiddich 18 years', 70000, 33000, NULL, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(113, 2, 77, 'JADLS', 'Jack Daniel\'s', 35000, 10333, NULL, 8, 1, 2, 14, NULL, NULL, NULL, NULL),
(114, 2, 78, 'JADLS1/2', '1/2 Jack Daniel\'s', 18000, 5167, NULL, NULL, 0, 3, NULL, 2, NULL, 'JADLS', NULL),
(115, 2, 79, 'JADLSC', 'Conso Jack Daniel\'s', 3500, 795, NULL, NULL, 0, 3, NULL, 1, NULL, 'JADLS', NULL),
(116, 2, 80, 'J&B_btle', 'J&B', 25000, 7336, NULL, 4, 1, 2, 14, NULL, NULL, NULL, NULL),
(117, 2, 81, 'J&B_1/2', '1/2 J&B', 15000, 3668, NULL, NULL, 0, 3, NULL, 2, NULL, 'J&B_btle', NULL),
(118, 2, 82, 'J&B_C', 'Conso J&B', 2500, 524, NULL, NULL, 0, 3, NULL, 1, NULL, 'J&B_btle', NULL),
(119, 2, 83, 'JDLSH', 'Jack Daniel\'s Honey', 35000, 13333, NULL, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(120, 2, 84, 'JDLSH1/2', '1/2 Jack daniel\'s Honey', 18000, 6667, NULL, NULL, 0, 3, NULL, 2, NULL, 'JDLSH', NULL),
(121, 2, 95, 'JDLSHC', 'Conso Jack Daniel\'s Honey', 3500, 1026, NULL, NULL, 0, 3, NULL, 1, NULL, 'JDLSH', NULL),
(122, 2, 96, 'JWRL', 'JW Red Label', 25000, 7336, NULL, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(123, 2, 97, 'JWRL1/2', '1/2 JW Red Label', 15000, 3668, NULL, NULL, 0, 3, NULL, 2, NULL, 'JWRL', NULL),
(124, 2, 98, 'JWRLC', 'Conso JW Red Label', 2500, 524, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWRL', NULL),
(125, 2, 99, 'JWBL', 'JW Black label', 35000, 14510, NULL, 8, 1, 2, 14, NULL, NULL, NULL, NULL),
(126, 2, 100, 'JWBL1/2', '1/2 JW Black Label', 18000, 7255, NULL, NULL, 0, 3, NULL, 2, NULL, 'JWBL', NULL),
(127, 2, 101, 'JWBLC', 'Conso JW Black Label', 3500, 1036, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWBL', NULL),
(128, 2, 102, 'JWDBL', 'JW Double Black Label', 50000, 21800, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(129, 2, 103, 'JWDBLC', 'Conso JW Double Black Label', 5000, 1557, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWDBL', NULL),
(130, 2, 104, 'JWGRL', 'JW Gold Reserve Label', 70000, 34800, NULL, 0, 1, 2, 14, NULL, NULL, NULL, NULL),
(131, 2, 85, 'JWGRLC', 'Conso JW Gold Reserve Label', 7000, 2486, NULL, NULL, 0, 3, NULL, 1, NULL, 'JWGRL', NULL),
(132, 2, 86, 'JWPLT', 'JW Platinium', 80000, 3321, NULL, 3, 1, 1, NULL, NULL, NULL, NULL, NULL),
(133, 2, 87, 'JWBLUL', 'JW Blue Label', 200000, 113500, NULL, 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(134, 4, 88, 'BLCRCC', 'Conso Blue Curacao', 2500, 654, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(135, 4, 89, 'GET27C', 'Conso Get 27', 2500, 833, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(136, 4, 90, 'GET31C', 'Conso GET 31', 2500, 556, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(137, 4, 91, 'MABRZD', 'Conso Marie Brizzard', 2500, 679, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(138, 4, 92, 'PAST51', 'Conso Pastis 51', 2500, 492, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(139, 4, 93, 'RCARD', 'Conso Ricard', 2500, 506, 14, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(140, 4, 94, 'GNGDN', 'Gin Gordon', 20000, 6046, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(141, 4, 105, 'GNGDNC', 'Conso Gin Gordon', 2500, 432, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNGDN', NULL),
(142, 4, 106, 'GNGDN1/2', '1/2 Gin Gordon', 12000, 3023, NULL, NULL, 0, 3, NULL, 2, NULL, 'GNGDN', NULL),
(143, 4, NULL, 'GNBETR', 'Gin Beefeater', 20000, 6000, 0, 5, 1, 2, 14, NULL, NULL, NULL, NULL),
(144, 4, NULL, 'GNBETR1/2', '1/2 Gin Beefeater', 12000, 0, NULL, NULL, 0, 3, NULL, 2, NULL, 'GNBETR', NULL),
(145, 4, 107, 'GNBETRC', 'Conso Gin Beefeater', 2500, 0, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNBETR', NULL),
(146, 4, 108, 'MRTNB', 'Martini Blanc', 22500, 6100, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(147, 4, 109, 'MRTNB1/2', '1/2 Martini Blanc', 12500, 3050, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNB', NULL),
(148, 4, 110, 'MRTNBC', 'Conso Martini Blanc', 2500, 339, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNB', NULL),
(149, 4, 111, 'MRTND', 'Martini Dry', 22500, 6000, NULL, 5, 1, 2, 14, NULL, NULL, NULL, NULL),
(150, 4, 112, 'MRTND1/2', '1/2 Martini Dry', 12500, 3000, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTND', NULL),
(151, 4, 113, 'MRTNDC', 'Conso Martini Dry', 2500, 333, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTND', NULL),
(152, 4, 114, 'MRTNRS', 'Martini Rose', 22500, 7000, NULL, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(153, 4, 115, 'MRTNRS1/2', '1/2 Martini Rose', 12500, 3500, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNRS', NULL),
(154, 4, 116, 'MRTNRSC', 'Conso Martini Rose', 2500, 389, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNRS', NULL),
(155, 4, 117, 'MRTNR', 'Martini Rouge', 22500, 6100, NULL, 3, 1, 2, 14, NULL, NULL, NULL, NULL),
(156, 4, 118, 'MRTNR1/2', '1/2 Martini Rouge', 12500, 3050, NULL, NULL, 0, 3, NULL, 2, NULL, 'MRTNR', NULL),
(157, 4, 119, 'MRTNRC', 'Conso Martini Rouge', 2500, 339, NULL, NULL, 0, 3, NULL, 1, NULL, 'MRTNR', NULL),
(158, 4, 120, 'BLYS', 'Baileys', 25000, 7658, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(159, 4, 121, 'BLYS1/2', '1/2 Baileys', 15000, 3829, NULL, NULL, 0, 3, NULL, 2, NULL, 'BLYS', NULL),
(160, 4, 122, 'BLYSC', 'Conso Baileys', 2500, 547, NULL, NULL, 0, 3, NULL, 1, NULL, 'BLYS', NULL),
(161, 4, 123, 'MLBU', 'Malibu', 25000, 10000, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(162, 4, 124, 'MLBUC', 'Conso Malibu', 2500, 714, NULL, NULL, 0, 3, NULL, 1, NULL, 'MLBU', NULL),
(163, 4, 125, 'TQLBL', 'Tequila Blanc', 25000, 5500, NULL, 2, 1, 2, 14, NULL, NULL, NULL, NULL),
(164, 4, 126, 'TQLBLC', 'Conso Tequila Blanc', 2500, 423, NULL, NULL, 0, 3, NULL, 1, NULL, 'TQLBL', NULL),
(165, 4, 127, 'CMPRI', 'Campari', 25000, 8000, NULL, 4, 1, 2, 14, NULL, NULL, NULL, NULL),
(166, 4, 128, 'CMPRIC', 'Conso Campari', 2500, 444, NULL, NULL, 0, 3, NULL, 1, NULL, 'CMPRI', NULL),
(167, 4, 129, 'CNTR', 'Conso Cointreau', 3000, 1269, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(168, 4, 130, 'GNTQR', 'Gin Tanqueray', 35000, 11700, NULL, 1, 1, 2, 14, NULL, NULL, NULL, NULL),
(169, 4, 131, 'GNTQRC', 'Conso Gin Tanqueray', 3500, 836, NULL, NULL, 0, 3, NULL, 1, NULL, 'GNTQR', NULL),
(170, 4, 132, 'PRTBL', 'Conso Porto Blanc', 3000, 714, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(171, 4, 133, 'PRTRO', 'Conso Porto Rouge', 3000, 786, NULL, 4, 1, 5, 14, NULL, NULL, NULL, NULL),
(172, 8, 134, 'AMRC', 'Americano', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(173, 8, 135, 'CPRNHA', 'Caipirinha', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(174, 8, 136, 'MRGRTA', 'Margarita', 5000, 3000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(175, 8, 137, 'PNCLDA', 'Pina Colada', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(176, 8, 138, 'TQLSNR', 'Tequila Sunrise', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(177, 8, 139, 'MOJITO', 'MOJITO', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(178, 8, 140, 'B52', 'B52', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(179, 8, 141, 'CSMPLT', 'Cosmopolitan', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(180, 8, 142, 'DAQRI', 'Daiquiri', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(181, 8, 143, 'MNTHAN', 'Manhattan', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(182, 8, 144, 'MTNCKT', 'Martini Cocktail', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(183, 8, 145, 'NEGRONI', 'Negroni', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(184, 8, 146, 'LNGISIT', 'Long Island Ice-Tea', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(185, 8, 147, 'MEXIT', 'Mexican Ice tea', 7500, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(186, 8, 148, 'BLWHITE', 'Black&White', 4000, 1000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(187, 8, 149, 'FLRDA', 'Florida', 4000, 1000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(188, 8, 150, 'VRMJTO', 'Virgin Mojito', 4000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(189, 8, 151, 'VRETKJ', 'Virgin Etekjito', 4000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(190, 8, 152, 'BLTKI', 'Blueteki', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(191, 8, 153, 'ETEKJITO', 'Etekjito', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(192, 8, 154, 'ETKSAMB', 'Eteki Samba', 5000, 2000, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(193, 8, 155, 'ETKBB', 'Eteki Boom Boom (4shots)', 8000, 3500, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL);

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
  `quantiteprec` int(11) DEFAULT NULL,
  `cause` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `employes_id` int(11) DEFAULT NULL
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
(60, 'I-60', 'Interieur', 0),
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
(81, 'C-1', 'Couloir', 0),
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
(190, 'T-30', 'Terasse', 0),
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
(2, 'chardonnay.jpg', 'chardonnay.jpg'),
(3, 'consobalantine.jpg', 'consobalantine.jpg'),
(4, 'chivas12.jpg', 'chivas12.jpg'),
(5, 'sprite1.jpg', 'sprite1.jpg'),
(6, 'fanta1.jpg', 'fanta1.jpg'),
(7, 'cafe1.jpg', 'cafe1.jpg'),
(8, 'scheppes.jpg', 'scheppes.jpg'),
(9, 'ballantine.jpg', 'ballantine.jpg'),
(10, 'ballantine.jpg', 'ballantine.jpg'),
(11, 'glenfiddich18.jpg', 'glenfiddich18.jpg'),
(12, 'cocktail3.jpg', 'cocktail3.jpg'),
(13, 'merlot.jpg', 'merlot.jpg'),
(14, 'conso7.jpg', 'conso7.jpg'),
(15, 'merlot1.jpg', 'merlot1.jpg'),
(16, 'conso4.jpg', 'conso4.jpg'),
(17, 'chivas12.jpg', 'chivas12.jpg'),
(18, 'cons3.jpg', 'cons3.jpg'),
(19, 'cocaGM.jpg', 'cocaGM.jpg'),
(20, 'topsoda.jpg', 'topsoda.jpg'),
(21, 'perrier.jpg', 'perrier.jpg'),
(22, 'cocaGM.jpg', 'cocaGM.jpg'),
(23, 'cocaGM.jpg', 'cocaGM.jpg'),
(24, 'redbull.jpg', 'redbull.jpg'),
(25, 'maltaguiness.jpg', 'maltaguiness.jpg'),
(26, 'smirnoff.jpg', 'smirnoff.jpg'),
(27, '33export.jpg', '33export.jpg'),
(28, 'beaufort.jpg', 'beaufort.jpg'),
(29, 'castel.jpg', 'castel.jpg'),
(30, 'heineken.jpg', 'heineken.jpg'),
(31, 'guiness.jpg', 'guiness.jpg'),
(32, 'topsoda.jpg', 'topsoda.jpg'),
(33, 'sauvignon.jpg', 'sauvignon.jpg'),
(34, 'cavior.jpg', 'cavior.jpg'),
(35, 'jpchenet.jpg', 'jpchenet.jpg'),
(36, 'cotedeprovence.jpg', 'cotedeprovence.jpg'),
(37, 'taitinger.jpg', 'taitinger.jpg'),
(38, 'taitinger.jpg', 'taitinger.jpg'),
(39, 'moet.jpg', 'moet.jpg'),
(40, 'moet.jpg', 'moet.jpg'),
(41, 'veuvecliquot.jpg', 'veuvecliquot.jpg'),
(42, 'supermont.jpg', 'supermont.jpg'),
(43, 'topsoda.jpg', 'topsoda.jpg'),
(45, 'armagnac.jpg', 'armagnac.jpg'),
(46, 'grandmarnier.jpg', 'grandmarnier.jpg'),
(47, 'conso1.jpg', 'conso1.jpg'),
(48, 'remymartin.jpg', 'remymartin.jpg'),
(49, 'conso6.jpg', 'conso6.jpg'),
(50, 'vodkaabsolut.jpg', 'vodkaabsolut.jpg'),
(51, 'vodkaabsolut.jpg', 'vodkaabsolut.jpg'),
(52, 'cons3.jpg', 'cons3.jpg'),
(53, 'absolut.jpg', 'absolut.jpg'),
(54, 'absolut.jpg', 'absolut.jpg'),
(55, 'consobalantine.jpg', 'consobalantine.jpg'),
(56, 'ciroc.jpg', 'ciroc.jpg'),
(57, 'bacardi.jpg', 'bacardi.jpg'),
(58, 'bacardi.jpg', 'bacardi.jpg'),
(59, 'conso4.jpg', 'conso4.jpg'),
(60, 'havana3years.jpg', 'havana3years.jpg'),
(61, 'havana3years.jpg', 'havana3years.jpg'),
(62, 'conso7.jpg', 'conso7.jpg'),
(63, 'havana3years.jpg', 'havana3years.jpg'),
(64, 'conso4.jpg', 'conso4.jpg'),
(65, 'ballantinesbrasil.jpg', 'ballantinesbrasil.jpg'),
(66, 'ballantinesbrasil.jpg', 'ballantinesbrasil.jpg'),
(67, 'conso1.jpg', 'conso1.jpg'),
(68, 'ballantine.jpg', 'ballantine.jpg'),
(69, 'ballantine.jpg', 'ballantine.jpg'),
(70, 'conso1.jpg', 'conso1.jpg'),
(71, 'chivas18.jpg', 'chivas18.jpg'),
(72, 'consobalantine.jpg', 'consobalantine.jpg'),
(73, 'chivas18.jpg', 'chivas18.jpg'),
(74, 'glenfiddich.jpg', 'glenfiddich.jpg'),
(75, 'glenfiddich.jpg', 'glenfiddich.jpg'),
(76, 'conso1.jpg', 'conso1.jpg'),
(77, 'jackdaniels.jpg', 'jackdaniels.jpg'),
(78, 'jackdaniels.jpg', 'jackdaniels.jpg'),
(79, 'conso7.jpg', 'conso7.jpg'),
(80, 'j&b.jpg', 'j&b.jpg'),
(81, 'j&b.jpg', 'j&b.jpg'),
(82, 'conso6.jpg', 'conso6.jpg'),
(83, 'jackdanielshoney.jpg', 'jackdanielshoney.jpg'),
(84, 'jackdanielshoney.jpg', 'jackdanielshoney.jpg'),
(85, 'cons3.jpg', 'cons3.jpg'),
(86, 'platinium.jpg', 'platinium.jpg'),
(87, 'bluelabel.jpg', 'bluelabel.jpg'),
(88, 'bluecuracao.jpg', 'bluecuracao.jpg'),
(89, 'get21.jpg', 'get21.jpg'),
(90, 'get31.jpg', 'get31.jpg'),
(91, 'mariebrizard.jpg', 'mariebrizard.jpg'),
(92, 'pastis51.jpg', 'pastis51.jpg'),
(93, 'ricard.jpg', 'ricard.jpg'),
(94, 'gingordon.jpg', 'gingordon.jpg'),
(95, 'conso1.jpg', 'conso1.jpg'),
(96, 'blacklabel.jpg', 'blacklabel.jpg'),
(97, 'blacklabel.jpg', 'blacklabel.jpg'),
(98, 'conso4.jpg', 'conso4.jpg'),
(99, 'blacklabel.jpg', 'blacklabel.jpg'),
(100, 'blacklabel.jpg', 'blacklabel.jpg'),
(101, 'conso7.jpg', 'conso7.jpg'),
(102, 'blacklabel.jpg', 'blacklabel.jpg'),
(103, 'conso4.jpg', 'conso4.jpg'),
(104, 'goldreserve.jpg', 'goldreserve.jpg'),
(105, 'conso7.jpg', 'conso7.jpg'),
(106, 'gingordon.jpg', 'gingordon.jpg'),
(107, 'conso7.jpg', 'conso7.jpg'),
(108, 'martiniblanc.jpg', 'martiniblanc.jpg'),
(109, 'martiniblanc.jpg', 'martiniblanc.jpg'),
(110, 'cons3.jpg', 'cons3.jpg'),
(111, 'martinidry.jpg', 'martinidry.jpg'),
(112, 'martinidry.jpg', 'martinidry.jpg'),
(113, 'conso6.jpg', 'conso6.jpg'),
(114, 'martinirose.jpg', 'martinirose.jpg'),
(115, 'martinirose.jpg', 'martinirose.jpg'),
(116, 'conso1.jpg', 'conso1.jpg'),
(117, 'martinirouge.jpg', 'martinirouge.jpg'),
(118, 'martinirouge.jpg', 'martinirouge.jpg'),
(119, 'conso4.jpg', 'conso4.jpg'),
(120, 'baileys.jpg', 'baileys.jpg'),
(121, 'baileys.jpg', 'baileys.jpg'),
(122, 'conso1.jpg', 'conso1.jpg'),
(123, 'malibu.jpg', 'malibu.jpg'),
(124, 'conso6.jpg', 'conso6.jpg'),
(125, 'tequillanlanc.jpg', 'tequillanlanc.jpg'),
(126, 'conso6.jpg', 'conso6.jpg'),
(127, 'campari.jpg', 'campari.jpg'),
(128, 'cons3.jpg', 'cons3.jpg'),
(129, 'xxxx.jpg', 'xxxx.jpg'),
(130, 'tanqueray.jpg', 'tanqueray.jpg'),
(131, 'cons3.jpg', 'cons3.jpg'),
(132, 'portoblanc.jpg', 'portoblanc.jpg'),
(133, 'portorouge.jpg', 'portorouge.jpg'),
(134, 'cocktail1.jpg', 'cocktail1.jpg'),
(135, 'cocktail3.jpg', 'cocktail3.jpg'),
(136, 'cocktail4.jpg', 'cocktail4.jpg'),
(137, 'coktail2.jpg', 'coktail2.jpg'),
(138, 'cocktail1.jpg', 'cocktail1.jpg'),
(139, 'cocktail3.jpg', 'cocktail3.jpg'),
(140, 'cocktail4.jpg', 'cocktail4.jpg'),
(141, 'coktail2.jpg', 'coktail2.jpg'),
(142, 'cocktail1.jpg', 'cocktail1.jpg'),
(143, 'cocktail1.jpg', 'cocktail1.jpg'),
(144, 'cocktail4.jpg', 'cocktail4.jpg'),
(145, 'coktail2.jpg', 'coktail2.jpg'),
(146, 'cocktail1.jpg', 'cocktail1.jpg'),
(147, 'cocktail3.jpg', 'cocktail3.jpg'),
(148, 'cocktail4.jpg', 'cocktail4.jpg'),
(149, 'cocktail1.jpg', 'cocktail1.jpg'),
(150, 'mojito.jpg', 'mojito.jpg'),
(151, 'cocktail4.jpg', 'cocktail4.jpg'),
(152, 'cocktail1.jpg', 'cocktail1.jpg'),
(153, 'cocktail3.jpg', 'cocktail3.jpg'),
(154, 'cocktail4.jpg', 'cocktail4.jpg'),
(155, 'coktail2.jpg', 'coktail2.jpg'),
(156, 'BROCHETTE.jpg', 'BROCHETTE.jpg'),
(157, 'plantain.jpg', 'plantain.jpg'),
(158, 'pommes.jpg', 'pommes.jpg'),
(159, 'demipoulet.jpg', 'demipoulet.jpg'),
(160, 'demipoulet.jpg', 'demipoulet.jpg'),
(161, 'entierpoulet.jpg', 'entierpoulet.jpg'),
(162, 'demipoulet.jpg', 'demipoulet.jpg'),
(163, 'demipoulet.jpg', 'demipoulet.jpg'),
(164, 'entierpoulet.jpg', 'entierpoulet.jpg'),
(165, 'chicha4.jpg', 'chicha4.jpg'),
(166, 'chicha3.jpg', 'chicha3.jpg'),
(167, 'chicha2.jpg', 'chicha2.jpg'),
(168, 'chicha1.jpg', 'chicha1.jpg'),
(169, 'chicha.jpg', 'chicha.jpg'),
(170, 'the.jpg', 'the.jpg'),
(171, 'supermont.jpg', 'supermont.jpg'),
(172, 'menthe.jpg', 'menthe.jpg');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7887B74FF971F91F` (`employes_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `commandeprod`
--
ALTER TABLE `commandeprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT pour la table `thumbnail`
--
ALTER TABLE `thumbnail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;
--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
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
-- Contraintes pour la table `stockoperation`
--
ALTER TABLE `stockoperation`
  ADD CONSTRAINT `FK_7887B74FF971F91F` FOREIGN KEY (`employes_id`) REFERENCES `employes` (`id`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA385405FD2` FOREIGN KEY (`tables_id`) REFERENCES `tables` (`id`),
  ADD CONSTRAINT `FK_97A0ADA3F971F91F` FOREIGN KEY (`employes_id`) REFERENCES `employes` (`id`);
