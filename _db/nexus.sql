-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 27 日 09:47
-- 服务器版本: 5.5.34
-- PHP 版本: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `nexus`
--

-- --------------------------------------------------------

--
-- 表的结构 `adclicks`
--

CREATE TABLE IF NOT EXISTS `adclicks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adid` int(11) unsigned DEFAULT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `adminpanel`
--

CREATE TABLE IF NOT EXISTS `adminpanel` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `advertisements`
--

CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('bbcodes','xhtml','text','image','flash') NOT NULL,
  `position` enum('header','footer','belownav','belowsearchbox','torrentdetail','comment','interoverforums','forumpost','popup') NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `agent_allowed_exception`
--

CREATE TABLE IF NOT EXISTS `agent_allowed_exception` (
  `family_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `peer_id` varchar(20) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `comment` varchar(200) NOT NULL DEFAULT '',
  KEY `family_id` (`family_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `agent_allowed_family`
--

CREATE TABLE IF NOT EXISTS `agent_allowed_family` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `family` varchar(50) NOT NULL DEFAULT '',
  `start_name` varchar(100) NOT NULL DEFAULT '',
  `peer_id_pattern` varchar(200) NOT NULL,
  `peer_id_match_num` tinyint(3) unsigned NOT NULL,
  `peer_id_matchtype` enum('dec','hex') NOT NULL DEFAULT 'dec',
  `peer_id_start` varchar(20) NOT NULL,
  `agent_pattern` varchar(200) NOT NULL,
  `agent_match_num` tinyint(3) unsigned NOT NULL,
  `agent_matchtype` enum('dec','hex') NOT NULL DEFAULT 'dec',
  `agent_start` varchar(100) NOT NULL,
  `exception` enum('yes','no') NOT NULL DEFAULT 'no',
  `allowhttps` enum('yes','no') NOT NULL DEFAULT 'no',
  `comment` varchar(200) NOT NULL DEFAULT '',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 表的结构 `allowedemails`
--

CREATE TABLE IF NOT EXISTS `allowedemails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `dlkey` char(32) NOT NULL,
  `filetype` varchar(50) NOT NULL DEFAULT '',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL,
  `downloads` mediumint(8) NOT NULL DEFAULT '0',
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`userid`,`id`),
  KEY `dateline` (`added`,`isimage`,`downloads`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `audiocodecs`
--

CREATE TABLE IF NOT EXISTS `audiocodecs` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `avps`
--

CREATE TABLE IF NOT EXISTS `avps` (
  `arg` varchar(20) NOT NULL DEFAULT '',
  `value_s` text NOT NULL,
  `value_i` int(11) NOT NULL DEFAULT '0',
  `value_u` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bannedemails`
--

CREATE TABLE IF NOT EXISTS `bannedemails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `first` bigint(20) NOT NULL,
  `last` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `first_last` (`first`,`last`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bitbucket`
--

CREATE TABLE IF NOT EXISTS `bitbucket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `blockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`blockid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bookmarks`
--

CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid_torrentid` (`userid`,`torrentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mode` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_index` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mode_sort` (`mode`,`sort_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=410 ;

-- --------------------------------------------------------

--
-- 表的结构 `caticons`
--

CREATE TABLE IF NOT EXISTS `caticons` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `folder` varchar(255) NOT NULL,
  `cssfile` varchar(255) NOT NULL DEFAULT '',
  `multilang` enum('yes','no') NOT NULL DEFAULT 'no',
  `secondicon` enum('yes','no') NOT NULL DEFAULT 'no',
  `designer` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `cheaters`
--

CREATE TABLE IF NOT EXISTS `cheaters` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `torrentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `anctime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seeders` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `leechers` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dealtby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dealtwith` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `chronicle`
--

CREATE TABLE IF NOT EXISTS `chronicle` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txt` text,
  PRIMARY KEY (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `codecs`
--

CREATE TABLE IF NOT EXISTS `codecs` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `torrent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text,
  `ori_text` text,
  `editedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `editdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `offer` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `torrent_id` (`torrent`,`id`),
  KEY `offer_id` (`offer`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=295 ;

-- --------------------------------------------------------

--
-- 表的结构 `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `flagpic` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

-- --------------------------------------------------------

--
-- 表的结构 `downloadspeed`
--

CREATE TABLE IF NOT EXISTS `downloadspeed` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` smallint(5) unsigned NOT NULL,
  `lang_id` smallint(5) unsigned NOT NULL DEFAULT '6',
  `type` enum('categ','item') NOT NULL DEFAULT 'item',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `categ` smallint(5) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=476 ;

-- --------------------------------------------------------

--
-- 表的结构 `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `torrent` (`torrent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118395 ;

-- --------------------------------------------------------

--
-- 表的结构 `forummods`
--

CREATE TABLE IF NOT EXISTS `forummods` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `forumid` smallint(5) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forumid` (`forumid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `minclassread` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minclasswrite` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postcount` int(10) unsigned NOT NULL DEFAULT '0',
  `topiccount` int(10) unsigned NOT NULL DEFAULT '0',
  `minclasscreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `forid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `friendid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`friendid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- 表的结构 `fun`
--

CREATE TABLE IF NOT EXISTS `fun` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` enum('normal','dull','notfunny','funny','veryfunny','banned') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `funds`
--

CREATE TABLE IF NOT EXISTS `funds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usd` decimal(8,2) NOT NULL DEFAULT '0.00',
  `cny` decimal(8,2) NOT NULL DEFAULT '0.00',
  `user` mediumint(8) unsigned NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `memo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `funvotes`
--

CREATE TABLE IF NOT EXISTS `funvotes` (
  `funid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote` enum('fun','dull') NOT NULL DEFAULT 'fun',
  PRIMARY KEY (`funid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `invites`
--

CREATE TABLE IF NOT EXISTS `invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inviter` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invitee` varchar(80) NOT NULL DEFAULT '',
  `hash` char(32) NOT NULL,
  `time_invited` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`(3))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `iplog`
--

CREATE TABLE IF NOT EXISTS `iplog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40302 ;

-- --------------------------------------------------------

--
-- 表的结构 `isp`
--

CREATE TABLE IF NOT EXISTS `isp` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(50) NOT NULL,
  `flagpic` varchar(255) NOT NULL DEFAULT '',
  `sub_lang` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `rule_lang` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `site_lang` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `site_lang_folder` varchar(255) NOT NULL DEFAULT '',
  `trans_state` enum('up-to-date','outdate','incomplete','need-new','unavailable') NOT NULL DEFAULT 'unavailable',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `location_main` varchar(200) NOT NULL,
  `location_sub` varchar(200) NOT NULL,
  `flagpic` varchar(50) DEFAULT NULL,
  `start_ip` varchar(20) NOT NULL,
  `end_ip` varchar(20) NOT NULL,
  `theory_upspeed` int(10) unsigned NOT NULL DEFAULT '10',
  `practical_upspeed` int(10) unsigned NOT NULL DEFAULT '10',
  `theory_downspeed` int(10) unsigned NOT NULL DEFAULT '10',
  `practical_downspeed` int(10) unsigned NOT NULL DEFAULT '10',
  `hit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `loginattempts`
--

CREATE TABLE IF NOT EXISTS `loginattempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `attempts` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` enum('login','recover') NOT NULL DEFAULT 'login',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=879 ;

-- --------------------------------------------------------

--
-- 表的结构 `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `receiver` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `msg` text,
  `unread` enum('yes','no') NOT NULL DEFAULT 'yes',
  `location` smallint(6) NOT NULL DEFAULT '1',
  `saved` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `receiver` (`receiver`),
  KEY `sender` (`sender`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1621 ;

-- --------------------------------------------------------

--
-- 表的结构 `modpanel`
--

CREATE TABLE IF NOT EXISTS `modpanel` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1020 ;

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `title` varchar(255) NOT NULL DEFAULT '',
  `notify` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(225) NOT NULL,
  `descr` text,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allowedtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `yeah` smallint(5) unsigned NOT NULL DEFAULT '0',
  `against` smallint(5) unsigned NOT NULL DEFAULT '0',
  `category` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowed` enum('allowed','pending','denied') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

-- --------------------------------------------------------

--
-- 表的结构 `offervotes`
--

CREATE TABLE IF NOT EXISTS `offervotes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offerid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote` enum('yeah','against') NOT NULL DEFAULT 'yeah',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=390 ;

-- --------------------------------------------------------

--
-- 表的结构 `overforums`
--

CREATE TABLE IF NOT EXISTS `overforums` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `minclassview` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `peers`
--

CREATE TABLE IF NOT EXISTS `peers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `peer_id` binary(20) NOT NULL,
  `ip` varchar(64) NOT NULL DEFAULT '',
  `ipv6` varchar(128) NOT NULL DEFAULT '',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `to_go` bigint(20) unsigned NOT NULL DEFAULT '0',
  `seeder` enum('yes','no') NOT NULL DEFAULT 'no',
  `started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `prev_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `connectable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(60) NOT NULL DEFAULT '',
  `finishedat` int(10) unsigned NOT NULL DEFAULT '0',
  `downloadoffset` bigint(20) unsigned NOT NULL DEFAULT '0',
  `uploadoffset` bigint(20) unsigned NOT NULL DEFAULT '0',
  `passkey` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `torrent` (`torrent`)
) ENGINE=MEMORY  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=5549 ;

-- --------------------------------------------------------

--
-- 表的结构 `pmboxes`
--

CREATE TABLE IF NOT EXISTS `pmboxes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `boxnumber` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pollanswers`
--

CREATE TABLE IF NOT EXISTS `pollanswers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `selection` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`),
  KEY `selection` (`selection`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question` varchar(255) NOT NULL DEFAULT '',
  `option0` varchar(40) NOT NULL DEFAULT '',
  `option1` varchar(40) NOT NULL DEFAULT '',
  `option2` varchar(40) NOT NULL DEFAULT '',
  `option3` varchar(40) NOT NULL DEFAULT '',
  `option4` varchar(40) NOT NULL DEFAULT '',
  `option5` varchar(40) NOT NULL DEFAULT '',
  `option6` varchar(40) NOT NULL DEFAULT '',
  `option7` varchar(40) NOT NULL DEFAULT '',
  `option8` varchar(40) NOT NULL DEFAULT '',
  `option9` varchar(40) NOT NULL DEFAULT '',
  `option10` varchar(40) NOT NULL DEFAULT '',
  `option11` varchar(40) NOT NULL DEFAULT '',
  `option12` varchar(40) NOT NULL DEFAULT '',
  `option13` varchar(40) NOT NULL DEFAULT '',
  `option14` varchar(40) NOT NULL DEFAULT '',
  `option15` varchar(40) NOT NULL DEFAULT '',
  `option16` varchar(40) NOT NULL DEFAULT '',
  `option17` varchar(40) NOT NULL DEFAULT '',
  `option18` varchar(40) NOT NULL DEFAULT '',
  `option19` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `body` text,
  `ori_body` text,
  `editedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `editdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `topicid_id` (`topicid`,`id`),
  KEY `added` (`added`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

-- --------------------------------------------------------

--
-- 表的结构 `processings`
--

CREATE TABLE IF NOT EXISTS `processings` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `prolinkclicks`
--

CREATE TABLE IF NOT EXISTS `prolinkclicks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `readposts`
--

CREATE TABLE IF NOT EXISTS `readposts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpostread` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=836 ;

-- --------------------------------------------------------

--
-- 表的结构 `regimages`
--

CREATE TABLE IF NOT EXISTS `regimages` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imagehash` varchar(32) NOT NULL DEFAULT '',
  `imagestring` varchar(8) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `addedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reportid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('torrent','user','offer','request','post','comment','subtitle') NOT NULL DEFAULT 'torrent',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `dealtby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dealtwith` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `rules`
--

CREATE TABLE IF NOT EXISTS `rules` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` smallint(5) unsigned NOT NULL DEFAULT '6',
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 表的结构 `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

-- --------------------------------------------------------

--
-- 表的结构 `searchbox`
--

CREATE TABLE IF NOT EXISTS `searchbox` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `showsubcat` tinyint(1) NOT NULL DEFAULT '0',
  `showsource` tinyint(1) NOT NULL DEFAULT '0',
  `showmedium` tinyint(1) NOT NULL DEFAULT '0',
  `showcodec` tinyint(1) NOT NULL DEFAULT '0',
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  `showprocessing` tinyint(1) NOT NULL DEFAULT '0',
  `showteam` tinyint(1) NOT NULL DEFAULT '0',
  `showaudiocodec` tinyint(1) NOT NULL DEFAULT '0',
  `catsperrow` smallint(5) unsigned NOT NULL DEFAULT '7',
  `catpadding` smallint(5) unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `secondicons`
--

CREATE TABLE IF NOT EXISTS `secondicons` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `medium` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `standard` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `processing` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `audiocodec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `shoutbox`
--

CREATE TABLE IF NOT EXISTS `shoutbox` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `type` enum('sb','hb') NOT NULL DEFAULT 'sb',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=393 ;

-- --------------------------------------------------------

--
-- 表的结构 `sitelog`
--

CREATE TABLE IF NOT EXISTS `sitelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txt` text NOT NULL,
  `security_level` enum('normal','mod') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7752 ;

-- --------------------------------------------------------

--
-- 表的结构 `snatched`
--

CREATE TABLE IF NOT EXISTS `snatched` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `torrentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `to_go` bigint(20) unsigned NOT NULL DEFAULT '0',
  `seedtime` int(10) unsigned NOT NULL DEFAULT '0',
  `leechtime` int(10) unsigned NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `startdat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `torrentid_userid` (`torrentid`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11974 ;

-- --------------------------------------------------------

--
-- 表的结构 `sources`
--

CREATE TABLE IF NOT EXISTS `sources` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `staffmessages`
--

CREATE TABLE IF NOT EXISTS `staffmessages` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `msg` text,
  `subject` varchar(128) NOT NULL DEFAULT '',
  `answeredby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `answer` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `standards`
--

CREATE TABLE IF NOT EXISTS `standards` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `stylesheets`
--

CREATE TABLE IF NOT EXISTS `stylesheets` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `addicode` text,
  `designer` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- 表的结构 `subs`
--

CREATE TABLE IF NOT EXISTS `subs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent_id` mediumint(8) unsigned NOT NULL,
  `lang_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `uppedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `anonymous` enum('yes','no') NOT NULL DEFAULT 'no',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ext` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `torrentid_langid` (`torrent_id`,`lang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- 表的结构 `suggest`
--

CREATE TABLE IF NOT EXISTS `suggest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `keywords` (`keywords`(4)),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1414 ;

-- --------------------------------------------------------

--
-- 表的结构 `sysoppanel`
--

CREATE TABLE IF NOT EXISTS `sysoppanel` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3028 ;

-- --------------------------------------------------------

--
-- 表的结构 `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `sort_index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `thanks`
--

CREATE TABLE IF NOT EXISTS `thanks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `torrentid_id` (`torrentid`,`id`),
  KEY `torrentid_userid` (`torrentid`,`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=360 ;

-- --------------------------------------------------------

--
-- 表的结构 `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  `forumid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `firstpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `sticky` enum('no','yes') NOT NULL DEFAULT 'no',
  `hlcolor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `subject` (`subject`),
  KEY `forumid_lastpost` (`forumid`,`lastpost`),
  KEY `forumid_sticky_lastpost` (`forumid`,`sticky`,`lastpost`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- 表的结构 `torrents`
--

CREATE TABLE IF NOT EXISTS `torrents` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `info_hash` binary(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `save_as` varchar(255) NOT NULL DEFAULT '',
  `descr` text,
  `small_descr` varchar(255) NOT NULL DEFAULT '',
  `ori_descr` text,
  `category` smallint(5) unsigned NOT NULL DEFAULT '0',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `medium` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `codec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `standard` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `processing` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `audiocodec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('single','multi') NOT NULL DEFAULT 'single',
  `numfiles` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `times_completed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `leechers` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seeders` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visible` enum('yes','no') NOT NULL DEFAULT 'yes',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `owner` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nfo` blob,
  `sp_state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `promotion_time_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `promotion_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `anonymous` enum('yes','no') NOT NULL DEFAULT 'no',
  `url` int(10) unsigned DEFAULT NULL,
  `pos_state` enum('normal','sticky') NOT NULL DEFAULT 'normal',
  `cache_stamp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `picktype` enum('hot','classic','recommended','normal') NOT NULL DEFAULT 'normal',
  `picktime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_reseed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `info_hash` (`info_hash`),
  KEY `owner` (`owner`),
  KEY `visible_pos_id` (`visible`,`pos_state`,`id`),
  KEY `url` (`url`),
  KEY `category_visible_banned` (`category`,`visible`,`banned`),
  KEY `visible_banned_pos_id` (`visible`,`banned`,`pos_state`,`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6071 ;

-- --------------------------------------------------------

--
-- 表的结构 `torrents_state`
--

CREATE TABLE IF NOT EXISTS `torrents_state` (
  `global_sp_state` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `uploadspeed`
--

CREATE TABLE IF NOT EXISTS `uploadspeed` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `passhash` varchar(32) NOT NULL DEFAULT '',
  `secret` varbinary(20) NOT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `status` enum('pending','confirmed') NOT NULL DEFAULT 'pending',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_home` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_offer` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forum_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_staffmsg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_pm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_comment` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_post` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_browse` int(10) unsigned NOT NULL DEFAULT '0',
  `last_music` int(10) unsigned NOT NULL DEFAULT '0',
  `last_catchup` int(10) unsigned NOT NULL DEFAULT '0',
  `editsecret` varbinary(20) NOT NULL,
  `privacy` enum('strong','normal','low') NOT NULL DEFAULT 'normal',
  `stylesheet` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `caticon` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fontsize` enum('small','medium','large') NOT NULL DEFAULT 'medium',
  `info` text,
  `acceptpms` enum('yes','friends','no') NOT NULL DEFAULT 'yes',
  `commentpm` enum('yes','no') NOT NULL DEFAULT 'yes',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `max_class_once` tinyint(3) NOT NULL DEFAULT '1',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `seedtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `leechtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '107',
  `notifs` varchar(500) DEFAULT NULL,
  `modcomment` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `avatars` enum('yes','no') NOT NULL DEFAULT 'yes',
  `donor` enum('yes','no') NOT NULL DEFAULT 'no',
  `donated` decimal(8,2) NOT NULL DEFAULT '0.00',
  `donated_cny` decimal(8,2) NOT NULL DEFAULT '0.00',
  `donoruntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `warned` enum('yes','no') NOT NULL DEFAULT 'no',
  `warneduntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `noad` enum('yes','no') NOT NULL DEFAULT 'no',
  `noaduntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `torrentsperpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topicsperpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postsperpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `clicktopic` enum('firstpage','lastpage') NOT NULL DEFAULT 'firstpage',
  `deletepms` enum('yes','no') NOT NULL DEFAULT 'yes',
  `savepms` enum('yes','no') NOT NULL DEFAULT 'no',
  `showhot` enum('yes','no') NOT NULL DEFAULT 'yes',
  `showclassic` enum('yes','no') NOT NULL DEFAULT 'yes',
  `support` enum('yes','no') NOT NULL DEFAULT 'no',
  `picker` enum('yes','no') NOT NULL DEFAULT 'no',
  `stafffor` varchar(255) NOT NULL,
  `supportfor` varchar(255) NOT NULL,
  `pickfor` varchar(255) NOT NULL,
  `supportlang` varchar(50) NOT NULL,
  `passkey` varchar(32) NOT NULL DEFAULT '',
  `promotion_link` varchar(32) DEFAULT NULL,
  `uploadpos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `forumpost` enum('yes','no') NOT NULL DEFAULT 'yes',
  `downloadpos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `clientselect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `signatures` enum('yes','no') NOT NULL DEFAULT 'yes',
  `signature` varchar(800) NOT NULL DEFAULT '',
  `lang` smallint(5) unsigned NOT NULL DEFAULT '6',
  `cheat` smallint(6) NOT NULL DEFAULT '0',
  `download` int(10) unsigned NOT NULL DEFAULT '0',
  `upload` int(10) unsigned NOT NULL DEFAULT '0',
  `isp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `invites` smallint(5) unsigned NOT NULL DEFAULT '0',
  `invited_by` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` enum('Male','Female','N/A') NOT NULL DEFAULT 'N/A',
  `vip_added` enum('yes','no') NOT NULL DEFAULT 'no',
  `vip_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `seedbonus` decimal(10,1) NOT NULL DEFAULT '0.0',
  `charity` decimal(10,1) NOT NULL DEFAULT '0.0',
  `bonuscomment` text,
  `parked` enum('yes','no') NOT NULL DEFAULT 'no',
  `leechwarn` enum('yes','no') NOT NULL DEFAULT 'no',
  `leechwarnuntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastwarned` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeswarned` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `warnedby` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sbnum` smallint(5) unsigned NOT NULL DEFAULT '70',
  `sbrefresh` smallint(5) unsigned NOT NULL DEFAULT '120',
  `hidehb` enum('yes','no') DEFAULT 'no',
  `showimdb` enum('yes','no') DEFAULT 'yes',
  `showdescription` enum('yes','no') DEFAULT 'yes',
  `showcomment` enum('yes','no') DEFAULT 'yes',
  `showclienterror` enum('yes','no') NOT NULL DEFAULT 'no',
  `showdlnotice` tinyint(1) NOT NULL DEFAULT '1',
  `tooltip` enum('minorimdb','medianimdb','off') NOT NULL DEFAULT 'off',
  `shownfo` enum('yes','no') DEFAULT 'yes',
  `timetype` enum('timeadded','timealive') DEFAULT 'timealive',
  `appendsticky` enum('yes','no') DEFAULT 'yes',
  `appendnew` enum('yes','no') DEFAULT 'yes',
  `appendpromotion` enum('highlight','word','icon','off') DEFAULT 'icon',
  `appendpicked` enum('yes','no') DEFAULT 'yes',
  `dlicon` enum('yes','no') DEFAULT 'yes',
  `bmicon` enum('yes','no') DEFAULT 'yes',
  `showsmalldescr` enum('yes','no') NOT NULL DEFAULT 'yes',
  `showcomnum` enum('yes','no') DEFAULT 'yes',
  `showlastcom` enum('yes','no') DEFAULT 'no',
  `showlastpost` enum('yes','no') NOT NULL DEFAULT 'no',
  `pmnum` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `school` smallint(5) unsigned NOT NULL DEFAULT '35',
  `showfb` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status_added` (`status`,`added`),
  KEY `ip` (`ip`),
  KEY `uploaded` (`uploaded`),
  KEY `downloaded` (`downloaded`),
  KEY `country` (`country`),
  KEY `last_access` (`last_access`),
  KEY `enabled` (`enabled`),
  KEY `warned` (`warned`),
  KEY `cheat` (`cheat`),
  KEY `class` (`class`),
  KEY `passkey` (`passkey`(8))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=835 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
