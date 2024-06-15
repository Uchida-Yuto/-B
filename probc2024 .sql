-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-06-15 12:52:27
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `probc2024`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `ユーザ`
--

CREATE TABLE `ユーザ` (
  `ID` int(11) NOT NULL,
  `所属ID` int(11) DEFAULT NULL,
  `氏名` varchar(50) NOT NULL,
  `電話番号` varchar(50) DEFAULT NULL,
  `メールアドレス` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `ユーザ`
--

INSERT INTO `ユーザ` (`ID`, `所属ID`, `氏名`, `電話番号`, `メールアドレス`) VALUES
(6883, 0, '佐藤', '35938', 'bunkyo.ac.jp');

-- --------------------------------------------------------

--
-- テーブルの構造 `所属`
--

CREATE TABLE `所属` (
  `ID` int(11) NOT NULL,
  `所属分類` varchar(50) NOT NULL,
  `所属名` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `所属`
--

INSERT INTO `所属` (`ID`, `所属分類`, `所属名`) VALUES
(100, '教員', '大学職員'),
(101, '事務員', '大学職員'),
(102, '学生', '情報学部情報システム学科'),
(103, '学生', '情報学部情報社会学科'),
(104, '学生', '情報学部メディア表現学科'),
(105, '学生', '健康栄養学部'),
(106, '学外', 'その他');

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物`
--

CREATE TABLE `拾得物` (
  `ID` int(11) NOT NULL,
  `拾得物分類ID` int(11) NOT NULL,
  `拾得場所` varchar(50) NOT NULL,
  `色` varchar(50) NOT NULL,
  `特長` varchar(50) DEFAULT NULL,
  `画像` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物分類`
--

CREATE TABLE `拾得物分類` (
  `ID` int(11) NOT NULL,
  `分類` varchar(50) NOT NULL,
  `物品名` varchar(50) NOT NULL,
  `拾得日` date NOT NULL,
  `拾得時間` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物管理状況`
--

CREATE TABLE `拾得物管理状況` (
  `ID` int(11) NOT NULL,
  `ユーザID` int(11) NOT NULL,
  `拾得物ID` int(11) NOT NULL,
  `変更日時` datetime DEFAULT NULL,
  `変更内容` varchar(100) DEFAULT NULL,
  `保管場所` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `遺失物分類`
--

CREATE TABLE `遺失物分類` (
  `ID` int(11) NOT NULL,
  `分類` varchar(50) NOT NULL,
  `物品名` varchar(50) NOT NULL,
  `遺失日` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `遺失物捜索依頼`
--

CREATE TABLE `遺失物捜索依頼` (
  `ID` int(11) NOT NULL,
  `ユーザID` int(11) NOT NULL,
  `分類` int(50) NOT NULL,
  `遺失場所` varchar(50) NOT NULL,
  `色` varchar(50) NOT NULL,
  `特長` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `所属ID` (`所属ID`);

--
-- テーブルのインデックス `所属`
--
ALTER TABLE `所属`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物`
--
ALTER TABLE `拾得物`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `拾得物分類ID` (`拾得物分類ID`);

--
-- テーブルのインデックス `拾得物分類`
--
ALTER TABLE `拾得物分類`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ユーザID` (`ユーザID`),
  ADD KEY `拾得物ID` (`拾得物ID`);

--
-- テーブルのインデックス `遺失物分類`
--
ALTER TABLE `遺失物分類`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ユーザID` (`ユーザID`),
  ADD KEY `分類` (`分類`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `ユーザ`
--
ALTER TABLE `ユーザ`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6884;

--
-- テーブルの AUTO_INCREMENT `所属`
--
ALTER TABLE `所属`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- テーブルの AUTO_INCREMENT `拾得物`
--
ALTER TABLE `拾得物`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9784;

--
-- テーブルの AUTO_INCREMENT `拾得物分類`
--
ALTER TABLE `拾得物分類`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4358;

--
-- テーブルの AUTO_INCREMENT `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `遺失物分類`
--
ALTER TABLE `遺失物分類`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567634;

--
-- テーブルの AUTO_INCREMENT `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `拾得物`
--
ALTER TABLE `拾得物`
  ADD CONSTRAINT `拾得物_ibfk_1` FOREIGN KEY (`拾得物分類ID`) REFERENCES `拾得物分類` (`ID`);

--
-- テーブルの制約 `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  ADD CONSTRAINT `拾得物管理状況_ibfk_1` FOREIGN KEY (`ユーザID`) REFERENCES `ユーザ` (`ID`),
  ADD CONSTRAINT `拾得物管理状況_ibfk_2` FOREIGN KEY (`拾得物ID`) REFERENCES `拾得物` (`ID`);

--
-- テーブルの制約 `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  ADD CONSTRAINT `遺失物捜索依頼_ibfk_1` FOREIGN KEY (`ユーザID`) REFERENCES `ユーザ` (`ID`),
  ADD CONSTRAINT `遺失物捜索依頼_ibfk_2` FOREIGN KEY (`分類`) REFERENCES `遺失物分類` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
