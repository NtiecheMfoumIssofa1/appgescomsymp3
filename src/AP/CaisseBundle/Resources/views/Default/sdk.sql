-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Sam 03 Juin 2017 à 13:18
-- Version du serveur :  5.6.35
-- Version de PHP :  7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `SDK`
--

-- --------------------------------------------------------

--
-- Structure de la table `category_details`
--

CREATE TABLE `category_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `category_description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `category_details`
--

INSERT INTO `category_details` (`id`, `category_name`, `category_description`) VALUES
(1, 'Bièrres', ''),
(2, 'Jus', ''),
(3, 'Whisky', ''),
(4, 'Champagnes', ''),
(5, 'Rhum', ''),
(6, 'Vodka', ''),
(7, 'Eau', ''),
(8, 'Source du Pays', '');

-- --------------------------------------------------------

--
-- Structure de la table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_address` varchar(500) NOT NULL,
  `customer_contact1` varchar(100) NOT NULL,
  `customer_contact2` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customer_details`
--

INSERT INTO `customer_details` (`id`, `customer_name`, `customer_address`, `customer_contact1`, `customer_contact2`, `created_at`) VALUES
(1, 'Djeuga BW', 'Djeuga palace', '', '', '2017-04-29 12:03:11'),
(2, 'Bastos BW', 'Bastos', '', '', '2017-04-29 12:03:29');

-- --------------------------------------------------------

--
-- Structure de la table `stock_avail`
--

CREATE TABLE `stock_avail` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stock_details`
--

CREATE TABLE `stock_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` varchar(120) NOT NULL,
  `stock_name` varchar(120) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `supplier_id` varchar(250) NOT NULL,
  `company_price` int(7) NOT NULL,
  `selling_price` int(7) NOT NULL,
  `category` varchar(120) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_details`
--

INSERT INTO `stock_details` (`id`, `stock_id`, `stock_name`, `stock_quantity`, `supplier_id`, `company_price`, `selling_price`, `category`, `date`, `expire_date`) VALUES
(1, 'BFL', 'Casier Beaufort Light', 0, 'Mr Job', 5196, 24000, 'Bières', '2017-05-02 12:05:52', '0000-00-00 00:00:00'),
(2, 'CTL', 'Casier Castel', 0, 'Mr Job', 3072, 2400, 'Bières', '2017-05-02 12:06:00', '0000-00-00 00:00:00'),
(3, '33EX', 'Cassier 33 export', 0, 'Mr Job', 3624, 24000, 'Bières', '2017-05-02 12:06:09', '0000-00-00 00:00:00'),
(4, 'GNSS', 'Casier Guinsess', 0, 'Mr Nasser', 1, 1, 'Bières', '2017-05-02 12:06:49', '0000-00-00 00:00:00'),
(5, 'MHO', 'Pack Mahou', 0, 'Mr Job', 1, 1, 'Bières', '2017-05-02 12:06:58', '0000-00-00 00:00:00'),
(6, 'HNK', 'Pack Heineken', 2, 'Mr Job', 1, 1, 'Bières', '2017-05-02 13:06:21', '0000-00-00 00:00:00'),
(7, 'BDR', 'Pack Budweiser', 4, 'Mr Job', 1, 1, 'Bières', '2017-05-03 01:59:36', '0000-00-00 00:00:00'),
(8, 'SmIB', 'Casier Smirnoff Ice Black', 0, 'Mr Job', 1, 1, 'Bières', '2017-05-02 12:07:44', '0000-00-00 00:00:00'),
(9, 'TSPPM', 'Palette Supermont PM', 0, 'Source du Pays', 1, 1, 'Eau', '2017-05-02 12:09:09', '0000-00-00 00:00:00'),
(10, 'ORG', 'Pack Orangina', 15, 'Brasseries', 1, 1, 'Jus', '2017-05-07 08:11:10', '0000-00-00 00:00:00'),
(11, 'CHPG', 'Champony Gold', 13, 'Mr Job', 1, 1, 'Champagnes', '2017-05-03 04:16:42', '0000-00-00 00:00:00'),
(12, 'CCA', 'Casier Coca Cola', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:18:32', '0000-00-00 00:00:00'),
(13, 'CCAL', 'Casier Coca Cola Light', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:19:00', '0000-00-00 00:00:00'),
(14, 'CCAZ', 'Casier de Coca Cola Light', 0, 'Mr Job', 1, 1, 'Bières', '2017-05-02 12:07:50', '0000-00-00 00:00:00'),
(15, 'PRPM', 'Palette Perrier PM', 10, 'Brasseries', 1, 1, 'Eau', '2017-04-29 09:19:52', '0000-00-00 00:00:00'),
(16, 'FTA', 'Casier  Fanta', 10, 'Brasseries', 1, 1, 'Jus', '2017-05-03 03:30:47', '0000-00-00 00:00:00'),
(17, 'SPT', 'Casier Sprite', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:20:45', '0000-00-00 00:00:00'),
(18, 'SwD', 'Cassier Schweppes Soda', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:22:17', '0000-00-00 00:00:00'),
(19, 'SWT', 'Cassier Schweppes Tonic', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:22:43', '0000-00-00 00:00:00'),
(20, 'GNSM', 'Cassier Guinness Malta', 10, 'Brasseries', 1, 1, 'Jus', '2017-04-29 09:23:29', '0000-00-00 00:00:00'),
(21, 'RBL', 'Pack Red Bull', 0, 'Mr Job', 1, 1, 'Bières', '2017-05-02 12:07:56', '0000-00-00 00:00:00'),
(22, 'BLT', 'Balantine', 5, 'Brasseries', 25000, 7200, 'Whisky', '2017-05-03 08:17:08', '0000-00-00 00:00:00'),
(23, 'BLTB', 'Balantine Brasil', 10, 'Brasseries', 7200, 25000, 'Whisky', '2017-04-29 09:26:25', '0000-00-00 00:00:00'),
(24, 'BLT12', 'Balantine 12 years', 10, 'Brasseries', 14600, 35000, 'Whisky', '2017-04-29 09:27:43', '0000-00-00 00:00:00'),
(25, 'JD', 'Jack Daniel', 9, 'GlobalWine', 10333, 35000, 'Whisky', '2017-04-29 13:27:00', '0000-00-00 00:00:00'),
(26, 'JDH', 'Jack Daniel Honey', 28, 'GlobalWine', 13333, 35000, 'Whisky', '2017-05-02 13:01:10', '0000-00-00 00:00:00'),
(27, 'J&B', 'J&B', 20, 'Mr Bello', 7336, 25000, 'Whisky', '2017-05-02 12:43:06', '0000-00-00 00:00:00'),
(28, 'JWRL', 'JW Red Label', 7, 'Mr Bello', 7336, 25000, 'Whisky', '2017-05-02 12:22:14', '0000-00-00 00:00:00'),
(29, 'JWBL', 'JW Black Label', 10, 'Mr Bello', 14510, 35000, 'Whisky', '2017-04-29 13:28:05', '0000-00-00 00:00:00'),
(30, 'JWDBL', 'JW Double Black Label', 10, 'Mr Job', 21800, 50000, 'Whisky', '2017-04-29 13:28:08', '0000-00-00 00:00:00'),
(31, 'JWGRL', 'JW Gold Reserve Label', 10, 'Mr Bello', 34800, 70000, 'Bières', '2017-04-29 13:20:18', '0000-00-00 00:00:00'),
(32, 'JWP', 'JW Platinium', 10, 'Mr Bello', 3321, 80000, 'Whisky', '2017-04-29 13:28:13', '0000-00-00 00:00:00'),
(33, 'JWBuL', 'JW Blue Label', 10, 'Mr Bello', 113500, 200000, 'Whisky', '2017-04-29 13:28:17', '0000-00-00 00:00:00'),
(34, 'CH18', 'Chivas 18 Years', 2, 'Brasseries', 15300, 35000, 'Whisky', '2017-05-06 06:48:17', '0000-00-00 00:00:00'),
(35, 'CH21', 'Chivas 21 years', 10, 'Brasseries', 94667, 140000, 'Whisky', '2017-04-29 09:40:45', '0000-00-00 00:00:00'),
(36, 'GLFD', 'Glenfiddich 12 years', 7, 'Brasseries', 19500, 40000, 'Whisky', '2017-05-03 04:10:35', '0000-00-00 00:00:00'),
(37, 'GLFD18', 'Glenfiddich 18 years', 10, 'Brasseries', 33000, 70000, 'Whisky', '2017-04-29 09:46:51', '0000-00-00 00:00:00'),
(38, 'TAG', 'Tequila Agavita', 7, 'Brasseries', 5500, 25000, 'Vodka', '2017-05-03 08:15:44', '0000-00-00 00:00:00'),
(39, 'GGD', 'Gin Gordon', 5, 'Brasseries', 6046, 20000, 'Whisky', '2017-05-03 08:15:19', '0000-00-00 00:00:00'),
(40, 'MTNB', 'Martini Blanc', 10, 'Brasseries', 6100, 22500, 'Whisky', '2017-04-29 09:53:26', '0000-00-00 00:00:00'),
(41, 'MTNR', 'Martini Rouge', 10, 'Brasseries', 6100, 22500, 'Whisky', '2017-04-29 09:53:57', '0000-00-00 00:00:00'),
(42, 'MTNRS', 'Martini Rose', 10, 'Mr Job', 7000, 22500, 'Bières', '2017-04-29 13:20:30', '0000-00-00 00:00:00'),
(43, 'MTND', 'Martini Dry', 10, 'Brasseries', 6000, 22500, 'Whisky', '2017-04-29 09:55:13', '0000-00-00 00:00:00'),
(44, 'BLS', 'Baileys', 5, 'Brasseries', 7658, 25000, 'Whisky', '2017-05-03 08:16:10', '0000-00-00 00:00:00'),
(45, 'CMP', 'Campari', 10, 'Brasseries', 8000, 25000, 'Vodka', '2017-04-29 09:56:55', '0000-00-00 00:00:00'),
(46, 'BLC', 'Blue Curacao', 10, 'Brasseries', 654, 2500, 'Whisky', '2017-04-29 09:57:42', '0000-00-00 00:00:00'),
(47, 'MLB', 'Malibu', 10, 'Brasseries', 10000, 25000, 'Whisky', '2017-04-29 09:58:17', '0000-00-00 00:00:00'),
(48, 'PRTB', 'Porto Blanc', 10, 'Mr Job', 714, 2500, 'Bières', '2017-04-29 13:20:38', '0000-00-00 00:00:00'),
(49, 'PRTR', 'Porto Rouge', 10, 'Brasseries', 786, 2500, 'Whisky', '2017-04-29 10:00:50', '0000-00-00 00:00:00'),
(50, 'TQR', 'Tanquery', 10, 'Mr Bello', 11700, 35000, 'Whisky', '2017-04-29 13:29:27', '0000-00-00 00:00:00'),
(51, 'CTR', 'Cointreau', 10, 'Brasseries', 1269, 3000, 'Rhum', '2017-04-29 10:06:10', '0000-00-00 00:00:00'),
(52, 'GT27', 'Get 27', 10, 'Brasseries', 833, 2500, 'Vodka', '2017-04-29 10:06:50', '0000-00-00 00:00:00'),
(53, 'GT31', 'Get 31', 10, 'Brasseries', 556, 2500, 'Whisky', '2017-04-29 10:07:55', '0000-00-00 00:00:00'),
(54, 'MBZ', 'Marie Brizzard', 13, 'Brasseries', 679, 2500, 'Vodka', '2017-04-29 11:59:16', '0000-00-00 00:00:00'),
(55, 'PTS51', 'Pastis 51', 10, 'Brasseries', 492, 2500, 'Vodka', '2017-04-29 10:09:10', '0000-00-00 00:00:00'),
(56, 'RCD', 'Ricard', 10, 'Mr Job', 506, 2500, 'Bièrres', '2017-04-29 13:20:59', '0000-00-00 00:00:00'),
(57, 'ARGC', 'Armagnac', 10, 'Mr Job', 1154, 4000, 'Bièrres', '2017-04-29 13:21:06', '0000-00-00 00:00:00'),
(58, 'GRDM', 'Grand Marnier', 10, 'Brasseries', 25000, 40000, 'Whisky', '2017-04-29 10:17:57', '0000-00-00 00:00:00'),
(59, 'RMM', 'Remy Martin', 10, 'Brasseries', 27500, 40000, 'Whisky', '2017-04-29 10:18:44', '0000-00-00 00:00:00'),
(60, 'RHH3', 'Rhum Havana 3 years', 10, 'Brasseries', 8250, 25000, 'Rhum', '2017-04-29 10:19:26', '0000-00-00 00:00:00'),
(61, 'RHBC', 'Rhum Bacardi', 10, 'Brasseries', 10000, 25000, 'Rhum', '2017-04-29 10:20:03', '0000-00-00 00:00:00'),
(62, 'RHH7', 'Rhum Havana 7 years', 10, 'Brasseries', 16200, 35000, 'Rhum', '2017-04-29 10:22:05', '0000-00-00 00:00:00'),
(63, 'ABS', 'Absolut', 10, 'Brasseries', 8700, 25000, 'Whisky', '2017-04-29 10:22:50', '0000-00-00 00:00:00'),
(64, 'ABSA', 'Absolut Aromatisée', 10, 'Brasseries', 8700, 25000, 'Vodka', '2017-04-29 10:23:47', '0000-00-00 00:00:00'),
(65, 'SMFR', 'Smirnoff Red', 10, 'Brasseries', 5250, 25000, 'Vodka', '2017-04-29 10:24:38', '0000-00-00 00:00:00'),
(66, 'CRC', 'CIROC', 10, 'Brasseries', 17900, 35000, 'Vodka', '2017-04-29 10:25:21', '0000-00-00 00:00:00'),
(67, 'TTG37', 'Taittinger 37,5cl', 10, 'GlobalWine', 12500, 22500, 'Rhum', '2017-04-29 13:25:28', '0000-00-00 00:00:00'),
(68, 'TTG', 'Taittinger', 10, 'GlobalWine', 21667, 45000, 'Bièrres', '2017-04-29 13:21:16', '0000-00-00 00:00:00'),
(69, 'MOB', 'Moet Brut', 10, 'Brasseries', 23333, 45000, 'Whisky', '2017-04-29 10:36:04', '0000-00-00 00:00:00'),
(70, 'MON', 'Moet Nectar', 10, 'Brasseries', 35000, 60000, 'Whisky', '2017-04-29 10:36:40', '0000-00-00 00:00:00'),
(71, 'VVC', 'Veuve Clicquot', 10, 'Brasseries', 35000, 60000, 'Whisky', '2017-04-29 10:37:59', '0000-00-00 00:00:00'),
(72, 'RNB', 'Ruinaert Blanc', 12, 'Mr Job', 45000, 70000, 'Rhum', '2017-05-02 12:25:19', '0000-00-00 00:00:00'),
(73, 'DPG', 'Dom Perignon', 10, 'Brasseries', 86667, 150000, 'Whisky', '2017-04-29 10:44:59', '0000-00-00 00:00:00'),
(74, 'CTL', 'Cristal', 10, 'Mr Job', 150000, 225000, 'Champagnes', '2017-04-29 13:21:55', '0000-00-00 00:00:00'),
(75, 'MLT', 'Merlot', 10, 'Mr Job', 3700, 15000, 'Bièrres', '2017-04-29 13:21:22', '0000-00-00 00:00:00'),
(76, 'MDC', 'Medoc', 10, 'Brasseries', 7600, 20000, 'Rhum', '2017-04-29 10:48:26', '0000-00-00 00:00:00'),
(77, 'CBSGN', 'Cabernet Sauvignon', 10, 'Brasseries', 8500, 20000, 'Vodka', '2017-04-29 10:49:47', '0000-00-00 00:00:00'),
(78, 'HMDC', 'Haut-Medoc', 10, 'Brasseries', 11500, 25000, 'Vodka', '2017-04-29 10:50:31', '0000-00-00 00:00:00'),
(79, 'CHDY', 'Chardonay', 10, 'Mr Messengue', 4500, 15000, 'Vodka', '2017-04-29 13:26:40', '0000-00-00 00:00:00'),
(80, 'SGN', 'Sauvignon', 10, 'Brasseries', 4500, 17500, 'Whisky', '2017-04-29 10:53:10', '0000-00-00 00:00:00'),
(81, 'CHDYS', 'Chardonay Sweet', 10, 'Mr Messengue', 8500, 20000, 'Whisky', '2017-04-29 13:30:13', '0000-00-00 00:00:00'),
(82, 'CTPR', 'Côte de Provence', 10, 'Brasseries', 6600, 17500, 'Rhum', '2017-04-29 10:57:04', '0000-00-00 00:00:00'),
(83, 'JPC', 'JP Chenet', 10, 'Brasseries', 5500, 15000, 'Vodka', '2017-04-29 10:57:51', '0000-00-00 00:00:00'),
(84, 'TGO', 'Tango', 10, 'Brasseries', 1, 500, 'Vodka', '2017-04-29 10:59:04', '0000-00-00 00:00:00'),
(85, 'CCAGM', 'Coca Cola GM', 10, 'Brasseries', 304, 1500, 'Jus', '2017-04-29 11:00:56', '0000-00-00 00:00:00'),
(86, 'TSGM', 'Top Soda GM', 10, 'Brasseries', 192, 1500, 'Jus', '2017-04-29 11:03:13', '0000-00-00 00:00:00'),
(87, 'TTPM', 'Top tonic PM', 10, 'Brasseries', 202, 1500, 'Jus', '2017-04-29 11:04:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `stock_entries`
--

CREATE TABLE `stock_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `transactionid` varchar(100) NOT NULL,
  `stock_id` varchar(120) DEFAULT NULL,
  `stock_name` varchar(260) NOT NULL,
  `stock_supplier_name` varchar(200) NOT NULL,
  `category` varchar(120) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `company_price` decimal(10,0) DEFAULT NULL,
  `selling_price` decimal(10,0) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `closing_stock` int(11) DEFAULT NULL,
  `date` varchar(100) NOT NULL,
  `username` varchar(120) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `salesid` varchar(120) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment` decimal(10,0) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `mode` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `count1` int(11) DEFAULT NULL,
  `billnumber` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_entries`
--

INSERT INTO `stock_entries` (`id`, `transactionid`, `stock_id`, `stock_name`, `stock_supplier_name`, `category`, `quantity`, `company_price`, `selling_price`, `opening_stock`, `closing_stock`, `date`, `username`, `type`, `salesid`, `total`, `payment`, `balance`, `mode`, `description`, `due`, `subtotal`, `count1`, `billnumber`) VALUES
(1, 'EN-8747', NULL, 'Champony Gold', 'Mr Dalence', NULL, 2, NULL, NULL, NULL, NULL, '05/02/2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(2, 'EN-4193', NULL, 'Jack Daniel Honey', 'Mr Dalence', NULL, 12, NULL, NULL, NULL, NULL, '05/02/2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(3, 'EN-9132', NULL, 'Pack Heineken', 'Mr Job', NULL, 72, NULL, NULL, NULL, NULL, '05/02/2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(4, 'EN-8160', NULL, 'Pack Orangina', 'Mr Bello', NULL, 20, NULL, NULL, NULL, NULL, '05/03/2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL),
(5, 'EN-1184', NULL, 'Pack Budweiser', 'Mr Dalence', NULL, 4, NULL, NULL, NULL, NULL, '3 Mai 2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dd', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stock_sales`
--

CREATE TABLE `stock_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `transactionid` varchar(250) NOT NULL,
  `sales_date` varchar(100) NOT NULL,
  `selling_price` varchar(200) DEFAULT NULL,
  `product` varchar(300) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `customer` varchar(120) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact` varchar(150) DEFAULT NULL,
  `payment` decimal(10,0) DEFAULT NULL,
  `dis_amount` decimal(10,0) DEFAULT NULL,
  `grand_total` decimal(10,0) DEFAULT NULL,
  `due_amount` varchar(200) DEFAULT NULL,
  `due` varchar(100) DEFAULT NULL,
  `payment_method` varchar(250) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `billnumber` varchar(120) DEFAULT NULL,
  `l_p` decimal(10,0) DEFAULT NULL,
  `idproducts` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_sales`
--

INSERT INTO `stock_sales` (`id`, `transactionid`, `sales_date`, `selling_price`, `product`, `quantity`, `amount`, `customer`, `address`, `contact`, `payment`, `dis_amount`, `grand_total`, `due_amount`, `due`, `payment_method`, `description`, `billnumber`, `l_p`, `idproducts`) VALUES
(1, 'ST-9801', '05/02/2017', NULL, 'Ruinaert Blanc', '3', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL, NULL, 'Rui59087ab04694b-'),
(2, 'ST-5958', '05/02/2017', NULL, 'Jack Daniel Honey', '6', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Jac5908831738218-'),
(3, 'ST-1807', '2 Mai 2017', NULL, 'Pack Heineken', '1', '', 'Bastos BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Pac5908844dbd746-'),
(5, 'ST-4985', '3 Mai 2017', NULL, 'Glenfiddich 12 years', '3', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:3:{i:0;s:16:\"Gle5909583c2558c\";i:1;s:16:\"Gle5909583c255c0\";i:2;s:16:\"Gle5909583c255d1\";}'),
(6, 'ST-6414', '3 Mai 2017', NULL, 'Champony Gold', '4', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:4:{i:0;s:16:\"Cha590959ab03610\";i:1;s:16:\"Cha590959ab0362f\";i:2;s:16:\"Cha590959ab0363b\";i:3;s:16:\"Cha590959ab03645\";}'),
(7, 'ST-6356', '3 Mai 2017', NULL, 'Gin Gordon', '5', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:5:{i:0;s:16:\"Gin59099197efc2c\";i:1;s:16:\"Gin59099197efc4c\";i:2;s:16:\"Gin59099197efc5e\";i:3;s:16:\"Gin59099197efc6e\";i:4;s:16:\"Gin59099197efc7d\";}'),
(8, 'ST-5080', '3 Mai 2017', NULL, 'Tequila Agavita', '3', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:3:{i:0;s:16:\"Teq590991b0bf728\";i:1;s:16:\"Teq590991b0bf750\";i:2;s:16:\"Teq590991b0bf77c\";}'),
(9, 'ST-1422', '3 Mai 2017', NULL, 'Baileys', '5', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:5:{i:0;s:16:\"Bai590991ca40d43\";i:1;s:16:\"Bai590991ca40d5c\";i:2;s:16:\"Bai590991ca40d68\";i:3;s:16:\"Bai590991ca40d72\";i:4;s:16:\"Bai590991ca40d7c\";}'),
(10, 'ST-8073', '3 Mai 2017', NULL, 'Balantine', '5', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:5:{i:0;s:16:\"Bal590992046113a\";i:1;s:16:\"Bal590992046114e\";i:2;s:16:\"Bal5909920461159\";i:3;s:16:\"Bal5909920461163\";i:4;s:16:\"Bal590992046116e\";}'),
(11, 'ST-6176', '6 Mai 2017', NULL, 'Chivas 18 Years', '8', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:8:{i:0;s:16:\"Chi590d71b1efcfa\";i:1;s:16:\"Chi590d71b1efd13\";i:2;s:16:\"Chi590d71b1efd1f\";i:3;s:16:\"Chi590d71b1efd29\";i:4;s:16:\"Chi590d71b1efd33\";i:5;s:16:\"Chi590d71b1efd3d\";i:6;s:16:\"Chi590d71b1efd48\";i:7;s:16:\"Chi590d71b1efd52\";}'),
(12, 'ST-8931', '7 Mai 2017', NULL, 'Pack Orangina', '20', '', 'Djeuga BW', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'a:9:{i:0;s:16:\"Pac590ed6b939c94\";i:1;s:16:\"Pac590ed6b939cf4\";i:2;s:16:\"Pac590ed6b939d17\";i:3;s:16:\"Pac590ed6b939d52\";i:4;s:16:\"Pac590ed6b939d6b\";i:5;s:16:\"Pac590ed6b939d80\";i:6;s:16:\"Pac590ed6b939d94\";i:7;s:16:\"Pac590ed6b939da9\";i:8;s:16:\"Pac590ed6b939dbe\";}');

-- --------------------------------------------------------

--
-- Structure de la table `stock_user`
--

CREATE TABLE `stock_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_user`
--

INSERT INTO `stock_user` (`id`, `username`, `password`, `user_type`, `answer`) VALUES
(1, 'affides', 'affides123', 'admin', ''),
(2, 'Tchecketame', 'phaso', 'admin', '');

-- --------------------------------------------------------

--
-- Structure de la table `store_details`
--

CREATE TABLE `store_details` (
  `name` varchar(100) NOT NULL,
  `log` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `supplier_details`
--

CREATE TABLE `supplier_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `supplier_address` varchar(500) NOT NULL,
  `supplier_contact1` varchar(100) NOT NULL,
  `supplier_contact2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `supplier_details`
--

INSERT INTO `supplier_details` (`id`, `supplier_name`, `supplier_address`, `supplier_contact1`, `supplier_contact2`) VALUES
(2, 'Mr Job', '', '', ''),
(3, 'Mr Bello', '', '', ''),
(4, 'Mr Nasser', '', '', ''),
(5, 'GlobalWine', '', '', ''),
(6, 'Mr Dalence', '', '', ''),
(7, 'Mr Messengue', '', '', ''),
(8, 'Autres', '', '', ''),
(9, 'Source du Pays', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `customer` varchar(250) NOT NULL,
  `supplier` varchar(250) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `due` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rid` varchar(120) NOT NULL,
  `receiptid` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `uom_details`
--

CREATE TABLE `uom_details` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(120) NOT NULL,
  `spec` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category_details`
--
ALTER TABLE `category_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_avail`
--
ALTER TABLE `stock_avail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_entries`
--
ALTER TABLE `stock_entries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_sales`
--
ALTER TABLE `stock_sales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_user`
--
ALTER TABLE `stock_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `uom_details`
--
ALTER TABLE `uom_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category_details`
--
ALTER TABLE `category_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `stock_avail`
--
ALTER TABLE `stock_avail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT pour la table `stock_entries`
--
ALTER TABLE `stock_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `stock_sales`
--
ALTER TABLE `stock_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `stock_user`
--
ALTER TABLE `stock_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `supplier_details`
--
ALTER TABLE `supplier_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `uom_details`
--
ALTER TABLE `uom_details`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;