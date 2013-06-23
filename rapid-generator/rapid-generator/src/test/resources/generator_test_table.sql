DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS blog;
DROP TABLE IF EXISTS role_permission;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS permission;
DROP TABLE IF EXISTS topic;
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `age` (`age`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';
CREATE TABLE blog (
  blog_id bigint PRIMARY KEY,
  user_id bigint,
  username varchar(50) NOT NULL UNIQUE,
  created date DEFAULT NULL,
  modified date DEFAULT NULL,
  title varchar(10) default NULL,
  content varchar(56) default NULL,
  content_length int default NULL,
  status varchar(56) default NULL
);
CREATE TABLE role (
  role_id bigint NOT NULL PRIMARY KEY,
  role_name varchar(50) default NULL,
  resource_id bigint default NULL,
  user_id bigint default NULL,
  role_desc varchar(20) default NULL,
  created date NOT NULL,
  modified date NOT NULL
);
CREATE TABLE permission (
  permissoin_id bigint NOT NULL PRIMARY KEY,
  permision_name varchar(50) default NULL,
  permision_desc varchar(200) default NULL,
  permision_string varchar(200) default NULL,
  created date NOT NULL,
  modified date NOT NULL
);
CREATE TABLE role_permission (
  role_id bigint NOT NULL,
  permissoin_id bigint NOT NULL,
  PRIMARY KEY(role_id,permissoin_id),
  CONSTRAINT fk_permission_id_1982 FOREIGN KEY  (permissoin_id) REFERENCES permission(permissoin_id),
  CONSTRAINT fk_role_id_2833 FOREIGN KEY (role_id) REFERENCES role(role_id)
);
CREATE TABLE topic (
  topic_id bigint NOT NULL,
  topic_type varchar(10) default 'UNKNOWN',
  topic_name varchar(10),
  topic_content varchar(10),
  created date NOT NULL,
  modified date NOT NULL,
  PRIMARY KEY(topic_id,topic_type)
);
