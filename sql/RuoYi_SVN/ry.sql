/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 04/12/2021 17:10:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_job_log', '定时任务调度日志表', NULL, NULL, 'SysJobLog', 'crud', 'com.ruoyi.us', 'us', 'log', '定时任务调度日志', 'ruoyi', '0', '/', NULL, 'admin', '2020-11-05 14:22:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'ry_bank_card', '银行卡管理', NULL, NULL, 'BankCard', 'crud', 'com.ruoyi.us', 'us', 'card', '银行卡管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"测试菜单\",\"treeCode\":\"\"}', 'admin', '2020-11-11 20:08:06', '', '2020-11-11 20:26:36', '');
INSERT INTO `gen_table` VALUES (3, 'ry_pay_order', '入账管理', NULL, NULL, 'RyPayOrder', 'crud', 'com.ruoyi.us', 'us', 'order', '入账单管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"测试菜单\",\"treeCode\":\"\"}', 'admin', '2020-11-11 20:08:06', '', '2020-11-11 20:28:51', '');
INSERT INTO `gen_table` VALUES (5, 'ry_col_user', '', NULL, NULL, 'RyColUser', 'crud', 'com.ruoyi.us', 'us', 'user', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-10-23 12:58:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'zx_dfpay_info', '代付通道管理', NULL, NULL, 'ZxDfpayInfo', 'crud', 'com.ruoyi.us', 'us', 'info', '代付通道信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"代收管理\",\"treeCode\":\"\"}', 'admin', '2021-12-03 17:40:10', '', '2021-12-03 17:59:29', '');
INSERT INTO `gen_table` VALUES (7, 'zx_dfpay_order', '代付订单管理', NULL, NULL, 'ZxDfpayOrder', 'crud', 'com.ruoyi.us', 'us', 'order', '代付订单', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"代收管理\",\"treeCode\":\"\"}', 'admin', '2021-12-03 17:40:10', '', '2021-12-03 18:00:01', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'job_log_id', '任务日志ID', 'bigint(20)', 'Long', 'jobLogId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'job_message', '日志信息', 'varchar(500)', 'String', 'jobMessage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'status', '执行状态（0正常 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'exception_info', '异常信息', 'varchar(2000)', 'String', 'exceptionInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-11-05 14:22:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'id', '', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (10, '2', 'bank_name', '银行名称', 'varchar(32)', 'String', 'bankName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (11, '2', 'bank_card_no', '银行卡号', 'varchar(64)', 'String', 'bankCardNo', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (12, '2', 'bank_card_img', '银行卡图片', 'varchar(255)', 'String', 'bankCardImg', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'upload', '', 4, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (13, '2', 'hand_user_name', '持卡人姓名', 'varchar(32)', 'String', 'handUserName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (14, '2', 'open_bank_address', '开户行地址', 'varchar(255)', 'String', 'openBankAddress', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (15, '2', 'today_collect_money', '今日已收款金额', 'double(11,2)', 'BigDecimal', 'todayCollectMoney', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (16, '2', 'taotal_colletc_quato', '每日最高收款金额', 'double(11,0)', 'Long', 'taotalColletcQuato', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (17, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (18, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (19, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (20, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (21, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:26:36');
INSERT INTO `gen_table_column` VALUES (22, '3', 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (23, '3', 'bank_id', '银行卡ID', 'varchar(32)', 'String', 'bankId', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (24, '3', 'order_no', '收款单号', 'varchar(64)', 'String', 'orderNo', '0', '0', NULL, '1', NULL, '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (25, '3', 'transfer_vouch_url', '转账凭证', 'varchar(255)', 'String', 'transferVouchUrl', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 4, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (26, '3', 'money', '转账金额', 'varchar(32)', 'String', 'money', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (27, '3', 'plaft_user_name', '平台会员账号', 'varchar(64)', 'String', 'plaftUserName', '0', '0', NULL, '1', NULL, '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (28, '3', 'plaft_nick_name', '平台会员昵称', 'varchar(255)', 'String', 'plaftNickName', '0', '0', NULL, '1', NULL, '1', '1', 'LIKE', 'input', '', 7, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (29, '3', 'state', '到账状态 0--待确认 1--已入账', 'varchar(32)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (30, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (31, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (32, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (33, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (34, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2020-11-11 20:08:06', NULL, '2020-11-11 20:28:51');
INSERT INTO `gen_table_column` VALUES (43, '5', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '5', 'nick_name', '称呼', 'varchar(255)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '5', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '5', 'id_card', '身份正', 'varchar(255)', 'String', 'idCard', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '5', 'city', '城市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '5', 'money', '咨询金额', 'varchar(255)', 'String', 'money', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '5', 'per_count', '分期', 'int(255)', 'Long', 'perCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-10-23 12:58:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '6', 'id', '', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (52, '6', 'mch_id', '商户号', 'varchar(32)', 'String', 'mchId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (53, '6', 'mch_name', '代付平台名称', 'varchar(64)', 'String', 'mchName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (54, '6', 'mch_id2', '商户编号2', 'varchar(255)', 'String', 'mchId2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (55, '6', 'api_url', '接口地址', 'varchar(32)', 'String', 'apiUrl', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (56, '6', 'key', '商户KEY', 'varchar(64)', 'String', 'key', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (57, '6', 'secret', '商户秘钥', 'varchar(255)', 'String', 'secret', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (58, '6', 'notify_url', '异步回调地址', 'varchar(32)', 'String', 'notifyUrl', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (59, '6', 'is_use', '是否启用', 'varchar(255)', 'String', 'isUse', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'dfpay_status', 9, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (60, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (61, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (62, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (63, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (64, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 17:59:29');
INSERT INTO `gen_table_column` VALUES (65, '7', 'id', '订单ID', 'int(11)', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (66, '7', 'dfpay_id', '通道ID', 'int(32)', 'Long', 'dfpayId', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (67, '7', 'dfpay_name', '通道名称', 'varchar(64)', 'String', 'dfpayName', '0', '0', NULL, '1', NULL, '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (68, '7', 'order_no', '订单号', 'varchar(255)', 'String', 'orderNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (69, '7', 'money', '代付金额', 'double(32,0)', 'Long', 'money', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (70, '7', 'relal_name', '姓名', 'varchar(64)', 'String', 'relalName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (71, '7', 'bank_card', '银行卡号', 'varchar(255)', 'String', 'bankCard', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (72, '7', 'bank', '银行名称', 'varchar(32)', 'String', 'bank', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (73, '7', 'open_bank', '开户行', 'varchar(255)', 'String', 'openBank', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (74, '7', 'pay_time', '打款时间', 'datetime', 'Date', 'payTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 10, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (75, '7', 'pay_status', '支付状态', 'int(255)', 'Integer', 'payStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'dfpay_order_status', 11, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (76, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (77, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (78, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (79, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');
INSERT INTO `gen_table_column` VALUES (80, '7', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2021-12-03 17:40:10', NULL, '2021-12-03 18:00:01');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001759698F50078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001759698F50078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001759698F50078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-IJDEO481638608963790', 1638609040596, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1638608970000, -1, 5, 'PAUSED', 'CRON', 1638608963000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1638608970000, -1, 5, 'PAUSED', 'CRON', 1638608963000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1638608980000, -1, 5, 'PAUSED', 'CRON', 1638608963000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for ry_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ry_bank_card`;
CREATE TABLE `ry_bank_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '银行名称',
  `bank_card_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '银行卡号',
  `bank_card_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '银行卡图片',
  `hand_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '持卡人姓名',
  `open_bank_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开户行地址',
  `today_collect_money` double(11, 2) DEFAULT NULL COMMENT '今日已收款金额',
  `taotal_colletc_quato` double(11, 0) DEFAULT NULL COMMENT '每日最高收款金额',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ry_bank_card
-- ----------------------------
INSERT INTO `ry_bank_card` VALUES (1, '建设银行', '622905632544663321', 'http://127.0.0.1:8088/profile/upload/2020/11/13/257cca22-25c1-4b43-9cb7-6e40094c5039.jpeg', '王大为', '简朴金边支行', 2200.00, 50000, '', '2020-11-11 21:06:29', '', '2020-11-13 21:09:40', '');
INSERT INTO `ry_bank_card` VALUES (2, '农业银行', '622905632544663322', 'http://127.0.0.1:8088/profile/upload/2020/11/13/8fc09ea4-1385-477d-a0d5-9ad5f86e666c.jpeg', '王大为', '简朴金边支行', 10060.00, 500000, '', '2020-11-11 21:06:29', '', '2021-12-02 20:31:30', '');
INSERT INTO `ry_bank_card` VALUES (3, '农商银行', '655905632544663323', 'http://127.0.0.1:8088/profile/upload/2020/11/13/53b805fc-a0a9-4dee-9095-4cecd27a65a5.jpeg', '王大为', '简朴金边支行', 0.00, 50000, '', '2020-11-11 21:06:29', '', '2020-11-13 21:10:00', '');
INSERT INTO `ry_bank_card` VALUES (4, 'ABC', '12312321321', '2222', '王者', '0', 0.00, 0, '', '2021-10-21 20:15:46', '', NULL, NULL);
INSERT INTO `ry_bank_card` VALUES (5, 'ABC', '12312321321', '2222', '王者', '0', 0.00, 0, '', '2021-10-21 20:15:55', '', NULL, NULL);
INSERT INTO `ry_bank_card` VALUES (6, 'ABC', '12312321321', '2222', '王者', '0', 0.00, 0, '', '2021-10-21 20:15:56', '', NULL, NULL);
INSERT INTO `ry_bank_card` VALUES (7, 'ABC', '12312321321', '2222', '王者', '0', 0.00, 0, '', '2021-10-23 14:02:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for ry_col_user
-- ----------------------------
DROP TABLE IF EXISTS `ry_col_user`;
CREATE TABLE `ry_col_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '称呼',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '身份正',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '城市',
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '咨询金额',
  `per_count` int(255) DEFAULT NULL COMMENT '分期',
  `create_time` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ry_col_user
-- ----------------------------
INSERT INTO `ry_col_user` VALUES (4, '大狗4', '1235645896', '350652368950336508', '广西南宁', '1000', 20, '2021-10-23 14:18:39');
INSERT INTO `ry_col_user` VALUES (5, '大狗4', '1235645896', '350652368950336508', '广西南宁', '1000', 20, '2021-10-23 14:53:14');
INSERT INTO `ry_col_user` VALUES (6, '大狗5', '1235645896', '350652368950336508', '广西南宁', '1000', 20, '2021-10-23 14:53:20');
INSERT INTO `ry_col_user` VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-23 17:56:31');
INSERT INTO `ry_col_user` VALUES (8, '大狗7', '1235645896', '350652368950336508', '广西南宁', '1000', 20, '2021-10-23 17:59:31');
INSERT INTO `ry_col_user` VALUES (9, '测试', '13799999999', '350652368950336508', '北京市', '1000', 30, '2021-10-23 18:03:41');
INSERT INTO `ry_col_user` VALUES (10, '测试', '13799999999', '350652368950336508', '北京市', '1000', 30, '2021-10-23 18:14:55');
INSERT INTO `ry_col_user` VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-23 18:19:25');
INSERT INTO `ry_col_user` VALUES (12, '测试123456', '13777777777', '432222222222222222', '北京市', '50000', 3, '2021-10-23 18:27:31');
INSERT INTO `ry_col_user` VALUES (13, '测试555', '13777777777', '12', '北京市', '50000', 3, '2021-10-23 18:47:30');
INSERT INTO `ry_col_user` VALUES (14, '测试', '13799999999', '350652368950336508', '北京市', '1000', 30, '2021-10-23 18:47:40');
INSERT INTO `ry_col_user` VALUES (15, '测试123456', '13777777777', '432222222222222222', '北京市', '50000', 3, '2021-10-23 19:03:36');
INSERT INTO `ry_col_user` VALUES (16, '测试', '13777777777', '432222222222222222', '北京市', '50000', 3, '2021-10-23 19:07:10');

-- ----------------------------
-- Table structure for ry_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ry_pay_order`;
CREATE TABLE `ry_pay_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '银行卡ID',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收款单号',
  `transfer_vouch_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '转账凭证',
  `money` double(32, 0) DEFAULT NULL COMMENT '转账金额',
  `plaft_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '平台会员账号',
  `plaft_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '平台会员昵称',
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '到账状态 0--待确认 1--已入账',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ry_pay_order
-- ----------------------------
INSERT INTO `ry_pay_order` VALUES (7, '1', 'RZ20201112185153194', 'http://192.168.0.104:8088/profile/upload/2020/11/13/ded79230-695d-461e-954d-ac8dd34905c4.jpeg', 300, 'wangdaywei', '你发的空间里', 'SUCESS', '', '2020-11-12 18:51:53', '', NULL, NULL);
INSERT INTO `ry_pay_order` VALUES (9, '1', 'RZ20201112194017824', 'http://192.168.0.104:8088/profile/upload/2020/11/13/ded79230-695d-461e-954d-ac8dd34905c4.jpeg', 258, '111', '默默', 'SUCESS', '', '2020-11-12 19:40:17', '', NULL, NULL);
INSERT INTO `ry_pay_order` VALUES (15, '2', 'RZ20201113191357179', 'http://127.0.0.1:8088/profile/upload/2020/11/13/f451ac28-b6ec-418b-9e16-04c34f936198.png', 3000, '测试', '王大爷', 'SUCESS', '', '2020-11-13 19:13:58', '', '2020-11-13 19:14:13', NULL);
INSERT INTO `ry_pay_order` VALUES (16, '2', 'RZ20201113191423374', 'http://127.0.0.1:8088/profile/upload/2020/11/13/a385adcb-2efe-44b5-b57a-faf32bf2c2c2.png', 3000, '测试', '王大爷', 'SUCESS', '', '2020-11-13 19:14:23', '', '2020-11-13 19:14:39', NULL);
INSERT INTO `ry_pay_order` VALUES (17, '2', 'RZ20201113191927349', 'http://127.0.0.1:8088/profile/upload/2020/11/13/cf832b61-256c-4f32-9fc3-940e5d296017.png', 3000, '测试', '王大爷', 'SUCESS', '', '2020-11-13 19:19:27', '', '2020-11-13 19:19:35', NULL);
INSERT INTO `ry_pay_order` VALUES (18, '1', 'RZ20201113192415506', 'http://127.0.0.1:8088/profile/upload/2020/11/13/c06e59c3-c604-46dd-b306-50235bd25c51.png', 400, '4343', '王者', 'SUCESS', '', '2020-11-13 19:24:16', '', '2020-11-13 19:28:53', NULL);
INSERT INTO `ry_pay_order` VALUES (19, '1', 'RZ20201113192907430', 'http://127.0.0.1:8088/profile/upload/2020/11/13/29e19006-25fb-4056-b974-1987930e3f81.png', 400, '4343', '王者', 'SUCESS', '', '2020-11-13 19:29:07', '', '2020-11-13 19:29:15', NULL);
INSERT INTO `ry_pay_order` VALUES (20, '1', 'RZ20201113192922241', 'http://127.0.0.1:8088/profile/upload/2020/11/13/de462b90-c486-4b94-91eb-e3f3fb313940.png', 400, '4343', '王者', 'SUCESS', '', '2020-11-13 19:29:22', '', '2020-11-13 19:29:35', NULL);
INSERT INTO `ry_pay_order` VALUES (21, '1', 'RZ20201113192953074', 'http://127.0.0.1:8088/profile/upload/2020/11/13/298a736b-010e-43e6-8807-4d3cce1f495a.png', 700, '4343', '王者3', 'SUCESS', '', '2020-11-13 19:29:54', '', '2020-11-13 19:36:32', NULL);
INSERT INTO `ry_pay_order` VALUES (22, '2', 'RZ20201113193609994', 'http://127.0.0.1:8088/profile/upload/2020/11/13/f7ddf340-5b40-45dc-a8fb-a6e11edbaadb.jpg', 560, 'wangzhe3', '王者3', 'SUCESS', '', '2020-11-13 19:36:10', '', '2020-11-13 19:36:30', NULL);
INSERT INTO `ry_pay_order` VALUES (23, '2', 'RZ20201114004447124', 'http://192.168.0.133:8088/profile/upload/2020/11/14/536131df-2514-4f19-a360-b73e2080187c.jpg', 500, '121242', '94946', 'SUCESS', '', '2020-11-14 00:44:48', '', '2021-12-02 20:31:30', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2020-11-05 12:10:08', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:07', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '成功', 'SUCESS', 'state', NULL, 'success', 'N', '0', 'admin', '2020-11-13 10:46:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '等待', 'WAIT', 'state', '', 'info', 'Y', '0', 'admin', '2020-11-13 10:47:20', 'admin', '2020-11-13 10:47:49', '');
INSERT INTO `sys_dict_data` VALUES (102, 3, '失败', 'FAILURE', 'state', NULL, 'warning', 'N', '0', 'admin', '2020-11-13 10:48:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '启用', '0', 'dfpay_status', '', 'success', 'Y', '0', 'admin', '2021-12-03 17:56:45', 'admin', '2021-12-04 16:43:02', '');
INSERT INTO `sys_dict_data` VALUES (104, 2, '禁用', '1', 'dfpay_status', '', 'danger', 'Y', '0', 'admin', '2021-12-03 17:57:08', 'admin', '2021-12-04 16:43:09', '');
INSERT INTO `sys_dict_data` VALUES (105, 1, '进行中', '0', 'dfpay_order_status', '', 'primary', 'Y', '0', 'admin', '2021-12-03 17:58:24', 'admin', '2021-12-04 15:00:50', '');
INSERT INTO `sys_dict_data` VALUES (106, 2, '成功', '1', 'dfpay_order_status', '', 'success', 'Y', '0', 'admin', '2021-12-03 17:58:46', 'admin', '2021-12-04 15:01:01', '');
INSERT INTO `sys_dict_data` VALUES (107, 3, '失败', '2', 'dfpay_order_status', '', 'danger', 'Y', '0', 'admin', '2021-12-03 17:59:04', 'admin', '2021-12-04 15:01:07', '');
INSERT INTO `sys_dict_data` VALUES (114, 1, '进行中', '0', 'dfpay_result', '', 'primary', 'Y', '0', 'admin', '2021-12-04 14:59:26', 'admin', '2021-12-04 14:59:41', '');
INSERT INTO `sys_dict_data` VALUES (115, 2, '成功', '1', 'dfpay_result', NULL, 'success', 'Y', '0', 'admin', '2021-12-04 14:59:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 3, '失败', '2', 'dfpay_result', '', 'danger', 'Y', '0', 'admin', '2021-12-04 15:00:23', 'admin', '2021-12-04 15:00:30', '');
INSERT INTO `sys_dict_data` VALUES (117, 1, 'ATCoin', 'ATCoin', 'pan_name', NULL, 'info', 'Y', '0', 'admin', '2021-12-04 15:14:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 2, 'YT', 'YT', 'pan_name', NULL, 'info', 'Y', '0', 'admin', '2021-12-04 15:14:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 1, '未回调', '0', 'is_notify', NULL, 'warning', 'Y', '0', 'admin', '2021-12-04 15:23:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 2, '已回调', '1', 'is_notify', '', 'info', 'Y', '0', 'admin', '2021-12-04 15:23:19', 'admin', '2021-12-04 15:23:26', '');
INSERT INTO `sys_dict_data` VALUES (121, 0, '万达代付', '25', 'dfpay_name', NULL, NULL, 'N', '0', '', '2021-12-04 15:44:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '盛联代付2', '26', 'dfpay_name', NULL, NULL, 'N', '0', '', '2021-12-04 15:45:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '入账状态', 'state', '0', 'admin', '2020-11-13 10:45:50', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '通道状态', 'dfpay_status', '0', 'admin', '2021-12-03 17:55:25', 'admin', '2021-12-03 17:57:40', '');
INSERT INTO `sys_dict_type` VALUES (102, '代付订单状态', 'dfpay_order_status', '0', 'admin', '2021-12-03 17:57:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '代付通道', 'dfpay_name', '0', 'admin', '2021-12-03 19:09:22', '', NULL, '1');
INSERT INTO `sys_dict_type` VALUES (104, '代付查询结果', 'dfpay_result', '0', 'admin', '2021-12-04 14:58:55', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '盘口名称', 'pan_name', '0', 'admin', '2021-12-04 15:13:25', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '回调状态', 'is_notify', '0', 'admin', '2021-12-04 15:22:26', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-05 12:10:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-05 14:21:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 11:57:00');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '192.168.0.133', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 12:32:34');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '192.168.0.109', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-11-11 12:33:11');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-11 20:42:54');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-11 20:42:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '192.168.0.109', '内网IP', 'Chrome 8', 'Mac OS X', '0', '登录成功', '2020-11-12 19:34:23');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '192.168.0.132', '内网IP', 'Chrome Mobile', 'Mac OS X (iPhone)', '0', '登录成功', '2020-11-12 19:38:16');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-12 19:41:16');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-13 10:16:51');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 10:16:55');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-13 10:26:09');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '192.168.0.104', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 10:26:13');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:30:53');
INSERT INTO `sys_logininfor` VALUES (114, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:31:05');
INSERT INTO `sys_logininfor` VALUES (115, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:31:20');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-11-14 11:31:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2020-11-14 11:31:36');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2020-11-14 11:31:41');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:31:48');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:37:15');
INSERT INTO `sys_logininfor` VALUES (121, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:37:24');
INSERT INTO `sys_logininfor` VALUES (122, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:37:59');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:38:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:42:15');
INSERT INTO `sys_logininfor` VALUES (125, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:42:25');
INSERT INTO `sys_logininfor` VALUES (126, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:42:48');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:42:55');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-14 11:43:19');
INSERT INTO `sys_logininfor` VALUES (129, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-14 11:43:30');
INSERT INTO `sys_logininfor` VALUES (130, 'caijinhe3747', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-15 20:12:36');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-15 20:12:42');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-10-21 20:00:12');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误2次', '2021-10-21 20:00:42');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误3次', '2021-10-21 20:00:50');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 20:02:39');
INSERT INTO `sys_logininfor` VALUES (136, 'wangdawei3747@gmail.com', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-02 20:18:28');
INSERT INTO `sys_logininfor` VALUES (137, 'wangdawei3747@gmail.com', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-02 20:18:32');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 20:18:43');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-12-03 17:39:24');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-03 17:39:33');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-03 19:56:08');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-03 19:56:25');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 12:37:53');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 13:01:42');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 13:36:34');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 14:15:05');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 14:24:06');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 14:27:02');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2021-12-04 14:45:42');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 14:45:55');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 14:57:43');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:21:55');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:34:38');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:39:18');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:48:11');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:51:33');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:54:27');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 15:56:20');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:00:00');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:31:41');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:39:15');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-04 16:46:13');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:46:16');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-04 16:48:43');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:48:47');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-04 16:56:34');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-04 16:56:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2020-11-05 12:10:08', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2020-11-05 12:10:08', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2020-11-05 12:10:08', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '', 'fa fa-location-arrow', 'admin', '2020-11-05 12:10:08', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2020-11-05 12:10:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2020-11-05 12:10:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2020-11-05 12:10:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', 'fa fa-outdent', 'admin', '2020-11-05 12:10:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', 'fa fa-address-card-o', 'admin', '2020-11-05 12:10:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 2000, 6, '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2020-11-05 12:10:08', 'admin', '2021-12-04 15:23:46', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', 'fa fa-sun-o', 'admin', '2020-11-05 12:10:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2020-11-05 12:10:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', 'fa fa-pencil-square-o', 'admin', '2020-11-05 12:10:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2020-11-05 12:10:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2020-11-05 12:10:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', 'fa fa-bug', 'admin', '2020-11-05 12:10:08', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', 'fa fa-server', 'admin', '2020-11-05 12:10:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', 'fa fa-wpforms', 'admin', '2020-11-05 12:10:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', 'fa fa-code', 'admin', '2020-11-05 12:10:08', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', 'fa fa-gg', 'admin', '2020-11-05 12:10:08', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2020-11-05 12:10:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2020-11-05 12:10:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '代付管理', 0, 1, '#', 'menuItem', 'M', '0', '', 'fa fa-vcard', 'admin', '2020-11-11 20:14:10', 'admin', '2021-12-03 18:17:31', '');
INSERT INTO `sys_menu` VALUES (2014, '代付通道信息', 2000, 1, '/us/info', 'menuItem', 'C', '0', 'us:info:view', 'fa fa-vcard-o', 'admin', '2021-12-03 18:12:24', 'admin', '2021-12-03 18:24:05', '代付通道信息菜单');
INSERT INTO `sys_menu` VALUES (2015, '查询', 2014, 1, '#', '', 'F', '0', 'us:info:list', '#', 'admin', '2021-12-03 18:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '新增', 2014, 2, '#', '', 'F', '0', 'us:info:add', '#', 'admin', '2021-12-03 18:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '修改', 2014, 3, '#', '', 'F', '0', 'us:info:edit', '#', 'admin', '2021-12-03 18:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '删除', 2014, 4, '#', '', 'F', '0', 'us:info:remove', '#', 'admin', '2021-12-03 18:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '导出', 2014, 5, '#', '', 'F', '0', 'us:info:export', '#', 'admin', '2021-12-03 18:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '代付订单', 2000, 1, '/us/order', 'menuItem', 'C', '0', 'us:order:view', 'fa fa-barcode', 'admin', '2021-12-03 18:12:58', 'admin', '2021-12-03 18:24:55', '代付订单菜单');
INSERT INTO `sys_menu` VALUES (2021, '查询', 2020, 1, '#', '', 'F', '0', 'us:order:list', '#', 'admin', '2021-12-03 18:12:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '新增', 2020, 2, '#', '', 'F', '0', 'us:order:add', '#', 'admin', '2021-12-03 18:12:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '修改', 2020, 3, '#', '', 'F', '0', 'us:order:edit', '#', 'admin', '2021-12-03 18:12:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '删除', 2020, 4, '#', '', 'F', '0', 'us:order:remove', '#', 'admin', '2021-12-03 18:12:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '导出', 2020, 5, '#', '', 'F', '0', 'us:order:export', '#', 'admin', '2021-12-03 18:12:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '代付查询', 2020, 6, '#', 'menuItem', 'F', '0', 'us:order:dfpay', '#', 'admin', '2021-12-03 18:49:44', 'admin', '2021-12-03 18:50:17', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_job_log\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-05 14:22:33');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_pay_order,ry_bank_card\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:08:06');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"代收业务\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:14:10');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"测试菜单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:21:26');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"测试管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:21:55');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"ry_bank_card\"],\"tableComment\":[\"银行卡管理\"],\"className\":[\"BankCard\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"9\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"10\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"银行名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"bankName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"11\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"银行卡号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"bankCardNo\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"12\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"银行卡图片\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"bankCardImg\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"upload\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"13\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"持卡人姓名\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"handUserName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"14\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"开户行地址\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"openBankAddress\"],\"columns[5].isInsert\":[\"1\"],', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:26:36');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/ry_bank_card', '127.0.0.1', '内网IP', NULL, 'null', 0, NULL, '2020-11-11 20:26:45');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"ry_pay_order\"],\"tableComment\":[\"入账管理\"],\"className\":[\"RyPayOrder\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"银行卡ID\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"bankId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"收款单号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"orderNo\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"转账凭证\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"transferVouchUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"转账金额\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"money\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"平台会员账号\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"plaftUserName\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"LIKE\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 20:28:51');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_pay_order\"]}', 'null', 0, NULL, '2020-11-11 20:28:57');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.0.133', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"测试管理\"],\"url\":[\"/us/card/list\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:list\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 21:00:32');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.0.133', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"测试管理\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 21:03:10');
INSERT INTO `sys_oper_log` VALUES (111, '银行卡管理', 1, 'com.ruoyi.web.controller.colect.BankCardController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/card/add', '192.168.0.133', '内网IP', '{\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\BankCardMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BankCardMapper.insertBankCard-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ry_bank_card          ( bank_name,             bank_card_no,             bank_card_img,             hand_user_name,             open_bank_address,             today_collect_money,             taotal_colletc_quato,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-11-11 21:06:01');
INSERT INTO `sys_oper_log` VALUES (112, '银行卡管理', 1, 'com.ruoyi.web.controller.colect.BankCardController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/card/add', '192.168.0.133', '内网IP', '{\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 21:06:28');
INSERT INTO `sys_oper_log` VALUES (113, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '192.168.0.133', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"http://192.168.0.133:8088/profile/upload/2020/11/11/e622eff8-8584-496f-bf74-97cebc182718.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 21:06:59');
INSERT INTO `sys_oper_log` VALUES (114, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '192.168.0.133', '内网IP', '{\"id\":[\"2\"],\"bankName\":[\"农业银行\"],\"bankCardNo\":[\"622905632544663322\"],\"bankCardImg\":[\"http://192.168.0.133:8088/profile/upload/2020/11/11/e622eff8-8584-496f-bf74-97cebc182718.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"500000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-11 21:09:14');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"代收管理\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 10:48:23');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"银行卡管理\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 10:48:40');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"代收管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 10:48:50');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"入账管理\"],\"url\":[\"us/order\"],\"target\":[\"menuItem\"],\"perms\":[\"us:order:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 10:49:54');
INSERT INTO `sys_oper_log` VALUES (119, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:10:13');
INSERT INTO `sys_oper_log` VALUES (120, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:13:38');
INSERT INTO `sys_oper_log` VALUES (121, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"C:\\\\fakepath\\\\bank.jpeg\"],\"plaftNickName\":[\"尼玛逼\"],\"plaftUserName\":[\"ceshi123\"],\"money\":[\"5000\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:47:00');
INSERT INTO `sys_oper_log` VALUES (122, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"C:\\\\fakepath\\\\bank.jpeg\"],\"plaftNickName\":[\"尼玛逼\"],\"plaftUserName\":[\"ceshi123\"],\"money\":[\"5000\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:47:24');
INSERT INTO `sys_oper_log` VALUES (123, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"C:\\\\fakepath\\\\bank.jpeg\"],\"plaftNickName\":[\"尼玛逼\"],\"plaftUserName\":[\"ceshi123\"],\"money\":[\"5000\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:47:27');
INSERT INTO `sys_oper_log` VALUES (124, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"尼玛逼\"],\"plaftUserName\":[\"ceshi123\"],\"money\":[\"5000\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:48:22');
INSERT INTO `sys_oper_log` VALUES (125, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:49:21');
INSERT INTO `sys_oper_log` VALUES (126, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"http://127.0.0.1:8088/profile/upload/2020/11/12/227f5f4e-248c-49a2-9d8d-89b484cfa0ed.jpeg\"],\"plaftNickName\":[\"你发的空间里\"],\"plaftUserName\":[\"wangdaywei\"],\"money\":[\"300\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:51:53');
INSERT INTO `sys_oper_log` VALUES (127, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"你发的空间里\"],\"plaftUserName\":[\"wangdaywei\"],\"money\":[\"300\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 18:52:50');
INSERT INTO `sys_oper_log` VALUES (128, '入账单管理', 3, 'com.ruoyi.web.controller.colect.RyPayOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/us/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 19:21:37');
INSERT INTO `sys_oper_log` VALUES (129, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.132', '内网IP', '{\"transferVouchUrl\":[\"http://192.168.0.133:8088/profile/upload/2020/11/12/a9b78483-6138-4a65-a08a-53a14cb4e5e6.jpeg\"],\"plaftNickName\":[\"默默\"],\"plaftUserName\":[\"111\"],\"money\":[\"258\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-12 19:40:17');
INSERT INTO `sys_oper_log` VALUES (130, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '192.168.0.104', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"http://192.168.0.104:8088/profile/upload/2020/11/13/ded79230-695d-461e-954d-ac8dd34905c4.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:27:00');
INSERT INTO `sys_oper_log` VALUES (131, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '192.168.0.104', '内网IP', '{\"id\":[\"2\"],\"bankName\":[\"农业银行\"],\"bankCardNo\":[\"622905632544663322\"],\"bankCardImg\":[\"http://192.168.0.104:8088/profile/upload/2020/11/13/58bda0a8-2596-47e1-a4f7-a419ffc2a30e.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"500000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:27:11');
INSERT INTO `sys_oper_log` VALUES (132, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '192.168.0.104', '内网IP', '{\"id\":[\"3\"],\"bankName\":[\"农商银行\"],\"bankCardNo\":[\"655905632544663323\"],\"bankCardImg\":[\"http://192.168.0.104:8088/profile/upload/2020/11/13/48d34e30-93db-43b5-a1c6-7ddfe51e6138.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:27:22');
INSERT INTO `sys_oper_log` VALUES (133, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '192.168.0.104', '内网IP', '{\"dictName\":[\"入账状态\"],\"dictType\":[\"state\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:45:50');
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '192.168.0.104', '内网IP', '{\"dictLabel\":[\"成功\"],\"dictValue\":[\"SUCESS\"],\"dictType\":[\"state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:46:55');
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '192.168.0.104', '内网IP', '{\"dictLabel\":[\"等待\"],\"dictValue\":[\"WAIT\"],\"dictType\":[\"state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:47:20');
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '192.168.0.104', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"等待\"],\"dictValue\":[\"WAIT\"],\"dictType\":[\"state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:47:33');
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '192.168.0.104', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"等待\"],\"dictValue\":[\"WAIT\"],\"dictType\":[\"state\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:47:49');
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '192.168.0.104', '内网IP', '{\"dictLabel\":[\"失败\"],\"dictValue\":[\"FAILURE\"],\"dictType\":[\"state\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"warning\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 10:48:22');
INSERT INTO `sys_oper_log` VALUES (139, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '192.168.0.104', '内网IP', '{\"id\":[\"7\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 11:48:27');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '192.168.0.104', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"卡片管理\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 12:21:26');
INSERT INTO `sys_oper_log` VALUES (141, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.104', '内网IP', '{\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"刘芳\"],\"plaftUserName\":[\"wangdawei\"],\"money\":[\"4000\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 12:26:24');
INSERT INTO `sys_oper_log` VALUES (142, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '192.168.0.104', '内网IP', '{\"id\":[\"10\"]}', 'null', 1, 'For input string: \"\"', '2020-11-13 12:26:38');
INSERT INTO `sys_oper_log` VALUES (143, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.104', '内网IP', '{\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"\"],\"plaftUserName\":[\"\"],\"money\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 12:28:04');
INSERT INTO `sys_oper_log` VALUES (144, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.104', '内网IP', '{\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"33333333\"],\"plaftUserName\":[\"3333333\"],\"money\":[\"333333333\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 12:29:25');
INSERT INTO `sys_oper_log` VALUES (145, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.104', '内网IP', '{\"bankId\":[\"2\"],\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"\"],\"plaftUserName\":[\"\"],\"money\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 13:14:52');
INSERT INTO `sys_oper_log` VALUES (146, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.104', '内网IP', '{\"bankId\":[\"2\"],\"transferVouchUrl\":[\"\"],\"plaftNickName\":[\"\"],\"plaftUserName\":[\"\"],\"money\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 13:15:18');
INSERT INTO `sys_oper_log` VALUES (147, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '192.168.0.104', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 17:07:26');
INSERT INTO `sys_oper_log` VALUES (148, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '192.168.0.104', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 17:07:29');
INSERT INTO `sys_oper_log` VALUES (149, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '192.168.0.104', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 17:08:30');
INSERT INTO `sys_oper_log` VALUES (150, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '192.168.0.104', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 17:09:56');
INSERT INTO `sys_oper_log` VALUES (151, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 18:43:28');
INSERT INTO `sys_oper_log` VALUES (152, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"bankName\":[\"农商银行\"],\"bankCardNo\":[\"655905632544663323\"],\"bankCardImg\":[\"http://192.168.0.104:8088/profile/upload/2020/11/13/48d34e30-93db-43b5-a1c6-7ddfe51e6138.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 18:43:46');
INSERT INTO `sys_oper_log` VALUES (153, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"bankName\":[\"农商银行\"],\"bankCardNo\":[\"655905632544663323\"],\"bankCardImg\":[\"\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 18:43:54');
INSERT INTO `sys_oper_log` VALUES (154, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"bankName\":[\"农商银行\"],\"bankCardNo\":[\"655905632544663323\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/22576df3-7717-4c1a-96a4-7c8391f28d44.jpg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 18:44:04');
INSERT INTO `sys_oper_log` VALUES (155, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 18:44:18');
INSERT INTO `sys_oper_log` VALUES (156, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"bankName\":[\"农业银行\"],\"bankCardNo\":[\"622905632544663322\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/3f541232-fd48-4310-8f5e-ccb95089980c.jpg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"500000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 18:50:29');
INSERT INTO `sys_oper_log` VALUES (157, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/f4f5862c-be1d-4f8c-ad7e-a2c6b52eb6cc.jpg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 18:50:37');
INSERT INTO `sys_oper_log` VALUES (158, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 19:02:25');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-11-13 19:04:33');
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"userName\":[\"测试\"],\"deptName\":[\"测试部门\"],\"phonenumber\":[\"18032541157\"],\"email\":[\"\"],\"loginName\":[\"caijinhe3747\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:05:28');
INSERT INTO `sys_oper_log` VALUES (161, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"平台账号不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 19:13:48');
INSERT INTO `sys_oper_log` VALUES (162, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"测试\"],\"plaftNickName\":[\"王大爷\"],\"money\":[\"3000\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:13:57');
INSERT INTO `sys_oper_log` VALUES (163, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 1,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-13 19:14:07');
INSERT INTO `sys_oper_log` VALUES (164, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"15\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:14:13');
INSERT INTO `sys_oper_log` VALUES (165, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 3000.0,\r\n    \"totalOrderNum\" : 1,\r\n    \"sucOrderNum\" : 1\r\n  }\r\n}', 0, NULL, '2020-11-13 19:14:16');
INSERT INTO `sys_oper_log` VALUES (166, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"测试\"],\"plaftNickName\":[\"王大爷\"],\"money\":[\"3000\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:14:23');
INSERT INTO `sys_oper_log` VALUES (167, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 3000.0,\r\n    \"totalOrderNum\" : 2,\r\n    \"sucOrderNum\" : 1\r\n  }\r\n}', 0, NULL, '2020-11-13 19:14:33');
INSERT INTO `sys_oper_log` VALUES (168, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"16\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:14:39');
INSERT INTO `sys_oper_log` VALUES (169, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 6000.0,\r\n    \"totalOrderNum\" : 2,\r\n    \"sucOrderNum\" : 2\r\n  }\r\n}', 0, NULL, '2020-11-13 19:19:22');
INSERT INTO `sys_oper_log` VALUES (170, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"测试\"],\"plaftNickName\":[\"王大爷\"],\"money\":[\"3000\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:19:27');
INSERT INTO `sys_oper_log` VALUES (171, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"17\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:19:34');
INSERT INTO `sys_oper_log` VALUES (172, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"平台账号不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 19:24:06');
INSERT INTO `sys_oper_log` VALUES (173, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"4343\"],\"plaftNickName\":[\"王者\"],\"money\":[\"400\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:24:15');
INSERT INTO `sys_oper_log` VALUES (174, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 9000.0,\r\n    \"totalOrderNum\" : 4,\r\n    \"sucOrderNum\" : 3\r\n  }\r\n}', 0, NULL, '2020-11-13 19:24:21');
INSERT INTO `sys_oper_log` VALUES (175, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 9000.0,\r\n    \"totalOrderNum\" : 4,\r\n    \"sucOrderNum\" : 3\r\n  }\r\n}', 0, NULL, '2020-11-13 19:24:54');
INSERT INTO `sys_oper_log` VALUES (176, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 9000.0,\r\n    \"totalOrderNum\" : 4,\r\n    \"sucOrderNum\" : 3\r\n  }\r\n}', 0, NULL, '2020-11-13 19:26:47');
INSERT INTO `sys_oper_log` VALUES (177, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 9000.0,\r\n    \"totalOrderNum\" : 4,\r\n    \"sucOrderNum\" : 3\r\n  }\r\n}', 0, NULL, '2020-11-13 19:28:47');
INSERT INTO `sys_oper_log` VALUES (178, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"18\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:28:52');
INSERT INTO `sys_oper_log` VALUES (179, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"4343\"],\"plaftNickName\":[\"王者\"],\"money\":[\"400\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:29:07');
INSERT INTO `sys_oper_log` VALUES (180, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"19\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:29:15');
INSERT INTO `sys_oper_log` VALUES (181, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"4343\"],\"plaftNickName\":[\"王者\"],\"money\":[\"400\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:29:22');
INSERT INTO `sys_oper_log` VALUES (182, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"20\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:29:34');
INSERT INTO `sys_oper_log` VALUES (183, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 10200.0,\r\n    \"totalOrderNum\" : 6,\r\n    \"sucOrderNum\" : 6\r\n  }\r\n}', 0, NULL, '2020-11-13 19:29:41');
INSERT INTO `sys_oper_log` VALUES (184, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"4343\"],\"plaftNickName\":[\"王者3\"],\"money\":[\"700\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:29:53');
INSERT INTO `sys_oper_log` VALUES (185, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"wangzhe3\"],\"plaftNickName\":[\"王者3\"],\"money\":[\"560\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:36:09');
INSERT INTO `sys_oper_log` VALUES (186, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"22\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:36:29');
INSERT INTO `sys_oper_log` VALUES (187, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"21\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 19:36:32');
INSERT INTO `sys_oper_log` VALUES (188, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 11460.0,\r\n    \"totalOrderNum\" : 8,\r\n    \"sucOrderNum\" : 8\r\n  }\r\n}', 0, NULL, '2020-11-13 19:36:36');
INSERT INTO `sys_oper_log` VALUES (189, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 11460.0,\r\n    \"totalOrderNum\" : 8,\r\n    \"sucOrderNum\" : 8\r\n  }\r\n}', 0, NULL, '2020-11-13 19:38:46');
INSERT INTO `sys_oper_log` VALUES (190, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 11460.0,\r\n    \"totalOrderNum\" : 8,\r\n    \"sucOrderNum\" : 8\r\n  }\r\n}', 0, NULL, '2020-11-13 21:00:05');
INSERT INTO `sys_oper_log` VALUES (191, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.133', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:00:37');
INSERT INTO `sys_oper_log` VALUES (192, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.133', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:01:07');
INSERT INTO `sys_oper_log` VALUES (193, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.133', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"平台账号不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:04:52');
INSERT INTO `sys_oper_log` VALUES (194, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 21:09:31');
INSERT INTO `sys_oper_log` VALUES (195, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"bankName\":[\"建设银行\"],\"bankCardNo\":[\"622905632544663321\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/257cca22-25c1-4b43-9cb7-6e40094c5039.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 21:09:39');
INSERT INTO `sys_oper_log` VALUES (196, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"bankName\":[\"农业银行\"],\"bankCardNo\":[\"622905632544663322\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/8fc09ea4-1385-477d-a0d5-9ad5f86e666c.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"500000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 21:09:51');
INSERT INTO `sys_oper_log` VALUES (197, '银行卡管理', 2, 'com.ruoyi.web.controller.colect.BankCardController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/card/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"bankName\":[\"农商银行\"],\"bankCardNo\":[\"655905632544663323\"],\"bankCardImg\":[\"http://127.0.0.1:8088/profile/upload/2020/11/13/53b805fc-a0a9-4dee-9095-4cecd27a65a5.jpeg\"],\"handUserName\":[\"王大为\"],\"openBankAddress\":[\"简朴金边支行\"],\"taotalColletcQuato\":[\"50000\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-13 21:09:59');
INSERT INTO `sys_oper_log` VALUES (198, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:10:20');
INSERT INTO `sys_oper_log` VALUES (199, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:10:32');
INSERT INTO `sys_oper_log` VALUES (200, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"1\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:13:29');
INSERT INTO `sys_oper_log` VALUES (201, '入账单管理', 1, 'com.ruoyi.web.controller.colect.RyPayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '192.168.0.133', '内网IP', '{\"plaftUserName\":[\"\"],\"plaftNickName\":[\"\"],\"money\":[\"\"],\"file\":[\"\"],\"bankId\":[\"3\"]}', '{\r\n  \"msg\" : \"凭证不能为空\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-13 21:19:43');
INSERT INTO `sys_oper_log` VALUES (202, '入账单管理', 1, 'com.ruoyi.web.controller.front.FrontCardController.addSave()', 'POST', 1, NULL, NULL, '/front/add', '192.168.0.101', '内网IP', '{\"plaftUserName\":[\"121242\"],\"plaftNickName\":[\"94946\"],\"money\":[\"500\"],\"bankId\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 00:44:47');
INSERT INTO `sys_oper_log` VALUES (203, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 1,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-14 11:02:23');
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"卡商\"],\"roleKey\":[\"cardmerch\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2002\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:36:54');
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"105\"],\"userName\":[\"测试\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"18032541157\"],\"email\":[\"\"],\"loginName\":[\"caijinhe3747\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:37:12');
INSERT INTO `sys_oper_log` VALUES (206, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'caijinhe3747', '测试部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 1,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-14 11:37:30');
INSERT INTO `sys_oper_log` VALUES (207, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'caijinhe3747', '测试部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 1,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2020-11-14 11:37:42');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:38:38');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:export\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:39:07');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:add\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:39:30');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"卡片管理\"],\"url\":[\"us/card\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:40:15');
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:add\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:40:52');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:41:19');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"us:card:remove\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:41:37');
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"卡商\"],\"roleKey\":[\"cardmerch\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2003,2004,2005,2006,2007,2002\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:42:05');
INSERT INTO `sys_oper_log` VALUES (216, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"卡商\"],\"roleKey\":[\"cardmerch\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2000,2001,2003,2007,2002\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-14 11:43:16');
INSERT INTO `sys_oper_log` VALUES (217, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-10-21 20:02:51');
INSERT INTO `sys_oper_log` VALUES (218, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-10-21 20:03:45');
INSERT INTO `sys_oper_log` VALUES (219, '用户提交信息', 1, 'com.ruoyi.web.controller.colect.BankCardController.saveCardInfo()', 'POST', 1, NULL, NULL, '/us/card/saveCardInfo', '127.0.0.1', '内网IP', '{\"bankName\":[\"ABC\"],\"bankCardNo\":[\"12312321321\"],\"bankCardImg\":[\"2222\"],\"handUserName\":[\"王者\"],\"openBankAddress\":[\"0\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"0\",\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-21 20:15:46');
INSERT INTO `sys_oper_log` VALUES (220, '用户提交信息', 1, 'com.ruoyi.web.controller.colect.BankCardController.saveCardInfo()', 'POST', 1, NULL, NULL, '/us/card/saveCardInfo', '127.0.0.1', '内网IP', '{\"bankName\":[\"ABC\"],\"bankCardNo\":[\"12312321321\"],\"bankCardImg\":[\"2222\"],\"handUserName\":[\"王者\"],\"openBankAddress\":[\"0\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"0\",\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-21 20:15:54');
INSERT INTO `sys_oper_log` VALUES (221, '用户提交信息', 1, 'com.ruoyi.web.controller.colect.BankCardController.saveCardInfo()', 'POST', 1, NULL, NULL, '/us/card/saveCardInfo', '127.0.0.1', '内网IP', '{\"bankName\":[\"ABC\"],\"bankCardNo\":[\"12312321321\"],\"bankCardImg\":[\"2222\"],\"handUserName\":[\"王者\"],\"openBankAddress\":[\"0\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"0\",\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-21 20:15:55');
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_col_user\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 12:48:49');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_col_user\"]}', 'null', 0, NULL, '2021-10-23 12:48:57');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 12:58:16');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_col_user\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 12:58:20');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"ry_col_user\"]}', 'null', 0, NULL, '2021-10-23 12:58:25');
INSERT INTO `sys_oper_log` VALUES (227, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-10-23 13:52:31');
INSERT INTO `sys_oper_log` VALUES (228, '【请填写功能名称】', 5, 'com.ruoyi.web.controller.colect.RyColUserController.export()', 'POST', 1, 'admin', '研发部门', '/us/user/export', '127.0.0.1', '内网IP', '{\"nickName\":[\"\"],\"phone\":[\"975073255\"],\"idCard\":[\"\"],\"city\":[\"\"],\"money\":[\"\"],\"perCount\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"cb7e173b-dc5b-4273-becd-2d9abea63f6d_user.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 13:58:21');
INSERT INTO `sys_oper_log` VALUES (229, '用户提交信息', 1, 'com.ruoyi.web.controller.colect.BankCardController.saveCardInfo()', 'POST', 1, NULL, NULL, '/us/card/saveCardInfo', '127.0.0.1', '内网IP', '{\"bankName\":[\"ABC\"],\"bankCardNo\":[\"12312321321\"],\"bankCardImg\":[\"2222\"],\"handUserName\":[\"王者\"],\"openBankAddress\":[\"0\"],\"todayCollectMoney\":[\"0\"],\"taotalColletcQuato\":[\"0\",\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:02:52');
INSERT INTO `sys_oper_log` VALUES (230, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '127.0.0.1', '内网IP', '{\"nickName\":[\"大狗\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:05:17');
INSERT INTO `sys_oper_log` VALUES (231, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '127.0.0.1', '内网IP', '{\"nickName\":[\"大狗2\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:11:44');
INSERT INTO `sys_oper_log` VALUES (232, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '127.0.0.1', '内网IP', '{\"nickName\":[\"大狗3\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:14:52');
INSERT INTO `sys_oper_log` VALUES (233, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.colect.RyColUserController.remove()', 'POST', 1, 'admin', '研发部门', '/us/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:14:57');
INSERT INTO `sys_oper_log` VALUES (234, '【请填写功能名称】', 5, 'com.ruoyi.web.controller.colect.RyColUserController.export()', 'POST', 1, 'admin', '研发部门', '/us/user/export', '127.0.0.1', '内网IP', '{\"nickName\":[\"\"],\"phone\":[\"\"],\"idCard\":[\"\"],\"city\":[\"\"],\"money\":[\"\"],\"perCount\":[\"\"],\"createTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"1076f447-73fa-46a5-8b63-248506418712_user.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:15:02');
INSERT INTO `sys_oper_log` VALUES (235, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '127.0.0.1', '内网IP', '{\"nickName\":[\"大狗4\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:18:39');
INSERT INTO `sys_oper_log` VALUES (236, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.176', '内网IP', '{\"nickName\":[\"大狗4\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:53:13');
INSERT INTO `sys_oper_log` VALUES (237, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.176', '内网IP', '{\"nickName\":[\"大狗5\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:53:19');
INSERT INTO `sys_oper_log` VALUES (238, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.colect.RyColUserController.remove()', 'POST', 1, 'admin', '研发部门', '/us/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:59:38');
INSERT INTO `sys_oper_log` VALUES (239, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.colect.RyColUserController.remove()', 'POST', 1, 'admin', '研发部门', '/us/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 14:59:40');
INSERT INTO `sys_oper_log` VALUES (240, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"java.io.FileNotFoundException: C:\\\\Users\\\\78522\\\\AppData\\\\Local\\\\Temp\\\\tomcat.7121804972710457864.8080\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\data\\\\ruoyi\\\\uploadFile\\\\avatar\\\\2021\\\\10\\\\23\\\\ecd02370-86f6-4b86-a928-4282c2daf5f2.png (系统找不到指定的路径。)\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-10-23 15:56:20');
INSERT INTO `sys_oper_log` VALUES (241, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"java.io.FileNotFoundException: C:\\\\Users\\\\78522\\\\AppData\\\\Local\\\\Temp\\\\tomcat.7121804972710457864.8080\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\data\\\\ruoyi\\\\uploadFile\\\\avatar\\\\2021\\\\10\\\\23\\\\0d91c364-4f83-4147-a6ef-5437f63c0561.png (系统找不到指定的路径。)\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-10-23 15:56:28');
INSERT INTO `sys_oper_log` VALUES (242, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-10-23 15:56:56');
INSERT INTO `sys_oper_log` VALUES (243, '【请填写功能名称】', 5, 'com.ruoyi.web.controller.colect.RyColUserController.export()', 'POST', 1, 'admin', '研发部门', '/us/user/export', '127.0.0.1', '内网IP', '{\"nickName\":[\"\"],\"phone\":[\"\"],\"idCard\":[\"\"],\"city\":[\"\"],\"money\":[\"\"],\"perCount\":[\"\"],\"createTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"4873e654-b7e0-427c-8c05-691d9aa20444_user.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 15:57:24');
INSERT INTO `sys_oper_log` VALUES (244, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 17:56:30');
INSERT INTO `sys_oper_log` VALUES (245, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.176', '内网IP', '{\"nickName\":[\"大狗7\"],\"phone\":[\"1235645896\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"广西南宁\"],\"money\":[\"1000\"],\"perCount\":[\"20\"],\"taotalColletcQuato\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 17:59:30');
INSERT INTO `sys_oper_log` VALUES (246, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试\"],\"phone\":[\"13799999999\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"北京市\"],\"money\":[\"1000\"],\"perCount\":[\"30\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:03:41');
INSERT INTO `sys_oper_log` VALUES (247, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试\"],\"phone\":[\"13799999999\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"北京市\"],\"money\":[\"1000\"],\"perCount\":[\"30\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:14:55');
INSERT INTO `sys_oper_log` VALUES (248, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:19:24');
INSERT INTO `sys_oper_log` VALUES (249, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试123456\"],\"phone\":[\"13777777777\"],\"idCard\":[\"432222222222222222\"],\"city\":[\"北京市\"],\"money\":[\"50000\"],\"perCount\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:27:31');
INSERT INTO `sys_oper_log` VALUES (250, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试555\"],\"phone\":[\"13777777777\"],\"idCard\":[\"12\"],\"city\":[\"北京市\"],\"money\":[\"50000\"],\"perCount\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:47:29');
INSERT INTO `sys_oper_log` VALUES (251, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试\"],\"phone\":[\"13799999999\"],\"idCard\":[\"350652368950336508\"],\"city\":[\"北京市\"],\"money\":[\"1000\"],\"perCount\":[\"30\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 18:47:40');
INSERT INTO `sys_oper_log` VALUES (252, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试123456\"],\"phone\":[\"13777777777\"],\"idCard\":[\"432222222222222222\"],\"city\":[\"北京市\"],\"money\":[\"50000\"],\"perCount\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 19:03:36');
INSERT INTO `sys_oper_log` VALUES (253, '手机用户信息', 1, 'com.ruoyi.web.controller.colect.RyColUserController.saveUserInfo()', 'POST', 1, NULL, NULL, '/us/user/saveUserInfo', '192.168.0.114', '内网IP', '{\"nickName\":[\"测试\"],\"phone\":[\"13777777777\"],\"idCard\":[\"432222222222222222\"],\"city\":[\"北京市\"],\"money\":[\"50000\"],\"perCount\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-10-23 19:07:10');
INSERT INTO `sys_oper_log` VALUES (254, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-10-23 19:40:10');
INSERT INTO `sys_oper_log` VALUES (255, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-12-02 20:18:52');
INSERT INTO `sys_oper_log` VALUES (256, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-12-02 20:21:20');
INSERT INTO `sys_oper_log` VALUES (257, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-12-02 20:21:34');
INSERT INTO `sys_oper_log` VALUES (258, '入账单审核', 2, 'com.ruoyi.web.controller.colect.RyPayOrderController.sureTransfer()', 'POST', 1, 'admin', '研发部门', '/us/order/sureTransfer', '127.0.0.1', '内网IP', '{\"id\":[\"23\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-02 20:31:30');
INSERT INTO `sys_oper_log` VALUES (259, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-12-02 20:31:30');
INSERT INTO `sys_oper_log` VALUES (260, '今日入账统计', 0, 'com.ruoyi.web.controller.colect.RyPayOrderController.getCount()', 'POST', 1, 'admin', '研发部门', '/us/order/getCount', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : {\r\n    \"totayMoney\" : 0.0,\r\n    \"totalOrderNum\" : 0,\r\n    \"sucOrderNum\" : 0\r\n  }\r\n}', 0, NULL, '2021-12-03 17:39:50');
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"zx_dfpay_info,zx_dfpay_order\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:40:11');
INSERT INTO `sys_oper_log` VALUES (262, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"zx_dfpay_info\"],\"tableComment\":[\"代付通道管理\"],\"className\":[\"ZxDfpayInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"51\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"52\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"53\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"代付平台名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"mchName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"商户编号2\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"mchId2\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"55\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"接口地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"apiUrl\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"56\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"商户KEY\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"key\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"co', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:43:23');
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"zx_dfpay_order\"],\"tableComment\":[\"代付订单管理\"],\"className\":[\"ZxDfpayOrder\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"65\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"66\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"通道ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"dfpayId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"67\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"通道名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dfpayName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"68\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订单号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"orderNo\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"69\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"代付金额\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"money\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"70\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"姓名\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"relalName\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"LIKE\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:46:02');
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"zx_dfpay_order,zx_dfpay_info\"]}', 'null', 0, NULL, '2021-12-03 17:46:10');
INSERT INTO `sys_oper_log` VALUES (265, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"通道启用\"],\"dictType\":[\"dfpay_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:55:25');
INSERT INTO `sys_oper_log` VALUES (266, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"启用\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:56:45');
INSERT INTO `sys_oper_log` VALUES (267, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"禁用\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:57:08');
INSERT INTO `sys_oper_log` VALUES (268, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"101\"],\"dictName\":[\"通道状态\"],\"dictType\":[\"dfpay_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:57:40');
INSERT INTO `sys_oper_log` VALUES (269, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"代付订单状态\"],\"dictType\":[\"dfpay_order_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:57:58');
INSERT INTO `sys_oper_log` VALUES (270, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"进行中\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:58:24');
INSERT INTO `sys_oper_log` VALUES (271, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"成功\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:58:46');
INSERT INTO `sys_oper_log` VALUES (272, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"106\"],\"dictLabel\":[\"成功\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:58:51');
INSERT INTO `sys_oper_log` VALUES (273, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"失败\"],\"dictValue\":[\"2\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:59:04');
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"zx_dfpay_info\"],\"tableComment\":[\"代付通道管理\"],\"className\":[\"ZxDfpayInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"51\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"52\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"53\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"代付平台名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"mchName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"商户编号2\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"mchId2\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"55\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"接口地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"apiUrl\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"56\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"商户KEY\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"key\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"co', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 17:59:29');
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"zx_dfpay_order\"],\"tableComment\":[\"代付订单管理\"],\"className\":[\"ZxDfpayOrder\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"65\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"66\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"通道ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"dfpayId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"67\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"通道名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"dfpayName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"68\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订单号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"orderNo\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"69\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"代付金额\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"money\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"70\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"姓名\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"relalName\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"LIKE\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:00:01');
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"zx_dfpay_info,zx_dfpay_order\"]}', 'null', 0, NULL, '2021-12-03 18:00:07');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"代付管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:17:31');
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-03 18:17:46');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-03 18:17:52');
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2003', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-03 18:21:17');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"代付通道信息\"],\"url\":[\"/us/info\"],\"target\":[\"menuItem\"],\"perms\":[\"us:info:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-vcard-o\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:24:05');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2020\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"代付订单\"],\"url\":[\"/us/order\"],\"target\":[\"menuItem\"],\"perms\":[\"us:order:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-barcode\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:24:55');
INSERT INTO `sys_oper_log` VALUES (283, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"key\":[\"12345687996\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\r\n### The error may exist in file [D:\\RuoYi_SVN\\ruoyi-system\\target\\classes\\mapper\\system\\ZxDfpayInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ZxDfpayInfoMapper.insertZxDfpayInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zx_dfpay_info          ( mch_id,             mch_name,             mch_id2,             api_url,             key,             secret,             notify_url,             is_use,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6', '2021-12-03 18:28:26');
INSERT INTO `sys_oper_log` VALUES (284, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"key\":[\"12345687996\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\r\n### The error may exist in file [D:\\RuoYi_SVN\\ruoyi-system\\target\\classes\\mapper\\system\\ZxDfpayInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ZxDfpayInfoMapper.insertZxDfpayInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zx_dfpay_info          ( mch_id,             mch_name,             mch_id2,             api_url,             key,             secret,             notify_url,             is_use,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6', '2021-12-03 18:28:46');
INSERT INTO `sys_oper_log` VALUES (285, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"key\":[\"2342sfd\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\r\n### The error may exist in file [D:\\RuoYi_SVN\\ruoyi-system\\target\\classes\\mapper\\system\\ZxDfpayInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ZxDfpayInfoMapper.insertZxDfpayInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zx_dfpay_info          ( mch_id,             mch_name,             mch_id2,             api_url,             key,             secret,             notify_url,             is_use,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6', '2021-12-03 18:30:13');
INSERT INTO `sys_oper_log` VALUES (286, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"key\":[\"2342sfd\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\r\n### The error may exist in file [D:\\RuoYi_SVN\\ruoyi-system\\target\\classes\\mapper\\system\\ZxDfpayInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ZxDfpayInfoMapper.insertZxDfpayInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zx_dfpay_info          ( mch_id,             mch_name,             mch_id2,             api_url,             key,             secret,             notify_url,             is_use,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'key,\n            secret,\n            notify_url,\n            is_use,\n           \' at line 6', '2021-12-03 18:31:43');
INSERT INTO `sys_oper_log` VALUES (287, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"key\":[\"2342sfd\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:37:25');
INSERT INTO `sys_oper_log` VALUES (288, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:39:39');
INSERT INTO `sys_oper_log` VALUES (289, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:39:45');
INSERT INTO `sys_oper_log` VALUES (290, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:39:49');
INSERT INTO `sys_oper_log` VALUES (291, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"1\"],\"dfpayName\":[\"万通\"],\"orderNo\":[\"2342134123423\"],\"money\":[\"100000\"],\"relalName\":[\"王者大伟\"],\"bankCard\":[\"1321561651356\"],\"bank\":[\"中国银行\"],\"openBank\":[\"金边支行\"],\"payTime\":[\"2021-12-24\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:41:01');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2020\"],\"menuType\":[\"F\"],\"menuName\":[\"代付查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:49:44');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2026\"],\"parentId\":[\"2020\"],\"menuType\":[\"F\"],\"menuName\":[\"代付查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:49:58');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2026\"],\"parentId\":[\"2020\"],\"menuType\":[\"F\"],\"menuName\":[\"代付查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"us:order:dfpay\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:50:17');
INSERT INTO `sys_oper_log` VALUES (295, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 18:58:51');
INSERT INTO `sys_oper_log` VALUES (296, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"代付通道\"],\"dictType\":[\"dfpay_name\"],\"status\":[\"0\"],\"remark\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:09:22');
INSERT INTO `sys_oper_log` VALUES (297, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"万通\"],\"dictValue\":[\"100\"],\"dictType\":[\"dfpay_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:09:48');
INSERT INTO `sys_oper_log` VALUES (298, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"盛联代付\"],\"dictValue\":[\"101\"],\"dictType\":[\"dfpay_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:14:41');
INSERT INTO `sys_oper_log` VALUES (299, '代付订单', 5, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.export()', 'POST', 1, 'admin', '研发部门', '/us/order/export', '127.0.0.1', '内网IP', '{\"dfpayName\":[\"\"],\"orderNo\":[\"\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"params[beginPayTime]\":[\"\"],\"params[endPayTime]\":[\"\"],\"payStatus\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\r\n  \"msg\" : \"ef65589b-f7b7-4bd1-8f56-b4a9e23bfadd_order.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:22:18');
INSERT INTO `sys_oper_log` VALUES (300, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"101\"],\"orderNo\":[\"23421342\"],\"money\":[\"100000\"],\"relalName\":[\"大师傅\"],\"bankCard\":[\"13546489468\"],\"bank\":[\"兴业银行\"],\"openBank\":[\"高德支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:23:11');
INSERT INTO `sys_oper_log` VALUES (301, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:52:44');
INSERT INTO `sys_oper_log` VALUES (302, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"mchId\":[\"TEST20001\"],\"mchName\":[\"万通代付\"],\"mchId2\":[\"20326589\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"MCHKE23432434\"],\"secret\":[\"KYKDSJFAI5544\"],\"notifyUrl\":[\"WWW.BAIBDU.COM\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', 'null', 1, '', '2021-12-03 19:52:49');
INSERT INTO `sys_oper_log` VALUES (303, '代付通道信息', 3, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.remove()', 'POST', 1, 'admin', '研发部门', '/us/info/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:53:08');
INSERT INTO `sys_oper_log` VALUES (304, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:53:55');
INSERT INTO `sys_oper_log` VALUES (305, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:55:04');
INSERT INTO `sys_oper_log` VALUES (306, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:56:43');
INSERT INTO `sys_oper_log` VALUES (307, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:56:51');
INSERT INTO `sys_oper_log` VALUES (308, '代付订单', 3, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/us/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"25\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-03 19:57:13');
INSERT INTO `sys_oper_log` VALUES (309, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 13:03:17');
INSERT INTO `sys_oper_log` VALUES (310, '代付通道信息', 1, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/info/add', '127.0.0.1', '内网IP', '{\"mchId\":[\"SL1002356\"],\"mchName\":[\"盛联代付\"],\"mchId2\":[\"SL235689\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"KEY21365897\"],\"secret\":[\"SCRES34354\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 13:15:02');
INSERT INTO `sys_oper_log` VALUES (311, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"mchId\":[\"SL1002356\"],\"mchName\":[\"盛联代付\"],\"mchId2\":[\"SL235689\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"KEY21365897\"],\"secret\":[\"SCRES34354\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 13:15:12');
INSERT INTO `sys_oper_log` VALUES (312, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 13:53:22');
INSERT INTO `sys_oper_log` VALUES (313, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"26\"],\"orderNo\":[\"45263568745988\"],\"money\":[\"100000\"],\"relalName\":[\"王者\"],\"bankCard\":[\"12365984758\"],\"bank\":[\"建设银行\"],\"openBank\":[\"建设银行高德之行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 13:54:30');
INSERT INTO `sys_oper_log` VALUES (314, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"orderNo\":[\"2342134123423\"],\"money\":[\"100000\"],\"relalName\":[\"王者大伟\"],\"bankCard\":[\"1321561651356\"],\"bank\":[\"中国银行\"],\"openBank\":[\"金边支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:15:15');
INSERT INTO `sys_oper_log` VALUES (315, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"orderNo\":[\"45263568745988\"],\"money\":[\"100000\"],\"relalName\":[\"王者\"],\"bankCard\":[\"12365984758\"],\"bank\":[\"建设银行\"],\"openBank\":[\"建设银行高德之行\"],\"payStatus\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:15:22');
INSERT INTO `sys_oper_log` VALUES (316, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"orderNo\":[\"45263568745988\"],\"money\":[\"100000\"],\"relalName\":[\"王者\"],\"bankCard\":[\"12365984758\"],\"bank\":[\"建设银行\"],\"openBank\":[\"建设银行高德之行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:15:31');
INSERT INTO `sys_oper_log` VALUES (317, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"代付查询结果\"],\"dictType\":[\"dfpay_result\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:58:55');
INSERT INTO `sys_oper_log` VALUES (318, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"进行中\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:59:26');
INSERT INTO `sys_oper_log` VALUES (319, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"114\"],\"dictLabel\":[\"进行中\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:59:41');
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"成功\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 14:59:57');
INSERT INTO `sys_oper_log` VALUES (321, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"失败\"],\"dictValue\":[\"2\"],\"dictType\":[\"dfpay_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:00:23');
INSERT INTO `sys_oper_log` VALUES (322, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"116\"],\"dictLabel\":[\"失败\"],\"dictValue\":[\"2\"],\"dictType\":[\"dfpay_result\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:00:30');
INSERT INTO `sys_oper_log` VALUES (323, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"进行中\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:00:50');
INSERT INTO `sys_oper_log` VALUES (324, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"106\"],\"dictLabel\":[\"成功\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:00:55');
INSERT INTO `sys_oper_log` VALUES (325, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"106\"],\"dictLabel\":[\"成功\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:01:01');
INSERT INTO `sys_oper_log` VALUES (326, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"107\"],\"dictLabel\":[\"失败\"],\"dictValue\":[\"2\"],\"dictType\":[\"dfpay_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:01:07');
INSERT INTO `sys_oper_log` VALUES (327, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"盘口名称\"],\"dictType\":[\"pan_name\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:13:25');
INSERT INTO `sys_oper_log` VALUES (328, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"ATCoin\"],\"dictValue\":[\"ATCoin\"],\"dictType\":[\"pan_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:14:10');
INSERT INTO `sys_oper_log` VALUES (329, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"YT\"],\"dictValue\":[\"YT\"],\"dictType\":[\"pan_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:14:29');
INSERT INTO `sys_oper_log` VALUES (330, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"回调状态\"],\"dictType\":[\"is_notify\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:22:26');
INSERT INTO `sys_oper_log` VALUES (331, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未回调\"],\"dictValue\":[\"0\"],\"dictType\":[\"is_notify\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:23:04');
INSERT INTO `sys_oper_log` VALUES (332, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已回调\"],\"dictValue\":[\"1\"],\"dictType\":[\"is_notify\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:23:19');
INSERT INTO `sys_oper_log` VALUES (333, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"120\"],\"dictLabel\":[\"已回调\"],\"dictValue\":[\"1\"],\"dictType\":[\"is_notify\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:23:26');
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:23:46');
INSERT INTO `sys_oper_log` VALUES (335, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:39:27');
INSERT INTO `sys_oper_log` VALUES (336, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"mchId\":[\"SL1002356\"],\"mchName\":[\"盛联代付\"],\"mchId2\":[\"SL235689\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"KEY21365897\"],\"secret\":[\"SCRES34354\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:39:31');
INSERT INTO `sys_oper_log` VALUES (337, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:44:57');
INSERT INTO `sys_oper_log` VALUES (338, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"mchId\":[\"SL10023561\"],\"mchName\":[\"盛联代付2\"],\"mchId2\":[\"SL2356891\"],\"apiUrl\":[\"www.baidu.com1\"],\"mchKey\":[\"KEY213658971\"],\"secret\":[\"SCRES343541\"],\"notifyUrl\":[\"www.baidu.com1\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:45:10');
INSERT INTO `sys_oper_log` VALUES (339, '代付通道信息', 2, 'com.ruoyi.web.controller.pay.ZxDfpayInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/info/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"mchId\":[\"TEST2012356\"],\"mchName\":[\"万达代付2\"],\"mchId2\":[\"203156254\"],\"apiUrl\":[\"www.baidu.com\"],\"mchKey\":[\"key1235689\"],\"secret\":[\"admin12568963\"],\"notifyUrl\":[\"www.baidu.com\"],\"isUse\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:45:20');
INSERT INTO `sys_oper_log` VALUES (340, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"26\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 15:46:27');
INSERT INTO `sys_oper_log` VALUES (341, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"],\"payResult\":[\"\"]}', '{\r\n  \"msg\" : \"代付订单无法修改!\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-04 15:51:41');
INSERT INTO `sys_oper_log` VALUES (342, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"],\"payResult\":[\"\"]}', '{\r\n  \"msg\" : \"代付订单无法修改!\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-04 15:51:43');
INSERT INTO `sys_oper_log` VALUES (343, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"],\"payResult\":[\"\"]}', '{\r\n  \"msg\" : \"代付订单无法修改!\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-04 15:52:06');
INSERT INTO `sys_oper_log` VALUES (344, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"],\"payResult\":[\"\"]}', '{\r\n  \"msg\" : \"代付订单无法修改!\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-04 15:56:34');
INSERT INTO `sys_oper_log` VALUES (345, '代付订单', 2, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.editSave()', 'POST', 1, 'admin', '研发部门', '/us/order/edit', '127.0.0.1', '内网IP', '{\"id\":[\"27\"],\"orderNo\":[\"77977_20211203438\"],\"money\":[\"100000\"],\"relalName\":[\"任兴见\"],\"bankCard\":[\"6228480469427970774\"],\"bank\":[\"中国农业银行\"],\"openBank\":[\"新光路支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"],\"payResult\":[\"\"]}', '{\r\n  \"msg\" : \"代付订单无法修改!\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-12-04 16:01:01');
INSERT INTO `sys_oper_log` VALUES (346, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"25\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"77977_20211203437\"],\"money\":[\"100000\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"bank\":[\"\"],\"openBank\":[\"\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"代入通道信息错误!\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-12-04 16:32:59');
INSERT INTO `sys_oper_log` VALUES (347, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"26\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"77977_20211203437\"],\"money\":[\"100000\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"bank\":[\"\"],\"openBank\":[\"\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"代入通道信息错误!\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-12-04 16:33:09');
INSERT INTO `sys_oper_log` VALUES (348, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"26\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"77977_20211203437\"],\"money\":[\"100000\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"bank\":[\"\"],\"openBank\":[\"\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"代入通道信息错误!\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-12-04 16:33:50');
INSERT INTO `sys_oper_log` VALUES (349, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"\"],\"dfpayName\":[\"26\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"77977_20211203437\"],\"money\":[\"100000\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"bank\":[\"\"],\"openBank\":[\"\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"代入通道信息错误!\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-12-04 16:38:13');
INSERT INTO `sys_oper_log` VALUES (350, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"25\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"78413_20211203132\"],\"money\":[\"100000\"],\"relalName\":[\"张旭\"],\"bankCard\":[\"6212252510000025401\"],\"bank\":[\"中国工商银行\\t\"],\"openBank\":[\"中国工商银行\\t\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:40:47');
INSERT INTO `sys_oper_log` VALUES (351, '代付订单', 3, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/us/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:40:53');
INSERT INTO `sys_oper_log` VALUES (352, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"启用\"],\"dictValue\":[\"0\"],\"dictType\":[\"dfpay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:43:02');
INSERT INTO `sys_oper_log` VALUES (353, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"禁用\"],\"dictValue\":[\"1\"],\"dictType\":[\"dfpay_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:43:09');
INSERT INTO `sys_oper_log` VALUES (354, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"25\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"\"],\"money\":[\"\"],\"relalName\":[\"\"],\"bankCard\":[\"\"],\"bank\":[\"\"],\"openBank\":[\"\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:44:11');
INSERT INTO `sys_oper_log` VALUES (355, '代付订单', 3, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/us/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"29\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:44:14');
INSERT INTO `sys_oper_log` VALUES (356, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"25\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"1\"],\"money\":[\"100000\"],\"relalName\":[\"123\"],\"bankCard\":[\"1323\"],\"bank\":[\"123123\"],\"openBank\":[\"12312312\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:49:15');
INSERT INTO `sys_oper_log` VALUES (357, '代付订单', 3, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/us/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"30\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:49:22');
INSERT INTO `sys_oper_log` VALUES (358, '代付订单', 1, 'com.ruoyi.web.controller.pay.ZxDfpayOrderController.addSave()', 'POST', 1, 'admin', '研发部门', '/us/order/add', '127.0.0.1', '内网IP', '{\"dfpayId\":[\"25\"],\"panName\":[\"ATCoin\"],\"orderNo\":[\"78413_20211203134\"],\"money\":[\"100000\"],\"relalName\":[\"大哥哥哥\"],\"bankCard\":[\"43214213421341234\"],\"bank\":[\"兴业银行\"],\"openBank\":[\"兴业银行-支行\"],\"payStatus\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-12-04 16:58:10');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-11-05 12:10:08', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-11-05 12:10:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2020-11-05 12:10:08', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '卡商', 'cardmerch', 3, '1', '0', '0', 'admin', '2020-11-14 11:36:54', 'admin', '2020-11-14 11:43:16', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2007);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-12-04 16:56:38', '2020-11-05 12:10:08', 'admin', '2020-11-05 12:10:08', '', '2021-12-04 16:56:38', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2020-11-05 12:10:08', '2020-11-05 12:10:08', 'admin', '2020-11-05 12:10:08', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('53bc8479-3a2c-40b5-bcda-e07515956895', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-12-04 12:37:42', '2021-12-04 17:05:59', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);

-- ----------------------------
-- Table structure for zx_dfpay_info
-- ----------------------------
DROP TABLE IF EXISTS `zx_dfpay_info`;
CREATE TABLE `zx_dfpay_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商户好',
  `mch_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '代付平台名称',
  `mch_id2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商户编号2',
  `api_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '接口地址',
  `mch_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商户KEY',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商户秘钥',
  `notify_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '异步回调地址',
  `is_use` int(2) DEFAULT NULL COMMENT '是否启用',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zx_dfpay_info
-- ----------------------------
INSERT INTO `zx_dfpay_info` VALUES (25, 'TEST2012356', '万达代付2', '203156254', 'www.baidu.com', 'key1235689', 'admin12568963', 'www.baidu.com', 0, '', '2021-12-03 19:53:56', '', '2021-12-04 15:45:20', '');
INSERT INTO `zx_dfpay_info` VALUES (26, 'SL10023561', '盛联代付2', 'SL2356891', 'www.baidu.com1', 'KEY213658971', 'SCRES343541', 'www.baidu.com1', 0, '', '2021-12-04 13:15:02', '', '2021-12-04 15:45:10', '');

-- ----------------------------
-- Table structure for zx_dfpay_order
-- ----------------------------
DROP TABLE IF EXISTS `zx_dfpay_order`;
CREATE TABLE `zx_dfpay_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `dfpay_id` int(32) DEFAULT NULL COMMENT '通道ID',
  `dfpay_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '通道名称',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单号',
  `money` double(32, 0) DEFAULT NULL COMMENT '代付金额',
  `relal_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `bank_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '银行卡号',
  `bank` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '银行银行',
  `open_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开户行',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '打款时间',
  `pay_status` int(255) DEFAULT NULL COMMENT '支付状态',
  `pay_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '四方支付状态  ',
  `is_notify` int(2) DEFAULT 0 COMMENT '是否已通知',
  `pan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '盘口名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zx_dfpay_order
-- ----------------------------
INSERT INTO `zx_dfpay_order` VALUES (28, 25, '万达代付2', '78413_20211203132', 100000, '张旭', '6212252510000025401', '中国工商银行	', '中国工商银行	', NULL, 0, NULL, 0, 'ATCoin', '', '2021-12-04 16:40:47', '', NULL, '');
INSERT INTO `zx_dfpay_order` VALUES (31, 25, '万达代付2', '78413_20211203134', 100000, '大哥哥哥', '43214213421341234', '兴业银行', '兴业银行-支行', NULL, 0, NULL, 0, 'ATCoin', '', '2021-12-04 16:58:11', '', NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
