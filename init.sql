CREATE DATABASE `microservice-auth`;
CREATE DATABASE `microservice-exam`;
CREATE DATABASE `microservice-user`;

USE `microservice-auth`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'client_id',
  `resource_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'resource_ids',
  `client_secret_plain_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密钥明文',
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'client_secret',
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授权范围',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'access_token有效时间',
  `refresh_token_validity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'refresh_token有效时间',
  `additional_information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL COMMENT '删除标记',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES (607150228717572096, 'web_app', NULL, 'spring-microservice-exam-secret', '$2a$10$IWLD8r7e0rKMW.ZhGsGCUO./MZUNDKudIswSToa9puXJwty.h59.u', 'read,write', 'password,authorization_code,refresh_token,implicit', NULL, NULL, '86400', '86400', NULL, NULL, 'admin', '2019-03-30 23:43:07', 'admin', '2020-03-28 20:01:31', 0, 'EXAM', 'gitee');

SET FOREIGN_KEY_CHECKS = 1;


USE `microservice-exam`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_answer`;
CREATE TABLE `exam_answer`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `exam_record_id` bigint(20) NOT NULL COMMENT '考试记录id',
  `subject_id` bigint(20) NOT NULL COMMENT '题目ID',
  `type` tinyint(4) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案',
  `answer_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '答题类型，0：正确，1：错误',
  `score` tinyint(4) NULL DEFAULT NULL COMMENT '实际得分',
  `mark_status` tinyint(4) NULL DEFAULT NULL,
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_answer
-- ----------------------------
INSERT INTO `exam_answer` VALUES (691062093205606401, 691062092169613312, 679455142176755712, 0, 'A', 0, 5, 1, '2020-03-21 23:14:02', '2020-03-21 23:14:08', 'anonymousUser', '2020-03-21 23:25:43', 'anonymousUser', '2020-03-21 23:14:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062191109050368, 691062092169613312, 679455223147794432, 0, 'B', 0, 5, 1, '2020-03-21 23:14:09', '2020-03-21 23:14:26', 'anonymousUser', '2020-03-21 23:25:43', 'anonymousUser', '2020-03-21 23:14:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062249435041792, 691062092169613312, 679455353129275392, 0, 'C', 0, 5, 1, '2020-03-21 23:14:26', '2020-03-21 23:14:40', 'anonymousUser', '2020-03-21 23:25:43', 'anonymousUser', '2020-03-21 23:14:40', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062295685632000, 691062092169613312, 679680049900818432, 3, 'A,C', 0, 5, 1, '2020-03-21 23:14:40', '2020-03-21 23:14:51', 'anonymousUser', '2020-03-21 23:25:43', 'anonymousUser', '2020-03-21 23:14:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062305785516032, 691062092169613312, 679680687489552384, 0, 'A', 0, 5, 1, '2020-03-21 23:14:51', '2020-03-21 23:20:32', 'anonymousUser', '2020-03-21 23:31:15', 'anonymousUser', '2020-03-21 23:20:32', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062329726603264, 691062092169613312, 680037906714333184, 1, '<p>erer</p>', 1, 0, 1, '2020-03-21 23:14:53', '2020-03-21 23:20:31', 'anonymousUser', '2020-03-21 23:31:13', 'anonymousUser', '2020-03-21 23:20:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691062861052645376, 691062092169613312, 680772677350330368, 2, '正确', 0, 5, 1, '2020-03-21 23:17:01', '2020-03-21 23:20:27', 'anonymousUser', '2020-03-21 23:31:10', 'anonymousUser', '2020-03-21 23:20:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063101176549377, 691063100123779072, 679455142176755712, 0, 'A', 0, 5, 1, '2020-03-21 23:18:03', '2020-03-21 23:18:06', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063138266779648, 691063100123779072, 679455223147794432, 0, 'B', 0, 5, 1, '2020-03-21 23:18:07', '2020-03-21 23:18:11', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063154221912064, 691063100123779072, 679455353129275392, 0, 'C', 0, 5, 1, '2020-03-21 23:18:11', '2020-03-21 23:18:15', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063166632857600, 691063100123779072, 679680049900818432, 3, 'A,C', 0, 5, 1, '2020-03-21 23:18:15', '2020-03-21 23:18:18', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:18', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063179433873408, 691063100123779072, 679680687489552384, 0, 'A', 0, 5, 1, '2020-03-21 23:18:18', '2020-03-21 23:18:21', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:21', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063208663977984, 691063100123779072, 680037906714333184, 1, '<p>测试</p>', 1, 0, 1, '2020-03-21 23:18:22', '2020-03-21 23:18:28', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:28', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (691063227982942208, 691063100123779072, 680772677350330368, 2, '正确', 0, 5, 1, '2020-03-21 23:18:28', '2020-03-21 23:18:33', 'admin', '2020-03-21 23:29:17', 'admin', '2020-03-21 23:18:33', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330635085746176, 696330634376908800, 696329099584606208, 0, 'A', 0, 5, 1, '2020-04-05 12:09:21', '2020-04-05 12:09:24', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:09:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330659911831552, 696330634376908800, 696329220065988608, 3, 'B', 0, 5, 1, '2020-04-05 12:09:24', '2020-04-05 12:09:27', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:09:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330669739085824, 696330634376908800, 696329277397929984, 2, '正确', 0, 5, 1, '2020-04-05 12:09:27', '2020-04-05 12:10:25', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:10:25', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330707735285760, 696330634376908800, 696329333312196608, 1, '<p>测试 吃的啥</p>', 1, 0, 1, '2020-04-05 12:09:29', '2020-04-05 12:10:24', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:10:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330724759965696, 696330634376908800, 696329371371311104, 1, '<p>测试&nbsp;</p>', 1, 0, 1, '2020-04-05 12:09:38', '2020-04-05 12:10:01', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:10:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330749921595392, 696330634376908800, 696329435527385088, 0, 'B', 1, 0, 1, '2020-04-05 12:09:45', '2020-04-05 12:09:56', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:09:56', 0, 'EXAM', 'gitee');
INSERT INTO `exam_answer` VALUES (696330779109756928, 696330634376908800, 696329516385177600, 0, 'A', 0, 5, 1, '2020-04-05 12:09:48', '2020-04-05 12:09:55', 'student', '2020-04-05 12:21:19', 'student', '2020-04-05 12:09:55', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_course
-- ----------------------------
DROP TABLE IF EXISTS `exam_course`;
CREATE TABLE `exam_course`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `course_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程名称',
  `college` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院',
  `major` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `teacher` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师',
  `course_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_course
-- ----------------------------
INSERT INTO `exam_course` VALUES (590968789617741824, '计算机基础', '信息学院', '软件工程', '', '计算机基础', 'admin', '2020-03-20 23:37:30', 'admin', '2020-03-20 23:26:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_course` VALUES (590968881187786752, '大学语文', '信息学院', '软件工程', '陈老师', '大学语文', 'admin', '2020-03-20 23:37:23', 'admin', '2020-03-20 23:26:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_course` VALUES (630786336084856832, '1', '1', '1', '1', '1', 'admin', '2019-10-07 15:28:53', 'admin', '2019-10-07 15:20:23', 1, 'EXAM', 'gitee');
INSERT INTO `exam_course` VALUES (630786555333709824, '1', '1', '1', '1', '1', 'admin', '2019-10-07 15:29:06', 'admin', '2019-10-07 15:20:37', 1, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_examination
-- ----------------------------
DROP TABLE IF EXISTS `exam_examination`;
CREATE TABLE `exam_examination`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `examination_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试名称',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '考试类型',
  `attention` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试注意事项',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  `total_score` int(11) NOT NULL COMMENT '总分',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '考试状态',
  `avatar_id` bigint(20) NULL DEFAULT NULL COMMENT '图片ID',
  `course_id` bigint(20) NULL DEFAULT NULL COMMENT '课程',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_examination
-- ----------------------------
INSERT INTO `exam_examination` VALUES (590969316204220416, '全国计算机统考练习题10道', 2, '练习', '2019-12-13 22:29:24', '2020-03-12 22:24:49', 50, 0, NULL, 590968789617741824, '全国计算机统考练习题10道', 'admin', '2019-06-19 18:21:04', 'admin', '2020-03-09 22:24:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (590969514372501504, '四川省2016年普通高考文科综合能力测试-语文部分', 0, '注意事项:\n1.本试卷分第工卷(选择题)和第II卷(非选择题)两部分。答卷前，考生务必将白己的姓名、准考证号填写在答题卡上。\n2.回答第Ⅰ卷时，选出每小题答案后，用铅笔把答题卡上对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。写在本试卷上无效。\n3.回答第Ⅱ卷时，将答案写在答题卡上。写在本试卷上无效。\n4.考试结束后，将本试卷和答题卡一并交回。', '2019-12-14 22:29:43', '2019-12-17 22:29:46', 60, 0, NULL, 590968881187786752, '四川省2016年普通高考-文科综合能力测试', 'admin', '2019-06-19 18:21:51', 'admin', '2019-12-14 22:20:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (625826218704506880, '12', 0, '1', '2019-10-07 15:32:23', '2019-10-09 15:32:25', 1, 0, NULL, NULL, '1', 'admin', '2019-09-23 22:49:58', 'admin', '2019-10-07 15:32:30', 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (630880779513237504, '2', 0, '2', '2019-10-07 21:34:53', '2019-10-15 00:00:00', 2, 0, NULL, NULL, '22', 'admin', '2019-10-07 21:34:59', 'admin', '2019-10-11 22:20:47', 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (636313595680002048, '1', 0, '1', '2019-12-13 22:33:24', '2019-12-17 22:33:31', 1, 0, NULL, NULL, '1', 'admin', '2019-10-22 21:23:03', 'admin', '2019-12-14 22:23:58', 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (672753150888906752, '测试考试1', 0, '测试考试1', '2020-02-08 13:55:39', '2020-02-20 13:55:41', 20, 0, NULL, 590968881187786752, '测试考试1', 'admin', '2020-01-31 10:40:50', 'admin', '2020-02-17 19:11:55', 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (679446626552647680, '测试考试1', 0, '测试考试1', '2020-03-21 17:08:28', '2020-03-25 00:00:00', 50, 0, 696436243684265984, 590968881187786752, '测试考试1', 'admin', '2020-02-18 21:58:19', 'preview', '2020-04-05 19:09:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination` VALUES (696328959679401984, '测试考试2', 0, '发的发达', '2020-04-04 12:13:21', '2020-04-08 00:00:00', 49, 0, 696434412228841472, 590968881187786752, '发达地方', 'preview', '2020-04-05 12:02:41', 'preview', '2020-04-05 19:01:44', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_examination_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_examination_record`;
CREATE TABLE `exam_examination_record`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `examination_id` bigint(20) NOT NULL COMMENT '考试ID',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `score` int(11) NULL DEFAULT NULL COMMENT '成绩',
  `correct_number` int(11) NULL DEFAULT NULL COMMENT '正确题目数量',
  `incorrect_number` int(11) NULL DEFAULT NULL COMMENT '错误题目数量',
  `submit_status` tinyint(4) NULL DEFAULT NULL,
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_examination_record
-- ----------------------------
INSERT INTO `exam_examination_record` VALUES (691062092169613312, 596078038307966976, 679446626552647680, '2020-03-21 23:14:02', '2020-03-21 23:17:21', 30, 6, 1, 3, 'admin', '2020-03-21 23:14:02', 'anonymousUser', '2020-03-21 23:17:21', 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_record` VALUES (691063100123779072, 596078038307966976, 679446626552647680, '2020-03-21 23:18:02', '2020-03-21 23:18:35', 30, 6, 1, 3, 'admin', '2020-03-21 23:18:02', 'admin', '2020-03-21 23:18:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_record` VALUES (696330634376908800, 596307222997372928, 696328959679401984, '2020-04-05 12:09:20', '2020-04-05 12:10:29', 20, 4, 3, 3, 'student', '2020-04-05 12:09:20', 'student', '2020-04-05 12:10:29', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_examination_subject
-- ----------------------------
DROP TABLE IF EXISTS `exam_examination_subject`;
CREATE TABLE `exam_examination_subject`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `examination_id` bigint(20) NULL DEFAULT NULL COMMENT '考试ID',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类',
  `subject_id` bigint(20) NOT NULL COMMENT '题目ID',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型 0-选择题，1-简答题',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试题目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_examination_subject
-- ----------------------------
INSERT INTO `exam_examination_subject` VALUES (590970743886581760, 590969316204220416, NULL, 590970743878193152, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590970887440830464, 590969316204220416, NULL, 590970887432441856, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971026888855552, 590969316204220416, NULL, 590971026880466944, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971151145111552, 590969316204220416, NULL, 590971151128334336, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971273547485184, 590969316204220416, NULL, 590971273539096576, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971402648162304, 590969316204220416, NULL, 590971402639773696, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971508113936384, 590969316204220416, NULL, 590971508109742080, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971613944614913, 590969316204220416, NULL, 590971613944614912, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971750154637312, 590969316204220416, NULL, 590971750146248704, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590971860049596416, 590969316204220416, NULL, 590971860041207808, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972141151850496, 590969514372501504, NULL, 590972141118296064, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972250216337408, 590969514372501504, NULL, 590972250212143104, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972363114418176, 590969514372501504, NULL, 590972363110223872, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972473890181120, 590969514372501504, NULL, 590972473877598208, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972590185648128, 590969514372501504, NULL, 590972590177259520, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972723384160257, 590969514372501504, NULL, 590972723384160256, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972834742931456, 590969514372501504, NULL, 590972834734542848, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590972929701974016, 590969514372501504, NULL, 590972929693585408, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590973027999682560, 590969514372501504, NULL, 590973027995488256, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590973115165708288, 590969514372501504, NULL, 590973115157319680, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590973253548380160, 590969514372501504, NULL, 590973253544185856, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (590973360670904320, 590969514372501504, NULL, 590973360662515712, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630856319682875392, 625826218704506880, NULL, 630856319242473472, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630856451711176704, 625826218704506880, NULL, 630856451555987456, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630856496523120640, 625826218704506880, NULL, 630856496279851008, 3, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630856557130813440, 625826218704506880, NULL, 630856556883349504, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630880822823620608, 630880779513237504, NULL, 630880822542602240, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630880853144244224, 630880779513237504, NULL, 630880852892585984, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (630880881971695616, 630880779513237504, NULL, 630880881720037376, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (635557908003819520, NULL, 635555845517742080, 635557907726995456, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (660248786156785664, NULL, 0, 660248785791881216, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (660573712369717248, NULL, 0, 660573712097087488, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (668114910588309504, NULL, 0, 668114909724282880, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (679455142529077248, 679446626552647680, NULL, 679455142176755712, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (679455223491727360, 679446626552647680, NULL, 679455223147794432, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (679455353464819712, 679446626552647680, NULL, 679455353129275392, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (679680050186031104, 679446626552647680, NULL, 679680049900818432, 3, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (679680687841873920, 679446626552647680, NULL, 679680687489552384, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (680037907620302848, 679446626552647680, NULL, 680037906714333184, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (680772677467770880, 679446626552647680, NULL, 680772677350330368, 2, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696323940607463424, NULL, 602231546270846976, 696323940339027968, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696324258783170560, NULL, 602231546270846976, 696324258506346496, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696325065666596864, NULL, 602231546270846976, 696325065393967104, 3, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696325166040485888, NULL, 602231546270846976, 696325165767856128, 2, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696326076326088704, NULL, 602231546270846976, 696326076057653248, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696326769229303808, NULL, 602231546270846976, 696326726975885312, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696327229705162752, NULL, 602231546270846976, 696327229180874752, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329099844653056, 696328959679401984, NULL, 696329099584606208, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329220326035456, 696328959679401984, NULL, 696329220065988608, 3, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329277674754048, 696328959679401984, NULL, 696329277397929984, 2, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329333576437760, 696328959679401984, NULL, 696329333312196608, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329371618775040, 696328959679401984, NULL, 696329371371311104, 1, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329435779043328, 696328959679401984, 602231546270846976, 696329435527385088, 0, 'EXAM', 'gitee');
INSERT INTO `exam_examination_subject` VALUES (696329516641030144, 696328959679401984, 602231546270846976, 696329516385177600, 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `exam_knowledge`;
CREATE TABLE `exam_knowledge`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `knowledge_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '知识名称',
  `knowledge_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识描述',
  `attachment_id` bigint(20) NULL DEFAULT NULL COMMENT '附件ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '知识表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_knowledge
-- ----------------------------
INSERT INTO `exam_knowledge` VALUES (590978901526843392, '四川省2016年普通高考适应性测试', '四川省2016年普通高考适应性测试', 696432359691653120, 1, 'admin', '2020-04-05 19:04:23', 'preview', '2020-04-05 18:53:34', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_pictures
-- ----------------------------
DROP TABLE IF EXISTS `exam_pictures`;
CREATE TABLE `exam_pictures`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `picture_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识名称',
  `attachment_id` bigint(20) NULL DEFAULT NULL COMMENT '附件ID',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for exam_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_category`;
CREATE TABLE `exam_subject_category`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父分类ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型: 0-私共,1-公有',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '题目分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_subject_category
-- ----------------------------
INSERT INTO `exam_subject_category` VALUES (590975991732637696, '计算机', NULL, -1, 30, 0, 'admin', '2019-09-21 16:20:22', 'admin', '2019-06-19 18:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (590976037467328512, '数据库基础', NULL, 590975991732637696, 30, 0, 'admin', '2019-09-21 16:20:24', 'admin', '2019-07-04 13:51:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (590976094983819264, 'Java程序设计', NULL, 590975991732637696, 31, 0, 'admin', '2019-09-21 16:20:25', 'admin', '2019-06-19 18:48:00', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (590976142211682304, '数据结构', NULL, 590975991732637696, 33, 0, 'admin', '2019-09-21 16:20:26', 'admin', '2019-06-19 18:48:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (590976191398285312, '地理', NULL, -1, 31, 0, 'admin', '2019-09-21 16:20:27', 'admin', '2019-06-19 18:48:23', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (590976335996915712, '计算机基础', NULL, 590975991732637696, 34, 0, 'admin', '2019-09-21 16:20:28', 'admin', '2019-06-19 18:48:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (602231546270846976, '多选测试', NULL, -1, 30, 0, 'admin', '2019-09-21 16:20:29', 'admin', '2019-07-20 20:13:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (634501836186980352, '测试', NULL, -1, 30, 0, 'admin', '2019-10-17 21:32:29', 'admin', '2019-10-17 21:23:46', 1, 'EXAM', 'gitee');
INSERT INTO `exam_subject_category` VALUES (635555845517742080, '测试', '测试', -1, 30, 0, 'admin', '2019-10-20 20:25:33', 'admin', '2019-10-20 19:12:02', 1, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_subject_choices
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_choices`;
CREATE TABLE `exam_subject_choices`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NULL DEFAULT 0,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目名称',
  `choices_type` tinyint(4) NOT NULL COMMENT '题目类型',
  `answer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参考答案',
  `score` int(11) NOT NULL COMMENT '题目分值',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析',
  `level` tinyint(4) NOT NULL COMMENT '难度等级',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '选择题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_subject_choices
-- ----------------------------
INSERT INTO `exam_subject_choices` VALUES (590970743878193152, 0, '自计算机问世至今已经经历了四个时代，划分时代的主要依据是计算机的_', 0, 'D', 5, '<p>无</p>', 2, 'admin', '2019-06-19 18:26:45', 'admin', '2019-06-19 18:31:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590970887432441856, 0, '第一台计算机是在1946年在美国诞生，该机的英文缩写是_', 0, 'A', 5, '<p>无</p>', 2, 'admin', '2019-06-19 18:27:19', 'admin', '2019-06-19 18:27:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971026880466944, 0, '当前的计算机一般被认为是第四代计算机，它所采用的逻辑元件是_', 0, 'C', 5, '无', 2, 'admin', '2019-06-19 18:27:52', 'admin', '2019-06-19 18:27:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971151128334336, 0, '当前计算机的应用最广泛的领域是_', 0, 'C', 5, '无', 2, 'admin', '2019-06-19 18:28:22', 'admin', '2019-06-19 18:28:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971273539096576, 0, '早期的计算机体积大、耗电多、速度慢，其主要原因是制约于_', 0, 'D', 5, '无', 2, 'admin', '2019-06-19 18:28:51', 'admin', '2019-06-19 18:28:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971402639773696, 0, '现代计算机之所以能够自动、连续地进行数据处理，主要是因为_', 0, 'D', 5, '无', 2, 'admin', '2019-06-19 18:29:22', 'admin', '2019-06-19 18:29:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971508109742080, 0, '电子计算机按规模和处理能力划分，可以分为_', 0, 'C', 5, '无', 2, 'admin', '2019-06-19 18:29:47', 'admin', '2019-06-19 18:29:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971613944614912, 0, '将计算机分为通用计算机、专用计算机两类的分类标准是_', 0, 'B', 5, '无', 2, 'admin', '2019-06-19 18:30:12', 'admin', '2019-06-19 18:30:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971750146248704, 0, '既可以接收、处理和输出模拟量，也可以接收、处理和输出数字量的计算机是_', 0, 'C', 5, '无', 2, 'admin', '2019-06-19 18:30:44', 'admin', '2019-06-19 18:30:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590971860041207808, 0, '至今日，计算机仍采用存储程序原理，原理的提出者是_', 0, 'C', 5, '无', 2, 'admin', '2019-06-19 18:31:11', 'admin', '2019-06-19 18:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972141118296064, 0, '《小雅·鹿鸣》本是西周贵族宣扬宴飨之仪的乐歌，后扩散到民间，在乡人宴会上也可传唱。这表明西周时期', 0, 'B', 5, '无', 2, 'admin', '2019-10-20 20:06:09', 'admin', '2019-10-20 19:57:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972250212143104, 0, '公元前 212 年，秦始皇坑杀“术士”，长子扶苏劝谏说：“远方黔首未集，诸生皆诵法孔子，今上皆重法绳之，臣恐天下不安，唯上察之”。这反映当时', 0, 'D', 5, '', 2, 'admin', '2019-06-19 18:32:44', 'admin', '2019-06-19 18:32:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972363110223872, 0, '唐前期的政治人物多为北方人，北宋时政治人物多出生于江西、福建、苏南等地。这一变化主要反映了', 0, 'C', 5, '', 2, 'admin', '2019-06-19 18:33:11', 'admin', '2019-06-19 18:33:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972473877598208, 0, '李鸿章凭淮军实力日渐强盛。一次，他在游孔林时说道：“孔子不会打洋枪，今不足贵也。”李鸿章这样评价孔子，其背景最可能是', 0, 'B', 5, '', 2, 'admin', '2019-06-19 18:33:37', 'admin', '2019-06-19 18:33:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972590177259520, 0, '《荆楚岁时记》云：“社日，四邻并结宗会社，宰牲牢，为屋于树下，先祭神，然后食其胙。”据此可知，社日的民俗功能主要是', 0, 'A', 5, '', 2, 'admin', '2019-06-19 18:34:05', 'admin', '2019-06-19 18:34:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972723384160256, 0, '李鸿章凭淮军实力日渐强盛。一次，他在游孔林时说道：“孔子不会打洋枪，今不足贵也。”李鸿章这样评价孔子，其背景最可能是', 0, 'B', 5, '', 2, 'admin', '2019-06-19 18:34:36', 'admin', '2019-06-19 18:34:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972834734542848, 0, '1930 年，中共中央在回应共产国际指示时说：党的任务决不是准备夺取部分的政权，如果认为现在还是准备夺取部分的政权,无疑是对革命形势估量不足的右倾观念。这一回应表明', 0, 'D', 5, '', 2, 'admin', '2019-06-19 18:35:03', 'admin', '2019-06-19 18:35:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590972929693585408, 0, '1938 年初，国民政府颁布多部法规，要求将每一工厂、商号、银行、钱庄都纳入到同业工会内，又将每一同业工会纳入当地商会内。这些法规', 0, 'D', 5, '', 2, 'admin', '2019-06-19 18:35:26', 'admin', '2019-06-19 18:35:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590973027995488256, 0, '古代雅典法律规定：每个公民从出生起，城邦就是他的最高监护人，要按城邦的需要来抚养和教育。这反映出雅典', 0, 'A', 5, '', 2, 'admin', '2019-06-19 18:35:49', 'admin', '2019-06-19 18:35:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590973115157319680, 0, '19 世纪末 20 世纪初，一向傲慢的英国人惊奇地发现：“身上的衣服是德国缝制的，少女们周末穿的漂亮披风与上衣来自德国。更让人吃惊的是生活中有许多东西都产自德国，……连周末歌剧院里上演的歌剧也是德国人创作的，演员无一例外是德国人。”可见，当时傲慢的英国人', 0, 'D', 5, '', 2, 'admin', '2019-06-19 18:36:10', 'admin', '2019-06-19 18:36:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590973253544185856, 0, '1920–1921 年，苏俄许多工人流往农村，还有一些则自谋生路成了小手工业者。据此推知当时苏俄', 0, 'A', 5, '', 2, 'admin', '2019-06-19 18:36:43', 'admin', '2019-06-19 18:36:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590973360662515712, 0, '1964 年 6 月，美国《时代》杂志发表社论指出：“从北约到联合国，从拉丁美洲到红色中国，几乎在世界政治中的每一个问题或地区上，法国都采取和美国政策不一致的态度。”这一社论', 0, 'B', 5, '', 2, 'admin', '2019-06-19 18:37:08', 'admin', '2019-06-19 18:37:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (590976455786237952, 590976335996915712, '<p>自计算机问世至今已经经历了四个时代，划分时代的主要依据是计算机的_</p>', 0, 'D', 5, '', 2, 'admin', '2019-06-19 18:49:26', 'admin', '2019-07-20 20:29:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (602231589715447808, 602231546270846976, '<p>32</p>', 3, 'A', 5, '233', 2, 'admin', '2019-07-20 20:13:20', 'admin', '2019-07-20 20:30:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (625826265252892672, 0, '2', 0, 'B', 5, '2', 2, 'admin', '2019-09-23 22:50:09', 'admin', '2019-09-23 22:50:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (625827733561282560, 0, '2', 0, 'B', 5, '2', 2, 'admin', '2019-09-23 22:55:59', 'admin', '2019-09-23 22:55:59', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630793085445607424, 0, '1', 0, 'A', 5, '1', 2, 'admin', '2019-10-07 15:46:31', 'admin', '2019-10-07 15:46:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630793358951976960, 0, '2', 0, 'B', 5, '<p>2</p>', 2, 'admin', '2019-10-07 15:47:36', 'admin', '2019-10-07 15:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630856319242473472, 0, '1', 0, 'A', 5, '<p>1</p>', 2, 'admin', '2019-10-07 19:57:47', 'admin', '2019-10-07 19:57:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630856451555987456, 0, '2', 0, 'B', 5, '2', 2, 'admin', '2019-10-07 19:58:19', 'admin', '2019-10-07 19:58:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630856496279851008, 0, '3', 0, 'B', 5, '3', 2, 'admin', '2019-10-07 19:58:29', 'admin', '2019-10-07 19:58:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630856556883349504, 0, '3', 0, 'C', 5, '3', 2, 'admin', '2019-10-07 19:58:44', 'admin', '2019-10-07 19:58:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630880822542602240, 0, '1', 0, 'A', 5, '1', 2, 'admin', '2019-10-07 21:35:09', 'admin', '2019-10-07 21:35:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630880852892585984, 0, '2', 0, 'B', 5, '2', 2, 'admin', '2019-10-07 21:35:17', 'admin', '2019-10-07 21:35:17', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (630880881720037376, 0, '3', 0, 'C', 5, '3', 2, 'admin', '2019-10-07 21:35:23', 'admin', '2019-10-07 21:35:23', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (660248785791881216, 0, '1', 0, 'A', 5, '1', 2, 'admin', '2019-12-27 22:32:57', 'admin', '2019-12-27 22:32:57', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (660573712097087488, 0, '2', 0, '', 5, '', 2, 'admin', '2019-12-28 20:04:06', 'admin', '2019-12-28 20:04:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (660944353132417024, 0, '大苏打实打实的', 0, 'A', 5, '<p>2323为</p>', 2, 'admin', '2019-12-29 20:36:54', 'admin', '2019-12-29 20:36:54', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (668114909724282880, 0, '1', 0, 'A', 5, '555', 2, 'admin', '2020-01-18 15:30:07', 'admin', '2020-01-18 15:30:07', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (679455142176755712, NULL, '<p>选择题1</p>', 0, 'A', 5, '选择题1', 2, 'admin', '2020-03-09 22:27:39', 'admin', '2020-03-09 22:16:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (679455223147794432, NULL, '<p>选择题2</p>', 0, 'B', 5, '选择题2', 2, 'admin', '2020-03-09 22:26:16', 'admin', '2020-03-09 22:15:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (679455353129275392, NULL, '<p>选择题3</p>', 0, 'C', 5, '选择题3', 2, 'admin', '2020-03-09 22:26:29', 'admin', '2020-03-09 22:15:34', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (679680049900818432, NULL, '<p>多选题</p>', 3, 'A,C', 5, '多选题', 2, 'admin', '2020-03-09 22:27:10', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (679680687489552384, NULL, '<p>测试两个选项</p>', 0, 'A', 5, '<p>测试两个选项</p>', 2, 'admin', '2020-04-05 11:37:59', 'preview', '2020-04-05 11:27:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696323940339027968, 602231546270846976, '<p>单选题1</p>', 0, 'A', 5, '<p>解析</p>', 2, 'preview', '2020-04-05 11:53:43', 'preview', '2020-04-05 11:42:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696324258506346496, 602231546270846976, '<p>单选题2</p>', 0, 'A', 5, '', 2, 'preview', '2020-04-05 11:44:00', 'preview', '2020-04-05 11:44:00', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696325065393967104, 602231546270846976, '<p>测试多选题1</p>', 3, ',B,C', 5, '<p>测试多选题1</p>', 2, 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696326076057653248, 602231546270846976, '<p>测试判断题2</p>', 0, '正确', 5, '<p>测试判断题2</p>', 2, 'preview', '2020-04-05 11:51:14', 'preview', '2020-04-05 11:51:14', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696329099584606208, NULL, '<p>单选题</p>', 0, 'A', 5, '<p>A</p>', 2, 'preview', '2020-04-05 12:03:15', 'preview', '2020-04-05 12:03:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696329220065988608, NULL, '<p>多选题</p>', 3, ',B,C', 5, '<p>A</p>', 2, 'preview', '2020-04-05 12:03:43', 'preview', '2020-04-05 12:03:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696329435527385088, 602231546270846976, '<p>单选题1</p>', 0, 'A', 5, '<p>解析</p>', 2, 'preview', '2020-04-05 12:04:35', 'preview', '2020-04-05 12:04:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_choices` VALUES (696329516385177600, 602231546270846976, '<p>打分</p>', 0, 'A', 5, '<p>发达</p>', 2, 'preview', '2020-04-05 12:04:54', 'preview', '2020-04-05 12:04:54', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_subject_judgement
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_judgement`;
CREATE TABLE `exam_subject_judgement`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '题目名称',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参考答案',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '分值',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析',
  `level` tinyint(4) NOT NULL COMMENT '难度等级',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简答题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_subject_judgement
-- ----------------------------
INSERT INTO `exam_subject_judgement` VALUES (680772677350330368, NULL, '<p>测试判断题</p>', '正确', 5, '<p>这是解析</p>', 2, 'admin', '2020-04-03 22:49:02', 'preview', '2020-04-03 22:38:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_judgement` VALUES (696325165767856128, 602231546270846976, '<p>测试判断题</p>', '正确', 5, '<p>测试判断题</p>', 2, 'preview', '2020-04-05 12:01:48', 'preview', '2020-04-05 11:50:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_judgement` VALUES (696329277397929984, NULL, '<p>判断题</p>', '正确', 5, '<p>A</p>', 2, 'preview', '2020-04-05 12:03:57', 'preview', '2020-04-05 12:03:57', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_subject_option
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_option`;
CREATE TABLE `exam_subject_option`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `subject_choices_id` bigint(20) NOT NULL COMMENT '选择题ID',
  `option_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '选项名称',
  `option_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '选项内容',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '选择题选项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_subject_option
-- ----------------------------
INSERT INTO `exam_subject_option` VALUES (590970743911747584, 590970743878193152, 'A', '<p>规模</p>', 'admin', '2019-06-19 18:26:45', 'admin', '2019-06-19 18:31:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970743911747585, 590970743878193152, 'B', '<p>功能</p>', 'admin', '2019-06-19 18:26:45', 'admin', '2019-06-19 18:31:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970743911747586, 590970743878193152, 'C', '<p>性能</p>', 'admin', '2019-06-19 18:26:45', 'admin', '2019-06-19 18:31:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970743911747587, 590970743878193152, 'D', '构成元件', 'admin', '2019-06-19 18:26:45', 'admin', '2019-06-19 18:31:29', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970887457607680, 590970887432441856, 'A', '<p>ENIAC</p>', 'admin', '2019-06-19 18:27:19', 'admin', '2019-06-19 18:27:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970887457607681, 590970887432441856, 'B', '<p>EDVAC</p>', 'admin', '2019-06-19 18:27:19', 'admin', '2019-06-19 18:27:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970887457607682, 590970887432441856, 'C', '<p>EDVAE</p>', 'admin', '2019-06-19 18:27:19', 'admin', '2019-06-19 18:27:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590970887457607683, 590970887432441856, 'D', 'MARK', 'admin', '2019-06-19 18:27:19', 'admin', '2019-06-19 18:27:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971026893049856, 590971026880466944, 'A', '<p>集成电路</p>', 'admin', '2019-06-19 18:27:52', 'admin', '2019-06-19 18:27:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971026901438464, 590971026880466944, 'B', '<p>晶体管</p>', 'admin', '2019-06-19 18:27:52', 'admin', '2019-06-19 18:27:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971026901438465, 590971026880466944, 'C', '<p>大规模集成电路</p>', 'admin', '2019-06-19 18:27:52', 'admin', '2019-06-19 18:27:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971026901438466, 590971026880466944, 'D', '电子管', 'admin', '2019-06-19 18:27:52', 'admin', '2019-06-19 18:27:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971151170277376, 590971151128334336, 'A', '<p>辅助设计</p>', 'admin', '2019-06-19 18:28:22', 'admin', '2019-06-19 18:28:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971151170277377, 590971151128334336, 'B', '<p>科学计算</p>', 'admin', '2019-06-19 18:28:22', 'admin', '2019-06-19 18:28:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971151170277378, 590971151128334336, 'C', '<p>数据处理</p>', 'admin', '2019-06-19 18:28:22', 'admin', '2019-06-19 18:28:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971151170277379, 590971151128334336, 'D', '<p>过程控制</p>', 'admin', '2019-06-19 18:28:22', 'admin', '2019-06-19 18:28:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971273560068096, 590971273539096576, 'A', '<p>元材料</p>', 'admin', '2019-06-19 18:28:51', 'admin', '2019-06-19 18:28:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971273560068097, 590971273539096576, 'B', '<p>工艺水平</p>', 'admin', '2019-06-19 18:28:51', 'admin', '2019-06-19 18:28:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971273560068098, 590971273539096576, 'C', '<p>设计水平</p>', 'admin', '2019-06-19 18:28:51', 'admin', '2019-06-19 18:28:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971273560068099, 590971273539096576, 'D', '元器件', 'admin', '2019-06-19 18:28:51', 'admin', '2019-06-19 18:28:51', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971402681716736, 590971402639773696, 'A', '<p>采用了开关电路</p>', 'admin', '2019-06-19 18:29:22', 'admin', '2019-06-19 18:29:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971402681716737, 590971402639773696, 'B', '<p>采用了半导体器件</p>', 'admin', '2019-06-19 18:29:22', 'admin', '2019-06-19 18:29:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971402681716738, 590971402639773696, 'C', '<p>采用了二进制</p>', 'admin', '2019-06-19 18:29:22', 'admin', '2019-06-19 18:29:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971402681716739, 590971402639773696, 'D', '<p>具有存储程序的功能</p>', 'admin', '2019-06-19 18:29:22', 'admin', '2019-06-19 18:29:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971508126519296, 590971508109742080, 'A', '<p>数字电子计算机和模拟电子计算机</p>', 'admin', '2019-06-19 18:29:47', 'admin', '2019-06-19 18:29:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971508126519297, 590971508109742080, 'B', '<p>通用计算机和专用计算机</p>', 'admin', '2019-06-19 18:29:47', 'admin', '2019-06-19 18:29:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971508126519298, 590971508109742080, 'C', '<p>巨型计算机、中小型计算机和微型计算机</p>', 'admin', '2019-06-19 18:29:47', 'admin', '2019-06-19 18:29:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971508126519299, 590971508109742080, 'D', '科学与过程计算计算机、工业控制计算机和数据计算机', 'admin', '2019-06-19 18:29:47', 'admin', '2019-06-19 18:29:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971613961392128, 590971613944614912, 'A', '<p>计算机处理数据的方式</p>', 'admin', '2019-06-19 18:30:12', 'admin', '2019-06-19 18:30:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971613961392129, 590971613944614912, 'B', '<p>计算机使用范围</p>', 'admin', '2019-06-19 18:30:12', 'admin', '2019-06-19 18:30:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971613961392130, 590971613944614912, 'C', '<p>机器的规模</p>', 'admin', '2019-06-19 18:30:12', 'admin', '2019-06-19 18:30:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971613961392131, 590971613944614912, 'D', '计算机的功能和处理能力', 'admin', '2019-06-19 18:30:12', 'admin', '2019-06-19 18:30:12', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971750163025920, 590971750146248704, 'A', '<p>电子数字计算机</p>', 'admin', '2019-06-19 18:30:44', 'admin', '2019-06-19 18:30:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971750167220224, 590971750146248704, 'B', '<p>电子模拟计算机</p>', 'admin', '2019-06-19 18:30:44', 'admin', '2019-06-19 18:30:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971750167220225, 590971750146248704, 'C', '<p>数模混合计算机</p>', 'admin', '2019-06-19 18:30:44', 'admin', '2019-06-19 18:30:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971750167220226, 590971750146248704, 'D', '<p>专用计算机</p>', 'admin', '2019-06-19 18:30:44', 'admin', '2019-06-19 18:30:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971860062179328, 590971860041207808, 'A', '<p>莫尔</p>', 'admin', '2019-06-19 18:31:11', 'admin', '2019-06-19 18:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971860062179329, 590971860041207808, 'B', '<p>比尔&middot;盖次</p>', 'admin', '2019-06-19 18:31:11', 'admin', '2019-06-19 18:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971860062179330, 590971860041207808, 'C', '<p>冯&middot;诺依曼</p>', 'admin', '2019-06-19 18:31:11', 'admin', '2019-06-19 18:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590971860062179331, 590971860041207808, 'D', '科得', 'admin', '2019-06-19 18:31:11', 'admin', '2019-06-19 18:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972141156044800, 590972141118296064, 'A', '<p>周人生活较为富足</p>', 'admin', '2019-06-19 18:32:18', 'admin', '2019-10-20 19:57:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972141156044801, 590972141118296064, 'B', '<p>礼乐文明得到广泛认同</p>', 'admin', '2019-06-19 18:32:18', 'admin', '2019-10-20 19:57:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972141156044802, 590972141118296064, 'C', '<p>乡人社会地位提高</p>', 'admin', '2019-06-19 18:32:18', 'admin', '2019-10-20 19:57:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972141156044803, 590972141118296064, 'D', '<p>贵族奢靡之风波及民间</p>', 'admin', '2019-06-19 18:32:18', 'admin', '2019-10-20 19:57:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972250224726016, 590972250212143104, 'A', '<p>统一进程曲折</p>', 'admin', '2019-06-19 18:32:44', 'admin', '2019-06-19 18:32:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972250224726017, 590972250212143104, 'B', '<p>地方治理不畅</p>', 'admin', '2019-06-19 18:32:44', 'admin', '2019-06-19 18:32:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972250224726018, 590972250212143104, 'C', '<p>始皇灭儒崇法</p>', 'admin', '2019-06-19 18:32:44', 'admin', '2019-06-19 18:32:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972250224726019, 590972250212143104, 'D', '儒学影响较大', 'admin', '2019-06-19 18:32:44', 'admin', '2019-06-19 18:32:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972363127001088, 590972363110223872, 'A', '<p>官僚集团重视本地域人才</p>', 'admin', '2019-06-19 18:33:11', 'admin', '2019-06-19 18:33:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972363127001089, 590972363110223872, 'B', '<p>南北方士人志向差异</p>', 'admin', '2019-06-19 18:33:11', 'admin', '2019-06-19 18:33:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972363127001090, 590972363110223872, 'C', '<p>科举制改变人才地域分布</p>', 'admin', '2019-06-19 18:33:11', 'admin', '2019-06-19 18:33:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972363127001091, 590972363110223872, 'D', '<p>政治中心转移到南方</p>', 'admin', '2019-06-19 18:33:11', 'admin', '2019-06-19 18:33:11', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972473902764032, 590972473877598208, 'A', '<p>&ldquo;师夷长技&rdquo;思想萌发</p>', 'admin', '2019-06-19 18:33:37', 'admin', '2019-06-19 18:33:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972473902764033, 590972473877598208, 'B', '<p>&ldquo;中体西用&rdquo;思潮兴起</p>', 'admin', '2019-06-19 18:33:37', 'admin', '2019-06-19 18:33:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972473902764034, 590972473877598208, 'C', '<p>&ldquo;中体西用&rdquo;思潮兴起</p>', 'admin', '2019-06-19 18:33:37', 'admin', '2019-06-19 18:33:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972473902764035, 590972473877598208, 'D', '<p>&ldquo;尊孔复古&rdquo;思潮泛滥</p>', 'admin', '2019-06-19 18:33:37', 'admin', '2019-06-19 18:33:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972590189842432, 590972590177259520, 'A', '<p>联谊乡邻</p>', 'admin', '2019-06-19 18:34:05', 'admin', '2019-06-19 18:34:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972590189842433, 590972590177259520, 'B', '<p>颂扬盛世</p>', 'admin', '2019-06-19 18:34:05', 'admin', '2019-06-19 18:34:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972590189842434, 590972590177259520, 'C', '<p>缅怀先祖</p>', 'admin', '2019-06-19 18:34:05', 'admin', '2019-06-19 18:34:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972590189842435, 590972590177259520, 'D', '助危济困', 'admin', '2019-06-19 18:34:05', 'admin', '2019-06-19 18:34:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972723392548864, 590972723384160256, 'A', '<p>&ldquo;师夷长技&rdquo;思想萌发</p>', 'admin', '2019-06-19 18:34:37', 'admin', '2019-06-19 18:34:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972723392548865, 590972723384160256, 'B', '<p>&ldquo;中体西用&rdquo;思潮兴起</p>', 'admin', '2019-06-19 18:34:37', 'admin', '2019-06-19 18:34:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972723392548866, 590972723384160256, 'C', '<p>&ldquo;托古改制&rdquo;思想产生</p>', 'admin', '2019-06-19 18:34:37', 'admin', '2019-06-19 18:34:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972723392548867, 590972723384160256, 'D', '<p>&ldquo;尊孔复古&rdquo;思潮泛滥</p>', 'admin', '2019-06-19 18:34:37', 'admin', '2019-06-19 18:34:37', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972834759708672, 590972834734542848, 'A', '<p>中共夺取全国政权时机成熟</p>', 'admin', '2019-06-19 18:35:03', 'admin', '2019-06-19 18:35:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972834759708673, 590972834734542848, 'B', '<p>中共找到符合国情的道路</p>', 'admin', '2019-06-19 18:35:03', 'admin', '2019-06-19 18:35:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972834759708674, 590972834734542848, 'C', '<p>中共找到符合国情的道路</p>', 'admin', '2019-06-19 18:35:03', 'admin', '2019-06-19 18:35:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972834759708675, 590972834734542848, 'D', '<p>中共出现自主革命的倾向</p>', 'admin', '2019-06-19 18:35:03', 'admin', '2019-06-19 18:35:03', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972929714556928, 590972929693585408, 'A', '<p>抑制了官僚资本膨胀</p>', 'admin', '2019-06-19 18:35:26', 'admin', '2019-06-19 18:35:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972929714556929, 590972929693585408, 'B', '<p>挫败了日军经济掠夺</p>', 'admin', '2019-06-19 18:35:26', 'admin', '2019-06-19 18:35:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972929714556930, 590972929693585408, 'C', '<p>防止了国民经济崩溃</p>', 'admin', '2019-06-19 18:35:26', 'admin', '2019-06-19 18:35:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590972929714556931, 590972929693585408, 'D', '积聚了抗战经济力量', 'admin', '2019-06-19 18:35:26', 'admin', '2019-06-19 18:35:26', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973028020654080, 590973027995488256, 'A', '<p>公民培养受强制性约束</p>', 'admin', '2019-06-19 18:35:49', 'admin', '2019-06-19 18:35:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973028020654081, 590973027995488256, 'B', '<p>法律有违人文精神</p>', 'admin', '2019-06-19 18:35:49', 'admin', '2019-06-19 18:35:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973028020654082, 590973027995488256, 'C', '<p>父母失去教育子女资格</p>', 'admin', '2019-06-19 18:35:49', 'admin', '2019-06-19 18:35:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973028020654083, 590973027995488256, 'D', '公民教育制度完备', 'admin', '2019-06-19 18:35:49', 'admin', '2019-06-19 18:35:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973115178291200, 590973115157319680, 'A', '<p>推崇德国文化</p>', 'admin', '2019-06-19 18:36:10', 'admin', '2019-06-19 18:36:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973115178291201, 590973115157319680, 'B', '<p>注意到了德国的威胁</p>', 'admin', '2019-06-19 18:36:10', 'admin', '2019-06-19 18:36:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973115178291202, 590973115157319680, 'C', '<p>喜爱德国产品</p>', 'admin', '2019-06-19 18:36:10', 'admin', '2019-06-19 18:36:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973115178291203, 590973115157319680, 'D', '意识到了德国的崛起', 'admin', '2019-06-19 18:36:10', 'admin', '2019-06-19 18:36:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973253556768768, 590973253544185856, 'A', '<p>战时共产主义政策有所突破</p>', 'admin', '2019-06-19 18:36:43', 'admin', '2019-06-19 18:36:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973253556768769, 590973253544185856, 'B', '<p>新经济政策成效显著</p>', 'admin', '2019-06-19 18:36:43', 'admin', '2019-06-19 18:36:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973253556768770, 590973253544185856, 'C', '<p>国营农庄吸引了大量劳动力</p>', 'admin', '2019-06-19 18:36:43', 'admin', '2019-06-19 18:36:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973253556768771, 590973253544185856, 'D', '政府重视日用品生产', 'admin', '2019-06-19 18:36:43', 'admin', '2019-06-19 18:36:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973360691875840, 590973360662515712, 'A', '<p>揭示了法国倒向社会主义阵营</p>', 'admin', '2019-06-19 18:37:08', 'admin', '2019-06-19 18:37:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973360691875841, 590973360662515712, 'B', '<p>反映了法国推行独立外交</p>', 'admin', '2019-06-19 18:37:08', 'admin', '2019-06-19 18:37:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973360691875842, 590973360662515712, 'C', '<p>体现了两大阵营对抗趋于缓和</p>', 'admin', '2019-06-19 18:37:08', 'admin', '2019-06-19 18:37:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590973360691875843, 590973360662515712, 'D', '体现了两大阵营对抗趋于缓和', 'admin', '2019-06-19 18:37:08', 'admin', '2019-06-19 18:37:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976455823986688, 590976455786237952, 'A', '<p>规模</p>', 'admin', '2019-06-19 18:49:26', 'admin', '2019-07-20 20:29:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976455823986689, 590976455786237952, 'B', '<p>功能</p>', 'admin', '2019-06-19 18:49:26', 'admin', '2019-07-20 20:29:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976455823986690, 590976455786237952, 'C', '<p>性能</p>', 'admin', '2019-06-19 18:49:26', 'admin', '2019-07-20 20:29:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976455823986691, 590976455786237952, 'D', '构成元件', 'admin', '2019-06-19 18:49:26', 'admin', '2019-07-20 20:29:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976456683819008, 590976456675430400, 'A', '<p>规模</p>', 'admin', '2019-06-19 18:49:27', 'admin', '2019-06-19 18:49:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976456683819009, 590976456675430400, 'B', '<p>功能</p>', 'admin', '2019-06-19 18:49:27', 'admin', '2019-06-19 18:49:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976456683819010, 590976456675430400, 'C', '<p>性能</p>', 'admin', '2019-06-19 18:49:27', 'admin', '2019-06-19 18:49:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (590976456683819011, 590976456675430400, 'D', '构成元件', 'admin', '2019-06-19 18:49:27', 'admin', '2019-06-19 18:49:27', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (602231589723836416, 602231589715447808, 'A', '32', 'admin', '2019-07-20 20:13:20', 'admin', '2019-07-20 20:30:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (602231589723836417, 602231589715447808, 'B', '323', 'admin', '2019-07-20 20:13:20', 'admin', '2019-07-20 20:30:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (602231589723836418, 602231589715447808, 'C', '323', 'admin', '2019-07-20 20:13:20', 'admin', '2019-07-20 20:30:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (602231589723836419, 602231589715447808, 'D', '323', 'admin', '2019-07-20 20:13:20', 'admin', '2019-07-20 20:30:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625063647999299584, 625063647458234368, 'A', '', 'admin', '2019-09-21 20:19:47', 'admin', '2019-09-21 20:19:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625063647999299585, 625063647458234368, 'B', '', 'admin', '2019-09-21 20:19:47', 'admin', '2019-09-21 20:19:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625063647999299586, 625063647458234368, 'C', '', 'admin', '2019-09-21 20:19:47', 'admin', '2019-09-21 20:19:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625063647999299587, 625063647458234368, 'D', '', 'admin', '2019-09-21 20:19:47', 'admin', '2019-09-21 20:19:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625065138394894336, 625065137853829120, 'A', '', 'admin', '2019-09-21 20:25:42', 'admin', '2019-09-21 20:25:42', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625065138394894337, 625065137853829120, 'B', '', 'admin', '2019-09-21 20:25:42', 'admin', '2019-09-21 20:25:42', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625065138394894338, 625065137853829120, 'C', '', 'admin', '2019-09-21 20:25:42', 'admin', '2019-09-21 20:25:42', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625065138394894339, 625065137853829120, 'D', '', 'admin', '2019-09-21 20:25:42', 'admin', '2019-09-21 20:25:42', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625819207472386048, 625819206985846784, 'A', '', 'admin', '2019-09-23 22:22:06', 'admin', '2019-09-23 22:22:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625819207472386049, 625819206985846784, 'B', '', 'admin', '2019-09-23 22:22:06', 'admin', '2019-09-23 22:22:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625819207472386050, 625819206985846784, 'C', '', 'admin', '2019-09-23 22:22:06', 'admin', '2019-09-23 22:22:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625819207472386051, 625819206985846784, 'D', '', 'admin', '2019-09-23 22:22:06', 'admin', '2019-09-23 22:22:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625826265500356608, 625826265252892672, 'A', '2', 'admin', '2019-09-23 22:50:09', 'admin', '2019-09-23 22:50:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625826265500356609, 625826265252892672, 'B', '2', 'admin', '2019-09-23 22:50:09', 'admin', '2019-09-23 22:50:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625826265500356610, 625826265252892672, 'C', '22', 'admin', '2019-09-23 22:50:09', 'admin', '2019-09-23 22:50:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625826265508745216, 625826265252892672, 'D', '2', 'admin', '2019-09-23 22:50:09', 'admin', '2019-09-23 22:50:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625827733783580672, 625827733561282560, 'A', '2', 'admin', '2019-09-23 22:55:59', 'admin', '2019-09-23 22:55:59', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625827733783580673, 625827733561282560, 'B', '2', 'admin', '2019-09-23 22:55:59', 'admin', '2019-09-23 22:55:59', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625827733783580674, 625827733561282560, 'C', '2', 'admin', '2019-09-23 22:55:59', 'admin', '2019-09-23 22:55:59', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (625827733783580675, 625827733561282560, 'D', '2', 'admin', '2019-09-23 22:55:59', 'admin', '2019-09-23 22:55:59', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630783408691351552, 630783408150286336, 'A', '', 'admin', '2019-10-07 15:08:04', 'admin', '2019-10-07 15:08:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630783408691351553, 630783408150286336, 'B', '', 'admin', '2019-10-07 15:08:04', 'admin', '2019-10-07 15:08:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630783408691351554, 630783408150286336, 'C', '', 'admin', '2019-10-07 15:08:04', 'admin', '2019-10-07 15:08:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630783408691351555, 630783408150286336, 'D', '', 'admin', '2019-10-07 15:08:04', 'admin', '2019-10-07 15:08:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793085604990976, 630793085445607424, 'A', '1', 'admin', '2019-10-07 15:46:31', 'admin', '2019-10-07 15:46:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793085604990977, 630793085445607424, 'B', '1', 'admin', '2019-10-07 15:46:31', 'admin', '2019-10-07 15:46:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793085604990978, 630793085445607424, 'C', '1', 'admin', '2019-10-07 15:46:31', 'admin', '2019-10-07 15:46:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793085604990979, 630793085445607424, 'D', '1', 'admin', '2019-10-07 15:46:31', 'admin', '2019-10-07 15:46:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793359186857984, 630793358951976960, 'A', '2', 'admin', '2019-10-07 15:47:36', 'admin', '2019-10-07 15:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793359186857985, 630793358951976960, 'B', '2', 'admin', '2019-10-07 15:47:36', 'admin', '2019-10-07 15:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793359186857986, 630793358951976960, 'C', '2', 'admin', '2019-10-07 15:47:36', 'admin', '2019-10-07 15:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630793359186857987, 630793358951976960, 'D', '2', 'admin', '2019-10-07 15:47:36', 'admin', '2019-10-07 15:47:36', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856320001642496, 630856319242473472, 'A', '1', 'admin', '2019-10-07 19:57:47', 'admin', '2019-10-07 19:57:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856320001642497, 630856319242473472, 'B', '1', 'admin', '2019-10-07 19:57:47', 'admin', '2019-10-07 19:57:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856320001642498, 630856319242473472, 'C', '1', 'admin', '2019-10-07 19:57:47', 'admin', '2019-10-07 19:57:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856320001642499, 630856319242473472, 'D', '1', 'admin', '2019-10-07 19:57:47', 'admin', '2019-10-07 19:57:47', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856451967029248, 630856451555987456, 'A', '2', 'admin', '2019-10-07 19:58:19', 'admin', '2019-10-07 19:58:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856451967029249, 630856451555987456, 'B', '2', 'admin', '2019-10-07 19:58:19', 'admin', '2019-10-07 19:58:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856451967029250, 630856451555987456, 'C', '2', 'admin', '2019-10-07 19:58:19', 'admin', '2019-10-07 19:58:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856451967029251, 630856451555987456, 'D', '2', 'admin', '2019-10-07 19:58:19', 'admin', '2019-10-07 19:58:19', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856496783167488, 630856496279851008, 'A', '3', 'admin', '2019-10-07 19:58:30', 'admin', '2019-10-07 19:58:30', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856496783167489, 630856496279851008, 'B', '3', 'admin', '2019-10-07 19:58:30', 'admin', '2019-10-07 19:58:30', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856496783167490, 630856496279851008, 'C', '3', 'admin', '2019-10-07 19:58:30', 'admin', '2019-10-07 19:58:30', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856496783167491, 630856496279851008, 'D', '3', 'admin', '2019-10-07 19:58:30', 'admin', '2019-10-07 19:58:30', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856557424414720, 630856556883349504, 'A', '3', 'admin', '2019-10-07 19:58:44', 'admin', '2019-10-07 19:58:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856557424414721, 630856556883349504, 'B', '3', 'admin', '2019-10-07 19:58:44', 'admin', '2019-10-07 19:58:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856557432803328, 630856556883349504, 'C', '3', 'admin', '2019-10-07 19:58:44', 'admin', '2019-10-07 19:58:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630856557432803329, 630856556883349504, 'D', '3', 'admin', '2019-10-07 19:58:44', 'admin', '2019-10-07 19:58:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880823066890240, 630880822542602240, 'A', '1', 'admin', '2019-10-07 21:35:09', 'admin', '2019-10-07 21:35:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880823066890241, 630880822542602240, 'B', '1', 'admin', '2019-10-07 21:35:09', 'admin', '2019-10-07 21:35:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880823066890242, 630880822542602240, 'C', '1', 'admin', '2019-10-07 21:35:09', 'admin', '2019-10-07 21:35:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880823066890243, 630880822542602240, 'D', '', 'admin', '2019-10-07 21:35:09', 'admin', '2019-10-07 21:35:09', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880853412679680, 630880852892585984, 'A', '2', 'admin', '2019-10-07 21:35:17', 'admin', '2019-10-07 21:35:17', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880853412679681, 630880852892585984, 'B', '2', 'admin', '2019-10-07 21:35:17', 'admin', '2019-10-07 21:35:17', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880853412679682, 630880852892585984, 'C', '2', 'admin', '2019-10-07 21:35:17', 'admin', '2019-10-07 21:35:17', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880853412679683, 630880852892585984, 'D', '2', 'admin', '2019-10-07 21:35:17', 'admin', '2019-10-07 21:35:17', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880882231742464, 630880881720037376, 'A', '3', 'admin', '2019-10-07 21:35:24', 'admin', '2019-10-07 21:35:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880882231742465, 630880881720037376, 'B', '3', 'admin', '2019-10-07 21:35:24', 'admin', '2019-10-07 21:35:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880882231742466, 630880881720037376, 'C', '3', 'admin', '2019-10-07 21:35:24', 'admin', '2019-10-07 21:35:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (630880882231742467, 630880881720037376, 'D', '3', 'admin', '2019-10-07 21:35:24', 'admin', '2019-10-07 21:35:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (635557908268060672, 635557907726995456, 'A', '434', 'admin', '2019-10-20 19:20:13', 'admin', '2019-10-20 19:20:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (635557908268060673, 635557907726995456, 'B', '43', 'admin', '2019-10-20 19:20:13', 'admin', '2019-10-20 19:20:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (635557908268060674, 635557907726995456, 'C', '4', 'admin', '2019-10-20 19:20:13', 'admin', '2019-10-20 19:20:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (635557908276449280, 635557907726995456, 'D', '3434', 'admin', '2019-10-20 19:20:13', 'admin', '2019-10-20 19:20:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660248786647519232, 660248785791881216, 'A', '1', 'admin', '2019-12-27 22:32:58', 'admin', '2019-12-27 22:32:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660248786647519233, 660248785791881216, 'B', '1', 'admin', '2019-12-27 22:32:58', 'admin', '2019-12-27 22:32:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660248786647519234, 660248785791881216, 'C', '1', 'admin', '2019-12-27 22:32:58', 'admin', '2019-12-27 22:32:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660248786647519235, 660248785791881216, 'D', '1', 'admin', '2019-12-27 22:32:58', 'admin', '2019-12-27 22:32:58', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660573712646541312, 660573712097087488, 'A', '<p>2</p>', 'admin', '2019-12-28 20:04:06', 'admin', '2019-12-28 20:04:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660573712646541313, 660573712097087488, 'B', '<p>22</p>', 'admin', '2019-12-28 20:04:06', 'admin', '2019-12-28 20:04:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660573712646541314, 660573712097087488, 'C', '<p>2</p>', 'admin', '2019-12-28 20:04:06', 'admin', '2019-12-28 20:04:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660573712646541315, 660573712097087488, 'D', '<p>2323</p>', 'admin', '2019-12-28 20:04:06', 'admin', '2019-12-28 20:04:06', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660937117618278400, 660937116812972032, 'A', '<p>AAAAAA</p>', 'admin', '2019-12-29 20:08:08', 'admin', '2019-12-29 20:08:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660937117618278401, 660937116812972032, 'B', '<p>BBBBBB</p>', 'admin', '2019-12-29 20:08:08', 'admin', '2019-12-29 20:08:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660937117618278402, 660937116812972032, 'C', '', 'admin', '2019-12-29 20:08:08', 'admin', '2019-12-29 20:08:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660937117618278403, 660937116812972032, 'D', '', 'admin', '2019-12-29 20:08:08', 'admin', '2019-12-29 20:08:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660941851133612032, 660941850579963904, 'A', '干干干干干干', 'admin', '2019-12-29 20:26:57', 'admin', '2019-12-29 20:26:57', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660941851133612033, 660941850579963904, 'B', '干干干干干', 'admin', '2019-12-29 20:26:57', 'admin', '2019-12-29 20:26:57', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660941851133612034, 660941850579963904, 'C', '干干干干干干', 'admin', '2019-12-29 20:26:57', 'admin', '2019-12-29 20:26:57', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660941851133612035, 660941850579963904, 'D', '干干干干干干', 'admin', '2019-12-29 20:26:57', 'admin', '2019-12-29 20:26:57', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660942635250356224, 660942634457632768, 'A', '的发射点发射点', 'admin', '2019-12-29 20:30:04', 'admin', '2019-12-29 20:30:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660942635250356225, 660942634457632768, 'B', '打发手动阀撒旦', 'admin', '2019-12-29 20:30:04', 'admin', '2019-12-29 20:30:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660942635250356226, 660942634457632768, 'C', '蒂法蒂法但是', 'admin', '2019-12-29 20:30:04', 'admin', '2019-12-29 20:30:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660942635250356227, 660942634457632768, 'D', '放大发生的', 'admin', '2019-12-29 20:30:04', 'admin', '2019-12-29 20:30:04', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660944352176115712, 660944350934601728, 'A', '的发射点发射点', 'admin', '2019-12-29 20:36:53', 'admin', '2019-12-29 20:36:53', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660944352176115713, 660944350934601728, 'B', '打发手动阀撒旦', 'admin', '2019-12-29 20:36:53', 'admin', '2019-12-29 20:36:53', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660944352176115714, 660944350934601728, 'C', '蒂法蒂法但是', 'admin', '2019-12-29 20:36:53', 'admin', '2019-12-29 20:36:53', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (660944352176115715, 660944350934601728, 'D', '放大发生的', 'admin', '2019-12-29 20:36:53', 'admin', '2019-12-29 20:36:53', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (661321950190243840, 661321949674344448, 'A', '323', 'admin', '2019-12-30 21:37:20', 'admin', '2019-12-30 21:37:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (661321950190243841, 661321949674344448, 'B', '3233', 'admin', '2019-12-30 21:37:20', 'admin', '2019-12-30 21:37:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (661321950190243842, 661321949674344448, 'C', '32323', 'admin', '2019-12-30 21:37:20', 'admin', '2019-12-30 21:37:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (661321950190243843, 661321949674344448, 'D', '3232323', 'admin', '2019-12-30 21:37:20', 'admin', '2019-12-30 21:37:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (661322975735320576, 661322812270710784, 'A', '2', 'admin', '2019-12-30 21:41:24', 'admin', '2019-12-30 21:41:24', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114910005301248, 668114909753643008, 'A', '23', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114910005301249, 668114909753643008, 'B', '32', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114910005301250, 668114909753643008, 'C', '3233', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114910005301251, 668114909753643008, 'D', '23', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114911150346240, 668114909724282880, 'A', '23', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114911150346241, 668114909724282880, 'B', '32', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114911150346242, 668114909724282880, 'C', '3233', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (668114911150346243, 668114909724282880, 'D', '23', 'admin', '2020-01-18 15:30:08', 'admin', '2020-01-18 15:30:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672765654515978240, 672765654134296576, 'A', '选项11111', 'admin', '2020-01-31 11:30:31', 'admin', '2020-01-31 11:30:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672765654515978241, 672765654134296576, 'B', '选项2', 'admin', '2020-01-31 11:30:31', 'admin', '2020-01-31 11:30:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672765654515978242, 672765654134296576, 'C', '选项3', 'admin', '2020-01-31 11:30:31', 'admin', '2020-01-31 11:30:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672765654515978243, 672765654134296576, 'D', '选项4', 'admin', '2020-01-31 11:30:31', 'admin', '2020-01-31 11:30:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768293509140480, 672768293106487296, 'A', '选项11111', 'admin', '2020-01-31 11:41:01', 'admin', '2020-01-31 11:41:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768293513334784, 672768293106487296, 'B', '选项2', 'admin', '2020-01-31 11:41:01', 'admin', '2020-01-31 11:41:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768293513334785, 672768293106487296, 'C', '选项3', 'admin', '2020-01-31 11:41:01', 'admin', '2020-01-31 11:41:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768293513334786, 672768293106487296, 'D', '选项4', 'admin', '2020-01-31 11:41:01', 'admin', '2020-01-31 11:41:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768816400437248, 672768816001978368, 'A', '选项11111', 'admin', '2020-01-31 11:43:05', 'admin', '2020-01-31 11:43:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768816400437249, 672768816001978368, 'B', '选项2', 'admin', '2020-01-31 11:43:05', 'admin', '2020-01-31 11:43:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768816400437250, 672768816001978368, 'C', '选项3', 'admin', '2020-01-31 11:43:05', 'admin', '2020-01-31 11:43:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672768816400437251, 672768816001978368, 'D', '选项4', 'admin', '2020-01-31 11:43:05', 'admin', '2020-01-31 11:43:05', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672824501511262208, 672824501133774849, 'A', '1', 'admin', '2020-01-31 15:24:22', 'admin', '2020-01-31 15:24:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672824501511262209, 672824501133774849, 'B', '1', 'admin', '2020-01-31 15:24:22', 'admin', '2020-01-31 15:24:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672824501511262210, 672824501133774849, 'C', '1', 'admin', '2020-01-31 15:24:22', 'admin', '2020-01-31 15:24:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (672824501511262211, 672824501133774849, 'D', '1', 'admin', '2020-01-31 15:24:22', 'admin', '2020-01-31 15:24:22', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455143225331712, 679455142176755712, 'A', '<p>选择题1</p>', 'admin', '2020-02-18 22:32:10', 'admin', '2020-03-09 22:16:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455143225331713, 679455142176755712, 'B', '<p>选择题1</p>', 'admin', '2020-02-18 22:32:10', 'admin', '2020-03-09 22:16:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455143225331714, 679455142176755712, 'C', '<p>选择题1</p>', 'admin', '2020-02-18 22:32:10', 'admin', '2020-03-09 22:16:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455143225331715, 679455142176755712, 'D', '<p>选择题1</p>', 'admin', '2020-02-18 22:32:10', 'admin', '2020-03-09 22:16:44', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455224125067264, 679455223147794432, 'A', '<p>选择题2</p>', 'admin', '2020-02-18 22:32:29', 'admin', '2020-03-09 22:15:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455224125067265, 679455223147794432, 'B', '<p>选择题2</p>', 'admin', '2020-02-18 22:32:29', 'admin', '2020-03-09 22:15:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455224125067266, 679455223147794432, 'C', '<p>选择题2</p>', 'admin', '2020-02-18 22:32:29', 'admin', '2020-03-09 22:15:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455224129261568, 679455223147794432, 'D', '<p>选择题2</p>', 'admin', '2020-02-18 22:32:29', 'admin', '2020-03-09 22:15:20', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455354119131136, 679455353129275392, 'A', '<p>选择题3</p>', 'admin', '2020-02-18 22:33:00', 'admin', '2020-03-09 22:15:34', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455354119131137, 679455353129275392, 'B', '<p>选择题3</p>', 'admin', '2020-02-18 22:33:00', 'admin', '2020-03-09 22:15:34', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455354119131138, 679455353129275392, 'C', '<p>选择题3</p>', 'admin', '2020-02-18 22:33:00', 'admin', '2020-03-09 22:15:34', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679455354119131139, 679455353129275392, 'D', '<p>选择题3</p>', 'admin', '2020-02-18 22:33:00', 'admin', '2020-03-09 22:15:34', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680050878091264, 679680049900818432, 'A', '<p>多选题</p>', 'admin', '2020-02-19 13:25:52', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680050878091265, 679680049900818432, 'B', '<p>多选题</p>', 'admin', '2020-02-19 13:25:52', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680050878091266, 679680049900818432, 'C', '<p>多选题</p>', 'admin', '2020-02-19 13:25:52', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680050878091267, 679680049900818432, 'D', '<p>多选题</p>', 'admin', '2020-02-19 13:25:52', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680050878091268, 679680049900818432, 'E', '<p>多选题</p>', 'admin', '2020-02-19 13:25:52', 'admin', '2020-03-09 22:16:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680688584265728, 679680687489552384, 'A', '测试两个选项', 'admin', '2020-02-19 13:28:24', 'admin', '2020-04-05 11:27:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (679680688584265729, 679680687489552384, 'B', '<p>测试两个选项</p>', 'admin', '2020-02-19 13:28:24', 'admin', '2020-04-05 11:27:08', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696323941173694464, 696323940339027968, 'A', '<p>测试1</p>', 'preview', '2020-04-05 11:42:45', 'preview', '2020-04-05 11:42:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696323941173694465, 696323940339027968, 'B', '<p>测试2</p>', 'preview', '2020-04-05 11:42:45', 'preview', '2020-04-05 11:42:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696323941173694466, 696323940339027968, 'C', '<p>测试3</p>', 'preview', '2020-04-05 11:42:45', 'preview', '2020-04-05 11:42:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696323941173694467, 696323940339027968, 'D', '<p>测试4</p>', 'preview', '2020-04-05 11:42:45', 'preview', '2020-04-05 11:42:52', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696324259345207296, 696324258506346496, 'A', '<p>测试1</p>', 'preview', '2020-04-05 11:44:01', 'preview', '2020-04-05 11:44:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696324259345207297, 696324258506346496, 'B', '<p>测试2</p>', 'preview', '2020-04-05 11:44:01', 'preview', '2020-04-05 11:44:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696324259345207298, 696324258506346496, 'C', '<p>测试3</p>', 'preview', '2020-04-05 11:44:01', 'preview', '2020-04-05 11:44:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696324259345207299, 696324258506346496, 'D', '<p>测试4</p>', 'preview', '2020-04-05 11:44:01', 'preview', '2020-04-05 11:44:01', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696325066228633600, 696325065393967104, 'A', '<p>测试多选题1</p>', 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696325066228633601, 696325065393967104, 'B', '<p>测试多选题1</p>', 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696325066228633602, 696325065393967104, 'C', '<p>测试多选题1</p>', 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696325066228633603, 696325065393967104, 'D', '<p>测试多选题1</p>', 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696325066228633604, 696325065393967104, 'E', '<p>测试多选题1</p>', 'preview', '2020-04-05 11:47:13', 'preview', '2020-04-05 11:47:13', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329100368941056, 696329099584606208, 'A', '<p>A</p>', 'preview', '2020-04-05 12:03:15', 'preview', '2020-04-05 12:03:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329100368941057, 696329099584606208, 'B', '<p>B</p>', 'preview', '2020-04-05 12:03:15', 'preview', '2020-04-05 12:03:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329100368941058, 696329099584606208, 'C', '<p>C</p>', 'preview', '2020-04-05 12:03:15', 'preview', '2020-04-05 12:03:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329100368941059, 696329099584606208, 'D', '<p>D</p>', 'preview', '2020-04-05 12:03:15', 'preview', '2020-04-05 12:03:15', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329220858712064, 696329220065988608, 'A', '<p>A</p>', 'preview', '2020-04-05 12:03:43', 'preview', '2020-04-05 12:03:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329220858712065, 696329220065988608, 'B', '<p>B</p>', 'preview', '2020-04-05 12:03:43', 'preview', '2020-04-05 12:03:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329220858712066, 696329220065988608, 'C', '<p>C</p>', 'preview', '2020-04-05 12:03:43', 'preview', '2020-04-05 12:03:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329220858712067, 696329220065988608, 'D', '<p>D</p>', 'preview', '2020-04-05 12:03:43', 'preview', '2020-04-05 12:03:43', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329436286554112, 696329435527385088, 'A', '<p>测试1</p>', 'preview', '2020-04-05 12:04:35', 'preview', '2020-04-05 12:04:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329436286554113, 696329435527385088, 'B', '<p>测试2</p>', 'preview', '2020-04-05 12:04:35', 'preview', '2020-04-05 12:04:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329436286554114, 696329435527385088, 'C', '<p>测试3</p>', 'preview', '2020-04-05 12:04:35', 'preview', '2020-04-05 12:04:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329436286554115, 696329435527385088, 'D', '<p>测试4</p>', 'preview', '2020-04-05 12:04:35', 'preview', '2020-04-05 12:04:35', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329517161123840, 696329516385177600, 'A', '<p>测试1</p>', 'preview', '2020-04-05 12:04:54', 'preview', '2020-04-05 12:04:54', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329517161123841, 696329516385177600, 'B', '<p>测试2</p>', 'preview', '2020-04-05 12:04:54', 'preview', '2020-04-05 12:04:54', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329517161123842, 696329516385177600, 'C', '<p>测试3</p>', 'preview', '2020-04-05 12:04:54', 'preview', '2020-04-05 12:04:54', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_option` VALUES (696329517161123843, 696329516385177600, 'D', '<p>测试4</p>', 'preview', '2020-04-05 12:04:54', 'preview', '2020-04-05 12:04:54', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for exam_subject_short_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_subject_short_answer`;
CREATE TABLE `exam_subject_short_answer`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目名称',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参考答案',
  `score` int(11) NOT NULL COMMENT '分值',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析',
  `level` tinyint(4) NOT NULL COMMENT '难度等级',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简答题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_subject_short_answer
-- ----------------------------
INSERT INTO `exam_subject_short_answer` VALUES (680037906714333184, NULL, '<p>测试简答题</p>', '<p>测试简答题</p>', 5, '<p>这是答案</p>', 4, 'admin', '2020-04-03 22:44:06', 'preview', '2020-04-03 22:33:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_short_answer` VALUES (696326726975885312, 602231546270846976, '<p>测试简答题1</p>', '<p>测试简答题1</p>', 5, '<p>测试简答题1</p>', 2, 'preview', '2020-04-05 12:06:21', 'preview', '2020-04-05 11:55:31', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_short_answer` VALUES (696327229180874752, 602231546270846976, '<p>测试简答题2</p>', '<p>测试简答题2</p>', 5, '<p>测试简答题2</p>', 2, 'preview', '2020-04-05 11:55:49', 'preview', '2020-04-05 11:55:49', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_short_answer` VALUES (696329333312196608, NULL, '<p>简答题</p>', '<p>A</p>', 5, '<p>B</p>', 2, 'preview', '2020-04-05 12:04:10', 'preview', '2020-04-05 12:04:10', 0, 'EXAM', 'gitee');
INSERT INTO `exam_subject_short_answer` VALUES (696329371371311104, NULL, '<p>简答题2</p>', '<p>地方大</p>', 5, '<p>打单发</p>', 2, 'preview', '2020-04-05 12:04:19', 'preview', '2020-04-05 12:04:19', 0, 'EXAM', 'gitee');

SET FOREIGN_KEY_CHECKS = 1;

USE `microservice-user`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` bigint(20) NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `preview_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览地址',
  `upload_type` tinyint(4) NULL DEFAULT NULL COMMENT '上传类型',
  `creator` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dept_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_leader` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级部门id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (596290673729212416, '基础平台部', '基础平台部', '管理员', -1, 30, 'admin', '2020-02-23 14:37:56', 'admin', '2020-02-23 14:27:13', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `creator` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `application_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `data_level` int(11) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('571348650370928640', '个人管理', 'personal', '/api/user/v1/personal/**', '-1', 'user', '30', '0', 1, 'admin', '2019-04-26 14:55:33', 'admin', '2020-02-22 13:03:09', '0', 'EXAM', 'Layout', '/personal', NULL, '个人管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571349816924311552', '个人资料', 'personal:message', '/api/user/v1/user/updateInfo', '571348650370928640', '', '29', '0', 1, 'admin', '2019-04-26 15:00:11', 'admin', '2019-04-26 15:00:11', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料', 'gitee');
INSERT INTO `sys_menu` VALUES ('571350099653955584', '修改密码', 'personal:password', '/api/user/v1/user/updateInfo', '571348650370928640', '', '30', '0', 1, 'admin', '2019-04-26 15:01:18', 'admin', '2019-04-26 15:01:18', '0', 'EXAM', 'views/personal/password', 'password', NULL, '修改密码', 'gitee');
INSERT INTO `sys_menu` VALUES ('571351763521769472', '附件管理', 'attachment', '/api/user/v1/attachment/**', '-1', 'documentation', '10', '0', 1, 'admin', '2019-04-26 15:07:55', 'admin', '2020-02-22 13:02:22', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352087896657920', '附件列表', 'attachment:list', '/api/user/v1/attachment/list', '571351763521769472', '', '30', '0', 1, 'admin', '2019-04-26 15:09:12', 'admin', '2019-04-26 15:09:12', '0', 'EXAM', 'views/attachment/list', 'list', NULL, '附件列表', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352797233156096', '考务管理', 'exam', '/api/exam/**', '-1', 'nested', '8', '0', 1, 'admin', '2019-04-26 15:12:02', 'admin', '2019-05-23 21:28:32', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353230286655488', '课程管理', 'exam:course', '/api/exam/v1/course/**', '571352797233156096', '', '1', '0', 1, 'admin', '2019-04-26 15:13:45', 'admin', '2019-04-26 15:13:45', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353525381107712', '考试管理', 'exam:exam', '/api/exam/v1/examination/**', '571352797233156096', '', '2', '0', 1, 'admin', '2019-04-26 15:14:55', 'admin', '2019-04-26 15:14:55', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353992756596736', '题库管理', 'exam:subject', '/api/exam/v1/subject/**', '571352797233156096', '', '3', '0', 1, 'admin', '2019-04-26 15:16:47', 'admin', '2019-04-26 15:16:47', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354428217626624', '成绩管理', 'exam:examRecord', '/api/exam/v1/examRecord/**', '571352797233156096', '', '4', '0', 1, 'admin', '2019-04-26 15:18:30', 'admin', '2019-04-26 15:18:30', '0', 'EXAM', 'views/exam/examRecord', 'score', NULL, '成绩管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354823258148864', '知识库', 'exam:knowledge', '/api/exam/v1/knowledge/**', '571352797233156096', '', '5', '0', 1, 'admin', '2019-04-26 15:20:05', 'admin', '2019-04-26 15:20:05', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, '知识库', 'gitee');
INSERT INTO `sys_menu` VALUES ('571355240792723456', '新增课程', 'exam:course:add', NULL, '571353230286655488', '', '1', '1', 1, 'admin', '2019-04-26 15:21:44', 'admin', '2019-04-26 15:21:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355418715099136', '修改课程', 'exam:course:edit', NULL, '571353230286655488', '', '2', '1', 1, 'admin', '2019-04-26 15:22:27', 'admin', '2019-04-26 15:22:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355486121758720', '删除课程', 'exam:course:del', NULL, '571353230286655488', '', '3', '1', 1, 'admin', '2019-04-26 15:22:43', 'admin', '2019-04-26 15:22:43', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355686403969024', '新增考试', 'exam:exam:add', NULL, '571353525381107712', '', '1', '1', 1, 'admin', '2019-04-26 15:23:30', 'admin', '2019-04-26 15:23:30', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355830226653184', '修改课程', 'exam:exam:edit', NULL, '571353525381107712', '', '2', '1', 1, 'admin', '2019-04-26 15:24:05', 'admin', '2019-04-26 15:24:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355921259827200', '删除考试', 'exam:exam:del', NULL, '571353525381107712', '', '3', '1', 1, 'admin', '2019-04-26 15:24:26', 'admin', '2019-04-26 15:24:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356206782877696', '题目管理', 'exam:exam:subject', NULL, '571353525381107712', '', '4', '1', 1, 'admin', '2019-04-26 15:25:34', 'admin', '2019-04-26 15:25:34', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356537642160128', '导出题目', 'exam:exam:subject:export', NULL, '571353525381107712', '', '5', '1', 1, 'admin', '2019-04-26 15:26:53', 'admin', '2019-04-26 15:27:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356877741494272', '导入题目', 'exam:exam:subject:import', NULL, '571353525381107712', '', '6', '1', 1, 'admin', '2019-04-26 15:28:14', 'admin', '2019-04-26 15:28:14', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357072436891648', '新增题目', 'exam:exam:subject:add', NULL, '571353525381107712', '', '7', '1', 1, 'admin', '2019-04-26 15:29:01', 'admin', '2019-04-26 15:29:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357235276550144', '删除题目', 'exam:exam:subject:del', NULL, '571353525381107712', '', '8', '1', 1, 'admin', '2019-04-26 15:29:40', 'admin', '2019-04-26 15:29:40', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357509638557696', '新增题目', 'exam:subject:bank:add', NULL, '571353992756596736', '', '1', '1', 1, 'admin', '2019-04-26 15:30:45', 'admin', '2019-04-26 15:30:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357821778661376', '修改题目', 'exam:subject:bank:edit', NULL, '571353992756596736', '', '2', '1', 1, 'admin', '2019-04-26 15:32:00', 'admin', '2019-04-26 15:32:00', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357937931522048', '删除题目', 'exam:subject:bank:del', NULL, '571353992756596736', '', '3', '1', 1, 'admin', '2019-04-26 15:32:27', 'admin', '2019-04-26 17:41:21', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358188264361984', '新增题目分类', 'exam:subject:category:add', NULL, '571353992756596736', '', '4', '1', 1, 'admin', '2019-04-26 15:33:27', 'admin', '2019-04-26 15:33:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358308477308928', '修改题目分类', 'exam:subject:category:edit', NULL, '571353992756596736', '', '5', '1', 1, 'admin', '2019-04-26 15:33:56', 'admin', '2019-04-26 15:33:56', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358407353831424', '删除题目分类', 'exam:subject:category:del', NULL, '571353992756596736', '', '6', '1', 1, 'admin', '2019-04-26 15:34:19', 'admin', '2019-04-26 15:34:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358617991778304', '导入题目', 'exam:subject:bank:import', NULL, '571353992756596736', '', '7', '1', 1, 'admin', '2019-04-26 15:35:09', 'admin', '2019-04-26 15:35:09', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358928483520512', '导出题目', 'exam:subject:bank:export', NULL, '571353992756596736', '', '8', '1', 1, 'admin', '2019-04-26 15:36:23', 'admin', '2019-04-26 15:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571359163205160960', '导出成绩', 'exam:examRecord:export', NULL, '571354428217626624', '', '30', '1', 1, 'admin', '2019-04-26 15:37:19', 'admin', '2019-04-26 15:37:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571361163502292992', '系统监控', 'sys', '/api/monitor/**', '-1', 'monitoring', '7', '0', 1, 'admin', '2019-04-26 15:45:16', 'admin', '2020-02-22 13:01:08', '0', 'EXAM', 'Layout', '/monitor', NULL, '系统监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361526066319360', '日志监控', 'monitor:log', '/api/user/v1/log/**', '571361163502292992', '', '30', '0', 1, 'admin', '2019-04-26 15:46:43', 'admin', '2019-04-26 15:46:43', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361746552492032', 'consul监控', 'monitor:service', '/api/monitor/service/**', '571361163502292992', '', '31', '0', 1, 'admin', '2019-04-26 15:47:35', 'admin', '2020-02-23 16:20:39', '0', 'EXAM', NULL, 'http://118.25.138.130:8500', NULL, 'consul监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571362994005610496', 'zipkin监控', 'monitor:link', '/api/monitor/**', '571361163502292992', '', '32', '0', 1, 'admin', '2019-04-26 15:52:33', 'admin', '2020-02-23 16:18:46', '0', 'EXAM', NULL, 'http://118.25.138.130:9411/zipkin', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363268497641472', '服务监控', 'monitor:admin', '/api/monitor/**', '571361163502292992', '', '33', '0', 1, 'admin', '2019-04-26 15:53:38', 'admin', '2020-02-23 16:20:24', '0', 'EXAM', NULL, 'http://118.25.138.130:9186/admin', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363537549660160', '接口文档', 'monitor:document', '/api/monitor/**', '571361163502292992', '', '34', '0', 1, 'admin', '2019-04-26 15:54:42', 'admin', '2020-02-23 16:19:58', '0', 'EXAM', NULL, 'http://118.25.138.130:9180/swagger-ui.html', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571364115214372864', '删除日志', 'monitor:log:del', NULL, '571361526066319360', '', '30', '1', 1, 'admin', '2019-04-26 15:57:00', 'admin', '2019-04-26 15:57:00', '0', 'EXAM', NULL, NULL, NULL, '删除日志', 'gitee');
INSERT INTO `sys_menu` VALUES ('571365178965364736', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 1, 'admin', '2019-04-26 16:01:14', 'admin', '2020-04-05 19:47:03', '0', 'EXAM', 'Layout', 'dashboard', NULL, '首页', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367565360762880', '系统管理', 'sys', '/api/user/v1/**', '-1', 'component', '1', '0', 1, 'admin', '2019-04-26 16:10:43', 'admin', '2019-05-23 21:52:26', '0', 'EXAM', 'Layout', '/sys', NULL, '系统管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367969767165952', '用户管理', 'sys:user', '/api/user/v1/user/**', '571367565360762880', '', '2', '0', 1, 'admin', '2019-04-26 16:12:19', 'admin', '2019-04-26 16:12:19', '0', 'EXAM', 'views/sys/user', 'user', NULL, '用户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368181252362240', '部门管理', 'sys:dept', '/api/user/v1/dept/**', '571367565360762880', '', '8', '0', 1, 'admin', '2019-04-26 16:13:09', 'admin', '2019-04-26 16:13:09', '0', 'EXAM', 'views/sys/dept', 'dept', NULL, '部门管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368627413061632', '角色管理', 'sys:role', '/api/user/v1/role/**', '571367565360762880', '', '9', '0', 1, 'admin', '2019-04-26 16:14:56', 'admin', '2019-04-26 16:14:56', '0', 'EXAM', 'views/sys/role', 'role', NULL, '角色管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369094226513920', '菜单管理', 'sys:menu', '/api/user/v1/menu/**', '571367565360762880', '', '10', '0', 1, 'admin', '2019-04-26 16:16:47', 'admin', '2019-04-26 16:16:47', '0', 'EXAM', 'views/sys/menu', 'menu', NULL, '菜单管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369709904203776', '终端管理', 'sys:client', '/api/user/v1/client/**', '581237996276289536', '', '11', '0', 1, 'admin', '2019-04-26 16:19:14', 'admin', '2019-04-26 16:19:14', '0', 'EXAM', 'views/sys/client', 'client', NULL, '终端管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369965811273728', '路由管理', 'sys:route', '/api/user/route/**', '581237996276289536', '', '12', '0', 1, 'admin', '2019-04-26 16:20:15', 'admin', '2019-04-26 16:20:15', '0', 'EXAM', 'views/sys/route', 'route', NULL, '路由管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571371375550402560', '新增用户', 'sys:user:add', NULL, '571367969767165952', '', '1', '1', 1, 'admin', '2019-04-26 16:25:51', 'admin', '2019-07-04 10:50:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371477828505600', '删除用户', 'sys:user:del', NULL, '571367969767165952', '', '2', '1', 1, 'admin', '2019-04-26 16:26:15', 'admin', '2019-04-26 16:26:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371606652358656', '修改用户', 'sys:user:edit', NULL, '571367969767165952', '', '3', '1', 1, 'admin', '2019-04-26 16:26:46', 'admin', '2019-04-26 16:26:46', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371699010932736', '导出用户', 'sys:user:export', NULL, '571367969767165952', '', '4', '1', 1, 'admin', '2019-04-26 16:27:08', 'admin', '2019-04-26 16:27:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371773073952768', '导入用户', 'sys:user:import', NULL, '571367969767165952', '', '5', '1', 1, 'admin', '2019-04-26 16:27:26', 'admin', '2019-04-26 16:27:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372425787346944', '新增部门', 'sys:dept:add', NULL, '571368181252362240', '', '1', '1', 1, 'admin', '2019-04-26 16:30:01', 'admin', '2019-04-26 16:30:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372559308820480', '修改部门', 'sys:dept:edit', NULL, '571368181252362240', '', '2', '1', 1, 'admin', '2019-04-26 16:30:33', 'admin', '2019-04-26 16:30:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372707153842176', '删除部门', 'sys:dept:del', NULL, '571368181252362240', '', '3', '1', 1, 'admin', '2019-04-26 16:31:08', 'admin', '2019-04-26 17:41:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373219269971968', '新增角色', 'sys:role:add', NULL, '571368627413061632', '', '1', '1', 1, 'admin', '2019-04-26 16:33:11', 'admin', '2019-04-26 16:33:11', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373292582211584', '修改角色', 'sys:role:edit', NULL, '571368627413061632', '', '2', '1', 1, 'admin', '2019-04-26 16:33:28', 'admin', '2019-04-26 16:33:28', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373363046518784', '删除角色', 'sys:role:del', NULL, '571368627413061632', '', '3', '1', 1, 'admin', '2019-04-26 16:33:45', 'admin', '2019-04-26 16:33:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373478440210432', '分配权限', 'sys:role:auth', NULL, '571368627413061632', '', '4', '1', 1, 'admin', '2019-04-26 16:34:12', 'admin', '2019-04-26 16:34:12', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373881496047616', '新增菜单', 'sys:menu:add', NULL, '571369094226513920', '', '1', '1', 1, 'admin', '2019-04-26 16:35:48', 'admin', '2019-04-26 16:35:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373962609692672', '修改菜单', 'sys:menu:edit', NULL, '571369094226513920', '', '2', '1', 1, 'admin', '2019-04-26 16:36:08', 'admin', '2019-04-26 16:36:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374025859796992', '删除菜单', 'sys:menu:del', NULL, '571369094226513920', '', '3', '1', 1, 'admin', '2019-04-26 16:36:23', 'admin', '2019-04-26 16:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374113881460736', '导入菜单', 'sys:menu:import', NULL, '571369094226513920', '', '4', '1', 1, 'admin', '2019-04-26 16:36:44', 'admin', '2019-04-26 16:36:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374178956087296', '导出菜单', 'sys:menu:export', NULL, '571369094226513920', '', '5', '1', 1, 'admin', '2019-04-26 16:36:59', 'admin', '2019-04-26 16:36:59', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374593844056064', '新增终端', 'sys:client:add', NULL, '571369709904203776', '', '1', '1', 1, 'admin', '2019-04-26 16:38:38', 'admin', '2019-04-26 16:38:38', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374671245742080', '修改终端', 'sys:client:edit', NULL, '571369709904203776', '', '2', '1', 1, 'admin', '2019-04-26 16:38:57', 'admin', '2019-04-26 16:38:57', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374747460440064', '删除终端', 'sys:client:del', NULL, '571369709904203776', '', '3', '1', 1, 'admin', '2019-04-26 16:39:15', 'admin', '2019-04-26 16:39:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374884270247936', '新增路由', 'sys:route:add', NULL, '571369965811273728', '', '1', '1', 1, 'admin', '2019-04-26 16:39:48', 'admin', '2019-04-26 16:39:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374951823708160', '修改路由', 'sys:route:edit', NULL, '571369965811273728', '', '2', '1', 1, 'admin', '2019-04-26 16:40:04', 'admin', '2019-04-26 16:40:04', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375033570693120', '删除路由', 'sys:route:del', NULL, '571369965811273728', '', '3', '1', 1, 'admin', '2019-04-26 16:40:23', 'admin', '2019-04-26 16:40:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375135655858176', '刷新路由', 'sys:route:refresh', NULL, '571369965811273728', '', '4', '1', 1, 'admin', '2019-04-26 16:40:47', 'admin', '2019-04-26 16:40:47', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571454722205159424', '修改题目', 'exam:exam:subject:edit', NULL, '571353525381107712', '', '9', '1', 1, 'admin', '2019-04-26 21:57:02', 'admin', '2019-04-26 21:57:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581237996276289536', '租户中心', 'tenant', '/api/user/v1/tenent/**', '-1', 'example', '3', '0', 1, 'admin', '2019-05-23 21:52:17', 'admin', '2020-02-22 12:58:27', '0', 'EXAM', 'Layout', '/tenant', NULL, '租户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238351663861760', '单位管理', 'tenant:tenant', '/api/user/tenant/**', '581237996276289536', '', '1', '0', 1, 'admin', '2019-05-23 21:53:41', 'admin', '2019-05-23 21:55:30', '0', 'EXAM', 'views/tenant/tenant', 'tenant', NULL, '单位管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238560250793984', '新增单位', 'tenant:tenant:add', NULL, '581238351663861760', '', '1', '1', 1, 'admin', '2019-05-23 21:54:31', 'admin', '2019-05-23 21:55:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238795467362304', '修改单位', 'tenant:tenant:edit', '', '581238351663861760', '', '2', '1', 1, 'admin', '2019-05-23 21:55:27', 'admin', '2019-05-23 21:55:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238883182841856', '删除单位', 'tenant:tenant:del', NULL, '581238351663861760', '', '3', '1', 1, 'admin', '2019-05-23 21:55:48', 'admin', '2019-05-23 21:55:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('624972495417643008', '查看首页', 'dashboard:view', NULL, '571365178965364736', '', '30', '1', NULL, 'admin', '2019-09-21 14:17:34', 'admin', '2019-09-21 14:17:34', '0', 'EXAM', NULL, NULL, NULL, '查看首页', 'gitee');
INSERT INTO `sys_menu` VALUES ('625058053556932608', '编辑考试', 'exam:exam:edit', '/api/exam/v1/examination/**', '571353525381107712', '', '2', '1', NULL, 'admin', '2019-09-21 19:57:33', 'admin', '2019-09-21 19:57:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('625058859773464576', '编辑题目', 'exam:exam:subject:edit', NULL, '571353525381107712', '', '9', '1', NULL, 'admin', '2019-09-21 20:00:45', 'admin', '2019-09-21 20:00:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('681171474660331520', 'elk日志', 'monitor:elk', '/api/monitor/**', '571361163502292992', '', '35', '0', NULL, 'admin', '2020-02-23 16:12:15', 'admin', '2020-02-23 16:18:07', '0', 'EXAM', NULL, 'http://118.25.138.130:5601/app/kibana', NULL, NULL, 'gitee');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `role_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色code',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否默认 0-否，1-是',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '启用禁用状态 0-启用，1-禁用',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (596116511031169024, '普通用户', 'role_user', '普通用户', 1, 0, 'admin', '2019-09-08 20:57:57', 'admin', '2019-09-08 20:57:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (596117256346406912, '超级管理员', 'role_admin', '超级管理员', 0, 0, 'admin', '2019-10-07 15:02:17', 'admin', '2019-10-07 14:53:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (596330074307956736, '教师', 'role_teacher', '教师', 0, 0, 'admin', '2019-09-08 20:57:57', 'admin', '2019-09-08 20:57:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (624964171867492352, '租户管理员', 'role_tenant_admin', '租户管理员', 0, 0, 'admin', '2019-10-08 21:55:13', 'admin', '2019-10-08 21:46:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (681167029125910528, '预览', 'role_preview', '预览权限', 0, 0, 'admin', '2020-02-23 15:54:35', 'admin', '2020-02-23 15:54:35', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (581239021590679552, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (581239021590679553, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (581239021590679554, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (581239021590679555, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (581239021590679556, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (581239021590679557, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (581239021590679558, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (581239021590679559, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (581239021590679560, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (581239021590679561, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (581239021590679562, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (581239021590679563, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (581239021590679564, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (581239021590679565, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (581239021590679566, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (581239021590679567, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (581239021590679568, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (581239021590679569, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (581239021590679570, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (581239021590679571, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (581239021590679572, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (581239021590679573, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (581239021590679574, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (581239021590679575, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (581239021590679576, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (581239021590679577, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (581239021590679578, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (581239021590679579, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (581239021590679580, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (581239021590679581, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (581239021590679582, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (581239021590679583, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (581239021590679584, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (581239021590679585, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (581239021590679586, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (581239021590679587, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (581239021590679588, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (581239021590679589, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (581239021590679590, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (581239021590679591, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (581239021590679592, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (581239021590679593, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (581239021590679594, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (581239021590679595, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (581239021590679596, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (581239021590679597, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (581239021590679598, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (581239021590679599, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (581239021590679600, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (581239021590679601, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (581239021590679602, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (581239021590679603, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (581239021590679604, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (581239021590679605, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (581239021590679606, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (581239021590679607, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (581239021590679608, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (581239021590679609, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (581239021590679610, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (581239021590679611, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (581239021590679612, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (581239021590679613, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (581239021590679614, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (581239021590679615, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (581239021590679616, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (581239021590679617, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (581239021590679618, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (581239021590679619, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (581239021590679620, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (581239021590679621, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (581239021590679622, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (581239021590679623, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (581239021590679624, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (581239021590679625, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (581239021590679626, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (586547078973493248, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (586547078973493249, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (586547078973493250, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (586547078973493251, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (586547078973493252, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (586547078973493253, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (586547078973493254, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (586547078973493255, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (586547078973493256, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (586547078973493257, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (586547078973493258, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (586547078973493259, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (586547078973493260, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (586547078973493261, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (586547078973493262, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (586547078973493263, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (586547078973493264, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (586547078973493265, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (586547078973493266, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (586547078973493267, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (586547078973493268, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (586547078973493269, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (586547078973493270, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (586547078973493271, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (586547078973493272, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (586547078973493273, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (586547078973493274, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (586547078973493275, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (586547078973493276, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (586547078973493277, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (586547078973493278, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (586547078973493279, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (586547078973493280, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (586547078973493281, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (586547078973493282, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (586547078973493283, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (586547078973493284, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (586547078973493285, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (586547078973493286, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (586547078973493287, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (586547078973493288, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (586547078973493289, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (586547078973493290, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (586547078973493291, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (586547078973493292, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (586547078973493293, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (586547078973493294, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (586547078973493295, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (586547078973493296, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (586547078973493297, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (586547078973493298, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (586547078973493299, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (586547078973493300, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (586547078973493301, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (586547078973493302, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (586547078973493303, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (586547078973493304, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (586547078973493305, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (586547078973493306, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (586547078973493307, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (586547078973493308, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (586547078973493309, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (586915493013753856, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (590994415867269120, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (590994415867269121, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (590994415867269122, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (590994415867269123, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (590994415867269124, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (590994415867269125, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (590994415867269126, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (590994415867269127, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (590994415867269128, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (590994415867269129, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (590994415867269130, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (590994415867269131, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (590994415867269132, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (590994415867269133, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (590994415867269134, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (590994415867269135, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (590994415867269136, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (590994415867269137, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (590994415867269138, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (590994415867269139, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (590994415867269140, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (590994415867269141, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (590994415867269142, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (590994415867269143, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (590994415867269144, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (590994415867269145, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (590994415867269146, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (590994415867269147, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (590994415867269148, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (590994415867269149, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (590994415867269150, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (590994415867269151, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (590994415867269152, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (590994415867269153, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (590994415867269154, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624972978748264448, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624972978748264449, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624972978748264450, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624972978748264451, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624972978748264452, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379413561344, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379413561345, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379413561346, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379413561347, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379413561348, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379413561349, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379413561350, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379413561351, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379413561352, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379413561353, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379417755648, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379417755649, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379417755650, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379417755651, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379417755652, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379417755653, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379417755654, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379417755655, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379417755656, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379417755657, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379417755658, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379417755659, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379417755660, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379417755661, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379417755662, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379417755663, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379417755664, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379417755665, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379417755666, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379417755667, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379417755668, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379417755669, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379417755670, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624985379417755671, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624985379417755672, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624985379417755673, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624985379417755674, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624985379417755675, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624985379417755676, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624985379417755677, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624985379417755678, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624985379417755679, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624985379417755680, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624985379417755681, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624985379417755682, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624985379417755683, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624985379417755684, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624985379417755685, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624985379417755686, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624985379417755687, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624985379417755688, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624985379417755689, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624985379417755690, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624985379417755691, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624985379417755692, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624985379417755693, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624985379417755694, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624985379417755695, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624985379417755696, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624985379417755697, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624985379417755698, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624985379421949952, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624985379421949953, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624985379421949954, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624985379421949955, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624985379421949956, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624985379421949957, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624985379421949958, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624985379421949959, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624985379421949960, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624985379421949961, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624985379421949962, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624985379421949963, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379421949964, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379421949965, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379421949966, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379421949967, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379421949968, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379421949969, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379421949970, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379421949971, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379421949972, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379421949973, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379421949974, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379421949975, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379421949976, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379421949977, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379421949978, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379421949979, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379421949980, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379421949981, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379421949982, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379421949983, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379421949984, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379421949985, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379421949986, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379421949987, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379421949988, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379421949989, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379421949990, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379421949991, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379421949992, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379421949993, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379421949994, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379421949995, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379421949996, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379421949997, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379421949998, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624985379421949999, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624985379421950000, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624985379421950001, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624985379421950002, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624985379421950003, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624985379421950004, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624985379426144256, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624985379426144257, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624985379426144258, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624985379426144259, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624985379426144260, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624985379426144261, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624985379426144262, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624985379426144263, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624985379426144264, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624985379426144265, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624985379426144266, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624985379426144267, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624985379426144268, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624985379426144269, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624985379426144270, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624985379426144271, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624985379426144272, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624985379426144273, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624985379426144274, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624985379426144275, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624985379426144276, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379426144277, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379426144278, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379426144279, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379426144280, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379426144281, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379426144282, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379426144283, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379426144284, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379426144285, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379426144286, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379426144287, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379426144288, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379426144289, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379426144290, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379426144291, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379426144292, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379426144293, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379426144294, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379426144295, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379426144296, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379426144297, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379426144298, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379426144299, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379426144300, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379426144301, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379426144302, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379426144303, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379426144304, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379426144305, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379426144306, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379426144307, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379426144308, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379426144309, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379426144310, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379426144311, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379426144312, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379426144313, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379426144314, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379434532967, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379434532968, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624985379434532969, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379434532970, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379434532971, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615829475328, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615829475329, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615829475330, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615829475331, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615829475332, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615829475333, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615829475334, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615829475335, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615829475336, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615829475337, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615829475338, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615829475339, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615829475340, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615829475341, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615829475342, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615829475343, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615829475344, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615829475345, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615829475346, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615829475347, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615829475348, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615829475349, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615829475350, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615829475351, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615829475352, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615829475353, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615829475354, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615829475355, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615829475356, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615829475357, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615829475358, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615829475359, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615829475360, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624992615829475361, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624992615829475362, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624992615829475363, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624992615829475364, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624992615829475365, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624992615829475366, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624992615829475367, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624992615829475368, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624992615829475369, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624992615829475370, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624992615829475371, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624992615829475372, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615829475373, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615829475374, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615829475375, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615829475376, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615829475377, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615829475378, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615829475379, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615829475380, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615829475381, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615829475382, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615829475383, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615829475384, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615829475385, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615829475386, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615829475387, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615829475388, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615829475389, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615829475390, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615829475391, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615829475392, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615829475393, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615829475394, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615829475395, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615829475396, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615829475397, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615833669632, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624992615833669633, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624992615833669634, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669635, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669636, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615833669637, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615833669638, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615833669639, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615833669640, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669641, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615833669642, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615833669643, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615833669644, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615833669645, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615833669646, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615833669647, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615833669648, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615833669649, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615833669650, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615833669651, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615833669652, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615833669653, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615833669654, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615833669655, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615833669656, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615833669657, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615833669658, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615833669659, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615833669660, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615833669661, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615833669662, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615833669663, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615833669664, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615833669665, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615833669666, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615833669667, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615833669668, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615833669669, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615833669670, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615833669671, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615833669672, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615833669673, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615833669674, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615833669675, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615833669676, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615833669677, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615833669678, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615833669679, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615833669680, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615833669681, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615833669682, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615833669683, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624992615833669684, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615833669685, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615833669686, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615833669687, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615833669688, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615833669689, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615833669690, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615833669691, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615833669692, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615833669693, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615833669694, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615833669695, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615833669696, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669697, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669698, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615833669699, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669700, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615833669701, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615833669702, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615833669703, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669704, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615833669705, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615833669706, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615833669707, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615833669708, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615833669709, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615833669710, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615833669711, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615833669712, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615833669713, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615833669714, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615833669715, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615833669716, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615833669717, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615833669718, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615833669719, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615833669720, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615833669721, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615833669722, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615833669723, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615833669724, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615833669725, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615833669726, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615833669727, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615833669728, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615833669729, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615833669730, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615833669731, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615833669732, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669733, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669734, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864087, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864088, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624992615837864089, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615837864090, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615837864091, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864092, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864093, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615837864094, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615837864095, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615837864096, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615837864097, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615837864098, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615837864099, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615837864100, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615837864101, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615837864102, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615837864103, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615837864104, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615837864105, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615837864106, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615837864107, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615837864108, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615837864109, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615837864110, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615837864111, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615837864112, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615837864113, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615837864114, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615837864115, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615837864116, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615837864117, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615837864118, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615837864119, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615837864120, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615837864121, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615837864122, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615837864123, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615837864124, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624992615837864125, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624992615837864126, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624992615837864127, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624992615837864128, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624992615837864129, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624992615837864130, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624992615837864131, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624992615837864132, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624992615837864133, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624992615837864134, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624992615837864135, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624992615837864136, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615837864137, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615837864138, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615837864139, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615837864140, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615837864141, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615837864142, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615837864143, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615837864144, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615837864145, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615837864146, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615837864147, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615837864148, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615837864149, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615837864150, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615837864151, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615837864152, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615837864153, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615837864154, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615837864155, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615837864156, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615837864157, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615837864158, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615837864159, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615837864160, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615837864161, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615837864162, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624992615837864163, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624992615837864164, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615837864165, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615837864166, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864167, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864168, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615837864169, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615837864170, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615837864171, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615837864172, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615837864173, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615837864174, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615837864175, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615837864176, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615837864177, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615837864178, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615837864179, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615837864180, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615837864181, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615837864182, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615837864183, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615837864184, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615837864185, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615837864186, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615837864187, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615837864188, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615837864189, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615837864190, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615837864191, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615837864192, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615837864193, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615837864194, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615837864195, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615837864196, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615837864197, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615837864198, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615846252544, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615846252545, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615846252546, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615846252547, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615846252548, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615846252549, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615846252550, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615846252551, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615846252552, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615846252553, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615846252554, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615846252555, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615846252556, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615846252557, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615846252558, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624992615846252559, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615846252560, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615846252561, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615846252562, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615846252563, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615846252564, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615846252565, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615846252566, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615846252567, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615846252568, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615846252569, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615846252570, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615846252571, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252572, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252573, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615846252574, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615846252575, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615846252576, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615846252577, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615846252578, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615846252579, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615846252580, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615846252581, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615846252582, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615846252583, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615846252584, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615846252585, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615846252586, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615846252587, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615846252588, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615846252589, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615846252590, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615846252591, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615846252592, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615846252593, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615846252594, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615846252595, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615846252596, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615846252597, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615846252598, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615846252599, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615846252600, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615846252601, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615846252602, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615846252603, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615846252604, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615846252605, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615846252606, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615846252607, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252608, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252609, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615846252775, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615846252776, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624992615846252777, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252778, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252779, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624993535845863424, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863425, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863426, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863433, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863434, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535845863435, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863436, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863437, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863444, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863445, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535845863446, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863447, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057728, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057735, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057736, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535850057737, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057738, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057739, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057746, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057747, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640208290051133440, 624964171867492352, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (640208290051133441, 624964171867492352, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640208290051133442, 624964171867492352, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (640208290051133443, 624964171867492352, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (640208290051133444, 624964171867492352, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (640208290051133445, 624964171867492352, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (640208290051133446, 624964171867492352, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (640208290051133447, 624964171867492352, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (640208290051133448, 624964171867492352, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (640208290051133449, 624964171867492352, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (640208290051133450, 624964171867492352, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (640208290051133451, 624964171867492352, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (640208290051133452, 624964171867492352, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (640208290051133453, 624964171867492352, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (640208290051133454, 624964171867492352, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (640208290051133455, 624964171867492352, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (640208290051133456, 624964171867492352, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (640208290051133457, 624964171867492352, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (640208290051133458, 624964171867492352, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (640208290051133459, 624964171867492352, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (640208290051133460, 624964171867492352, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (640208290051133461, 624964171867492352, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (640208290051133462, 624964171867492352, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (640208290051133463, 624964171867492352, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (640208290051133464, 624964171867492352, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (640208290051133465, 624964171867492352, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (640208290051133466, 624964171867492352, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (640208290051133467, 624964171867492352, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (640208290051133468, 624964171867492352, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (640208290051133469, 624964171867492352, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (640208290051133470, 624964171867492352, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (640208290051133471, 624964171867492352, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (640208290051133472, 624964171867492352, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (640208290051133473, 624964171867492352, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (640208290051133474, 624964171867492352, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (640208290051133475, 624964171867492352, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (640208290051133476, 624964171867492352, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (640208290051133477, 624964171867492352, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (640208290051133478, 624964171867492352, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (640208290051133479, 624964171867492352, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (640208290051133480, 624964171867492352, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (640208290051133481, 624964171867492352, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (640208290051133482, 624964171867492352, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (640208290051133483, 624964171867492352, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (640208290051133484, 624964171867492352, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (640208290051133485, 624964171867492352, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (640208290051133486, 624964171867492352, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (640208290051133487, 624964171867492352, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (640208290051133488, 624964171867492352, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (640208290051133489, 624964171867492352, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (640214746716573696, 596330074307956736, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (640214746716573697, 596330074307956736, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640214746716573698, 596330074307956736, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (640214746716573699, 596330074307956736, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (640214746716573700, 596330074307956736, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (640214746716573701, 596330074307956736, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (640214746716573702, 596330074307956736, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (640214746716573703, 596330074307956736, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (640214746716573704, 596330074307956736, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (640214746716573705, 596330074307956736, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (640214746716573706, 596330074307956736, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (640214746716573707, 596330074307956736, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (640214746716573708, 596330074307956736, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (640214746716573709, 596330074307956736, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (640214746716573710, 596330074307956736, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (640214746716573711, 596330074307956736, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (640214746716573712, 596330074307956736, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (640214746716573713, 596330074307956736, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (640214746716573714, 596330074307956736, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (640214746716573715, 596330074307956736, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (640214746716573716, 596330074307956736, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (640214746716573717, 596330074307956736, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (640214746716573718, 596330074307956736, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (640214746716573719, 596330074307956736, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (640214746716573720, 596330074307956736, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (640214746716573721, 596330074307956736, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (640214746716573722, 596330074307956736, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (640214746716573723, 596330074307956736, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (681171832786784256, 596117256346406912, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (681171832786784257, 596117256346406912, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (681171832786784258, 596117256346406912, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (681171832786784259, 596117256346406912, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (681171832786784260, 596117256346406912, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (681171832786784261, 596117256346406912, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (681171832786784262, 596117256346406912, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (681171832786784263, 596117256346406912, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (681171832786784264, 596117256346406912, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (681171832786784265, 596117256346406912, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (681171832786784266, 596117256346406912, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (681171832786784267, 596117256346406912, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (681171832786784268, 596117256346406912, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (681171832786784269, 596117256346406912, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (681171832786784270, 596117256346406912, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (681171832786784271, 596117256346406912, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (681171832786784272, 596117256346406912, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (681171832786784273, 596117256346406912, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (681171832786784274, 596117256346406912, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (681171832786784275, 596117256346406912, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (681171832786784276, 596117256346406912, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (681171832786784277, 596117256346406912, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (681171832786784278, 596117256346406912, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (681171832786784279, 596117256346406912, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (681171832786784280, 596117256346406912, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (681171832786784281, 596117256346406912, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (681171832786784282, 596117256346406912, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (681171832786784283, 596117256346406912, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (681171832786784284, 596117256346406912, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (681171832786784285, 596117256346406912, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (681171832786784286, 596117256346406912, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (681171832786784287, 596117256346406912, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (681171832786784288, 596117256346406912, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (681171832786784289, 596117256346406912, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (681171832786784290, 596117256346406912, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (681171832786784291, 596117256346406912, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (681171832786784292, 596117256346406912, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (681171832786784293, 596117256346406912, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (681171832786784294, 596117256346406912, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (681171832786784295, 596117256346406912, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (681171832786784296, 596117256346406912, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (681171832786784297, 596117256346406912, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (681171832786784298, 596117256346406912, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (681171832786784299, 596117256346406912, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (681171832786784300, 596117256346406912, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (681171832786784301, 596117256346406912, 681171474660331520);
INSERT INTO `sys_role_menu` VALUES (681171832786784302, 596117256346406912, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (681171832786784303, 596117256346406912, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (681171832786784304, 596117256346406912, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (681171832786784305, 596117256346406912, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (681171832786784306, 596117256346406912, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (681171832786784307, 596117256346406912, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (681171832786784308, 596117256346406912, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (681171832786784309, 596117256346406912, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (681171832786784310, 596117256346406912, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (681171832786784311, 596117256346406912, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (681171832786784312, 596117256346406912, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (681171832786784313, 596117256346406912, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (681171832786784314, 596117256346406912, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (681171832786784315, 596117256346406912, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (681171832786784316, 596117256346406912, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (681171832786784317, 596117256346406912, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (681171832786784318, 596117256346406912, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (681171832786784319, 596117256346406912, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (681171832786784320, 596117256346406912, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (681171832786784321, 596117256346406912, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (681171832786784322, 596117256346406912, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (681171832786784323, 596117256346406912, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (681171832786784324, 596117256346406912, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (681171832786784325, 596117256346406912, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (681171832786784326, 596117256346406912, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (681171832786784327, 596117256346406912, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (681171832786784328, 596117256346406912, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (681171832786784329, 596117256346406912, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (681171867557564416, 681167029125910528, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (681171867557564417, 681167029125910528, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (681171867557564418, 681167029125910528, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (681171867557564419, 681167029125910528, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (681171867557564420, 681167029125910528, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (681171867557564421, 681167029125910528, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (681171867557564422, 681167029125910528, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (681171867557564423, 681167029125910528, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (681171867557564424, 681167029125910528, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (681171867557564425, 681167029125910528, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (681171867557564426, 681167029125910528, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (681171867557564427, 681167029125910528, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (681171867557564428, 681167029125910528, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (681171867557564429, 681167029125910528, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (681171867557564430, 681167029125910528, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (681171867557564431, 681167029125910528, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (681171867557564432, 681167029125910528, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (681171867557564433, 681167029125910528, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (681171867557564434, 681167029125910528, 681171474660331520);
INSERT INTO `sys_role_menu` VALUES (681171867557564435, 681167029125910528, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (681171867557564436, 681167029125910528, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (681171867557564437, 681167029125910528, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (681171867557564438, 681167029125910528, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (681171867557564439, 681167029125910528, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (681171867557564440, 681167029125910528, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (681171867557564441, 681167029125910528, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (681171867557564442, 681167029125910528, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (681171867557564443, 681167029125910528, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (681171867557564444, 681167029125910528, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (681171867557564445, 681167029125910528, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (681171867557564446, 681167029125910528, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (681171867557564447, 681167029125910528, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (681171867557564448, 681167029125910528, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (681171867557564449, 681167029125910528, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (681171867557564450, 681167029125910528, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (681171867557564451, 681167029125910528, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (681171867557564452, 681167029125910528, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (681171867557564453, 681167029125910528, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (681171867557564454, 681167029125910528, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (681171867557564455, 681167029125910528, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (681171867557564456, 681167029125910528, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (681171867557564457, 681167029125910528, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (681171867557564458, 681167029125910528, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (681171867557564459, 681167029125910528, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (681171867557564460, 681167029125910528, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (681171867557564461, 681167029125910528, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (681171867557564462, 681167029125910528, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (681171867557564463, 681167029125910528, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (681171867557564464, 681167029125910528, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (681171867557564465, 681167029125910528, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (681171867557564466, 681167029125910528, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (681171867557564467, 681167029125910528, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (681171867557564468, 681167029125910528, 571350099653955584);

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `student_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `born` date NULL DEFAULT NULL,
  `sex` tinyint(4) NULL DEFAULT NULL COMMENT '难度等级',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就读学校',
  `wechat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `city_id` bigint(20) NULL DEFAULT NULL COMMENT '城市id',
  `county_id` bigint(20) NULL DEFAULT NULL COMMENT '县id',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户标识',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `tenant_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户描述信息',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (581236567985754112, 'gitee', '码云', '码云', 1, 'admin', '2019-05-23 21:46:36', 'admin', '2019-05-23 21:46:36', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像id',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `born` date NULL DEFAULT NULL COMMENT '出生日期',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sex` tinyint(4) NULL DEFAULT NULL COMMENT '性别',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `parent_uid` bigint(20) NULL DEFAULT NULL COMMENT '父账号id',
  `street_id` bigint(20) NULL DEFAULT NULL COMMENT '街道id',
  `county_id` bigint(20) NULL DEFAULT NULL COMMENT '国家id',
  `city_id` bigint(20) NULL DEFAULT NULL COMMENT '城市id',
  `province_id` bigint(20) NULL DEFAULT NULL COMMENT '省id',
  `login_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `lock_time` timestamp(0) NULL DEFAULT NULL COMMENT '锁定账号时间',
  `wechat` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `family_role` tinyint(4) NULL DEFAULT NULL COMMENT '家庭角色',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (596078038307966976, '管理员', '15521089123', '0', '1633736729@qq.com', '1995-07-03', 0, 0, 596290673729212416, '管理员', NULL, NULL, NULL, 530100, 530000, '2020-04-05 19:47:18', NULL, NULL, '测试', NULL, 'admin', '2020-04-05 19:58:07', 'admin', '2020-04-05 19:47:18', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (596307222997372928, '梁同学', '15521089123', '0', '1633736729@qq.com', '2019-07-01', 0, 1, 596290673729212416, '梁同学', NULL, NULL, NULL, NULL, NULL, '2020-04-05 19:36:13', NULL, NULL, NULL, NULL, 'admin', '2020-04-05 19:56:36', 'student', '2020-04-05 19:38:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (596332387600830464, '林老师', '15521089123', NULL, '1633736729@qq.com', '2019-07-03', 0, 1, 596290673729212416, '林老师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2020-03-05 22:17:01', 'admin', '2020-03-05 22:06:27', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (681167776798347264, '预览权限', '15521089123', '0', NULL, '2020-02-23', 0, 0, 596290673729212416, '', 596329627606192128, NULL, NULL, NULL, NULL, '2020-04-05 19:30:45', NULL, NULL, NULL, NULL, 'admin', '2020-04-05 19:56:38', 'preview', '2020-04-05 19:30:59', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_user_auths
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auths`;
CREATE TABLE `sys_user_auths`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `identity_type` tinyint(4) NOT NULL COMMENT '登录类型，手机号、邮箱、用户名或第三方应用名称（微信 微博等）',
  `identifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识，手机号、邮箱、用户名或第三方应用的唯一标识',
  `credential` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码凭证，站内的保存密码，站外的不保存或保存token',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_auths
-- ----------------------------
INSERT INTO `sys_user_auths` VALUES (596329627606192128, 596078038307966976, 1, 'admin', '$2a$10$fi16OaJpNVcMuhudn5pxf.0Um3OI0mOODA9Rx3.oLERDrry9RRCRe', 'admin', '2020-02-29 16:13:29', 'admin', '2019-07-04 13:21:02', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (596329627648135168, 596307222997372928, 1, 'student', '$2a$10$5XMiXaS3XbkZvcdFHFA6HeZGWAfzxQtLVXRZi8Oyic/rbRLExT5Na', 'admin', '2019-07-04 13:21:03', 'admin', '2019-07-04 13:21:03', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (596332387693105152, 596332387600830464, 1, 'teacher', '$2a$10$8CNmKhP0UJm9WVeDRkowteGHtJEz77xUNaKoVQook6ESYemueK8sC', 'admin', '2019-07-04 13:32:01', 'admin', '2019-07-04 13:32:01', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (681167777872089088, 681167776798347264, 1, 'preview', '$2a$10$tzwo3TcjyyHnX85WlyO2Huq/gdR7gxhNBGrARAl9PctT6AFZ30Dnu', 'admin', '2020-02-23 15:57:34', 'admin', '2020-02-23 15:57:34', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (681167857941352448, 596307222997372928, 596116511031169024);
INSERT INTO `sys_user_role` VALUES (681167874412384256, 596078038307966976, 596117256346406912);
INSERT INTO `sys_user_role` VALUES (685246878203383808, 596332387600830464, 596330074307956736);
INSERT INTO `sys_user_role` VALUES (686273423307051008, 681167776798347264, 681167029125910528);

-- ----------------------------
-- Table structure for sys_user_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_student`;
CREATE TABLE `sys_user_student`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '学生姓名',
  `student_id` bigint(20) NOT NULL COMMENT '电话号码',
  `relationship_type` tinyint(4) NOT NULL COMMENT '关系类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户学生关联表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;