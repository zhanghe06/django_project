USE django_project;

-- 插入用户全局注册信息
TRUNCATE TABLE `user`;
INSERT INTO `user` VALUES (1, '1', '0', '0', '0', '2017-01-11 11:01:10', NULL, NULL, NULL, '2017-01-10 23:01:05', '2017-01-11 11:01:05');
INSERT INTO `user` VALUES (2, '1', '0', '0', '0', '2017-01-11 11:01:10', NULL, NULL, NULL, '2017-01-10 23:01:05', '2017-01-11 11:01:05');
INSERT INTO `user` VALUES (3, '1', '0', '0', '0', '2017-01-11 11:01:10', NULL, NULL, NULL, '2017-01-10 23:01:05', '2017-01-11 11:01:05');
INSERT INTO `user` VALUES (4, '1', '0', '0', '0', '2017-01-11 11:01:10', NULL, NULL, NULL, '2017-01-10 23:01:05', '2017-01-11 11:01:05');
INSERT INTO `user` VALUES (5, '1', '0', '0', '0', '2017-01-11 11:01:10', NULL, NULL, NULL, '2017-01-10 23:01:05', '2017-01-11 11:01:05');

-- 插入用户认证信息
TRUNCATE TABLE `user_auth`;
INSERT INTO `user_auth` VALUES (1, 1, 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_auth` VALUES (2, 2, 0, 'guest', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-01-12 12:25:34', '2017-01-12 12:25:34');
INSERT INTO `user_auth` VALUES (3, 3, 0, 'test', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-01-12 01:43:42', '2017-01-12 01:43:42');
INSERT INTO `user_auth` VALUES (4, 4, 0, 'git', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-01-12 01:43:42', '2017-01-12 01:43:42');
INSERT INTO `user_auth` VALUES (5, 5, 0, 'hub', 'e10adc3949ba59abbe56e057f20f883e', '1', '2017-01-12 01:43:42', '2017-01-12 01:43:42');

-- 插入用户基本信息
TRUNCATE TABLE `user_profile`;
INSERT INTO `user_profile` VALUES (1, 0, 'Admin', 0, NULL, '1900-01-01', 'Admin', '123456789098765432', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_profile` VALUES (2, 1, 'Guest', 0, NULL, '1900-01-01', 'Guest', '123456789098765433', '2017-01-12 12:25:34', '2017-01-12 12:25:34');
INSERT INTO `user_profile` VALUES (3, 1, 'Test', 0, NULL, '1900-01-01', 'Test', '123456789098765434', '2017-01-12 01:43:42', '2017-01-12 01:43:42');
INSERT INTO `user_profile` VALUES (4, 2, 'Git', 0, NULL, '1900-01-01', 'Git', '123456789098765435', '2017-01-12 01:43:42', '2017-01-12 01:43:42');
INSERT INTO `user_profile` VALUES (5, 2, 'Hub', 0, NULL, '1900-01-01', 'Hub', '123456789098765436', '2017-01-12 01:43:42', '2017-01-12 01:43:42');

-- 插入用户银行信息
TRUNCATE TABLE `user_bank`;
INSERT INTO `user_bank` VALUES (1, 1, '建行', '上海分行', '1234567891', 0, 0, '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_bank` VALUES (2, 2, '农行', '上海分行', '1234567892', 0, 0, '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_bank` VALUES (3, 3, '农行', '上海分行', '1234567893', 0, 0, '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_bank` VALUES (4, 4, '农行', '上海分行', '1234567894', 0, 0, '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
INSERT INTO `user_bank` VALUES (5, 5, '农行', '上海分行', '1234567895', 0, 0, '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05', '2017-01-11 11:01:05');
