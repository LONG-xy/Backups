/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.107
Source Server Version : 50067
Source Host           : 192.168.1.107:3306
Source Database       : db_show

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2016-06-06 14:19:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `checkcode`
-- ----------------------------
DROP TABLE IF EXISTS `checkcode`;
CREATE TABLE `checkcode` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `UserName` varchar(50) default NULL,
  `CODE` varchar(50) default NULL,
  `addtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of checkcode
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_attrs`
-- ----------------------------
DROP TABLE IF EXISTS `tb_attrs`;
CREATE TABLE `tb_attrs` (
  `attr_id` int(10) unsigned NOT NULL auto_increment,
  `control_id` int(11) default NULL,
  `attr_name` varchar(50) default NULL,
  `attr_default` varchar(2000) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_attrs
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_code`
-- ----------------------------
DROP TABLE IF EXISTS `tb_code`;
CREATE TABLE `tb_code` (
  `code_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` int(11) default NULL,
  `msg` varchar(50) default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_code
-- ----------------------------
INSERT INTO `tb_code` VALUES ('1', '2', '互联网/IT', '0');
INSERT INTO `tb_code` VALUES ('2', '2', '地产/家具', '0');
INSERT INTO `tb_code` VALUES ('3', '2', '教育/培训', '0');
INSERT INTO `tb_code` VALUES ('4', '2', '服饰/时尚', '0');
INSERT INTO `tb_code` VALUES ('5', '3', '企业宣传', '0');
INSERT INTO `tb_code` VALUES ('6', '3', '品牌推广', '0');
INSERT INTO `tb_code` VALUES ('7', '3', '产品介绍', '0');
INSERT INTO `tb_code` VALUES ('8', '3', '会议邀请', '0');
INSERT INTO `tb_code` VALUES ('9', '3', '课程培训', '0');
INSERT INTO `tb_code` VALUES ('10', '6', '普通用户', '0');
INSERT INTO `tb_code` VALUES ('11', '6', 'VIP用户', '0');
INSERT INTO `tb_code` VALUES ('12', '7', '无权限', '0');
INSERT INTO `tb_code` VALUES ('13', '7', '自己查看', '0');
INSERT INTO `tb_code` VALUES ('14', '8', '纵向', '0');
INSERT INTO `tb_code` VALUES ('15', '9', '横向', '0');
INSERT INTO `tb_code` VALUES ('16', '2', '餐饮/食品', '0');
INSERT INTO `tb_code` VALUES ('17', '2', '金融/银行', '0');
INSERT INTO `tb_code` VALUES ('18', '2', '零售/电商', '0');
INSERT INTO `tb_code` VALUES ('19', '2', '媒体/广告', '0');
INSERT INTO `tb_code` VALUES ('20', '2', '旅游/景区', '0');
INSERT INTO `tb_code` VALUES ('21', '2', '其他/行业', '0');
INSERT INTO `tb_code` VALUES ('22', '2', '个人', '0');
INSERT INTO `tb_code` VALUES ('23', '3', '企业招聘', '0');
INSERT INTO `tb_code` VALUES ('24', '3', '活动宣传', '0');
INSERT INTO `tb_code` VALUES ('25', '3', '节日传情', '0');
INSERT INTO `tb_code` VALUES ('26', '3', '事件祝福', '0');
INSERT INTO `tb_code` VALUES ('27', '3', '其他场景', '0');
INSERT INTO `tb_code` VALUES ('28', '2', '节日祝福', '0');
INSERT INTO `tb_code` VALUES ('29', '9', '嘿1', '0');

-- ----------------------------
-- Table structure for `tb_code_group`
-- ----------------------------
DROP TABLE IF EXISTS `tb_code_group`;
CREATE TABLE `tb_code_group` (
  `group_id` int(10) unsigned NOT NULL auto_increment,
  `group_msg` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_code_group
-- ----------------------------
INSERT INTO `tb_code_group` VALUES ('1', '目前状态');
INSERT INTO `tb_code_group` VALUES ('2', '类型行业');
INSERT INTO `tb_code_group` VALUES ('3', '类型场景');
INSERT INTO `tb_code_group` VALUES ('4', '最大页数');
INSERT INTO `tb_code_group` VALUES ('5', '翻页类型');
INSERT INTO `tb_code_group` VALUES ('6', '用户类型');
INSERT INTO `tb_code_group` VALUES ('7', '访问权限');
INSERT INTO `tb_code_group` VALUES ('8', '翻页类型');
INSERT INTO `tb_code_group` VALUES ('9', '瞧瞧123');
INSERT INTO `tb_code_group` VALUES ('10', '嘿嘿嘿1');

-- ----------------------------
-- Table structure for `tb_controls`
-- ----------------------------
DROP TABLE IF EXISTS `tb_controls`;
CREATE TABLE `tb_controls` (
  `control_id` int(11) unsigned NOT NULL auto_increment,
  `control_name` varchar(50) default NULL,
  `money` double default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_controls
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_file`
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file` (
  `fileid` varchar(50) NOT NULL,
  `extName` varchar(50) default NULL,
  `fileType` varchar(50) default NULL,
  `path` varchar(500) default NULL,
  `addtime` datetime default NULL,
  `userid` varchar(50) default NULL,
  `fileName` varchar(50) default NULL,
  `fileUserName` varchar(500) default NULL,
  PRIMARY KEY  (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
INSERT INTO `tb_file` VALUES ('f29fa993a97b4f9ca28b65906a5ca3b1', 'png', '1', '/upload/User201666930154.png', '2016-06-06 09:08:54', 'fb7e2fb3212443b1b9c954e98a0c8c26', 'User201666930154.png', '大王.png');

-- ----------------------------
-- Table structure for `tb_integral_detailed`
-- ----------------------------
DROP TABLE IF EXISTS `tb_integral_detailed`;
CREATE TABLE `tb_integral_detailed` (
  `user_id` int(11) NOT NULL default '0',
  `addtime` datetime default NULL,
  `integral` int(11) default NULL,
  `des` varchar(2000) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_integral_detailed
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `new_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `msg` varchar(2000) default NULL,
  `addtime` datetime default NULL,
  `send_user_id` int(11) default NULL,
  PRIMARY KEY  (`new_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_news
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scene`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene`;
CREATE TABLE `tb_scene` (
  `scene_id` int(10) unsigned NOT NULL auto_increment,
  `scene_name` varchar(500) default NULL,
  `addtime` datetime default NULL,
  `state_code_id` int(11) default NULL,
  `visit_num` int(11) default NULL,
  `use_num` int(11) default '0',
  `dic_code_id` int(11) default NULL,
  `cover` varchar(500) default NULL,
  `scene_custom_id` int(11) default NULL,
  `js_file_id` int(11) default NULL,
  `css_file_id` int(11) default NULL,
  `scene_code` varchar(50) default NULL,
  `sh` int(11) default NULL,
  `tj` int(11) default '0',
  `musicUrl` varchar(500) default NULL,
  `videoUrl` varchar(500) default NULL,
  `movietype` int(11) default NULL,
  `qrCode` varchar(500) default NULL,
  `author` varchar(50) default NULL,
  `userNum` int(11) default NULL,
  `MouseClick` int(11) default NULL,
  `des` varchar(500) default NULL,
  `scene_typeid` int(11) default NULL,
  `Modeled` int(11) default NULL,
  `fileType` varchar(100) default NULL,
  `x` int(11) default NULL,
  `y` int(11) default NULL,
  `w` int(11) default NULL,
  `h` int(11) default NULL,
  PRIMARY KEY  (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_scene
-- ----------------------------
INSERT INTO `tb_scene` VALUES ('69', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', '/upload/User201666930154.png', '1', '0', '0', '30442a12-e880-43d6-9914-fd2007af62f9', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', '', null, '1', '1', '0', '53', '132', '132');
INSERT INTO `tb_scene` VALUES ('70', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', 'b45fdc00-01c0-48fe-8999-dab93af61886', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', '', null, '1', null, null, null, null, null);
INSERT INTO `tb_scene` VALUES ('71', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', '1c210dcf-ceac-4fe0-8e21-6d0ce12ba61a', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', null, null, '1', null, null, null, null, null);
INSERT INTO `tb_scene` VALUES ('72', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', 'bbe93187-4986-45c2-a1fb-eadd3a34a784', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', null, null, '1', null, null, null, null, null);
INSERT INTO `tb_scene` VALUES ('73', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', '36015b0e-852d-4afb-abf2-83b341e36b04', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', null, null, '1', null, null, null, null, null);
INSERT INTO `tb_scene` VALUES ('74', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', '02a9c60e-c1a9-492f-9f43-b61782e47e1a', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', null, null, '1', null, null, null, null, null);
INSERT INTO `tb_scene` VALUES ('75', '默认名称', '0001-01-01 00:00:00', '0', '0', '0', '12', 'default_thum.jpg', '1', '0', '0', '86019205-314c-429d-bf0d-39975416552c', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', '0', null, null, '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_scenenew`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scenenew`;
CREATE TABLE `tb_scenenew` (
  `sceneid_bigint` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `scenecode_varchar` varchar(50) NOT NULL COMMENT '场景编码',
  `scenename_varchar` varchar(50) default NULL COMMENT '场景名称',
  `scenetype_int` int(11) NOT NULL default '0' COMMENT '场景类型',
  `userid_int` int(50) NOT NULL COMMENT '用户表主键',
  `hitcount_int` int(11) NOT NULL default '0' COMMENT '点击数',
  `createtime_time` datetime default NULL,
  `musicurl_varchar` varchar(500) default NULL COMMENT '音乐链接',
  `videocode_varchar` varchar(2000) default NULL COMMENT '视频链接',
  `showstatus_int` int(11) NOT NULL default '1' COMMENT '显示状态1显示,2关闭',
  `thumbnail_varchar` varchar(200) default NULL COMMENT '场景缩略图',
  `movietype_int` int(11) default '0' COMMENT '翻页方式',
  `desc_varchar` varchar(500) default NULL COMMENT '场景描述',
  `ip_varchar` varchar(50) default NULL,
  `delete_int` int(11) NOT NULL default '0' COMMENT '0未删,1已经删除 ',
  `tagid_int` int(11) NOT NULL default '0',
  `sourceId_int` int(11) NOT NULL default '0',
  `biztype_int` int(11) NOT NULL default '1',
  `eqid_int` int(11) default NULL COMMENT '生成二维码',
  `eqcode` varchar(50) default NULL,
  `datacount_int` int(11) NOT NULL default '0',
  `musictype_int` int(11) NOT NULL default '3',
  `usecount_int` int(11) NOT NULL default '0',
  `fromsceneid_bigint` bigint(20) NOT NULL default '0',
  `publishTime` int(10) unsigned NOT NULL default '0',
  `updateTime` int(10) unsigned NOT NULL default '0',
  `rank` bigint(20) unsigned default '0',
  `shenhe` tinyint(1) unsigned default '1',
  `isadvanceduser` tinyint(1) unsigned default '0',
  `hideeqad` int(8) unsigned default '0',
  `lastpageid` bigint(20) unsigned default NULL,
  `is_tpl` tinyint(1) unsigned default '0',
  `is_public` tinyint(1) unsigned default '1',
  PRIMARY KEY  (`sceneid_bigint`),
  UNIQUE KEY `scenecode` (`scenecode_varchar`),
  KEY `userid` USING BTREE (`userid_int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_scenenew
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scenepage`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scenepage`;
CREATE TABLE `tb_scenepage` (
  `pageid_bigint` bigint(20) NOT NULL auto_increment COMMENT '主键（场景页面表）',
  `sceneid_bigint` bigint(20) NOT NULL COMMENT '场景表主键',
  `scenecode_varchar` varchar(50) NOT NULL COMMENT '场景编码',
  `pagecurrentnum_int` int(11) NOT NULL default '1' COMMENT '当前页数',
  `createtime_time` datetime default NULL,
  `content_text` longtext COMMENT '该页面所有组件属性都存储在这里',
  `pagename_varchar` varchar(50) default NULL COMMENT '页面名称',
  `userid_int` int(11) NOT NULL COMMENT '用户表主键',
  `properties_text` text NOT NULL,
  `myTypl_id` bigint(20) unsigned NOT NULL default '0' COMMENT '是否模板',
  PRIMARY KEY  (`pageid_bigint`),
  KEY `sceneid` USING BTREE (`scenecode_varchar`),
  KEY `scenid` USING BTREE (`sceneid_bigint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_scenepage
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scene_control_value`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene_control_value`;
CREATE TABLE `tb_scene_control_value` (
  `scene_control_id` int(10) unsigned NOT NULL auto_increment,
  `scene_id` int(11) default NULL,
  `scene_pag_id` int(11) default NULL,
  `control_id` int(11) default NULL,
  `attr_id` int(11) default NULL,
  `value_id` int(11) default NULL,
  `value_text` varchar(500) default NULL,
  `up_scene_control_id` int(11) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`scene_control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_scene_control_value
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scene_custom`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene_custom`;
CREATE TABLE `tb_scene_custom` (
  `scene_custom_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `type_msg` varchar(50) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`scene_custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_scene_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scene_pag`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene_pag`;
CREATE TABLE `tb_scene_pag` (
  `scene_pag_id` int(10) unsigned NOT NULL auto_increment,
  `flip_code_id` int(11) default NULL,
  `num` int(11) default NULL,
  `content_text` longtext,
  `scene_code` varchar(50) default NULL,
  `pageName` varchar(50) default NULL,
  PRIMARY KEY  (`scene_pag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_scene_pag
-- ----------------------------
INSERT INTO `tb_scene_pag` VALUES ('244', null, '1', '', '30442a12-e880-43d6-9914-fd2007af62f9', '');
INSERT INTO `tb_scene_pag` VALUES ('245', null, '1', '[{\"content\":\"点击此处进行编辑\",\"css\":{\"top\":\"100px\",\"left\":\"0px\",\"zIndex\":\"101\",\"lineHeight\":\"1.0\",\"height\":38},\"id\":9985648960,\"num\":1,\"pageId\":\"245\",\"properties\":{},\"sceneId\":\"b45fdc00-01c0-48fe-8999-dab93af61886\",\"title\":null,\"type\":2}]', 'b45fdc00-01c0-48fe-8999-dab93af61886', '');
INSERT INTO `tb_scene_pag` VALUES ('246', null, '1', '', '1c210dcf-ceac-4fe0-8e21-6d0ce12ba61a', '');
INSERT INTO `tb_scene_pag` VALUES ('247', null, '1', '', 'bbe93187-4986-45c2-a1fb-eadd3a34a784', '');
INSERT INTO `tb_scene_pag` VALUES ('248', null, '1', '', '36015b0e-852d-4afb-abf2-83b341e36b04', '');
INSERT INTO `tb_scene_pag` VALUES ('249', null, '1', '', '02a9c60e-c1a9-492f-9f43-b61782e47e1a', '');
INSERT INTO `tb_scene_pag` VALUES ('250', null, '1', '', '86019205-314c-429d-bf0d-39975416552c', '');

-- ----------------------------
-- Table structure for `tb_show_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_show_user`;
CREATE TABLE `tb_show_user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) default NULL,
  `user_pwd` varchar(50) default NULL,
  `nick_name` varchar(50) default NULL,
  `Phone` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `qq` varchar(50) default NULL,
  `wechat` varchar(50) default NULL,
  `sina_blog` varchar(50) default NULL,
  `gender` int(10) default NULL,
  `integral` int(11) default NULL,
  `user_type_code_id` int(11) default NULL,
  `addtime` datetime default NULL,
  `state_code_id` int(11) default NULL,
  `headImg` varchar(100) default NULL,
  `checkCode` varchar(50) default NULL,
  `checkTime` datetime default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_show_user
-- ----------------------------
INSERT INTO `tb_show_user` VALUES ('fb7e2fb3212443b1b9c954e98a0c8c26', 'admin', 'admin', '管理员', 'admin', '123123', '', null, null, '1', '0', '10', '2016-05-24 10:07:17', '0', null, null, null);

-- ----------------------------
-- Table structure for `tb_user_read`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_read`;
CREATE TABLE `tb_user_read` (
  `new_id` int(11) default NULL,
  `type` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_user_read
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_scene`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_scene`;
CREATE TABLE `tb_user_scene` (
  `user_scene_id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `scene_id` int(11) default NULL,
  `scene_custom_id` int(11) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`user_scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_user_scene
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_cssfile`
-- ----------------------------
DROP TABLE IF EXISTS `ts_cssfile`;
CREATE TABLE `ts_cssfile` (
  `css_file_id` int(10) unsigned NOT NULL auto_increment,
  `file_name` varchar(50) default NULL,
  `choice` int(11) default NULL,
  PRIMARY KEY  (`css_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_cssfile
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_journal`
-- ----------------------------
DROP TABLE IF EXISTS `ts_journal`;
CREATE TABLE `ts_journal` (
  `addtime` datetime default NULL,
  `user_id` int(11) default NULL,
  `des` varchar(2000) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_journal
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_jsfile`
-- ----------------------------
DROP TABLE IF EXISTS `ts_jsfile`;
CREATE TABLE `ts_jsfile` (
  `js_file_id` int(10) unsigned NOT NULL auto_increment,
  `file_name` varchar(50) default NULL,
  `choice` int(11) default NULL,
  PRIMARY KEY  (`js_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_jsfile
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_temps`
-- ----------------------------
DROP TABLE IF EXISTS `ts_temps`;
CREATE TABLE `ts_temps` (
  `temp_id` int(10) unsigned NOT NULL auto_increment,
  `temp_name` varchar(50) default NULL,
  `use_num` int(11) default NULL,
  `addtime` datetime default NULL,
  `type_code_id` int(11) default NULL,
  `des` varchar(2000) default NULL,
  `state_code_id` int(11) default NULL,
  `cover` varchar(500) default NULL,
  `js_file_id` int(11) default NULL,
  `css_file_id` int(11) default NULL,
  `sence_code_id` int(11) default NULL,
  `Money` double default NULL,
  `MouseClick` int(11) default NULL,
  `temp_code` varchar(50) default NULL,
  `sh` int(11) default NULL,
  `tj` int(11) default NULL,
  `musicUrl` varchar(500) default NULL,
  `videoUrl` varchar(500) default NULL,
  `movietype` int(11) default NULL,
  `qrCode` varchar(500) default NULL,
  `author` varchar(50) default NULL,
  `userNum` int(11) default NULL,
  `fileType` varchar(100) default NULL,
  `x` int(11) default NULL,
  `y` int(11) default NULL,
  `w` int(11) default NULL,
  `h` int(11) default NULL,
  `scene_custom_id` int(11) default NULL,
  `scene_typeid` int(11) default NULL,
  PRIMARY KEY  (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_temps
-- ----------------------------
INSERT INTO `ts_temps` VALUES ('1', '默认名称', '0', '0001-01-01 00:00:00', null, null, '0', 'default_thum.jpg', '0', '0', null, null, '2', '105978e2-6d29-46f5-8a31-b6196b848f83', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', null, null, null, null, null, '1', null);
INSERT INTO `ts_temps` VALUES ('2', '默认名称', '0', '0001-01-01 00:00:00', null, null, '0', 'default_thum.jpg', '0', '0', null, null, '2', '1414c135-a524-4419-994f-3313add452e8', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', null, null, null, null, null, '1', null);
INSERT INTO `ts_temps` VALUES ('3', '默认名称', '0', '0001-01-01 00:00:00', null, null, '0', 'default_thum.jpg', '0', '0', null, null, '0', '4caaab1d-31a5-42f6-831f-9e9f6a0bdb85', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', null, null, null, null, null, '1', null);
INSERT INTO `ts_temps` VALUES ('4', '默认名称', '0', '0001-01-01 00:00:00', null, null, '0', 'default_thum.jpg', '0', '0', null, null, '3', 'ccf57b2e-f092-4e2b-89e7-e2ddc3ffca7f', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', null, null, null, null, null, '1', null);
INSERT INTO `ts_temps` VALUES ('5', '默', '0', '0001-01-01 00:00:00', null, null, '0', 'default_thum.jpg', '0', '0', null, '12', '4', '95db864a-8a69-457c-a087-ceb205410a30', '1', '1', '', '', '9', '', 'fb7e2fb3212443b1b9c954e98a0c8c26', '0', null, null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for `ts_temp_control_value`
-- ----------------------------
DROP TABLE IF EXISTS `ts_temp_control_value`;
CREATE TABLE `ts_temp_control_value` (
  `temp_control_id` int(10) unsigned NOT NULL auto_increment,
  `temp_id` int(11) default NULL,
  `pag_id` int(11) default NULL,
  `control_id` int(11) default NULL,
  `attr_id` int(11) default NULL,
  `value_id` int(11) default NULL,
  `value_text` varchar(2000) default NULL,
  `up_temp_control_id` int(11) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`temp_control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_temp_control_value
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_temp_pag`
-- ----------------------------
DROP TABLE IF EXISTS `ts_temp_pag`;
CREATE TABLE `ts_temp_pag` (
  `pag_id` int(10) unsigned NOT NULL auto_increment,
  `temp_id` int(11) default NULL,
  `num` int(11) default NULL,
  `type_code_id` int(11) default NULL,
  `content_text` longtext,
  `temp_code` varchar(50) default NULL,
  `pageName` varchar(50) default NULL,
  `addtime` datetime default NULL,
  PRIMARY KEY  (`pag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_temp_pag
-- ----------------------------
INSERT INTO `ts_temp_pag` VALUES ('1', null, '1', null, '', '105978e2-6d29-46f5-8a31-b6196b848f83', '', '2016-06-06 09:38:39');
INSERT INTO `ts_temp_pag` VALUES ('2', null, '1', null, '', '1414c135-a524-4419-994f-3313add452e8', '', '2016-06-06 09:48:51');
INSERT INTO `ts_temp_pag` VALUES ('3', null, '1', null, '', '4caaab1d-31a5-42f6-831f-9e9f6a0bdb85', '', '2016-06-06 09:48:52');
INSERT INTO `ts_temp_pag` VALUES ('4', null, '1', null, '', 'ccf57b2e-f092-4e2b-89e7-e2ddc3ffca7f', '', '2016-06-06 09:48:52');
INSERT INTO `ts_temp_pag` VALUES ('5', null, '1', null, '', '95db864a-8a69-457c-a087-ceb205410a30', '', '2016-06-06 09:48:53');
INSERT INTO `ts_temp_pag` VALUES ('6', null, '1', null, '', '1f866983-bef6-4023-aed3-a972e07d7d2d', '', '2016-06-06 09:48:53');
INSERT INTO `ts_temp_pag` VALUES ('7', null, '1', null, '', '3298cd88-09d1-4634-87d7-4a2443be6c90', '', '2016-06-06 09:48:54');

-- ----------------------------
-- Table structure for `ts_values`
-- ----------------------------
DROP TABLE IF EXISTS `ts_values`;
CREATE TABLE `ts_values` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `attr_id` int(11) default NULL,
  `value_text` varchar(2000) default NULL,
  `value_regular` varchar(500) default NULL,
  `custom_code_id` int(11) default NULL,
  `state_code_id` int(11) default NULL,
  PRIMARY KEY  (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ts_values
-- ----------------------------

-- ----------------------------
-- Table structure for `t_acl`
-- ----------------------------
DROP TABLE IF EXISTS `t_acl`;
CREATE TABLE `t_acl` (
  `ID` varchar(36) NOT NULL,
  `PRINCIPALTYPE` varchar(10) default NULL,
  `PRINCIPALID` varchar(36) default NULL,
  `RESOURCETYPE` varchar(10) default NULL,
  `RESOURCEID` varchar(36) default NULL,
  `ACLSTATE` decimal(5,0) default NULL,
  `ACLTRISTATE` decimal(5,0) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_acl
-- ----------------------------
INSERT INTO `t_acl` VALUES ('08dce576-9c35-446a-9b17-56c9ca0a666e', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '02739745-8601-499a-a103-bf1800b97f24', null, null);
INSERT INTO `t_acl` VALUES ('0a14a1c9-9368-4474-adb3-b4e91985952f', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'e9365401-866d-41a6-a6df-6ff40ec76bcf', null, null);
INSERT INTO `t_acl` VALUES ('0abaffe5-a75c-44e3-84b3-04f4b99c6704', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '0a0a40d3-afa4-4c8c-b75d-70fb3e4f3107', null, null);
INSERT INTO `t_acl` VALUES ('0e9e0630-1dd4-4573-a1ba-5636cc3b4fef', 'role', '1', 'menu', '550e4f95-cd4e-4931-89e0-6a0822fdf85c', null, null);
INSERT INTO `t_acl` VALUES ('15ae97c8-7abb-4a46-94c6-534c03529029', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', 'd677c11b-091a-49a8-8592-ae7792c1de08', null, null);
INSERT INTO `t_acl` VALUES ('1cc0705a-5fee-4262-a7ed-9f538fec69f5', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', 'ca3ab255-5cb6-43a5-887c-dec31cdb15f3', null, null);
INSERT INTO `t_acl` VALUES ('25c5595c-7082-4222-b5e3-54549ddc7f47', 'role', '1', 'menu', 'a0bf5f13-a2b4-4fa1-a708-2dab006b8692', null, null);
INSERT INTO `t_acl` VALUES ('26d8a4ec-bd57-40a2-9154-a5394f736eb3', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '0c75da0a-d0a6-4d82-9076-91804711237b', null, null);
INSERT INTO `t_acl` VALUES ('2e02c310-edd5-444d-a068-44b296431537', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', 'e9365401-866d-41a6-a6df-6ff40ec76bcf', null, null);
INSERT INTO `t_acl` VALUES ('313ff1d4-2322-4226-8048-1b4a790be938', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '77e25be8-4f8c-4b47-a737-8f297d4207a9', null, null);
INSERT INTO `t_acl` VALUES ('353fe1e5-2a6f-4eb2-8e67-ed9a25cddf4a', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '2e1480ef-5466-457d-a228-fc585adadc97', null, null);
INSERT INTO `t_acl` VALUES ('3b84db03-d498-4d2c-b074-58fc19a1a4c9', 'role', '1', 'menu', '8721185c-9575-47da-9b6e-cdb811c59a8a', null, null);
INSERT INTO `t_acl` VALUES ('3ce9efc1-260f-4432-820a-dcdcdd9caf6f', 'role', '1', 'menu', 'e1e7da83-ebf3-493c-bbd0-b7a98882a863', null, null);
INSERT INTO `t_acl` VALUES ('3d97d0ca-3809-4a80-9e19-a7e90a5f53a8', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'ca3ab255-5cb6-43a5-887c-dec31cdb15f3', null, null);
INSERT INTO `t_acl` VALUES ('48eee2ef-dc6f-4a95-908d-3a47f36061c2', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'f62e5b56-aec3-45f1-9c9a-848983650a68', null, null);
INSERT INTO `t_acl` VALUES ('4ee04d14-d1b3-4044-b7d3-b5cf8403e8f1', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', 'f62e5b56-aec3-45f1-9c9a-848983650a68', null, null);
INSERT INTO `t_acl` VALUES ('5257bda1-31bf-414d-bb48-bfcb062def0c', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '395b1ccf-88e8-4aa4-be85-110b3b1cc422', null, null);
INSERT INTO `t_acl` VALUES ('527e0760-0278-4fe6-b34d-8edb276d367f', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', 'def4484a-dff5-41d5-8565-774576651e0b', null, null);
INSERT INTO `t_acl` VALUES ('5294ea29-05dd-4d2f-8f77-dffba0a38769', 'role', '1', 'menu', '0e5058fc-e938-44df-bd2c-db921af551a2', null, null);
INSERT INTO `t_acl` VALUES ('58df014b-6c8e-46da-941f-61b742f85e63', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '69ca88e9-dd8d-4c68-b533-5c09df18d041', null, null);
INSERT INTO `t_acl` VALUES ('5bd72f6e-4b5e-4a44-8329-49a43018fd0b', 'role', '1', 'menu', 'a71ec8d3-57f5-4ddc-8d84-18f82ae115ee', null, null);
INSERT INTO `t_acl` VALUES ('6b281bf4-f9f4-4599-bf96-00c5f2634fe7', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '2e1480ef-5466-457d-a228-fc585adadc97', null, null);
INSERT INTO `t_acl` VALUES ('6c061af3-9943-4cfe-bbc5-a607a06b6827', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '6f2330fc-7b1e-49f0-9f71-9eb8c7799d5c', null, null);
INSERT INTO `t_acl` VALUES ('6e510136-3f0e-4700-97c3-67cc7101f3c8', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'bd90249a-f081-472b-a478-9f020e6a0162', null, null);
INSERT INTO `t_acl` VALUES ('73a7f26a-9429-4354-956f-51c1db344fd5', 'role', '1', 'menu', '80be36cb-94cd-4667-a54f-68f8ba3e8cf7', null, null);
INSERT INTO `t_acl` VALUES ('757f1d2b-41ab-4fcf-b0bf-ce1037c269d1', 'role', '1', 'menu', '952b2b19-b543-4a0b-969e-726207e8584d', null, null);
INSERT INTO `t_acl` VALUES ('76d94ab4-f6ba-40e6-a9b7-9d594b641769', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'ac74ef29-e252-4f31-9eef-b6aeab49472a', null, null);
INSERT INTO `t_acl` VALUES ('80db7765-5108-4fbc-897e-8fae2142810a', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '0a0a40d3-afa4-4c8c-b75d-70fb3e4f3107', null, null);
INSERT INTO `t_acl` VALUES ('82972b61-f5b2-46a0-8775-fa160a1b0125', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', 'def4484a-dff5-41d5-8565-774576651e0b', null, null);
INSERT INTO `t_acl` VALUES ('8381fe67-5393-4206-bc54-778499d4630a', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '2fb423a2-798d-49ce-a76b-ccafe48ea0aa', null, null);
INSERT INTO `t_acl` VALUES ('84184ee6-e877-4319-ac2f-c44ba14a1849', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '8721185c-9575-47da-9b6e-cdb811c59a8a', null, null);
INSERT INTO `t_acl` VALUES ('843efad5-ca18-4931-b8bb-8a983159dc1b', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '0c75da0a-d0a6-4d82-9076-91804711237b', null, null);
INSERT INTO `t_acl` VALUES ('89c12ad6-1880-41f5-a31c-b131e6a52366', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '98c95cda-84b3-49d7-9c75-f0b5c185fc2e', null, null);
INSERT INTO `t_acl` VALUES ('8b02e28b-afa4-4b58-b2d3-0edf306f8af1', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '6f2330fc-7b1e-49f0-9f71-9eb8c7799d5c', null, null);
INSERT INTO `t_acl` VALUES ('8c986d51-b557-416f-a192-c1e3022db519', 'role', '1', 'menu', '4848adb2-b799-4544-8c1e-f2bfd8ed625b', null, null);
INSERT INTO `t_acl` VALUES ('8d76af27-1db8-4527-81ca-af6d2129a861', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '747f7426-9947-49b4-8126-89c3d3a7b0d8', null, null);
INSERT INTO `t_acl` VALUES ('957f3651-9166-4d46-9eb0-61856e95ceec', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '2fb423a2-798d-49ce-a76b-ccafe48ea0aa', null, null);
INSERT INTO `t_acl` VALUES ('97e21798-df94-4814-a97a-42d7f3555592', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '77e25be8-4f8c-4b47-a737-8f297d4207a9', null, null);
INSERT INTO `t_acl` VALUES ('980d50cb-8f35-4a35-b840-8b05475313b8', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '0471e009-824e-4757-a45f-3a9dc4950ff1', null, null);
INSERT INTO `t_acl` VALUES ('99ea587d-71d1-452c-84b0-f3b71bf8e3f0', 'role', '1', 'menu', 'b148724d-cfa8-4c89-a7dc-02e41d6de9b3', null, null);
INSERT INTO `t_acl` VALUES ('9c22afa4-23c5-4b86-ba35-d1f48c0da9bb', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '0471e009-824e-4757-a45f-3a9dc4950ff1', null, null);
INSERT INTO `t_acl` VALUES ('9daeacd9-91d9-4fb1-a798-dcd2287cac94', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '7e154e00-0260-4630-9053-6aa9931e3f47', null, null);
INSERT INTO `t_acl` VALUES ('9fe7ea4c-b20d-484f-8c47-af58475977c8', 'role', '990cae75-6dca-4f2f-92d4-792aaf3771b2', 'menu', '0e85b3af-2eaf-4a54-af2a-d1c52ba797bf', null, null);
INSERT INTO `t_acl` VALUES ('a7d2e033-13d4-4e1f-9f76-e8e1d69e696a', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '80be36cb-94cd-4667-a54f-68f8ba3e8cf7', null, null);
INSERT INTO `t_acl` VALUES ('a98f1d72-4af3-4fb8-8e7a-96e496d51deb', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '7e655e0a-b34d-415d-8de9-69c6e0403811', null, null);
INSERT INTO `t_acl` VALUES ('aafb7e4c-78d2-42c3-b33a-378de481f2a7', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '952b2b19-b543-4a0b-969e-726207e8584d', null, null);
INSERT INTO `t_acl` VALUES ('ab5df40e-0c01-41df-b9a2-10e77bfe6add', 'role', '1', 'menu', '747f7426-9947-49b4-8126-89c3d3a7b0d8', null, null);
INSERT INTO `t_acl` VALUES ('afa7d836-54b9-40af-9a4b-0efa40d30186', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '7e655e0a-b34d-415d-8de9-69c6e0403811', null, null);
INSERT INTO `t_acl` VALUES ('b0a62e05-5e0d-47e1-a9cd-665b0d6dc637', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '5813d856-dfae-4da9-849d-7e0eabc9f1fc', null, null);
INSERT INTO `t_acl` VALUES ('b65e9ebe-4e9a-4ca4-a9b6-86d108c44b05', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', 'd677c11b-091a-49a8-8592-ae7792c1de08', null, null);
INSERT INTO `t_acl` VALUES ('b7dd1dcb-bf4c-489e-8c25-15f696a082f3', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '98c95cda-84b3-49d7-9c75-f0b5c185fc2e', null, null);
INSERT INTO `t_acl` VALUES ('ba4b5760-0f9c-442d-98cd-3066b05f5112', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '02739745-8601-499a-a103-bf1800b97f24', null, null);
INSERT INTO `t_acl` VALUES ('c24be15d-8864-45d5-8292-34c8d68d5af6', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', '5813d856-dfae-4da9-849d-7e0eabc9f1fc', null, null);
INSERT INTO `t_acl` VALUES ('c3cb36c5-7715-4f42-9c37-05e9e86d0e7c', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '845bde4e-2350-4471-b9bd-374bfd71896b', null, null);
INSERT INTO `t_acl` VALUES ('c989f247-e1ef-4754-91a9-d7de7947683b', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', 'c5b9dbae-facc-4f0d-a280-3b4474c3d330', null, null);
INSERT INTO `t_acl` VALUES ('cd28051c-3c24-4ac0-85ef-f6599666b7ae', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '7e154e00-0260-4630-9053-6aa9931e3f47', null, null);
INSERT INTO `t_acl` VALUES ('d13da1ae-f8f7-4747-b959-5d98f193fde1', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '550e4f95-cd4e-4931-89e0-6a0822fdf85c', null, null);
INSERT INTO `t_acl` VALUES ('d90c8686-9245-44c1-b1a9-23ea6f715852', 'role', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7', 'menu', '7188c54b-fd78-4aea-9792-cea1c90b8f2f', null, null);
INSERT INTO `t_acl` VALUES ('da9045ec-6953-48aa-9e51-717b47bd87f7', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '88d1f686-a6b9-46b0-bf0f-2c80180c6783', null, null);
INSERT INTO `t_acl` VALUES ('ddde1774-0090-45ee-8d83-b13856364fef', 'role', '1', 'menu', '1', null, null);
INSERT INTO `t_acl` VALUES ('dfd00b5a-a672-41b2-9a44-333f4192e488', 'role', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', 'menu', '495e11e5-d087-46c2-87fb-17281a07d2a4', null, null);
INSERT INTO `t_acl` VALUES ('e5082252-0cad-44ec-940c-07fa01226c14', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', 'c5b9dbae-facc-4f0d-a280-3b4474c3d330', null, null);
INSERT INTO `t_acl` VALUES ('e74f517c-6531-4b42-b85a-a82086b88b66', 'role', '1bedf97c-dfc9-4c59-a805-13bf378d631a', 'menu', '0e85b3af-2eaf-4a54-af2a-d1c52ba797bf', null, null);
INSERT INTO `t_acl` VALUES ('ee0d3685-fb1f-4042-845b-1c9c2c00ca09', 'role', '1', 'menu', '1e40e3a4-1d69-43c7-a73e-12600c04a35f', null, null);
INSERT INTO `t_acl` VALUES ('efa89d04-38e0-4bfc-9aa7-fa0dcd769c20', 'role', '1', 'menu', '7188c54b-fd78-4aea-9792-cea1c90b8f2f', null, null);
INSERT INTO `t_acl` VALUES ('f57c37db-d0ef-4b81-89d3-bcd6a6f0bc6d', 'role', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', 'menu', 'bd90249a-f081-472b-a478-9f020e6a0162', null, null);
INSERT INTO `t_acl` VALUES ('fc0cc043-a61f-417a-b187-fc2a905c181e', 'role', '1', 'menu', '845bde4e-2350-4471-b9bd-374bfd71896b', null, null);
INSERT INTO `t_acl` VALUES ('fe4f5921-884d-4a50-9d75-4e915fa4373f', 'role', '1', 'menu', 'b22461d2-f0ad-488a-b6c0-461722c3a94f', null, null);

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `ID` varchar(36) NOT NULL,
  `CODE` varchar(32) default NULL,
  `ABBREVIATION` varchar(100) default NULL,
  `MARK` varchar(100) default NULL,
  `TYPE` varchar(100) default NULL,
  `GRADE` varchar(100) default NULL,
  `AREA` varchar(100) default NULL,
  `LINKMAN` varchar(100) default NULL,
  `TEL` varchar(50) default NULL,
  `FAX` varchar(50) default NULL,
  `ZIPCODE` varchar(6) default NULL,
  `ADDRESS` varchar(100) default NULL,
  `EMAIL` varchar(50) default NULL,
  `WEBSITE` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1b9bfefe-acb8-4370-afda-8a62c2a09051', '1', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `ID` varchar(36) NOT NULL,
  `MARK` varchar(100) default NULL,
  `TYPE` varchar(100) default NULL,
  `GRADE` varchar(100) default NULL,
  `LINKMAN` varchar(100) default NULL,
  `LINKMANEXP` varchar(500) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------

-- ----------------------------
-- Table structure for `t_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `ID` varchar(36) NOT NULL,
  `USERNAME` varchar(100) default NULL,
  `PASSWORD` varchar(32) default NULL,
  `LOGINIP` varchar(100) default NULL,
  `ENABLESTATE` char(1) default NULL COMMENT '0禁用,1启用',
  `ENABLETIME` varchar(19) default NULL,
  `LOGINTIME` varchar(19) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login
-- ----------------------------
INSERT INTO `t_login` VALUES ('96804794-2d94-48aa-8c9b-d929308b0689', 'admin_superMR', '000000', '0:0:0:0:0:0:0:1', '1', '', '2016-06-06 11:39:23', '2014-06-21 20:17:38', '2016-03-21 09:46:20');
INSERT INTO `t_login` VALUES ('cfc4b0a4-0cad-499b-843f-c6ffd049602a', 'show_admin', '000000', '0:0:0:0:0:0:0:1', '1', null, '2016-06-06 14:22:04', '2016-05-23 09:40:11', null);

-- ----------------------------
-- Table structure for `t_loginrole`
-- ----------------------------
DROP TABLE IF EXISTS `t_loginrole`;
CREATE TABLE `t_loginrole` (
  `LOGINID` varchar(36) default NULL,
  `ROLEID` varchar(36) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginrole
-- ----------------------------
INSERT INTO `t_loginrole` VALUES ('0c76917e-b728-4f30-89bb-6e2e0ebe5487', '1bedf97c-dfc9-4c59-a805-13bf378d631a');
INSERT INTO `t_loginrole` VALUES ('14836575-2690-4cc1-a419-bd2be23b6824', '990cae75-6dca-4f2f-92d4-792aaf3771b2');
INSERT INTO `t_loginrole` VALUES ('96804794-2d94-48aa-8c9b-d929308b0689', '1');
INSERT INTO `t_loginrole` VALUES ('cfc4b0a4-0cad-499b-843f-c6ffd049602a', 'd0f16ee5-a627-41f6-ba54-4ac3e40739d7');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `ID` varchar(36) NOT NULL,
  `PID` varchar(36) default NULL,
  `NAME` varchar(100) default NULL,
  `PATH` varchar(100) default NULL,
  `ICON` varchar(100) default NULL,
  `ORDERNUM` decimal(5,0) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('0e5058fc-e938-44df-bd2c-db921af551a2', '1', '角色管理', '/back/role.do?cmd=main', null, '2', '2014-06-20 00:24:13', '2014-06-20 01:52:28');
INSERT INTO `t_menu` VALUES ('1', null, '系统管理', null, null, '0', null, '2014-06-21 18:04:48');
INSERT INTO `t_menu` VALUES ('1e40e3a4-1d69-43c7-a73e-12600c04a35f', '1', '功能管理', '', '', '1', '2014-06-20 00:26:06', '2014-07-06 18:29:39');
INSERT INTO `t_menu` VALUES ('4848adb2-b799-4544-8c1e-f2bfd8ed625b', '1e40e3a4-1d69-43c7-a73e-12600c04a35f', '资源管理', '/back/resource.do?cmd=main', null, '1', '2014-06-20 00:26:31', '2014-06-20 01:52:38');
INSERT INTO `t_menu` VALUES ('550e4f95-cd4e-4931-89e0-6a0822fdf85c', '845bde4e-2350-4471-b9bd-374bfd71896b', '用户场景管理', '/back/showScene_list.do', '', '1', '2016-06-01 17:00:47', null);
INSERT INTO `t_menu` VALUES ('7188c54b-fd78-4aea-9792-cea1c90b8f2f', '845bde4e-2350-4471-b9bd-374bfd71896b', '网站模板管理', '/back/showTemps_list.do', '', '2', '2016-06-06 11:39:51', '2016-06-06 11:40:24');
INSERT INTO `t_menu` VALUES ('747f7426-9947-49b4-8126-89c3d3a7b0d8', '80be36cb-94cd-4667-a54f-68f8ba3e8cf7', '基础信息类型表', '/back/showCodeGroup_list.do', '', '1', '2016-06-04 11:05:17', '2016-06-04 11:06:22');
INSERT INTO `t_menu` VALUES ('80be36cb-94cd-4667-a54f-68f8ba3e8cf7', '', 'show信息', '', '', '2', '2016-06-04 11:04:34', '2016-06-04 11:04:43');
INSERT INTO `t_menu` VALUES ('845bde4e-2350-4471-b9bd-374bfd71896b', '', 'show网站', '', '', '1', '2016-05-23 10:17:05', '2016-05-23 10:17:35');
INSERT INTO `t_menu` VALUES ('8721185c-9575-47da-9b6e-cdb811c59a8a', '845bde4e-2350-4471-b9bd-374bfd71896b', '网站用户管理', '/back/showUser_list.do', '', '0', '2016-05-23 10:17:20', '2016-05-23 10:20:52');
INSERT INTO `t_menu` VALUES ('952b2b19-b543-4a0b-969e-726207e8584d', '80be36cb-94cd-4667-a54f-68f8ba3e8cf7', '基础信息值表', '/back/showCode_list.do', '', '0', '2016-06-04 11:05:07', '2016-06-04 11:05:53');
INSERT INTO `t_menu` VALUES ('a0bf5f13-a2b4-4fa1-a708-2dab006b8692', '1e40e3a4-1d69-43c7-a73e-12600c04a35f', '菜单管理', '/back/menu.do?cmd=main', null, '0', '2014-06-20 00:26:19', '2014-06-20 01:52:35');
INSERT INTO `t_menu` VALUES ('a71ec8d3-57f5-4ddc-8d84-18f82ae115ee', 'b22461d2-f0ad-488a-b6c0-461722c3a94f', '组织机构信息', '/back/company.do?cmd=updateInput&flag=setting', '', '0', '2014-06-20 00:23:17', '2016-03-21 09:06:31');
INSERT INTO `t_menu` VALUES ('b148724d-cfa8-4c89-a7dc-02e41d6de9b3', '1', '用户管理', '/back/login.do?cmd=list', null, '1', '2014-06-20 00:24:00', '2014-06-21 18:03:22');
INSERT INTO `t_menu` VALUES ('b22461d2-f0ad-488a-b6c0-461722c3a94f', '1', '机构管理', '', '', '0', '2014-06-20 00:23:01', '2016-03-21 09:06:01');
INSERT INTO `t_menu` VALUES ('e1e7da83-ebf3-493c-bbd0-b7a98882a863', 'b22461d2-f0ad-488a-b6c0-461722c3a94f', '组织机构树', '/back/company.do?cmd=main', null, '1', '2014-06-20 00:23:37', '2014-06-20 01:52:17');

-- ----------------------------
-- Table structure for `t_party`
-- ----------------------------
DROP TABLE IF EXISTS `t_party`;
CREATE TABLE `t_party` (
  `ID` varchar(36) NOT NULL,
  `PID` varchar(36) default NULL,
  `NAME` varchar(100) default NULL,
  `DESCRIPTION` varchar(500) default NULL,
  `DISCRIMINATE` varchar(10) default NULL COMMENT 'company：公司表\r\n            department：部门表\r\n            position：岗位表\r\n            \r\n            ',
  `ORDERNUM` decimal(5,0) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_party
-- ----------------------------
INSERT INTO `t_party` VALUES ('1b9bfefe-acb8-4370-afda-8a62c2a09051', '', 'show平台', null, 'company', null, '2016-03-21 09:19:13', '2016-05-21 08:37:16');

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `ID` varchar(36) NOT NULL,
  `DEPARTMENTID` varchar(36) default NULL,
  `NAME` varchar(100) default NULL,
  `ENGNAME` varchar(100) default NULL,
  `TYPE` varchar(100) default NULL,
  `SEX` char(1) default NULL COMMENT '0女,1男',
  `PHONE` varchar(50) default NULL,
  `TEL` varchar(50) default NULL,
  `EMAIL` varchar(50) default NULL,
  `ADDRESS` varchar(200) default NULL,
  `ZIPCODE` varchar(6) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('96804794-2d94-48aa-8c9b-d929308b0689', '1b9bfefe-acb8-4370-afda-8a62c2a09051', '超级管理员', '', '', '1', '', '', '', '', '', '2014-06-21 20:17:38', '2016-03-21 09:46:20');
INSERT INTO `t_person` VALUES ('cfc4b0a4-0cad-499b-843f-c6ffd049602a', '1b9bfefe-acb8-4370-afda-8a62c2a09051', '平台管理员', '', '', '1', '', '', '', '', '', '2016-05-23 09:40:11', null);

-- ----------------------------
-- Table structure for `t_position`
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `ID` varchar(36) NOT NULL,
  `MARK` varchar(100) default NULL,
  `TYPE` varchar(100) default NULL,
  `GRADE` varchar(100) default NULL,
  `ISLEADER` char(1) default NULL,
  `LEADERLEVEL` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `ID` varchar(36) NOT NULL,
  `MENUID` varchar(36) default NULL,
  `PID` varchar(36) default NULL,
  `NAME` varchar(100) default NULL,
  `PATH` varchar(100) default NULL,
  `ORDERNUM` decimal(5,0) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  `TYPE` varchar(10) default NULL,
  `EXEMODE` varchar(10) default NULL,
  `CLASSSTYLE` varchar(100) default NULL,
  `REMARK` varchar(500) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) default NULL,
  `CREATETIME` varchar(19) default NULL,
  `UPDATETIME` varchar(19) default NULL,
  `DESCRIPTION` varchar(500) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员角色', null, '2014-07-12 11:48:25', '至高无上，拥有所有的权限！\r\n');
INSERT INTO `t_role` VALUES ('d0f16ee5-a627-41f6-ba54-4ac3e40739d7', '网站管理员', '2016-05-23 09:39:42', null, 'show网站日常维护');

-- ----------------------------
-- Table structure for `t_roletask`
-- ----------------------------
DROP TABLE IF EXISTS `t_roletask`;
CREATE TABLE `t_roletask` (
  `PK_ID` varchar(36) NOT NULL,
  `role_id` varchar(36) default NULL,
  `dict_code` varchar(36) default NULL,
  `fun_id` varchar(10) default NULL COMMENT '10 初筛查看  11 初筛回执  ',
  `create_id` varchar(100) default NULL,
  `create_time` varchar(20) default NULL,
  `update_id` varchar(100) default NULL,
  `update_time` varchar(20) default NULL,
  PRIMARY KEY  (`PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roletask
-- ----------------------------
INSERT INTO `t_roletask` VALUES ('106b9d63-1dcc-43d5-9426-0e12d52f309c', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '10', 'admin', '2015-09-23 21:46:49', null, null);
INSERT INTO `t_roletask` VALUES ('17217d61-84aa-48f0-997d-84f598689861', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '80', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('28c610b8-aada-4c06-b126-bb01faeae15e', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '10', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('3a8f2824-3a89-4192-bbee-e6bdd5c795eb', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '50', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('3d800512-5d45-4f99-a5f6-3e9a26cec6b2', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '00', 'admin', '2015-05-15 10:49:30', null, null);
INSERT INTO `t_roletask` VALUES ('40d9d67b-2b86-404a-957e-5b8346aa310d', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '80', 'admin', '2015-09-23 21:46:50', null, null);
INSERT INTO `t_roletask` VALUES ('4951f543-5dd2-4c66-952e-c59ecaac010e', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '60', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('7423cd47-76c7-4dc6-a1ae-0863cf2db9d2', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '20', 'admin', '2015-09-23 21:46:49', null, null);
INSERT INTO `t_roletask` VALUES ('81c61ca4-d67b-4f11-b423-733539824342', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '30', 'admin', '2015-05-15 10:49:30', null, null);
INSERT INTO `t_roletask` VALUES ('86c9a605-3a49-4e14-a70e-990d0436a9ec', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '20', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('878e2f9d-5bc3-42a5-936e-3f9a3c74bfdd', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '30', 'admin', '2015-09-23 21:46:49', null, null);
INSERT INTO `t_roletask` VALUES ('ac10569b-e54f-4520-9c8e-2533b74ef8e0', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '10', 'admin', '2015-05-15 10:49:30', null, null);
INSERT INTO `t_roletask` VALUES ('b4bab84d-9242-48ab-b376-f0139634224e', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '70', 'admin', '2015-09-23 21:46:50', null, null);
INSERT INTO `t_roletask` VALUES ('c1c1165f-ba5b-4e3f-9697-80232bab9a81', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '30', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('c2282611-0dbe-4581-8762-beb02a0cca81', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '70', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('d0f76423-694c-4959-a87a-8fcc32f7b0b5', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '50', 'admin', '2015-09-23 21:46:50', null, null);
INSERT INTO `t_roletask` VALUES ('d23e9137-43f5-4d23-bec4-06c0681158ba', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '00', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('e43af096-e7f3-4980-a670-76849f2413f1', '617a9faa-f57d-4571-bb1f-c2fd17ef1c8c', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '70', 'admin', '2015-05-15 10:49:30', null, null);
INSERT INTO `t_roletask` VALUES ('e8b8067b-d9f2-49b2-b45b-2874d56e6f20', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '40', 'admin', '2015-09-23 21:46:50', null, null);
INSERT INTO `t_roletask` VALUES ('f5c910a9-aa38-4bd8-942b-dbd93c57bbd3', '1', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '40', 'admin', '2015-09-23 21:46:06', null, null);
INSERT INTO `t_roletask` VALUES ('fec386b3-7114-4f89-9c86-e7549fe455b4', '50e1aa44-43f1-4ec2-b01a-5493bd43608e', '4cde5820-1b05-4af2-aad1-d663d454ef9d', '60', 'admin', '2015-09-23 21:46:50', null, null);

-- ----------------------------
-- Table structure for `t_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `pk_id` varchar(36) NOT NULL,
  `col_dept` varchar(36) default NULL,
  `col_role` varchar(36) default NULL,
  `col_uid` varchar(36) default NULL,
  `col_desc` varchar(500) default NULL,
  `col_type` varchar(10) default NULL,
  `col_url` varchar(500) default NULL,
  `col_state` varchar(10) default NULL COMMENT '1 未办理\r\n            3 已办理',
  `col_finaldate` varchar(20) default NULL,
  `open_type` varchar(10) default NULL,
  `col_id` varchar(36) default NULL,
  `dept_code` varchar(36) default NULL,
  `send_name` varchar(100) default NULL,
  `create_id` varchar(100) default NULL,
  `create_time` varchar(20) default NULL,
  `update_id` varchar(100) default NULL,
  `update_time` varchar(20) default NULL,
  PRIMARY KEY  (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
