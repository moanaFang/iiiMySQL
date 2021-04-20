-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-04-19 08:08:23
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `my_db`
--
CREATE DATABASE IF NOT EXISTS `my_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `my_db`;

-- --------------------------------------------------------

--
-- 資料表結構 `courses`
--

CREATE TABLE `courses` (
  `cId` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程編號',
  `cName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程名稱',
  `credit` tinyint(1) NOT NULL COMMENT '學分',
  `isCompulsory` tinyint(1) NOT NULL COMMENT '是否必修',
  `tId` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老師編號',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程資料表';

-- --------------------------------------------------------

--
-- 資料表結構 `scores`
--

CREATE TABLE `scores` (
  `sId` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學生編號',
  `cId` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程編號',
  `score` tinyint(3) NOT NULL COMMENT '成績',
  `created_at` datetime NOT NULL COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成績資料表';

--
-- 傾印資料表的資料 `scores`
--

INSERT INTO `scores` (`sId`, `cId`, `score`, `created_at`, `updated_at`) VALUES
('087', 'C001', 74, '0000-00-00 00:00:00', '2021-04-19 11:57:11'),
('087', 'C002', 93, '0000-00-00 00:00:00', '2021-04-19 11:57:11'),
('088', 'C004', 94, '0000-00-00 00:00:00', '2021-04-19 11:57:11');

-- --------------------------------------------------------

--
-- 資料表結構 `students`
--

CREATE TABLE `students` (
  `sId` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學生編號',
  `sName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學生姓名',
  `sGender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學生性別',
  `sNickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '學生暱稱',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='學生資料表';

--
-- 傾印資料表的資料 `students`
--

INSERT INTO `students` (`sId`, `sName`, `sGender`, `sNickname`, `created_at`, `updated_at`) VALUES
('003', '王oo', '男', '小王', '2021-04-19 11:14:20', '2021-04-19 11:14:20'),
('004', '江oo', '女', '小江', '2021-04-19 11:14:20', '2021-04-19 11:14:20'),
('005', '周oo', '女', '小周', '2021-04-19 11:14:20', '2021-04-19 11:14:20'),
('006', '黃oo', '男', '小黃', '2021-04-19 11:14:20', '2021-04-19 11:14:20'),
('007', '丁oo', '男', '小丁', '2021-04-19 11:14:20', '2021-04-19 11:14:20'),
('008', '鄭oo', '男', '小鄭', '2021-04-19 11:14:20', '2021-04-19 11:14:20');

-- --------------------------------------------------------

--
-- 資料表結構 `teachers`
--

CREATE TABLE `teachers` (
  `tId` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老師編號',
  `tName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老師姓名',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增時間',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='老師資料表';

--
-- 傾印資料表的資料 `teachers`
--

INSERT INTO `teachers` (`tId`, `tName`, `created_at`, `updated_at`) VALUES
('T001', '曾oo', '2021-04-19 11:30:42', '2021-04-19 11:30:42'),
('T002', '林oo', '2021-04-19 11:32:41', '2021-04-19 11:32:41'),
('T003', '王oo', '2021-04-19 11:32:41', '2021-04-19 11:32:41'),
('T005', '謝oo', '2021-04-19 11:32:41', '2021-04-19 11:32:41');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`cId`,`tId`);

--
-- 資料表索引 `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`sId`,`cId`);

--
-- 資料表索引 `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`sId`);

--
-- 資料表索引 `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
