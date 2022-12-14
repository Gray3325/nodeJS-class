-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-01-07 10:16:40
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `stock_mfee31`
--

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(97) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `stocks`
--

CREATE TABLE `stocks` (
  `id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `stocks`
--

INSERT INTO `stocks` (`id`, `name`) VALUES
('2330', '台積電'),
('2412', '中華電'),
('2618', '長榮航');

-- --------------------------------------------------------

--
-- 資料表結構 `stock_prices`
--

CREATE TABLE `stock_prices` (
  `stock_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `open_price` decimal(10,2) UNSIGNED NOT NULL,
  `high_price` decimal(10,2) UNSIGNED NOT NULL,
  `low_price` decimal(10,2) UNSIGNED NOT NULL,
  `close_price` decimal(10,2) UNSIGNED NOT NULL,
  `delta_price` decimal(10,2) NOT NULL,
  `transactions` int(10) UNSIGNED NOT NULL,
  `volume` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(14,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `stock_prices`
--

INSERT INTO `stock_prices` (`stock_id`, `date`, `open_price`, `high_price`, `low_price`, `close_price`, `delta_price`, `transactions`, `volume`, `amount`) VALUES
('2330', '2022-11-01', '388.50', '393.00', '386.00', '391.50', '1.50', 29780, 42123141, '16428079355.00'),
('2330', '2022-11-02', '391.00', '395.00', '388.50', '395.00', '3.50', 22285, 23169428, '9091891929.00'),
('2330', '2022-11-03', '385.00', '387.00', '383.50', '384.00', '-11.00', 52660, 42092776, '16201844314.00'),
('2330', '2022-11-04', '381.00', '384.50', '378.50', '382.00', '-2.00', 26895, 30839846, '11762941797.00'),
('2330', '2022-11-07', '390.00', '393.00', '387.00', '390.00', '8.00', 30880, 37704746, '14710405524.00'),
('2330', '2022-11-08', '395.00', '399.50', '394.00', '399.00', '9.00', 35956, 32576136, '12954941396.00'),
('2330', '2022-11-09', '403.50', '417.00', '403.50', '417.00', '18.00', 67569, 56357663, '23188739823.00'),
('2330', '2022-11-10', '409.00', '411.50', '406.00', '407.50', '-9.50', 36471, 33671621, '13757669359.00'),
('2330', '2022-11-11', '441.50', '442.00', '435.00', '441.50', '34.00', 100349, 83770040, '36838808146.00'),
('2330', '2022-11-14', '450.00', '450.00', '441.50', '445.00', '3.50', 48957, 63282094, '28257175788.00'),
('2330', '2022-11-15', '465.00', '487.00', '462.00', '480.00', '35.00', 139136, 118536865, '56191637241.00'),
('2330', '2022-11-16', '491.50', '494.00', '481.50', '487.00', '7.00', 98338, 88416393, '43103738374.00'),
('2330', '2022-11-17', '482.50', '485.00', '475.00', '485.00', '-2.00', 57331, 46850915, '22547582604.00'),
('2330', '2022-11-18', '491.50', '494.00', '486.00', '487.00', '2.00', 41694, 37001332, '18131673834.00'),
('2330', '2022-11-21', '487.50', '489.50', '480.50', '482.00', '-5.00', 35815, 30609465, '14843805078.00'),
('2330', '2022-11-22', '476.00', '491.00', '476.00', '491.00', '9.00', 40964, 39329440, '19112616916.00'),
('2330', '2022-11-23', '494.50', '496.00', '488.50', '492.00', '1.00', 32889, 34752559, '17111333375.00'),
('2330', '2022-11-24', '494.00', '496.00', '492.00', '496.00', '4.00', 34387, 28477359, '14073196704.00'),
('2330', '2022-11-25', '494.00', '498.00', '494.00', '498.00', '2.00', 34399, 41461805, '20594790238.00'),
('2330', '2022-11-28', '486.00', '490.00', '480.50', '480.50', '-17.50', 57163, 40815045, '19790586320.00'),
('2330', '2022-11-29', '473.50', '488.00', '473.00', '487.00', '6.50', 35929, 40266315, '19374604221.00'),
('2330', '2022-11-30', '483.00', '490.00', '482.50', '490.00', '3.00', 25325, 60728041, '29643130386.00'),
('2330', '2022-12-01', '506.00', '508.00', '498.50', '498.50', '8.50', 46181, 43684491, '21976936461.00'),
('2330', '2022-12-02', '490.00', '497.00', '490.00', '492.50', '-6.00', 31799, 29909021, '14745810388.00'),
('2330', '2022-12-05', '491.50', '497.50', '489.00', '489.00', '-3.50', 31739, 33048153, '16272219716.00'),
('2330', '2022-12-06', '488.00', '489.00', '478.00', '478.00', '-11.00', 44448, 44964237, '21703863181.00'),
('2330', '2022-12-07', '477.00', '485.50', '475.00', '475.00', '-3.00', 43603, 39978821, '19128832587.00'),
('2330', '2022-12-08', '475.00', '475.00', '467.00', '471.50', '-3.50', 45114, 28348573, '13366736635.00'),
('2330', '2022-12-09', '478.00', '484.50', '476.00', '481.50', '10.00', 25790, 28903860, '13881674073.00'),
('2330', '2022-12-12', '476.50', '478.00', '473.50', '475.00', '-6.50', 34393, 24064002, '11435789974.00'),
('2330', '2022-12-13', '473.00', '476.00', '471.00', '471.50', '-3.50', 36559, 36028109, '17034191389.00'),
('2330', '2022-12-14', '472.00', '480.50', '472.00', '480.50', '9.00', 25102, 35263781, '16860500181.00'),
('2330', '2022-12-15', '476.00', '481.50', '474.50', '480.50', '0.00', 21052, 26001756, '12446105928.00'),
('2330', '2022-12-16', '466.50', '471.00', '465.50', '471.00', '-9.50', 69011, 51707693, '24262026661.00'),
('2412', '2022-11-01', '110.50', '110.50', '109.50', '109.50', '-1.50', 4039, 5272581, '579328366.00'),
('2412', '2022-11-02', '109.00', '109.00', '108.00', '108.50', '-1.00', 4183, 8446297, '916976034.00'),
('2412', '2022-11-03', '108.50', '109.00', '108.00', '108.50', '0.00', 2578, 5181876, '561797853.00'),
('2412', '2022-11-04', '107.50', '108.50', '107.00', '108.50', '0.00', 5902, 11310355, '1218833184.00'),
('2412', '2022-11-07', '108.50', '109.00', '107.50', '108.00', '-0.50', 4603, 6285270, '678671324.00'),
('2412', '2022-11-08', '108.00', '108.50', '108.00', '108.50', '0.50', 3710, 4464896, '483154961.00'),
('2412', '2022-11-09', '108.00', '109.50', '108.00', '109.00', '0.50', 5237, 11374417, '1237176140.00'),
('2412', '2022-11-10', '108.50', '109.50', '108.00', '108.50', '-0.50', 3988, 6601952, '717022338.00'),
('2412', '2022-11-11', '109.50', '110.00', '108.50', '109.50', '1.00', 5513, 13541837, '1479619335.00'),
('2412', '2022-11-14', '109.50', '110.50', '108.50', '109.50', '0.00', 7251, 20744675, '2268604292.00'),
('2412', '2022-11-15', '109.50', '110.00', '108.50', '109.00', '-0.50', 5633, 12134584, '1323894461.00'),
('2412', '2022-11-16', '108.50', '109.00', '108.00', '108.50', '-0.50', 6813, 13565041, '1472132554.00'),
('2412', '2022-11-17', '108.50', '109.00', '107.50', '108.00', '-0.50', 5611, 11295474, '1220319942.00'),
('2412', '2022-11-18', '108.00', '109.00', '108.00', '109.00', '1.00', 4152, 6707063, '727180846.00'),
('2412', '2022-11-21', '109.00', '109.50', '108.50', '109.00', '0.00', 3911, 5224639, '568428459.00'),
('2412', '2022-11-22', '109.00', '109.00', '108.00', '108.50', '-0.50', 3814, 6114127, '663048960.00'),
('2412', '2022-11-23', '109.00', '109.50', '108.50', '109.00', '0.50', 3747, 5494580, '599782550.00'),
('2412', '2022-11-24', '109.50', '110.50', '109.00', '110.00', '1.00', 3386, 6435724, '707470935.00'),
('2412', '2022-11-25', '110.00', '114.00', '110.00', '112.50', '2.50', 7890, 20032864, '2244946967.00'),
('2412', '2022-11-28', '111.50', '112.00', '110.50', '110.50', '-2.00', 3989, 10951451, '1218125312.00'),
('2412', '2022-11-29', '110.50', '113.00', '110.50', '112.00', '1.50', 4869, 9200148, '1031333609.00'),
('2412', '2022-11-30', '112.00', '113.50', '111.50', '113.50', '1.50', 3907, 14536167, '1644644325.00'),
('2412', '2022-12-01', '114.00', '114.00', '111.50', '111.50', '-2.00', 5543, 10281440, '1154373750.00'),
('2412', '2022-12-02', '111.50', '112.00', '111.00', '112.00', '0.50', 3649, 7157112, '798094309.00'),
('2412', '2022-12-05', '112.00', '113.00', '111.50', '112.50', '0.50', 2838, 4440051, '498542172.00'),
('2412', '2022-12-06', '112.00', '112.00', '111.50', '112.00', '-0.50', 4003, 6982186, '780503331.00'),
('2412', '2022-12-07', '112.00', '113.00', '111.50', '112.50', '0.50', 3974, 10680253, '1200630503.00'),
('2412', '2022-12-08', '112.00', '112.50', '111.00', '111.00', '-1.50', 3629, 5805091, '646566624.00'),
('2412', '2022-12-09', '111.50', '112.50', '111.00', '112.00', '1.00', 2740, 6241097, '697812661.00'),
('2412', '2022-12-12', '111.50', '112.50', '111.50', '112.50', '0.50', 2858, 6999530, '784198547.00'),
('2412', '2022-12-13', '112.00', '112.50', '111.00', '111.00', '-1.50', 4376, 8203870, '913808027.00'),
('2412', '2022-12-14', '112.00', '113.00', '111.50', '111.50', '0.50', 3711, 8039184, '900198327.00'),
('2412', '2022-12-15', '112.50', '112.50', '111.50', '112.00', '0.50', 3019, 7361483, '823549881.00'),
('2412', '2022-12-16', '111.00', '112.00', '110.50', '110.50', '-1.50', 5902, 16355920, '1814203809.00'),
('2618', '2022-11-01', '23.50', '23.85', '23.10', '23.85', '0.45', 11106, 33812312, '798719743.00'),
('2618', '2022-11-02', '23.80', '24.10', '23.75', '23.75', '-0.10', 8501, 25692441, '613709325.00'),
('2618', '2022-11-03', '23.50', '23.60', '23.20', '23.35', '-0.40', 10329, 35697321, '834116104.00'),
('2618', '2022-11-04', '23.35', '25.00', '23.35', '25.00', '1.65', 18175, 65304644, '1575509902.00'),
('2618', '2022-11-07', '24.50', '24.80', '24.20', '24.50', '-0.50', 21616, 78503534, '1924097183.00'),
('2618', '2022-11-08', '24.60', '26.50', '24.55', '25.40', '0.90', 35004, 109463346, '2804923691.00'),
('2618', '2022-11-09', '25.95', '26.00', '25.50', '25.55', '0.15', 13553, 42764798, '1098377185.00'),
('2618', '2022-11-10', '25.55', '25.90', '25.30', '25.50', '-0.05', 9602, 31233766, '798584825.00'),
('2618', '2022-11-11', '26.40', '26.75', '25.70', '25.70', '0.20', 18570, 59254368, '1547181511.00'),
('2618', '2022-11-14', '26.05', '26.20', '25.60', '26.05', '0.35', 13679, 44911362, '1166687322.00'),
('2618', '2022-11-15', '26.20', '26.35', '25.80', '26.05', '0.00', 11690, 36029429, '939238046.00'),
('2618', '2022-11-16', '26.15', '26.20', '25.70', '25.75', '-0.30', 10895, 32514323, '841915879.00'),
('2618', '2022-11-17', '25.70', '26.20', '25.60', '25.95', '0.20', 8329, 29652608, '770270769.00'),
('2618', '2022-11-18', '26.10', '26.90', '26.00', '26.25', '0.30', 18256, 61796922, '1634023810.00'),
('2618', '2022-11-21', '26.30', '26.45', '25.60', '25.75', '-0.50', 11250, 33831172, '875804190.00'),
('2618', '2022-11-22', '25.55', '26.05', '25.55', '25.70', '-0.05', 6858, 17889569, '460863958.00'),
('2618', '2022-11-23', '26.00', '26.20', '25.85', '26.05', '0.35', 6373, 17885555, '465935298.00'),
('2618', '2022-11-24', '26.30', '26.50', '26.00', '26.15', '0.10', 8504, 26985776, '706786190.00'),
('2618', '2022-11-25', '26.25', '26.70', '26.05', '26.05', '-0.10', 11927, 39879823, '1051032690.00'),
('2618', '2022-11-28', '25.90', '26.45', '25.70', '26.25', '0.20', 7799, 25782633, '674964067.00'),
('2618', '2022-11-29', '26.25', '28.40', '26.15', '28.30', '2.05', 40717, 134077311, '3696860639.00'),
('2618', '2022-11-30', '27.90', '28.15', '27.50', '27.95', '-0.35', 28018, 91657182, '2548137253.00'),
('2618', '2022-12-01', '28.30', '28.45', '27.50', '27.80', '-0.15', 20371, 62260001, '1739505589.00'),
('2618', '2022-12-02', '27.65', '28.10', '27.55', '27.60', '-0.20', 9164, 26883521, '746814943.00'),
('2618', '2022-12-05', '27.75', '28.90', '27.45', '28.40', '0.80', 26580, 91678558, '2599047951.00'),
('2618', '2022-12-06', '28.40', '29.20', '27.65', '27.80', '-0.60', 34679, 106349220, '3018836387.00'),
('2618', '2022-12-07', '27.75', '28.30', '27.35', '28.00', '0.20', 15642, 48306583, '1347864157.00'),
('2618', '2022-12-08', '28.15', '28.55', '27.75', '28.05', '0.05', 13107, 38945757, '1093746098.00'),
('2618', '2022-12-09', '28.25', '28.70', '28.15', '28.35', '0.30', 14009, 42279052, '1202599480.00'),
('2618', '2022-12-12', '28.60', '28.75', '28.05', '28.05', '-0.30', 11204, 31533790, '893041387.00'),
('2618', '2022-12-13', '28.35', '28.40', '27.65', '27.75', '-0.30', 9644, 27557010, '769429072.00'),
('2618', '2022-12-14', '27.90', '28.20', '27.70', '28.20', '0.45', 6958, 22659203, '633847430.00'),
('2618', '2022-12-15', '28.20', '29.00', '28.05', '28.75', '0.55', 21734, 68432062, '1961456084.00'),
('2618', '2022-12-16', '28.50', '28.95', '28.35', '28.60', '-0.15', 17852, 56881726, '1633883895.00');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- 資料表索引 `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `stock_prices`
--
ALTER TABLE `stock_prices`
  ADD PRIMARY KEY (`stock_id`,`date`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `stock_prices`
--
ALTER TABLE `stock_prices`
  ADD CONSTRAINT `stock_price_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
