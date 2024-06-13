-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-06-13 11:58:47
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
  `所属ID` int(11) NOT NULL,
  `氏名` varchar(50) NOT NULL,
  `電話番号` varchar(50) DEFAULT NULL,
  `メールアドレス` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `ユーザ`
--

INSERT INTO `ユーザ` (`ID`, `所属ID`, `氏名`, `電話番号`, `メールアドレス`) VALUES
(6875, 1453, '佐藤太郎', '08065508461', 'unkyo@gail.com');

-- --------------------------------------------------------

--
-- テーブルの構造 `受け取り申請`
--

CREATE TABLE `受け取り申請` (
  `ID` int(11) NOT NULL,
  `学籍番号` varchar(50) NOT NULL,
  `電話番号` varchar(50) NOT NULL,
  `メールアドレス` varchar(50) NOT NULL,
  `受け取り希望日` date NOT NULL,
  `希望時間` time NOT NULL,
  `備考` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `所属`
--

CREATE TABLE `所属` (
  `ID` int(11) NOT NULL,
  `所属分類` varchar(50) NOT NULL,
  `所属` varchar(50) NOT NULL,
  `学籍番号` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `所属`
--

INSERT INTO `所属` (`ID`, `所属分類`, `所属`, `学籍番号`) VALUES
(1453, '学生', '情報学部情報システム学科', 'c9p46254');

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

--
-- テーブルのデータのダンプ `拾得物`
--

INSERT INTO `拾得物` (`ID`, `拾得物分類ID`, `拾得場所`, `色`, `特長`, `画像`) VALUES
(9783, 4357, '１号館', '黒', '革製', 'あり');

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

--
-- テーブルのデータのダンプ `拾得物分類`
--

INSERT INTO `拾得物分類` (`ID`, `分類`, `物品名`, `拾得日`, `拾得時間`) VALUES
(4357, '財布', 'キーホルダー付きの長財布', '2024-05-14', '05:39:04');

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

--
-- テーブルのデータのダンプ `拾得物管理状況`
--

INSERT INTO `拾得物管理状況` (`ID`, `ユーザID`, `拾得物ID`, `変更日時`, `変更内容`, `保管場所`) VALUES
(5344, 6875, 9783, '2024-05-21 00:56:38', '持ち主に返還されました。', '返還済み');

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

--
-- テーブルのデータのダンプ `遺失物分類`
--

INSERT INTO `遺失物分類` (`ID`, `分類`, `物品名`, `遺失日`) VALUES
(567633, '小物', 'モバイルバッテリー', '2024-05-22');

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
-- テーブルのデータのダンプ `遺失物捜索依頼`
--

INSERT INTO `遺失物捜索依頼` (`ID`, `ユーザID`, `分類`, `遺失場所`, `色`, `特長`) VALUES
(567689, 6875, 567633, '６号館', '白', '黒い入れ物に入っています。');

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
-- テーブルのインデックス `受け取り申請`
--
ALTER TABLE `受け取り申請`
  ADD PRIMARY KEY (`ID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6876;

--
-- テーブルの AUTO_INCREMENT `受け取り申請`
--
ALTER TABLE `受け取り申請`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `所属`
--
ALTER TABLE `所属`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1454;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5345;

--
-- テーブルの AUTO_INCREMENT `遺失物分類`
--
ALTER TABLE `遺失物分類`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567634;

--
-- テーブルの AUTO_INCREMENT `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567690;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD CONSTRAINT `ユーザ_ibfk_1` FOREIGN KEY (`所属ID`) REFERENCES `所属` (`ID`);

--
-- テーブルの制約 `受け取り申請`
--
ALTER TABLE `受け取り申請`
  ADD CONSTRAINT `受け取り申請_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `ユーザ` (`ID`);

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
