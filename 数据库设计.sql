-- 书籍
-- 创建一个书籍表，代表图书馆里的书籍，可以在页面显示，也能通过管理员增删改查
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookname` varchar(100) NOT NULL,
  `author` varchar(60) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sales` int(6) NOT NULL DEFAULT '0',
  `stock` int(6) NOT NULL DEFAULT '0',
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 添加书籍数据
INSERT INTO `book` VALUES ('1', 'php书籍', 'lqy', '50.00', '102', '898', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('2', '东晋门阀政治', '田余庆', '45.00', '102', '898', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('3', '三国演义', '罗贯中', '88.80', '102', '898', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('4', '水浒传', '斯耐庵', '66.88', '1000', '0', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('6', '西游记', '吴承恩', '25.00', '100', '900', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('7', '苏东坡传', '林语堂', '20.00', '100', '900', '/static/images/docker.jpg');
INSERT INTO `book` VALUES ('8', '童话', '未知', '50.00', '100', '900', '/static/images/docker.jpg');




-- 注册 sessions
-- 一个用户想在我们的图书馆里借书，要先在页面注册一个账户，每当一个用户在页面上注册一个账户，都会加入到数据库
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `uuid` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 添加session数据
INSERT INTO `sessions` VALUES ('6a953fda-ffe6-4666-7de1-6ed8d52e4edd', 'admin', '1');
INSERT INTO `sessions` VALUES ('2a808320-9011-4c0e-7f25-bd4f7a2c1efa', 'admin', '1');
INSERT INTO `sessions` VALUES ('322c09e1-ad76-4fe1-4d0c-d8edf220cfd7', 'admin', '1');
INSERT INTO `sessions` VALUES ('bb286dbc-eebc-489b-7050-134b0046b947', 'admin', '1');
INSERT INTO `sessions` VALUES ('e63025f7-37f0-4016-7c1f-622d17bd49bc', 'lqy', '2');
INSERT INTO `sessions` VALUES ('bc6c93c6-ec7e-41dd-4ba9-e9230e1d4726', 'admin', '1');
INSERT INTO `sessions` VALUES ('cf1da753-5e46-462d-4e0e-daeeecdda36f', 'admin', '1');

-- 用户
-- 创建一个用户表，代表在图书馆里借过书的用户，可以在页面显示，也能通过管理员增删改查
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 添加用户数据
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'admin@qq.com');
INSERT INTO `user` VALUES ('2', 'lqy', '123456', 'lqy@qq.com');
INSERT INTO `user` VALUES ('3', 'maomao', '123456', 'maomao@qq.com');
