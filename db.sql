/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.26 : Database - dingcanxiaochengxu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dingcanxiaochengxu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dingcanxiaochengxu`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '所属用户',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='购物车';

/*Data for the table `cart` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/dingcanxiaochengxu/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/dingcanxiaochengxu/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/dingcanxiaochengxu/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (74,'shangxia_types','上下架',1,'上架',NULL,NULL,'2022-02-18 16:43:33'),(75,'shangxia_types','上下架',2,'下架',NULL,NULL,'2022-02-18 16:43:33'),(76,'goods_types','菜品名称',1,'菜品类型1',NULL,NULL,'2022-02-18 16:43:33'),(77,'goods_types','菜品名称',2,'菜品类型2',NULL,NULL,'2022-02-18 16:43:33'),(78,'goods_types','菜品名称',3,'菜品类型3',NULL,NULL,'2022-02-18 16:43:33'),(79,'goods_order_payment_types','支付方式',1,'余额支付',NULL,NULL,'2022-02-18 16:43:33'),(80,'sex_types','性别类型名称',2,'女',NULL,NULL,'2022-02-18 16:43:33'),(81,'sex_types','性别类型名称',1,'男',NULL,NULL,'2022-02-18 16:43:33'),(82,'goods_order_types','订单类型名称',1,'退款',NULL,NULL,'2022-02-18 16:43:33'),(83,'goods_order_types','订单类型名称',2,'已支付',NULL,NULL,'2022-02-18 16:43:33'),(84,'goods_order_types','订单类型名称',3,'已出餐',NULL,NULL,'2022-02-18 16:43:33'),(85,'goods_order_types','订单类型名称',4,'已取餐',NULL,NULL,'2022-02-18 16:43:33'),(86,'goods_order_types','订单类型名称',5,'已评价',NULL,NULL,'2022-02-18 16:43:33'),(87,'news_types','新闻类型名称',1,'优惠活动',NULL,NULL,'2022-02-18 16:43:33'),(88,'news_types','新闻类型名称',2,'紧急情况',NULL,NULL,'2022-02-18 16:43:33'),(89,'isdefault_types','是否默认地址',1,'否',NULL,NULL,'2022-02-18 16:43:33'),(90,'isdefault_types','是否默认地址',2,'是',NULL,NULL,'2022-02-18 16:43:33'),(91,'huiyuandengji_types','会员等级类型',1,'青铜会员',NULL,'0.98','2022-02-18 16:43:33'),(92,'huiyuandengji_types','会员等级类型',2,'白银会员',NULL,'0.96','2022-02-18 16:43:33'),(93,'huiyuandengji_types','会员等级类型',3,'黄金会员',NULL,'0.94','2022-02-18 16:43:33'),(94,'shangjia_xingji_types','商家星级类型',1,'一级',NULL,NULL,'2022-02-18 16:43:33'),(95,'shangjia_xingji_types','商家星级类型',2,'二级',NULL,NULL,'2022-02-18 16:43:33'),(96,'shangjia_xingji_types','商家星级类型',3,'三级',NULL,NULL,'2022-02-18 16:43:33');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `shangjia_id` int(11) DEFAULT NULL COMMENT '商家',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '菜品名称  Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '菜品类型  Search111 ',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '菜品照片',
  `goods_kucun_number` int(11) DEFAULT '0' COMMENT '菜品库存',
  `goods_old_money` decimal(10,2) DEFAULT NULL COMMENT '菜品原价 ',
  `goods_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价 ',
  `goods_price` int(11) DEFAULT NULL COMMENT '购买获得积分 ',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '是否上架 ',
  `goods_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `goods_content` text COMMENT '菜品简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='菜品信息';

/*Data for the table `goods` */

insert  into `goods`(`id`,`shangjia_id`,`goods_name`,`goods_types`,`goods_photo`,`goods_kucun_number`,`goods_old_money`,`goods_new_money`,`goods_price`,`shangxia_types`,`goods_delete`,`goods_content`,`create_time`) values (1,1,'菜品名称1',2,'http://localhost:8080/dingcanxiaochengxu/upload/1645175392090.webp',10001,'826.39','35.15',1,1,1,'<p>菜品简介1</p>','2022-02-18 16:44:26'),(2,2,'菜品名称2',3,'http://localhost:8080/dingcanxiaochengxu/upload/1645175383271.webp',10001,'916.27','472.67',364,1,1,'<p>菜品简介2</p>','2022-02-18 16:44:26'),(3,3,'菜品名称3',2,'http://localhost:8080/dingcanxiaochengxu/upload/1645175374562.webp',10003,'565.47','341.46',78,1,1,'<p>菜品简介3</p>','2022-02-18 16:44:26'),(4,1,'菜品名称4',2,'http://localhost:8080/dingcanxiaochengxu/upload/1645175365749.webp',10004,'918.36','95.38',425,1,1,'<p>菜品简介4</p>','2022-02-18 16:44:26'),(5,2,'菜品名称5',3,'http://localhost:8080/dingcanxiaochengxu/upload/1645175357177.webp',10005,'577.25','162.38',322,1,1,'<p>菜品简介5</p>','2022-02-18 16:44:26'),(6,3,'菜品名称6',2,'http://localhost:8080/dingcanxiaochengxu/upload/1645175349142.webp',10004,'858.93','195.32',57,1,1,'<p>菜品简介6</p>','2022-02-18 16:44:26');

/*Table structure for table `goods_commentback` */

DROP TABLE IF EXISTS `goods_commentback`;

CREATE TABLE `goods_commentback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `goods_commentback_text` text COMMENT '评价内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜品评价';

/*Data for the table `goods_commentback` */

insert  into `goods_commentback`(`id`,`goods_id`,`yonghu_id`,`goods_commentback_text`,`reply_text`,`insert_time`,`update_time`,`create_time`) values (1,1,1,'评价内容1','回复信息1','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(2,2,1,'评价内容2','回复信息2','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(3,3,2,'评价内容3','回复信息3','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(4,4,1,'评价内容4','回复信息4','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(5,5,2,'评价内容5','回复信息5','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(6,6,1,'评价内容6','回复信息6','2022-02-18 16:44:26','2022-02-18 16:44:26','2022-02-18 16:44:26'),(12,2,1,'购买完成后可评论','每个商家都是只能看到自己发布的菜品','2022-02-18 20:30:05','2022-02-18 20:39:14','2022-02-18 20:30:05');

/*Table structure for table `goods_order` */

DROP TABLE IF EXISTS `goods_order`;

CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `buy_number` int(200) DEFAULT NULL COMMENT '购买的数量',
  `goods_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格 ',
  `goods_order_types` int(11) DEFAULT NULL COMMENT '订单类型',
  `goods_order_payment_types` int(11) DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='菜品订单';

/*Data for the table `goods_order` */

insert  into `goods_order`(`id`,`goods_order_uuid_number`,`goods_id`,`yonghu_id`,`buy_number`,`goods_order_true_price`,`goods_order_types`,`goods_order_payment_types`,`insert_time`,`create_time`) values (4,'1645184946671',6,1,1,'191.41',2,1,'2022-02-18 19:49:07','2022-02-18 19:49:07'),(5,'1645186593934',2,1,1,'463.22',5,1,'2022-02-18 20:16:34','2022-02-18 20:16:34'),(6,'1645187357016',6,1,1,'191.41',1,1,'2022-02-18 20:29:17','2022-02-18 20:29:17'),(7,'1645187422151',6,1,1,'187.51',2,1,'2022-02-18 20:30:22','2022-02-18 20:30:22');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻名称 Search111  ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻图片 ',
  `news_types` int(11) NOT NULL COMMENT '新闻类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻发布时间 ',
  `news_content` text COMMENT '新闻详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_photo`,`news_types`,`insert_time`,`news_content`,`create_time`) values (1,'新闻名称1','http://localhost:8080/dingcanxiaochengxu/upload/1645174877261.jpg',2,'2022-02-18 16:44:26','<p>新闻详情1</p>','2022-02-18 16:44:26'),(2,'新闻名称2','http://localhost:8080/dingcanxiaochengxu/upload/1645174869215.webp',1,'2022-02-18 16:44:26','<p>新闻详情2</p>','2022-02-18 16:44:26'),(3,'新闻名称3','http://localhost:8080/dingcanxiaochengxu/upload/1645174861550.webp',1,'2022-02-18 16:44:26','<p>新闻详情3</p>','2022-02-18 16:44:26'),(4,'新闻名称4','http://localhost:8080/dingcanxiaochengxu/upload/1645174853956.jpg',2,'2022-02-18 16:44:26','<p>新闻详情4</p>','2022-02-18 16:44:26');

/*Table structure for table `shangjia` */

DROP TABLE IF EXISTS `shangjia`;

CREATE TABLE `shangjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `username` varchar(200) DEFAULT NULL COMMENT '账户 ',
  `password` varchar(200) DEFAULT NULL COMMENT '密码 ',
  `shangjia_name` varchar(200) DEFAULT NULL COMMENT '商家名称 Search111 ',
  `shangjia_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `shangjia_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shangjia_photo` varchar(200) DEFAULT NULL COMMENT '营业执照展示 ',
  `shangjia_xingji_types` int(11) DEFAULT NULL COMMENT '商家星级类型',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '现有余额',
  `shangjia_content` text COMMENT '商家简介 ',
  `shangjia_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商家';

/*Data for the table `shangjia` */

insert  into `shangjia`(`id`,`username`,`password`,`shangjia_name`,`shangjia_phone`,`shangjia_email`,`shangjia_photo`,`shangjia_xingji_types`,`new_money`,`shangjia_content`,`shangjia_delete`,`create_time`) values (1,'a1','123456','商家名称1','17703786901','1@qq.com','http://localhost:8080/dingcanxiaochengxu/upload/1645175139206.jpg',1,'174.56','<p>商家简介1</p>',1,'2022-02-18 16:44:26'),(2,'a2','123456','商家名称2','17703786902','2@qq.com','http://localhost:8080/dingcanxiaochengxu/upload/1645175131476.webp',3,'1367.94','<p>商家简介2</p>',1,'2022-02-18 16:44:26'),(3,'a3','123456','商家名称3','17703786903','3@qq.com','http://localhost:8080/dingcanxiaochengxu/upload/1645175124369.jpg',1,'1275.70','<p>商家简介3</p>',1,'2022-02-18 16:44:26');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','cf3oyu2wnerfhrkard9in9pm4koms4oi','2022-02-18 16:50:19','2022-02-18 21:49:23'),(2,1,'a1','yonghu','用户','n9ylrrwqou96ahgs3x3qpzrxaxect5ab','2022-02-18 19:43:16','2022-02-18 21:50:30'),(3,1,'a1','shangjia','商家','o6xweqx8iy8uhzmc2ab9zqy7mq4y66gj','2022-02-18 20:38:38','2022-02-18 21:38:38'),(4,2,'a2','shangjia','商家','a34mabv6dzmpywzg2n9bq4an2ivf4fge','2022-02-18 20:38:48','2022-02-18 21:39:22');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_sum_jifen` decimal(10,2) DEFAULT NULL COMMENT '总积分',
  `huiyuandengji_types` int(11) DEFAULT NULL COMMENT '会员等级',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`sex_types`,`new_money`,`yonghu_sum_jifen`,`huiyuandengji_types`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/dingcanxiaochengxu/upload/1645174973567.jpg','17703786901','410224199610232001','1@qq.com',1,'263.15','1434.74',1,1,'2022-02-18 16:44:26'),(2,'a2','123456','用户姓名2','http://localhost:8080/dingcanxiaochengxu/upload/1645174966343.jpg','17703786902','410224199610232002','2@qq.com',2,'979.37','872.64',1,1,'2022-02-18 16:44:26'),(3,'a3','123456','用户姓名3','http://localhost:8080/dingcanxiaochengxu/upload/1645174955161.jpg','17703786903','410224199610232003','3@qq.com',2,'221.02','533.08',1,1,'2022-02-18 16:44:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
