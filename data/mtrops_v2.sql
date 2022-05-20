/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : 127.0.0.1:3306
 Source Schema         : mtrops_v2

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 28/11/2018 16:32:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_asset_host
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_host`;
CREATE TABLE `app_asset_host`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_remove_port` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_passwd` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_msg` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serial_num` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_date` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overdue_date` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creat_time` datetime(6) NOT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `idc_id` int(11) NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `host_ip`(`host_ip`) USING BTREE,
  INDEX `app_asset_host_group_id_c2f5df06_fk_app_asset_hostgroup_id`(`group_id`) USING BTREE,
  INDEX `app_asset_host_idc_id_82734ac0_fk_app_asset_idc_id`(`idc_id`) USING BTREE,
  INDEX `app_asset_host_supplier_id_77b2b553_fk_app_asset_supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `app_asset_host_group_id_c2f5df06_fk_app_asset_hostgroup_id` FOREIGN KEY (`group_id`) REFERENCES `app_asset_hostgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_asset_host_idc_id_82734ac0_fk_app_asset_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `app_asset_idc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_asset_host_supplier_id_77b2b553_fk_app_asset_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `app_asset_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_asset_hostdetail
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_hostdetail`;
CREATE TABLE `app_asset_hostdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mem_size` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `swap_size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpu_model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpu_nums` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interface` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `os_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kernel_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `os_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `host_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_asset_hostdetail_host_id_7ccadf7f_fk_app_asset_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `app_asset_hostdetail_host_id_7ccadf7f_fk_app_asset_host_id` FOREIGN KEY (`host_id`) REFERENCES `app_asset_host` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_asset_hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_hostgroup`;
CREATE TABLE `app_asset_hostgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_group_msg` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `host_group_name`(`host_group_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_asset_hostgroup
-- ----------------------------
INSERT INTO `app_asset_hostgroup` VALUES (9, '测试组', '测试');

-- ----------------------------
-- Table structure for app_asset_idc
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_idc`;
CREATE TABLE `app_asset_idc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idc_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idc_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idc_admin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idc_admin_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idc_admin_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idc_name`(`idc_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_asset_netwk
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_netwk`;
CREATE TABLE `app_asset_netwk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netwk_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `netwk_remove_port` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `netwk_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `netwk_passwd` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `netwk_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `netwk_msg` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serial_num` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_date` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overdue_date` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creat_time` datetime(6) NOT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `idc_id` int(11) NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `netwk_ip`(`netwk_ip`) USING BTREE,
  INDEX `app_asset_netwk_group_id_296fe67a_fk_app_asset_hostgroup_id`(`group_id`) USING BTREE,
  INDEX `app_asset_netwk_idc_id_ce4d4607_fk_app_asset_idc_id`(`idc_id`) USING BTREE,
  INDEX `app_asset_netwk_supplier_id_fa6020c4_fk_app_asset_supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `app_asset_netwk_group_id_296fe67a_fk_app_asset_hostgroup_id` FOREIGN KEY (`group_id`) REFERENCES `app_asset_hostgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_asset_netwk_idc_id_ce4d4607_fk_app_asset_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `app_asset_idc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_asset_netwk_supplier_id_fa6020c4_fk_app_asset_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `app_asset_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_asset_software
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_software`;
CREATE TABLE `app_asset_software`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `server_version` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_port` varchar(1026) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_asset_software_host_id_1c4f4ada_fk_app_asset_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `app_asset_software_host_id_1c4f4ada_fk_app_asset_host_id` FOREIGN KEY (`host_id`) REFERENCES `app_asset_host` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_asset_supplier
-- ----------------------------
DROP TABLE IF EXISTS `app_asset_supplier`;
CREATE TABLE `app_asset_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_head` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_head_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_head_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_asset_supplier_supplier_c7b4eaa0_uniq`(`supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_auth_menus
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_menus`;
CREATE TABLE `app_auth_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pmenu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_order` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_menus_menu_url_d695085b_uniq`(`menu_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_menus
-- ----------------------------
INSERT INTO `app_auth_menus` VALUES (1, '首页', '/', '一级菜单', '0', '1', 'fa fa-lg fa-dashboard', NULL);
INSERT INTO `app_auth_menus` VALUES (2, '资产管理', '/asset/', '一级菜单', '0', '2', 'fa fa-lg fa-bars', NULL);
INSERT INTO `app_auth_menus` VALUES (3, '代码管理', '/code/', '一级菜单', '0', '3', 'fa fa-lg fa-code', NULL);
INSERT INTO `app_auth_menus` VALUES (4, '系统管理', '/sys/', '一级菜单', '0', '4', 'fa fa-lg fa-desktop', NULL);
INSERT INTO `app_auth_menus` VALUES (5, '运维工具', '/tool/', '一级菜单', '0', '5', 'fa fa-lg fa-wrench', NULL);
INSERT INTO `app_auth_menus` VALUES (6, '日志审计', '/log/', '一级菜单', '0', '6', 'fa fa-lg fa-book', NULL);
INSERT INTO `app_auth_menus` VALUES (7, '后台管理', '/auth/', '一级菜单', '0', '7', 'fa fa-lg fa-cog', NULL);
INSERT INTO `app_auth_menus` VALUES (8, '服务器', '/asset/host/', '二级菜单', '2', '208', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (9, '网络设备', '/asset/netwk/', '二级菜单', '2', '209', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (10, 'IDC 机房', '/asset/idc/', '二级菜单', '2', '2010', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (11, '主机分组', '/asset/hostgroup/', '二级菜单', '2', '2011', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (12, '设备厂商', '/asset/supplier/', '二级菜单', '2', '2012', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (13, '项目管理', '/code/project/', '二级菜单', '3', '3013', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (14, '代码管理', '/code/gitcode/', '二级菜单', '3', '3014', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (15, '代码发布', '/code/publist/', '二级菜单', '3', '3015', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (16, '发布记录', '/code/log/', '二级菜单', '3', '3016', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (17, '环境部署', '/sys/sofeware/', '二级菜单', '4', '4017', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (18, '批量管理', '/sys/batch/', '二级菜单', '4', '4018', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (19, '文件管理', '/sys/filemg/', '二级菜单', '4', '4019', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (21, 'phpMyadmin', '/tool/phpmyadmin/', '二级菜单', '5', '5021', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (22, '操作日志', '/log/opslog/', '二级菜单', '6', '6022', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (23, '用户日志', '/log/userlog/', '二级菜单', '6', '6023', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (24, '角色管理', '/auth/role/', '二级菜单', '7', '7024', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (25, '用户管理', '/auth/user/', '二级菜单', '7', '7025', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (26, '菜单管理', '/auth/menu/', '二级菜单', '7', '7026', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (27, '权限管理', '/auth/perms/', '二级菜单', '7', '7027', NULL, NULL);
INSERT INTO `app_auth_menus` VALUES (28, '任务中心', '/log/tasklog/', '二级菜单', '6', '6028', NULL, NULL);

-- ----------------------------
-- Table structure for app_auth_perms
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_perms`;
CREATE TABLE `app_auth_perms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perms_req` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menus_id` int(11) NOT NULL,
  `perms_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `perms_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_perms_perms_url_989fe779_uniq`(`perms_url`) USING BTREE,
  INDEX `app_auth_perms_menus_id_57ecaabb_fk_app_auth_menus_id`(`menus_id`) USING BTREE,
  CONSTRAINT `app_auth_perms_menus_id_57ecaabb_fk_app_auth_menus_id` FOREIGN KEY (`menus_id`) REFERENCES `app_auth_menus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_perms
-- ----------------------------
INSERT INTO `app_auth_perms` VALUES (4, 'post', 8, '添加服务器', NULL);
INSERT INTO `app_auth_perms` VALUES (5, 'delete', 8, '删除服务器', NULL);
INSERT INTO `app_auth_perms` VALUES (6, 'put', 8, '修改服务器', NULL);
INSERT INTO `app_auth_perms` VALUES (7, 'get', 8, '查询服务器', NULL);
INSERT INTO `app_auth_perms` VALUES (8, 'post', 9, '添加网络设备', NULL);
INSERT INTO `app_auth_perms` VALUES (9, 'delete', 9, '删除网络设备', NULL);
INSERT INTO `app_auth_perms` VALUES (10, 'put', 9, '修改网络设备', NULL);
INSERT INTO `app_auth_perms` VALUES (11, 'get', 9, '查询网络设备', NULL);
INSERT INTO `app_auth_perms` VALUES (12, 'post', 10, '添加机房', NULL);
INSERT INTO `app_auth_perms` VALUES (13, 'delete', 10, '删除机房', NULL);
INSERT INTO `app_auth_perms` VALUES (14, 'put', 10, '修改机房', NULL);
INSERT INTO `app_auth_perms` VALUES (15, 'get', 10, '查询机房', NULL);
INSERT INTO `app_auth_perms` VALUES (16, 'post', 11, '添加分组', NULL);
INSERT INTO `app_auth_perms` VALUES (17, 'delete', 11, '删除分组', NULL);
INSERT INTO `app_auth_perms` VALUES (18, 'put', 11, '修改分组', NULL);
INSERT INTO `app_auth_perms` VALUES (19, 'get', 11, '查询分组', NULL);
INSERT INTO `app_auth_perms` VALUES (20, 'post', 12, '添加厂商', NULL);
INSERT INTO `app_auth_perms` VALUES (21, 'delete', 12, '删除厂商', NULL);
INSERT INTO `app_auth_perms` VALUES (22, 'put', 12, '修改厂商', NULL);
INSERT INTO `app_auth_perms` VALUES (23, 'get', 12, '查询厂商', NULL);
INSERT INTO `app_auth_perms` VALUES (24, 'post', 13, '添加项目', NULL);
INSERT INTO `app_auth_perms` VALUES (25, 'put', 13, '修改项目', NULL);
INSERT INTO `app_auth_perms` VALUES (26, 'delete', 13, '删除项目', NULL);
INSERT INTO `app_auth_perms` VALUES (27, 'get', 13, '查询项目', NULL);
INSERT INTO `app_auth_perms` VALUES (28, 'post', 14, '添加代码', NULL);
INSERT INTO `app_auth_perms` VALUES (29, 'put', 14, '修改代码', NULL);
INSERT INTO `app_auth_perms` VALUES (30, 'delete', 14, '删除代码', NULL);
INSERT INTO `app_auth_perms` VALUES (31, 'get', 14, '查询代码', NULL);
INSERT INTO `app_auth_perms` VALUES (32, 'post', 15, '添加发布', NULL);
INSERT INTO `app_auth_perms` VALUES (33, 'delete', 15, '删除发布', NULL);
INSERT INTO `app_auth_perms` VALUES (34, 'delete', 16, '删除发布记录', NULL);
INSERT INTO `app_auth_perms` VALUES (36, 'post', 17, '添加环境', NULL);
INSERT INTO `app_auth_perms` VALUES (37, 'delete', 17, '删除环境', NULL);
INSERT INTO `app_auth_perms` VALUES (38, 'put', 17, '修改环境', NULL);
INSERT INTO `app_auth_perms` VALUES (39, 'get', 17, '查询环境', NULL);
INSERT INTO `app_auth_perms` VALUES (40, 'get', 18, '访问批量管理', NULL);
INSERT INTO `app_auth_perms` VALUES (41, 'get', 19, '访问文件管理', NULL);
INSERT INTO `app_auth_perms` VALUES (43, 'get', 21, '访问phpmyadmin', NULL);
INSERT INTO `app_auth_perms` VALUES (44, 'get', 22, '查看操作日志', NULL);
INSERT INTO `app_auth_perms` VALUES (45, 'get', 23, '查看用户日志', NULL);
INSERT INTO `app_auth_perms` VALUES (46, 'post', 24, '添加角色', NULL);
INSERT INTO `app_auth_perms` VALUES (47, 'delete', 24, '删除角色', NULL);
INSERT INTO `app_auth_perms` VALUES (48, 'put', 24, '删除修改', NULL);
INSERT INTO `app_auth_perms` VALUES (49, 'get', 24, '查看角色', NULL);
INSERT INTO `app_auth_perms` VALUES (50, 'other', 24, '角色菜单授权', '/auth/addrolemenu/');
INSERT INTO `app_auth_perms` VALUES (51, 'other', 24, '角色权限授权', '/auth/addroleperms/');
INSERT INTO `app_auth_perms` VALUES (53, 'other', 24, '获取角色菜单', '/auth/rolemenu/');
INSERT INTO `app_auth_perms` VALUES (54, 'other', 24, '获取角色权限', '/auth/roleperms/');
INSERT INTO `app_auth_perms` VALUES (55, 'other', 24, '获取角色资产', '/auth/roleasset/');
INSERT INTO `app_auth_perms` VALUES (56, 'other', 24, '角色资产授权', '/auth/addroleasset/');
INSERT INTO `app_auth_perms` VALUES (57, 'other', 24, '角色项目授权', '/auth/addroleproject/');
INSERT INTO `app_auth_perms` VALUES (58, 'other', 24, '获取角色项目', '/auth/roleproject/');
INSERT INTO `app_auth_perms` VALUES (59, 'post', 25, '添加用户', NULL);
INSERT INTO `app_auth_perms` VALUES (60, 'delete', 25, '删除用户', NULL);
INSERT INTO `app_auth_perms` VALUES (61, 'put', 25, '修改用户', NULL);
INSERT INTO `app_auth_perms` VALUES (62, 'get', 25, '查询用户', NULL);
INSERT INTO `app_auth_perms` VALUES (63, 'get', 26, '查询菜单', NULL);
INSERT INTO `app_auth_perms` VALUES (64, 'put', 26, '修改菜单', NULL);
INSERT INTO `app_auth_perms` VALUES (65, 'delete', 26, '删除菜单', NULL);
INSERT INTO `app_auth_perms` VALUES (66, 'post', 26, '添加菜单', NULL);
INSERT INTO `app_auth_perms` VALUES (67, 'post', 27, '添加权限', NULL);
INSERT INTO `app_auth_perms` VALUES (68, 'delete', 27, '删除权限', NULL);
INSERT INTO `app_auth_perms` VALUES (69, 'put', 27, '修改权限', NULL);
INSERT INTO `app_auth_perms` VALUES (70, 'get', 27, '查询权限', NULL);
INSERT INTO `app_auth_perms` VALUES (71, 'get', 15, '查询发布', NULL);
INSERT INTO `app_auth_perms` VALUES (72, 'get', 16, '查询发布记录', NULL);
INSERT INTO `app_auth_perms` VALUES (73, 'other', 8, '查询服务器详细信息', '/asset/hostdetail/');
INSERT INTO `app_auth_perms` VALUES (74, 'other', 8, '服务器同步系统信息', '/asset/synchost/');
INSERT INTO `app_auth_perms` VALUES (75, 'other', 8, '过滤服务器', '/asset/searchhost/');
INSERT INTO `app_auth_perms` VALUES (76, 'other', 8, '批量删除服务器', '/asset/delhost/');
INSERT INTO `app_auth_perms` VALUES (77, 'other', 8, '连接服务器', '/asset/connecthost/');
INSERT INTO `app_auth_perms` VALUES (78, 'other', 15, '代码发布过滤', '/code/search/');
INSERT INTO `app_auth_perms` VALUES (79, 'other', 8, '导出服务器', '/asset/exporthost/');
INSERT INTO `app_auth_perms` VALUES (80, 'other', 25, '修改密码', '/auth/chpasswd/');
INSERT INTO `app_auth_perms` VALUES (81, 'other', 25, '添加远程管理用户', '/auth/addremote/');
INSERT INTO `app_auth_perms` VALUES (82, 'other', 18, '上传文件', '/sys/upfile/');
INSERT INTO `app_auth_perms` VALUES (83, 'other', 18, '执行命令', '/sys/runcmd/');
INSERT INTO `app_auth_perms` VALUES (84, 'other', 18, '执行脚本', '/sys/script/');
INSERT INTO `app_auth_perms` VALUES (85, 'other', 18, '计划任务', '/sys/cron/');
INSERT INTO `app_auth_perms` VALUES (86, 'post', 21, '连接phpmyadmin', NULL);
INSERT INTO `app_auth_perms` VALUES (87, 'post', 22, '查看审计记录', NULL);
INSERT INTO `app_auth_perms` VALUES (88, 'put', 15, '更新代码', NULL);
INSERT INTO `app_auth_perms` VALUES (89, 'other', 15, '查看更新记录', '/code/gitlog/');
INSERT INTO `app_auth_perms` VALUES (91, 'get', 28, '查看任务', NULL);
INSERT INTO `app_auth_perms` VALUES (92, 'post', 28, '任务日志', NULL);

-- ----------------------------
-- Table structure for app_auth_remoteuser
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_remoteuser`;
CREATE TABLE `app_auth_remoteuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lg_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lg_passwd` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lg_key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NOT NULL,
  `lg_key_pass` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lg_user`(`lg_user`) USING BTREE,
  INDEX `app_auth_remoteuser_user_id_ea3232d8_fk_app_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `app_auth_remoteuser_user_id_ea3232d8_fk_app_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_remoteuser
-- ----------------------------
INSERT INTO `app_auth_remoteuser` VALUES (2, '', 'b\'\'', '', 1, 'b\'\'');

-- ----------------------------
-- Table structure for app_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role`;
CREATE TABLE `app_auth_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_title`(`role_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_role
-- ----------------------------
INSERT INTO `app_auth_role` VALUES (1, 'administrator', '超级管理员');

-- ----------------------------
-- Table structure for app_auth_role_host
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role_host`;
CREATE TABLE `app_auth_role_host`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_role_host_role_id_host_id_b84cf1fc_uniq`(`role_id`, `host_id`) USING BTREE,
  INDEX `app_auth_role_host_host_id_8f5ad2a4_fk_app_asset_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `app_auth_role_host_host_id_8f5ad2a4_fk_app_asset_host_id` FOREIGN KEY (`host_id`) REFERENCES `app_asset_host` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_role_host_role_id_9eb7afaf_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role_menu`;
CREATE TABLE `app_auth_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_role_menu_role_id_menus_id_a36454cb_uniq`(`role_id`, `menus_id`) USING BTREE,
  INDEX `app_auth_role_menu_menus_id_7ef9f003_fk_app_auth_menus_id`(`menus_id`) USING BTREE,
  CONSTRAINT `app_auth_role_menu_menus_id_7ef9f003_fk_app_auth_menus_id` FOREIGN KEY (`menus_id`) REFERENCES `app_auth_menus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_role_menu_role_id_16d6bb84_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_role_menu
-- ----------------------------
INSERT INTO `app_auth_role_menu` VALUES (304, 1, 1);
INSERT INTO `app_auth_role_menu` VALUES (305, 1, 2);
INSERT INTO `app_auth_role_menu` VALUES (311, 1, 3);
INSERT INTO `app_auth_role_menu` VALUES (316, 1, 4);
INSERT INTO `app_auth_role_menu` VALUES (320, 1, 5);
INSERT INTO `app_auth_role_menu` VALUES (322, 1, 6);
INSERT INTO `app_auth_role_menu` VALUES (326, 1, 7);
INSERT INTO `app_auth_role_menu` VALUES (306, 1, 8);
INSERT INTO `app_auth_role_menu` VALUES (307, 1, 9);
INSERT INTO `app_auth_role_menu` VALUES (308, 1, 10);
INSERT INTO `app_auth_role_menu` VALUES (309, 1, 11);
INSERT INTO `app_auth_role_menu` VALUES (310, 1, 12);
INSERT INTO `app_auth_role_menu` VALUES (312, 1, 13);
INSERT INTO `app_auth_role_menu` VALUES (313, 1, 14);
INSERT INTO `app_auth_role_menu` VALUES (314, 1, 15);
INSERT INTO `app_auth_role_menu` VALUES (315, 1, 16);
INSERT INTO `app_auth_role_menu` VALUES (317, 1, 17);
INSERT INTO `app_auth_role_menu` VALUES (318, 1, 18);
INSERT INTO `app_auth_role_menu` VALUES (319, 1, 19);
INSERT INTO `app_auth_role_menu` VALUES (321, 1, 21);
INSERT INTO `app_auth_role_menu` VALUES (323, 1, 22);
INSERT INTO `app_auth_role_menu` VALUES (324, 1, 23);
INSERT INTO `app_auth_role_menu` VALUES (327, 1, 24);
INSERT INTO `app_auth_role_menu` VALUES (328, 1, 25);
INSERT INTO `app_auth_role_menu` VALUES (329, 1, 26);
INSERT INTO `app_auth_role_menu` VALUES (330, 1, 27);
INSERT INTO `app_auth_role_menu` VALUES (325, 1, 28);

-- ----------------------------
-- Table structure for app_auth_role_netwk
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role_netwk`;
CREATE TABLE `app_auth_role_netwk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `netwk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_role_netwk_role_id_netwk_id_d7fd7a9e_uniq`(`role_id`, `netwk_id`) USING BTREE,
  INDEX `app_auth_role_netwk_netwk_id_65b51976_fk_app_asset_netwk_id`(`netwk_id`) USING BTREE,
  CONSTRAINT `app_auth_role_netwk_netwk_id_65b51976_fk_app_asset_netwk_id` FOREIGN KEY (`netwk_id`) REFERENCES `app_asset_netwk` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_role_netwk_role_id_c2eec4e1_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_auth_role_perms
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role_perms`;
CREATE TABLE `app_auth_role_perms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `perms_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_role_perms_role_id_perms_id_f73ba1cb_uniq`(`role_id`, `perms_id`) USING BTREE,
  INDEX `app_auth_role_perms_perms_id_05bc8fc8_fk_app_auth_perms_id`(`perms_id`) USING BTREE,
  CONSTRAINT `app_auth_role_perms_perms_id_05bc8fc8_fk_app_auth_perms_id` FOREIGN KEY (`perms_id`) REFERENCES `app_auth_perms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_role_perms_role_id_d1dbe279_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1878 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_role_perms
-- ----------------------------
INSERT INTO `app_auth_role_perms` VALUES (1793, 1, 4);
INSERT INTO `app_auth_role_perms` VALUES (1794, 1, 5);
INSERT INTO `app_auth_role_perms` VALUES (1795, 1, 6);
INSERT INTO `app_auth_role_perms` VALUES (1796, 1, 7);
INSERT INTO `app_auth_role_perms` VALUES (1803, 1, 8);
INSERT INTO `app_auth_role_perms` VALUES (1804, 1, 9);
INSERT INTO `app_auth_role_perms` VALUES (1805, 1, 10);
INSERT INTO `app_auth_role_perms` VALUES (1806, 1, 11);
INSERT INTO `app_auth_role_perms` VALUES (1807, 1, 12);
INSERT INTO `app_auth_role_perms` VALUES (1808, 1, 13);
INSERT INTO `app_auth_role_perms` VALUES (1809, 1, 14);
INSERT INTO `app_auth_role_perms` VALUES (1810, 1, 15);
INSERT INTO `app_auth_role_perms` VALUES (1811, 1, 16);
INSERT INTO `app_auth_role_perms` VALUES (1812, 1, 17);
INSERT INTO `app_auth_role_perms` VALUES (1813, 1, 18);
INSERT INTO `app_auth_role_perms` VALUES (1814, 1, 19);
INSERT INTO `app_auth_role_perms` VALUES (1815, 1, 20);
INSERT INTO `app_auth_role_perms` VALUES (1816, 1, 21);
INSERT INTO `app_auth_role_perms` VALUES (1817, 1, 22);
INSERT INTO `app_auth_role_perms` VALUES (1818, 1, 23);
INSERT INTO `app_auth_role_perms` VALUES (1819, 1, 24);
INSERT INTO `app_auth_role_perms` VALUES (1820, 1, 25);
INSERT INTO `app_auth_role_perms` VALUES (1821, 1, 26);
INSERT INTO `app_auth_role_perms` VALUES (1822, 1, 27);
INSERT INTO `app_auth_role_perms` VALUES (1823, 1, 28);
INSERT INTO `app_auth_role_perms` VALUES (1824, 1, 29);
INSERT INTO `app_auth_role_perms` VALUES (1825, 1, 30);
INSERT INTO `app_auth_role_perms` VALUES (1826, 1, 31);
INSERT INTO `app_auth_role_perms` VALUES (1827, 1, 32);
INSERT INTO `app_auth_role_perms` VALUES (1828, 1, 33);
INSERT INTO `app_auth_role_perms` VALUES (1833, 1, 34);
INSERT INTO `app_auth_role_perms` VALUES (1835, 1, 36);
INSERT INTO `app_auth_role_perms` VALUES (1836, 1, 37);
INSERT INTO `app_auth_role_perms` VALUES (1837, 1, 38);
INSERT INTO `app_auth_role_perms` VALUES (1838, 1, 39);
INSERT INTO `app_auth_role_perms` VALUES (1839, 1, 40);
INSERT INTO `app_auth_role_perms` VALUES (1844, 1, 41);
INSERT INTO `app_auth_role_perms` VALUES (1845, 1, 43);
INSERT INTO `app_auth_role_perms` VALUES (1847, 1, 44);
INSERT INTO `app_auth_role_perms` VALUES (1849, 1, 45);
INSERT INTO `app_auth_role_perms` VALUES (1852, 1, 46);
INSERT INTO `app_auth_role_perms` VALUES (1853, 1, 47);
INSERT INTO `app_auth_role_perms` VALUES (1854, 1, 48);
INSERT INTO `app_auth_role_perms` VALUES (1855, 1, 49);
INSERT INTO `app_auth_role_perms` VALUES (1856, 1, 50);
INSERT INTO `app_auth_role_perms` VALUES (1857, 1, 51);
INSERT INTO `app_auth_role_perms` VALUES (1858, 1, 53);
INSERT INTO `app_auth_role_perms` VALUES (1859, 1, 54);
INSERT INTO `app_auth_role_perms` VALUES (1860, 1, 55);
INSERT INTO `app_auth_role_perms` VALUES (1861, 1, 56);
INSERT INTO `app_auth_role_perms` VALUES (1862, 1, 57);
INSERT INTO `app_auth_role_perms` VALUES (1863, 1, 58);
INSERT INTO `app_auth_role_perms` VALUES (1864, 1, 59);
INSERT INTO `app_auth_role_perms` VALUES (1865, 1, 60);
INSERT INTO `app_auth_role_perms` VALUES (1866, 1, 61);
INSERT INTO `app_auth_role_perms` VALUES (1867, 1, 62);
INSERT INTO `app_auth_role_perms` VALUES (1870, 1, 63);
INSERT INTO `app_auth_role_perms` VALUES (1871, 1, 64);
INSERT INTO `app_auth_role_perms` VALUES (1872, 1, 65);
INSERT INTO `app_auth_role_perms` VALUES (1873, 1, 66);
INSERT INTO `app_auth_role_perms` VALUES (1874, 1, 67);
INSERT INTO `app_auth_role_perms` VALUES (1875, 1, 68);
INSERT INTO `app_auth_role_perms` VALUES (1876, 1, 69);
INSERT INTO `app_auth_role_perms` VALUES (1877, 1, 70);
INSERT INTO `app_auth_role_perms` VALUES (1829, 1, 71);
INSERT INTO `app_auth_role_perms` VALUES (1834, 1, 72);
INSERT INTO `app_auth_role_perms` VALUES (1797, 1, 73);
INSERT INTO `app_auth_role_perms` VALUES (1798, 1, 74);
INSERT INTO `app_auth_role_perms` VALUES (1799, 1, 75);
INSERT INTO `app_auth_role_perms` VALUES (1800, 1, 76);
INSERT INTO `app_auth_role_perms` VALUES (1801, 1, 77);
INSERT INTO `app_auth_role_perms` VALUES (1830, 1, 78);
INSERT INTO `app_auth_role_perms` VALUES (1802, 1, 79);
INSERT INTO `app_auth_role_perms` VALUES (1868, 1, 80);
INSERT INTO `app_auth_role_perms` VALUES (1869, 1, 81);
INSERT INTO `app_auth_role_perms` VALUES (1840, 1, 82);
INSERT INTO `app_auth_role_perms` VALUES (1841, 1, 83);
INSERT INTO `app_auth_role_perms` VALUES (1842, 1, 84);
INSERT INTO `app_auth_role_perms` VALUES (1843, 1, 85);
INSERT INTO `app_auth_role_perms` VALUES (1846, 1, 86);
INSERT INTO `app_auth_role_perms` VALUES (1848, 1, 87);
INSERT INTO `app_auth_role_perms` VALUES (1831, 1, 88);
INSERT INTO `app_auth_role_perms` VALUES (1832, 1, 89);
INSERT INTO `app_auth_role_perms` VALUES (1850, 1, 91);
INSERT INTO `app_auth_role_perms` VALUES (1851, 1, 92);

-- ----------------------------
-- Table structure for app_auth_role_project
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_role_project`;
CREATE TABLE `app_auth_role_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `gitcode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_role_project_role_id_project_id_09f71818_uniq`(`role_id`, `gitcode_id`) USING BTREE,
  INDEX `app_auth_role_project_gitcode_id_d1f3c5bb_fk_app_code_gitcode_id`(`gitcode_id`) USING BTREE,
  CONSTRAINT `app_auth_role_project_gitcode_id_d1f3c5bb_fk_app_code_gitcode_id` FOREIGN KEY (`gitcode_id`) REFERENCES `app_code_gitcode` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_role_project_role_id_8f081530_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_role_project
-- ----------------------------
INSERT INTO `app_auth_role_project` VALUES (13, 1, 2);

-- ----------------------------
-- Table structure for app_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_user`;
CREATE TABLE `app_auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ready_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passwd` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creat_time` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_user
-- ----------------------------
INSERT INTO `app_auth_user` VALUES (1, 'admin', 'admin', 'b\'d4721440af5b9f9f9a9915f5b2358ffb\'', '10086@139.com', '10086', '', '在线', '2018-10-11 06:13:37.757161', '2018-11-28 08:08:40.357052');

-- ----------------------------
-- Table structure for app_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `app_auth_user_role`;
CREATE TABLE `app_auth_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_auth_user_role_user_id_role_id_4407ef40_uniq`(`user_id`, `role_id`) USING BTREE,
  INDEX `app_auth_user_role_role_id_987f89e1_fk_app_auth_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `app_auth_user_role_role_id_987f89e1_fk_app_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `app_auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_auth_user_role_user_id_2363d45d_fk_app_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_auth_user_role
-- ----------------------------
INSERT INTO `app_auth_user_role` VALUES (4, 1, 1);

-- ----------------------------
-- Table structure for app_code_gitcode
-- ----------------------------
DROP TABLE IF EXISTS `app_code_gitcode`;
CREATE TABLE `app_code_gitcode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `git_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `git_msg` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `git_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `git_passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `git_sshkey` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `git_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `git_name`(`git_name`) USING BTREE,
  UNIQUE INDEX `git_url`(`git_url`) USING BTREE,
  INDEX `app_code_gitcode_project_id_24ec459d_fk_app_code_project_id`(`project_id`) USING BTREE,
  CONSTRAINT `app_code_gitcode_project_id_24ec459d_fk_app_code_project_id` FOREIGN KEY (`project_id`) REFERENCES `app_code_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_code_gitcode
-- ----------------------------
INSERT INTO `app_code_gitcode` VALUES (2, 'mtrops_v2', '运维管理平台 第二版', 'https://gitee.com/12x/mtrops_v2.git', 2, 'b\'\'', '', '');

-- ----------------------------
-- Table structure for app_code_project
-- ----------------------------
DROP TABLE IF EXISTS `app_code_project`;
CREATE TABLE `app_code_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_msg` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_name`(`project_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_code_project
-- ----------------------------
INSERT INTO `app_code_project` VALUES (2, '运维平台', '运维管理平台');

-- ----------------------------
-- Table structure for app_code_publist
-- ----------------------------
DROP TABLE IF EXISTS `app_code_publist`;
CREATE TABLE `app_code_publist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publist_dir` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publist_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publist_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gitcode_id` int(11) NOT NULL,
  `host_ip_id` int(11) NOT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_code_publist_gitcode_id_08f6579e_fk_app_code_gitcode_id`(`gitcode_id`) USING BTREE,
  INDEX `app_code_publist_host_ip_id_55ba2063_fk_app_asset_host_id`(`host_ip_id`) USING BTREE,
  CONSTRAINT `app_code_publist_gitcode_id_08f6579e_fk_app_code_gitcode_id` FOREIGN KEY (`gitcode_id`) REFERENCES `app_code_gitcode` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app_code_publist_host_ip_id_55ba2063_fk_app_asset_host_id` FOREIGN KEY (`host_ip_id`) REFERENCES `app_asset_host` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_code_publistrecord
-- ----------------------------
DROP TABLE IF EXISTS `app_code_publistrecord`;
CREATE TABLE `app_code_publistrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publist_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publist_id` int(11) NOT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_code_publistreco_publist_id_3e2d949d_fk_app_code_`(`publist_id`) USING BTREE,
  CONSTRAINT `app_code_publistreco_publist_id_3e2d949d_fk_app_code_` FOREIGN KEY (`publist_id`) REFERENCES `app_code_publist` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_code_wchartlog
-- ----------------------------
DROP TABLE IF EXISTS `app_code_wchartlog`;
CREATE TABLE `app_code_wchartlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `up_connect` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `up_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_log_opslog
-- ----------------------------
DROP TABLE IF EXISTS `app_log_opslog`;
CREATE TABLE `app_log_opslog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hostname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `audit_log` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_log_taskrecord
-- ----------------------------
DROP TABLE IF EXISTS `app_log_taskrecord`;
CREATE TABLE `app_log_taskrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `task_result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `task_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_log_taskrecord_task_user_id_db7792d0_fk_app_auth_user_id`(`task_user_id`) USING BTREE,
  CONSTRAINT `app_log_taskrecord_task_user_id_db7792d0_fk_app_auth_user_id` FOREIGN KEY (`task_user_id`) REFERENCES `app_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_log_taskrecord
-- ----------------------------
INSERT INTO `app_log_taskrecord` VALUES (43, '同步服务器信息', 'e5925d0e-e4c8-4e19-b19e-f77a2084b013', 'SUCCESS', '2018-10-30 09:17:04.716267', '{\n \"sys_info\": {\n  \"39.108.15.95\": {\n   \"localhost\": \"iZwz94rq1zzte7clamirpkZ\",\n   \"kernel\": \"Linux\",\n   \"kernelrelease\": \"2.6.32-696.3.2.el6.x86_64\",\n   \"cpu_model\": \"Intel(R) Xeon(R) Platinum 8163 CPU @ 2.50GHz\",\n   \"num_cpus\": 8,\n   \"productname\": \"Alibaba Cloud ECS\",\n   \"os\": \"CentOS\",\n   \"osrelease\": \"6.9\",\n   \"mem_total\": 16080,\n   \"interface\": [\n    {\n     \"hwaddr\": \"00:00:00:00:00:00\",\n     \"ipaddr\": \"127.0.0.1\",\n     \"label\": \"lo\",\n     \"netmask\": \"255.0.0.0\"\n    },\n    {\n     \"hwaddr\": \"00:16:3e:06:25:c7\",\n     \"ipaddr\": \"172.18.218.12\",\n     \"label\": \"eth0\",\n     \"netmask\": \"255.255.240.0\"\n    }\n   ],\n   \"disk_info\": [\n    \"Disk /dev/vda: 42.9 GB\",\n    \"Disk /dev/vdb: 21.5 GB\"\n   ],\n   \"SwapTotal\": 0.0\n  }\n },\n \"sofeware_info\": {\n  \"39.108.15.95\": {\n   \"sshd\": {\n    \"port\": [\n     \"25840\"\n    ],\n    \"pid\": \"27807\",\n    \"name\": \"sshd\",\n    \"version\": \"Unkonwn\"\n   },\n   \"nginx\": {\n    \"port\": [\n     \"80\"\n    ],\n    \"pid\": \"15867\",\n    \"name\": \"nginx\",\n    \"version\": \"1.5\"\n   },\n   \"java\": {\n    \"port\": [\n     \"8081\"\n    ],\n    \"pid\": \"11398\",\n    \"name\": \"java\",\n    \"version\": \"1.8\"\n   },\n   \"php\": {\n    \"version\": \"5.4\",\n    \"name\": \"php\",\n    \"port\": \"None\"\n   }\n  }\n }\n}', 1);

-- ----------------------------
-- Table structure for app_log_userlog
-- ----------------------------
DROP TABLE IF EXISTS `app_log_userlog`;
CREATE TABLE `app_log_userlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ready_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1073 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_log_userlog
-- ----------------------------
INSERT INTO `app_log_userlog` VALUES (1001, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:33.498728');
INSERT INTO `app_log_userlog` VALUES (1002, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:35.662852');
INSERT INTO `app_log_userlog` VALUES (1003, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:38.100991');
INSERT INTO `app_log_userlog` VALUES (1004, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:42.319232');
INSERT INTO `app_log_userlog` VALUES (1005, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:45.984442');
INSERT INTO `app_log_userlog` VALUES (1006, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:46.764487');
INSERT INTO `app_log_userlog` VALUES (1007, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:47.551532');
INSERT INTO `app_log_userlog` VALUES (1008, 'admin', '删除代码', '小贰', '成功', '2018-11-28 07:45:48.101563');
INSERT INTO `app_log_userlog` VALUES (1009, 'admin', '查询代码', '小贰', '成功', '2018-11-28 07:45:49.031616');
INSERT INTO `app_log_userlog` VALUES (1010, 'admin', '修改代码', '小贰', '成功', '2018-11-28 07:45:53.099849');
INSERT INTO `app_log_userlog` VALUES (1011, 'admin', '修改代码', '小贰', '成功', '2018-11-28 07:45:56.869064');
INSERT INTO `app_log_userlog` VALUES (1012, 'admin', '查询代码', '小贰', '成功', '2018-11-28 07:45:57.836120');
INSERT INTO `app_log_userlog` VALUES (1013, 'admin', '查询代码', '小贰', '成功', '2018-11-28 07:46:03.699455');
INSERT INTO `app_log_userlog` VALUES (1014, 'admin', '查询发布', '小贰', '成功', '2018-11-28 07:46:04.801518');
INSERT INTO `app_log_userlog` VALUES (1015, 'admin', '代码发布过滤', '小贰', '成功', '2018-11-28 07:46:07.274660');
INSERT INTO `app_log_userlog` VALUES (1016, 'admin', '查询发布', '小贰', '成功', '2018-11-28 07:46:09.288775');
INSERT INTO `app_log_userlog` VALUES (1017, 'admin', '查询发布记录', '小贰', '成功', '2018-11-28 07:46:10.418839');
INSERT INTO `app_log_userlog` VALUES (1018, 'admin', '查询环境', '小贰', '成功', '2018-11-28 07:46:21.101450');
INSERT INTO `app_log_userlog` VALUES (1019, 'admin', '访问批量管理', '小贰', '成功', '2018-11-28 07:46:23.225572');
INSERT INTO `app_log_userlog` VALUES (1020, 'admin', '访问文件管理', '小贰', '成功', '2018-11-28 07:46:25.891724');
INSERT INTO `app_log_userlog` VALUES (1021, 'admin', '查看操作日志', '小贰', '成功', '2018-11-28 07:46:31.728058');
INSERT INTO `app_log_userlog` VALUES (1022, 'admin', '查看用户日志', '小贰', '成功', '2018-11-28 07:46:33.039133');
INSERT INTO `app_log_userlog` VALUES (1023, 'admin', '查看任务', '小贰', '成功', '2018-11-28 07:46:35.496274');
INSERT INTO `app_log_userlog` VALUES (1024, 'admin', '查看角色', '小贰', '成功', '2018-11-28 07:46:37.948414');
INSERT INTO `app_log_userlog` VALUES (1025, 'admin', '删除角色', '小贰', '成功', '2018-11-28 07:46:42.913698');
INSERT INTO `app_log_userlog` VALUES (1026, 'admin', '查看角色', '小贰', '成功', '2018-11-28 07:46:44.547792');
INSERT INTO `app_log_userlog` VALUES (1027, 'admin', '查询用户', '小贰', '成功', '2018-11-28 07:46:46.367896');
INSERT INTO `app_log_userlog` VALUES (1028, 'admin', '删除用户', '小贰', '成功', '2018-11-28 07:46:52.622253');
INSERT INTO `app_log_userlog` VALUES (1029, 'admin', '查询用户', '小贰', '成功', '2018-11-28 07:46:53.091280');
INSERT INTO `app_log_userlog` VALUES (1030, 'admin', '修改用户', '小贰', '成功', '2018-11-28 07:46:54.613367');
INSERT INTO `app_log_userlog` VALUES (1031, 'admin', '修改用户', '小贰', '成功', '2018-11-28 07:47:07.498104');
INSERT INTO `app_log_userlog` VALUES (1032, 'admin', '查询用户', '小贰', '成功', '2018-11-28 07:47:08.299150');
INSERT INTO `app_log_userlog` VALUES (1033, 'admin', '添加远程管理用户', '小贰', '成功', '2018-11-28 07:47:12.454388');
INSERT INTO `app_log_userlog` VALUES (1034, 'admin', '添加远程管理用户', '小贰', '成功', '2018-11-28 07:47:16.637627');
INSERT INTO `app_log_userlog` VALUES (1035, 'admin', '查询用户', '小贰', '成功', '2018-11-28 07:47:17.661686');
INSERT INTO `app_log_userlog` VALUES (1036, 'admin', '添加远程管理用户', '小贰', '成功', '2018-11-28 07:47:18.714746');
INSERT INTO `app_log_userlog` VALUES (1037, 'admin', '查询用户', '小贰', '成功', '2018-11-28 07:47:21.889927');
INSERT INTO `app_log_userlog` VALUES (1038, 'admin', '查询菜单', '小贰', '成功', '2018-11-28 07:47:22.873984');
INSERT INTO `app_log_userlog` VALUES (1039, 'admin', '查询权限', '小贰', '成功', '2018-11-28 07:47:24.762092');
INSERT INTO `app_log_userlog` VALUES (1040, 'admin', '查询权限', '小贰', '成功', '2018-11-28 08:02:29.170821');
INSERT INTO `app_log_userlog` VALUES (1041, 'admin', '登录', 'admin', '成功', '2018-11-28 08:02:34.416121');
INSERT INTO `app_log_userlog` VALUES (1042, 'admin', '查看角色', 'admin', '成功', '2018-11-28 08:02:43.895663');
INSERT INTO `app_log_userlog` VALUES (1043, 'admin', '查询用户', 'admin', '成功', '2018-11-28 08:02:44.877719');
INSERT INTO `app_log_userlog` VALUES (1044, 'admin', '查询菜单', 'admin', '成功', '2018-11-28 08:02:45.772770');
INSERT INTO `app_log_userlog` VALUES (1045, 'admin', '查询权限', 'admin', '成功', '2018-11-28 08:02:47.028842');
INSERT INTO `app_log_userlog` VALUES (1046, 'admin', '查询权限', 'admin', '成功', '2018-11-28 08:03:22.013843');
INSERT INTO `app_log_userlog` VALUES (1047, 'admin', '查询服务器', 'admin', '成功', '2018-11-28 08:03:24.842005');
INSERT INTO `app_log_userlog` VALUES (1048, 'admin', '查询网络设备', 'admin', '成功', '2018-11-28 08:03:25.614049');
INSERT INTO `app_log_userlog` VALUES (1049, 'admin', '查询机房', 'admin', '成功', '2018-11-28 08:03:26.373093');
INSERT INTO `app_log_userlog` VALUES (1050, 'admin', '查询分组', 'admin', '成功', '2018-11-28 08:03:27.161138');
INSERT INTO `app_log_userlog` VALUES (1051, 'admin', '查询厂商', 'admin', '成功', '2018-11-28 08:03:27.957183');
INSERT INTO `app_log_userlog` VALUES (1052, 'admin', '查询项目', 'admin', '成功', '2018-11-28 08:03:29.960298');
INSERT INTO `app_log_userlog` VALUES (1053, 'admin', '查询代码', 'admin', '成功', '2018-11-28 08:03:30.838348');
INSERT INTO `app_log_userlog` VALUES (1054, 'admin', '查询发布', 'admin', '成功', '2018-11-28 08:03:31.557389');
INSERT INTO `app_log_userlog` VALUES (1055, 'admin', '查询发布记录', 'admin', '成功', '2018-11-28 08:03:32.396437');
INSERT INTO `app_log_userlog` VALUES (1056, 'admin', '查询环境', 'admin', '成功', '2018-11-28 08:03:33.958527');
INSERT INTO `app_log_userlog` VALUES (1057, 'admin', '访问批量管理', 'admin', '成功', '2018-11-28 08:03:34.779573');
INSERT INTO `app_log_userlog` VALUES (1058, 'admin', '访问文件管理', 'admin', '成功', '2018-11-28 08:03:35.539617');
INSERT INTO `app_log_userlog` VALUES (1059, 'admin', '访问phpmyadmin', 'admin', '成功', '2018-11-28 08:03:37.360721');
INSERT INTO `app_log_userlog` VALUES (1060, 'admin', '查看用户日志', 'admin', '成功', '2018-11-28 08:03:39.406838');
INSERT INTO `app_log_userlog` VALUES (1061, 'admin', '查看操作日志', 'admin', '成功', '2018-11-28 08:03:40.197883');
INSERT INTO `app_log_userlog` VALUES (1062, 'admin', '查看任务', 'admin', '成功', '2018-11-28 08:03:40.920925');
INSERT INTO `app_log_userlog` VALUES (1063, 'admin', '查看角色', 'admin', '成功', '2018-11-28 08:03:42.998044');
INSERT INTO `app_log_userlog` VALUES (1064, 'admin', '查询用户', 'admin', '成功', '2018-11-28 08:03:43.759087');
INSERT INTO `app_log_userlog` VALUES (1065, 'admin', '查询菜单', 'admin', '成功', '2018-11-28 08:03:44.605135');
INSERT INTO `app_log_userlog` VALUES (1066, 'admin', '查询权限', 'admin', '成功', '2018-11-28 08:03:45.461184');
INSERT INTO `app_log_userlog` VALUES (1067, 'admin', '登录', 'admin', '成功', '2018-11-28 08:03:52.835606');
INSERT INTO `app_log_userlog` VALUES (1068, 'admin', '登录', 'admin', '成功', '2018-11-28 08:04:55.218174');
INSERT INTO `app_log_userlog` VALUES (1069, 'admin', '查看角色', 'admin', '成功', '2018-11-28 08:05:01.979561');
INSERT INTO `app_log_userlog` VALUES (1070, 'admin', '查询用户', 'admin', '成功', '2018-11-28 08:05:03.205631');
INSERT INTO `app_log_userlog` VALUES (1071, 'admin', '查询菜单', 'admin', '成功', '2018-11-28 08:05:04.309694');
INSERT INTO `app_log_userlog` VALUES (1072, 'admin', '登录', 'admin', '成功', '2018-11-28 08:08:40.381053');

-- ----------------------------
-- Table structure for app_sys_envsofeware
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_envsofeware`;
CREATE TABLE `app_sys_envsofeware`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sofeware_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sofeware_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `install_script` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_sys_envsofeware
-- ----------------------------
INSERT INTO `app_sys_envsofeware` VALUES (1, 'php', '7.2.4', 'echo \"1232\" >/home/test.txt');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add user', 3, 'add_user');
INSERT INTO `auth_permission` VALUES (10, 'Can change user', 3, 'change_user');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user', 3, 'delete_user');
INSERT INTO `auth_permission` VALUES (12, 'Can view user', 3, 'view_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add menus', 6, 'add_menus');
INSERT INTO `auth_permission` VALUES (22, 'Can change menus', 6, 'change_menus');
INSERT INTO `auth_permission` VALUES (23, 'Can delete menus', 6, 'delete_menus');
INSERT INTO `auth_permission` VALUES (24, 'Can view menus', 6, 'view_menus');
INSERT INTO `auth_permission` VALUES (25, 'Can add perms', 7, 'add_perms');
INSERT INTO `auth_permission` VALUES (26, 'Can change perms', 7, 'change_perms');
INSERT INTO `auth_permission` VALUES (27, 'Can delete perms', 7, 'delete_perms');
INSERT INTO `auth_permission` VALUES (28, 'Can view perms', 7, 'view_perms');
INSERT INTO `auth_permission` VALUES (29, 'Can add role', 8, 'add_role');
INSERT INTO `auth_permission` VALUES (30, 'Can change role', 8, 'change_role');
INSERT INTO `auth_permission` VALUES (31, 'Can delete role', 8, 'delete_role');
INSERT INTO `auth_permission` VALUES (32, 'Can view role', 8, 'view_role');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add host', 10, 'add_host');
INSERT INTO `auth_permission` VALUES (38, 'Can change host', 10, 'change_host');
INSERT INTO `auth_permission` VALUES (39, 'Can delete host', 10, 'delete_host');
INSERT INTO `auth_permission` VALUES (40, 'Can view host', 10, 'view_host');
INSERT INTO `auth_permission` VALUES (41, 'Can add host group', 11, 'add_hostgroup');
INSERT INTO `auth_permission` VALUES (42, 'Can change host group', 11, 'change_hostgroup');
INSERT INTO `auth_permission` VALUES (43, 'Can delete host group', 11, 'delete_hostgroup');
INSERT INTO `auth_permission` VALUES (44, 'Can view host group', 11, 'view_hostgroup');
INSERT INTO `auth_permission` VALUES (45, 'Can add idc', 12, 'add_idc');
INSERT INTO `auth_permission` VALUES (46, 'Can change idc', 12, 'change_idc');
INSERT INTO `auth_permission` VALUES (47, 'Can delete idc', 12, 'delete_idc');
INSERT INTO `auth_permission` VALUES (48, 'Can view idc', 12, 'view_idc');
INSERT INTO `auth_permission` VALUES (49, 'Can add netwk', 13, 'add_netwk');
INSERT INTO `auth_permission` VALUES (50, 'Can change netwk', 13, 'change_netwk');
INSERT INTO `auth_permission` VALUES (51, 'Can delete netwk', 13, 'delete_netwk');
INSERT INTO `auth_permission` VALUES (52, 'Can view netwk', 13, 'view_netwk');
INSERT INTO `auth_permission` VALUES (53, 'Can add supplier', 14, 'add_supplier');
INSERT INTO `auth_permission` VALUES (54, 'Can change supplier', 14, 'change_supplier');
INSERT INTO `auth_permission` VALUES (55, 'Can delete supplier', 14, 'delete_supplier');
INSERT INTO `auth_permission` VALUES (56, 'Can view supplier', 14, 'view_supplier');
INSERT INTO `auth_permission` VALUES (57, 'Can add wchart req', 15, 'add_wchartreq');
INSERT INTO `auth_permission` VALUES (58, 'Can change wchart req', 15, 'change_wchartreq');
INSERT INTO `auth_permission` VALUES (59, 'Can delete wchart req', 15, 'delete_wchartreq');
INSERT INTO `auth_permission` VALUES (60, 'Can view wchart req', 15, 'view_wchartreq');
INSERT INTO `auth_permission` VALUES (61, 'Can add publist record', 16, 'add_publistrecord');
INSERT INTO `auth_permission` VALUES (62, 'Can change publist record', 16, 'change_publistrecord');
INSERT INTO `auth_permission` VALUES (63, 'Can delete publist record', 16, 'delete_publistrecord');
INSERT INTO `auth_permission` VALUES (64, 'Can view publist record', 16, 'view_publistrecord');
INSERT INTO `auth_permission` VALUES (65, 'Can add git mg', 17, 'add_gitmg');
INSERT INTO `auth_permission` VALUES (66, 'Can change git mg', 17, 'change_gitmg');
INSERT INTO `auth_permission` VALUES (67, 'Can delete git mg', 17, 'delete_gitmg');
INSERT INTO `auth_permission` VALUES (68, 'Can view git mg', 17, 'view_gitmg');
INSERT INTO `auth_permission` VALUES (69, 'Can add publist', 18, 'add_publist');
INSERT INTO `auth_permission` VALUES (70, 'Can change publist', 18, 'change_publist');
INSERT INTO `auth_permission` VALUES (71, 'Can delete publist', 18, 'delete_publist');
INSERT INTO `auth_permission` VALUES (72, 'Can view publist', 18, 'view_publist');
INSERT INTO `auth_permission` VALUES (73, 'Can add project', 19, 'add_project');
INSERT INTO `auth_permission` VALUES (74, 'Can change project', 19, 'change_project');
INSERT INTO `auth_permission` VALUES (75, 'Can delete project', 19, 'delete_project');
INSERT INTO `auth_permission` VALUES (76, 'Can view project', 19, 'view_project');
INSERT INTO `auth_permission` VALUES (77, 'Can add git code', 20, 'add_gitcode');
INSERT INTO `auth_permission` VALUES (78, 'Can change git code', 20, 'change_gitcode');
INSERT INTO `auth_permission` VALUES (79, 'Can delete git code', 20, 'delete_gitcode');
INSERT INTO `auth_permission` VALUES (80, 'Can view git code', 20, 'view_gitcode');
INSERT INTO `auth_permission` VALUES (81, 'Can add wchartlog', 15, 'add_wchartlog');
INSERT INTO `auth_permission` VALUES (82, 'Can change wchartlog', 15, 'change_wchartlog');
INSERT INTO `auth_permission` VALUES (83, 'Can delete wchartlog', 15, 'delete_wchartlog');
INSERT INTO `auth_permission` VALUES (84, 'Can view wchartlog', 15, 'view_wchartlog');
INSERT INTO `auth_permission` VALUES (85, 'Can add env install', 21, 'add_envinstall');
INSERT INTO `auth_permission` VALUES (86, 'Can change env install', 21, 'change_envinstall');
INSERT INTO `auth_permission` VALUES (87, 'Can delete env install', 21, 'delete_envinstall');
INSERT INTO `auth_permission` VALUES (88, 'Can view env install', 21, 'view_envinstall');
INSERT INTO `auth_permission` VALUES (89, 'Can add env sofeware', 21, 'add_envsofeware');
INSERT INTO `auth_permission` VALUES (90, 'Can change env sofeware', 21, 'change_envsofeware');
INSERT INTO `auth_permission` VALUES (91, 'Can delete env sofeware', 21, 'delete_envsofeware');
INSERT INTO `auth_permission` VALUES (92, 'Can view env sofeware', 21, 'view_envsofeware');
INSERT INTO `auth_permission` VALUES (93, 'Can add ops log', 22, 'add_opslog');
INSERT INTO `auth_permission` VALUES (94, 'Can change ops log', 22, 'change_opslog');
INSERT INTO `auth_permission` VALUES (95, 'Can delete ops log', 22, 'delete_opslog');
INSERT INTO `auth_permission` VALUES (96, 'Can view ops log', 22, 'view_opslog');
INSERT INTO `auth_permission` VALUES (97, 'Can add user log', 23, 'add_userlog');
INSERT INTO `auth_permission` VALUES (98, 'Can change user log', 23, 'change_userlog');
INSERT INTO `auth_permission` VALUES (99, 'Can delete user log', 23, 'delete_userlog');
INSERT INTO `auth_permission` VALUES (100, 'Can view user log', 23, 'view_userlog');
INSERT INTO `auth_permission` VALUES (101, 'Can add host detail', 24, 'add_hostdetail');
INSERT INTO `auth_permission` VALUES (102, 'Can change host detail', 24, 'change_hostdetail');
INSERT INTO `auth_permission` VALUES (103, 'Can delete host detail', 24, 'delete_hostdetail');
INSERT INTO `auth_permission` VALUES (104, 'Can view host detail', 24, 'view_hostdetail');
INSERT INTO `auth_permission` VALUES (105, 'Can add software', 25, 'add_software');
INSERT INTO `auth_permission` VALUES (106, 'Can change software', 25, 'change_software');
INSERT INTO `auth_permission` VALUES (107, 'Can delete software', 25, 'delete_software');
INSERT INTO `auth_permission` VALUES (108, 'Can view software', 25, 'view_software');
INSERT INTO `auth_permission` VALUES (109, 'Can add remote user', 26, 'add_remoteuser');
INSERT INTO `auth_permission` VALUES (110, 'Can change remote user', 26, 'change_remoteuser');
INSERT INTO `auth_permission` VALUES (111, 'Can delete remote user', 26, 'delete_remoteuser');
INSERT INTO `auth_permission` VALUES (112, 'Can view remote user', 26, 'view_remoteuser');
INSERT INTO `auth_permission` VALUES (113, 'Can add crontab', 27, 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES (114, 'Can change crontab', 27, 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES (115, 'Can delete crontab', 27, 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES (116, 'Can view crontab', 27, 'view_crontabschedule');
INSERT INTO `auth_permission` VALUES (117, 'Can add periodic task', 28, 'add_periodictask');
INSERT INTO `auth_permission` VALUES (118, 'Can change periodic task', 28, 'change_periodictask');
INSERT INTO `auth_permission` VALUES (119, 'Can delete periodic task', 28, 'delete_periodictask');
INSERT INTO `auth_permission` VALUES (120, 'Can view periodic task', 28, 'view_periodictask');
INSERT INTO `auth_permission` VALUES (121, 'Can add interval', 29, 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES (122, 'Can change interval', 29, 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES (123, 'Can delete interval', 29, 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES (124, 'Can view interval', 29, 'view_intervalschedule');
INSERT INTO `auth_permission` VALUES (125, 'Can add periodic tasks', 30, 'add_periodictasks');
INSERT INTO `auth_permission` VALUES (126, 'Can change periodic tasks', 30, 'change_periodictasks');
INSERT INTO `auth_permission` VALUES (127, 'Can delete periodic tasks', 30, 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES (128, 'Can view periodic tasks', 30, 'view_periodictasks');
INSERT INTO `auth_permission` VALUES (129, 'Can add task state', 31, 'add_taskmeta');
INSERT INTO `auth_permission` VALUES (130, 'Can change task state', 31, 'change_taskmeta');
INSERT INTO `auth_permission` VALUES (131, 'Can delete task state', 31, 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES (132, 'Can view task state', 31, 'view_taskmeta');
INSERT INTO `auth_permission` VALUES (133, 'Can add saved group result', 32, 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES (134, 'Can change saved group result', 32, 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES (135, 'Can delete saved group result', 32, 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES (136, 'Can view saved group result', 32, 'view_tasksetmeta');
INSERT INTO `auth_permission` VALUES (137, 'Can add task', 33, 'add_taskstate');
INSERT INTO `auth_permission` VALUES (138, 'Can change task', 33, 'change_taskstate');
INSERT INTO `auth_permission` VALUES (139, 'Can delete task', 33, 'delete_taskstate');
INSERT INTO `auth_permission` VALUES (140, 'Can view task', 33, 'view_taskstate');
INSERT INTO `auth_permission` VALUES (141, 'Can add worker', 34, 'add_workerstate');
INSERT INTO `auth_permission` VALUES (142, 'Can change worker', 34, 'change_workerstate');
INSERT INTO `auth_permission` VALUES (143, 'Can delete worker', 34, 'delete_workerstate');
INSERT INTO `auth_permission` VALUES (144, 'Can view worker', 34, 'view_workerstate');
INSERT INTO `auth_permission` VALUES (145, 'Can add task record', 35, 'add_taskrecord');
INSERT INTO `auth_permission` VALUES (146, 'Can change task record', 35, 'change_taskrecord');
INSERT INTO `auth_permission` VALUES (147, 'Can delete task record', 35, 'delete_taskrecord');
INSERT INTO `auth_permission` VALUES (148, 'Can view task record', 35, 'view_taskrecord');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for celery_taskmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `celery_taskmeta_hidden_23fd02dc`(`hidden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for celery_tasksetmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `taskset_id`(`taskset_id`) USING BTREE,
  INDEX `celery_tasksetmeta_hidden_593cfc24`(`hidden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (10, 'app_asset', 'host');
INSERT INTO `django_content_type` VALUES (24, 'app_asset', 'hostdetail');
INSERT INTO `django_content_type` VALUES (11, 'app_asset', 'hostgroup');
INSERT INTO `django_content_type` VALUES (12, 'app_asset', 'idc');
INSERT INTO `django_content_type` VALUES (13, 'app_asset', 'netwk');
INSERT INTO `django_content_type` VALUES (25, 'app_asset', 'software');
INSERT INTO `django_content_type` VALUES (14, 'app_asset', 'supplier');
INSERT INTO `django_content_type` VALUES (6, 'app_auth', 'menus');
INSERT INTO `django_content_type` VALUES (7, 'app_auth', 'perms');
INSERT INTO `django_content_type` VALUES (26, 'app_auth', 'remoteuser');
INSERT INTO `django_content_type` VALUES (8, 'app_auth', 'role');
INSERT INTO `django_content_type` VALUES (9, 'app_auth', 'user');
INSERT INTO `django_content_type` VALUES (20, 'app_code', 'gitcode');
INSERT INTO `django_content_type` VALUES (17, 'app_code', 'gitmg');
INSERT INTO `django_content_type` VALUES (19, 'app_code', 'project');
INSERT INTO `django_content_type` VALUES (18, 'app_code', 'publist');
INSERT INTO `django_content_type` VALUES (16, 'app_code', 'publistrecord');
INSERT INTO `django_content_type` VALUES (15, 'app_code', 'wchartlog');
INSERT INTO `django_content_type` VALUES (22, 'app_log', 'opslog');
INSERT INTO `django_content_type` VALUES (35, 'app_log', 'taskrecord');
INSERT INTO `django_content_type` VALUES (23, 'app_log', 'userlog');
INSERT INTO `django_content_type` VALUES (21, 'app_sys', 'envsofeware');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (27, 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES (29, 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES (28, 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES (30, 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES (31, 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES (32, 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES (33, 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES (34, 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'app_asset', '0001_initial', '2018-10-09 08:26:24.472633');
INSERT INTO `django_migrations` VALUES (2, 'app_auth', '0001_initial', '2018-10-09 08:26:31.314025');
INSERT INTO `django_migrations` VALUES (3, 'app_auth', '0002_auto_20181009_0901', '2018-10-09 08:26:32.724105');
INSERT INTO `django_migrations` VALUES (4, 'contenttypes', '0001_initial', '2018-10-09 08:26:33.150130');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-10-09 08:26:34.106184');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0001_initial', '2018-10-09 08:26:41.095584');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-10-09 08:26:41.856628');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-10-09 08:26:42.540667');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-10-09 08:26:42.585669');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-10-09 08:26:42.951690');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-10-09 08:26:42.984692');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-10-09 08:26:43.029695');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-10-09 08:26:43.651730');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-10-09 08:26:44.296767');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-10-09 08:26:44.820797');
INSERT INTO `django_migrations` VALUES (16, 'app_code', '0001_initial', '2018-10-10 01:58:55.424677');
INSERT INTO `django_migrations` VALUES (17, 'app_code', '0002_auto_20181010_1036', '2018-10-10 02:36:17.692448');
INSERT INTO `django_migrations` VALUES (18, 'app_code', '0003_auto_20181010_1433', '2018-10-10 06:33:10.734388');
INSERT INTO `django_migrations` VALUES (19, 'app_code', '0004_auto_20181010_1434', '2018-10-10 06:34:06.329568');
INSERT INTO `django_migrations` VALUES (20, 'app_code', '0005_auto_20181010_1435', '2018-10-10 06:35:47.226339');
INSERT INTO `django_migrations` VALUES (21, 'app_code', '0006_auto_20181010_1436', '2018-10-10 06:36:16.408008');
INSERT INTO `django_migrations` VALUES (22, 'app_code', '0007_auto_20181010_1503', '2018-10-10 07:03:51.736687');
INSERT INTO `django_migrations` VALUES (23, 'app_code', '0008_auto_20181010_1608', '2018-10-10 08:08:36.563886');
INSERT INTO `django_migrations` VALUES (24, 'app_code', '0009_auto_20181010_2034', '2018-10-11 00:19:10.389463');
INSERT INTO `django_migrations` VALUES (25, 'app_sys', '0001_initial', '2018-10-11 02:35:05.222167');
INSERT INTO `django_migrations` VALUES (26, 'app_sys', '0002_auto_20181011_1114', '2018-10-11 03:14:55.137863');
INSERT INTO `django_migrations` VALUES (27, 'app_auth', '0003_user_last_login', '2018-10-11 06:57:38.378196');
INSERT INTO `django_migrations` VALUES (28, 'app_log', '0001_initial', '2018-10-11 06:57:39.116239');
INSERT INTO `django_migrations` VALUES (29, 'app_auth', '0004_perms_perms_url', '2018-10-12 00:53:47.356511');
INSERT INTO `django_migrations` VALUES (30, 'app_auth', '0005_auto_20181012_1455', '2018-10-12 06:55:56.476346');
INSERT INTO `django_migrations` VALUES (31, 'app_auth', '0006_auto_20181012_1537', '2018-10-12 07:37:26.091744');
INSERT INTO `django_migrations` VALUES (32, 'app_auth', '0007_auto_20181012_1643', '2018-10-12 08:43:55.769940');
INSERT INTO `django_migrations` VALUES (33, 'app_asset', '0002_hostdetail', '2018-10-15 07:24:35.656774');
INSERT INTO `django_migrations` VALUES (34, 'app_asset', '0003_auto_20181015_1525', '2018-10-15 07:25:15.682063');
INSERT INTO `django_migrations` VALUES (35, 'app_asset', '0004_auto_20181015_1527', '2018-10-15 07:27:38.710244');
INSERT INTO `django_migrations` VALUES (36, 'app_asset', '0005_auto_20181015_1602', '2018-10-15 08:02:21.195356');
INSERT INTO `django_migrations` VALUES (37, 'app_asset', '0006_host_host_status', '2018-10-15 08:38:47.979432');
INSERT INTO `django_migrations` VALUES (38, 'app_asset', '0007_software', '2018-10-15 09:50:03.860999');
INSERT INTO `django_migrations` VALUES (39, 'app_asset', '0008_auto_20181016_1527', '2018-10-16 07:27:11.974410');
INSERT INTO `django_migrations` VALUES (40, 'app_code', '0010_auto_20181018_1124', '2018-10-18 03:24:31.134935');
INSERT INTO `django_migrations` VALUES (41, 'app_auth', '0008_remoteuser', '2018-10-22 01:13:43.115134');
INSERT INTO `django_migrations` VALUES (42, 'app_code', '0010_auto_20181022_0913', '2018-10-22 01:13:43.236141');
INSERT INTO `django_migrations` VALUES (43, 'app_code', '0011_auto_20181024_1048', '2018-10-24 03:05:27.896831');
INSERT INTO `django_migrations` VALUES (44, 'app_auth', '0009_auto_20181024_1134', '2018-10-24 04:00:37.469887');
INSERT INTO `django_migrations` VALUES (45, 'app_auth', '0010_auto_20181024_1138', '2018-10-24 04:02:01.537061');
INSERT INTO `django_migrations` VALUES (46, 'app_log', '0002_auto_20181024_1118', '2018-10-24 04:02:01.548192');
INSERT INTO `django_migrations` VALUES (47, 'app_auth', '0011_auto_20181026_1054', '2018-10-26 04:06:02.431221');
INSERT INTO `django_migrations` VALUES (48, 'app_code', '0012_auto_20181026_1236', '2018-10-26 04:35:56.855941');
INSERT INTO `django_migrations` VALUES (49, 'app_code', '0013_auto_20181026_1239', '2018-10-26 04:44:58.119192');
INSERT INTO `django_migrations` VALUES (50, 'app_code', '0014_auto_20181026_1242', '2018-10-26 04:44:58.311308');
INSERT INTO `django_migrations` VALUES (51, 'app_code', '0015_auto_20181026_1244', '2018-10-26 04:44:58.330343');
INSERT INTO `django_migrations` VALUES (52, 'app_log', '0003_taskrecord', '2018-10-29 07:05:18.948799');
INSERT INTO `django_migrations` VALUES (53, 'djcelery', '0001_initial', '2018-10-29 07:05:25.193156');
INSERT INTO `django_migrations` VALUES (54, 'app_log', '0004_auto_20181029_1511', '2018-10-29 07:11:10.804924');
INSERT INTO `django_migrations` VALUES (55, 'app_log', '0005_taskrecord_task_result', '2018-10-29 07:31:00.854991');
INSERT INTO `django_migrations` VALUES (56, 'app_asset', '0009_auto_20181029_1652', '2018-10-29 08:52:39.959204');
INSERT INTO `django_migrations` VALUES (57, 'app_log', '0006_taskrecord_task_user', '2018-10-30 09:02:12.085211');
INSERT INTO `django_migrations` VALUES (58, 'app_code', '0016_auto_20181127_0951', '2018-11-27 01:51:51.023964');
INSERT INTO `django_migrations` VALUES (59, 'app_code', '0017_auto_20181127_0957', '2018-11-27 02:00:52.503935');
INSERT INTO `django_migrations` VALUES (60, 'app_code', '0018_auto_20181127_0959', '2018-11-27 02:00:53.793009');
INSERT INTO `django_migrations` VALUES (61, 'app_code', '0019_auto_20181127_0959', '2018-11-27 02:00:54.305038');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hour` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_of_week` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_of_month` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month_of_year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kwargs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `queue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exchange` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routing_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expires` datetime(6) NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) NULL DEFAULT NULL,
  `total_run_count` int(10) UNSIGNED NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crontab_id` int(11) NULL DEFAULT NULL,
  `interval_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_`(`crontab_id`) USING BTREE,
  INDEX `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_`(`interval_id`) USING BTREE,
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks`  (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_taskstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kwargs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `eta` datetime(6) NULL DEFAULT NULL,
  `expires` datetime(6) NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `traceback` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `runtime` double NULL DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `djcelery_taskstate_state_53543be4`(`state`) USING BTREE,
  INDEX `djcelery_taskstate_name_8af9eded`(`name`) USING BTREE,
  INDEX `djcelery_taskstate_tstamp_4c3f93a1`(`tstamp`) USING BTREE,
  INDEX `djcelery_taskstate_hidden_c3905e57`(`hidden`) USING BTREE,
  INDEX `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id`(`worker_id`) USING BTREE,
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for djcelery_workerstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_heartbeat` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hostname`(`hostname`) USING BTREE,
  INDEX `djcelery_workerstate_last_heartbeat_4539b544`(`last_heartbeat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
