-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: chinese_poetry
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analects`
--

DROP TABLE IF EXISTS `analects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analects` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `chapter` varchar(100) NOT NULL COMMENT '篇目',
  `paragraphs` text NOT NULL COMMENT '正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COMMENT='论语,英文就是Analects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caocao_poetry`
--

DROP TABLE IF EXISTS `caocao_poetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caocao_poetry` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '题目',
  `author` varchar(45) DEFAULT '曹操' COMMENT '作者',
  `paragraphs` text NOT NULL COMMENT '诗歌正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hua_jian_ji`
--

DROP TABLE IF EXISTS `hua_jian_ji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hua_jian_ji` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `rhythmic` varchar(100) NOT NULL COMMENT '词牌名',
  `title` varchar(100) NOT NULL COMMENT '题目',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `paragraphs` varchar(1000) NOT NULL COMMENT '词正文',
  `notes` varchar(1000) NOT NULL COMMENT '评注',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3977 DEFAULT CHARSET=utf8mb4 COMMENT='花间集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nan_tang_er_zhu_ci`
--

DROP TABLE IF EXISTS `nan_tang_er_zhu_ci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nan_tang_er_zhu_ci` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `rhythmic` varchar(100) NOT NULL COMMENT '词牌名',
  `title` varchar(100) NOT NULL COMMENT '题目',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `paragraphs` varchar(1000) NOT NULL COMMENT '词正文',
  `notes` varchar(2000) NOT NULL COMMENT '评注',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COMMENT='南唐二主词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `song_ci`
--

DROP TABLE IF EXISTS `song_ci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_ci` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL COMMENT '作者',
  `rhythmic` varchar(100) NOT NULL COMMENT '词牌名',
  `paragraphs` text NOT NULL COMMENT '正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=168425 DEFAULT CHARSET=utf8mb4 COMMENT='宋词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `song_poetry`
--

DROP TABLE IF EXISTS `song_poetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_poetry` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL COMMENT '作者',
  `title` varchar(1024) NOT NULL COMMENT '题目',
  `paragraphs` text NOT NULL COMMENT '诗歌正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1634254 DEFAULT CHARSET=utf8mb4 COMMENT='宋诗';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `songs_of_chu`
--

DROP TABLE IF EXISTS `songs_of_chu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_of_chu` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '题目',
  `section` varchar(100) NOT NULL COMMENT '编目',
  `author` varchar(45) NOT NULL DEFAULT '' COMMENT '作者',
  `content` text NOT NULL COMMENT '诗歌正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COMMENT='楚辞.楚辞的英文翻译就是 Songs of Chu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tang_poetry`
--

DROP TABLE IF EXISTS `tang_poetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tang_poetry` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL COMMENT '作者',
  `title` varchar(1024) NOT NULL COMMENT '题目',
  `paragraphs` text NOT NULL COMMENT '诗歌正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=460897 DEFAULT CHARSET=utf8mb4 COMMENT='唐诗';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `the_book_of_songs`
--

DROP TABLE IF EXISTS `the_book_of_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `the_book_of_songs` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '题目',
  `chapter` varchar(100) NOT NULL COMMENT '部分,风\\雅\\颂之一',
  `section` varchar(100) NOT NULL COMMENT '篇章,例如周南\\召南\\卫风...',
  `content` text NOT NULL COMMENT '诗歌正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2441 DEFAULT CHARSET=utf8mb4 COMMENT='诗经,The Book of Songs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `you_meng_ying`
--

DROP TABLE IF EXISTS `you_meng_ying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `you_meng_ying` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `comment` text NOT NULL COMMENT '点评',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8mb4 COMMENT='幽梦影';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yuan_opera`
--

DROP TABLE IF EXISTS `yuan_opera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuan_opera` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL COMMENT '作者',
  `title` varchar(512) NOT NULL COMMENT '题目',
  `paragraphs` text NOT NULL COMMENT '正文',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=88457 DEFAULT CHARSET=utf8mb4 COMMENT='元曲,Yuan Opera.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'chinese_poetry'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-20 16:49:08
