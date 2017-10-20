DROP DATABASE IF EXISTS `django_project`;
CREATE DATABASE `django_project` /*!40100 DEFAULT CHARACTER SET utf8 */;


use django_project;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status_activate` TINYINT NOT NULL DEFAULT '0' COMMENT '激活状态（0未激活，1已激活）',
  `status_lock` TINYINT NOT NULL DEFAULT '0' COMMENT '锁定状态（0未锁定，1已锁定）',
  `status_real_name` TINYINT NOT NULL DEFAULT '0' COMMENT '实名状态（0未实名，1已实名）',
  `status_delete` TINYINT NOT NULL DEFAULT '0' COMMENT '删除状态（0未删除，1已删除）',
  `time_activate` TIMESTAMP NULL COMMENT '激活时间',
  `time_lock` TIMESTAMP NULL COMMENT '锁定时间',
  `time_real_name` TIMESTAMP NULL COMMENT '实名时间',
  `time_delete` TIMESTAMP NULL COMMENT '删除时间',
  `time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `time_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户全局注册表';


DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type_auth` TINYINT NOT NULL DEFAULT '0' COMMENT '认证类型（0账号，1邮箱，2手机，3qq，4微信，5微博）',
  `auth_key` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '授权账号（如果是手机，格式：[国家区号,手机号码];第三方登陆，这里是openid）',
  `auth_secret` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '密码凭证（密码;token）',
  `status_verified_auth` TINYINT NOT NULL DEFAULT '0' COMMENT '认证状态（0未认证，1已认证）',
  `time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `time_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`user_id`),
  UNIQUE (`type_auth`, `auth_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户认证表';


DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` INT NOT NULL COMMENT '用户ID',
  `user_pid` INT NOT NULL DEFAULT '0' COMMENT '推荐人用户ID',
  `nickname` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `type_level` TINYINT NOT NULL DEFAULT '0' COMMENT '等级类型（0普通，1铜牌，2银牌，3金牌，4钻石）',
  `avatar_url` VARCHAR(60) COMMENT '用户头像',
  `birthday` DATE NOT NULL DEFAULT '1900-01-01' COMMENT '生日',
  `real_name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '真实姓名(对应银行信息开户人姓名)',
  `id_card` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `time_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  KEY `ind_card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';


DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL COMMENT '用户ID',
  `bank_name` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_address` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '开户网点',
  `bank_account` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '银行账号',
  `status_default` TINYINT NOT NULL DEFAULT '0' COMMENT '默认状态（0空置，1默认）',
  `status_verified_bank` TINYINT NOT NULL DEFAULT '0' COMMENT '认证状态（0未认证，1已认证）',
  `time_default` TIMESTAMP NULL COMMENT '删除时间',
  `time_verified_bank` TIMESTAMP NULL COMMENT '认证时间',
  `time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `time_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ind_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户银行账号信息';

