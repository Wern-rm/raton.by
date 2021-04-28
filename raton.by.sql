/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3309
 Source Schema         : raton.by

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 28/04/2021 14:45:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_accounts
-- ----------------------------
DROP TABLE IF EXISTS `core_accounts`;
CREATE TABLE `core_accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` int NOT NULL DEFAULT 0,
  `last_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NOT NULL,
  `edit_date` datetime(0) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_banned` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_accounts
-- ----------------------------
INSERT INTO `core_accounts` VALUES (1, 'admin@wern.dev', '73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', 1, '127.0.0.1', NULL, '2021-04-20 00:27:31', '2021-04-22 02:50:53', 'Морозов Роман Сергеевич', 0);

-- ----------------------------
-- Table structure for core_banners
-- ----------------------------
DROP TABLE IF EXISTS `core_banners`;
CREATE TABLE `core_banners`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_activated` int NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_banners
-- ----------------------------

-- ----------------------------
-- Table structure for core_clients
-- ----------------------------
DROP TABLE IF EXISTS `core_clients`;
CREATE TABLE `core_clients`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_clients
-- ----------------------------
INSERT INTO `core_clients` VALUES (22, 'ГомельЭнерго', 'uploads/0e8043ea7f0e5288c33f63f77d52abe2.jpg', 2, 1, '2021-04-23 09:32:21');
INSERT INTO `core_clients` VALUES (23, 'МогилевЭнерго', 'uploads/7f771681f995ab9fd51da6ff92323a9b.jpg', 2, 1, '2021-04-23 09:32:21');
INSERT INTO `core_clients` VALUES (24, 'БрестЭнерго', 'uploads/3b66ca8afa69f68c960c513e771426c1.jpg', 2, 1, '2021-04-23 09:50:34');
INSERT INTO `core_clients` VALUES (25, 'ВитебскЭнерго', 'uploads/f537e975b6fa15884e41dbcd506ddd18.jpg', 2, 1, '2021-04-23 09:50:34');
INSERT INTO `core_clients` VALUES (26, 'ГродноЭнерго', 'uploads/4b8f6a6cb6ab6c3303b4ee5dced417e6.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (27, 'БеларусьНефть', 'uploads/67268bac429ef4e63e28d49c5f16be33.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (28, 'Гомсельмаш', 'uploads/cd112dd6417615f282e4e7728b62385c.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (29, 'БелТопГаз', 'uploads/c9c0dacd68c1e1bf8f38ad795a9cf626.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (30, 'Беларуськалий', 'uploads/84ecac06ca01dc3f791649f1da3ea68c.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (31, 'ШнайдерЭлектрик', 'uploads/c4d60899f22fa3d87039712af3125d39.jpg', 1, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (32, 'Белаз', 'uploads/96fe152c722e8dd825e779094be2a069.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (33, 'ГомельТоргМаш', 'uploads/1890aa286b71fc9954f428849e36b7be.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (34, 'БелСельЭлектроСетьСтрой', 'uploads/74560ee144721277c587bb4143cd1e39.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (35, 'БелорусскаяЖелезнаяДорога', 'uploads/80218a028e9bdd982ae41c072de5f5cb.jpg', 2, 1, '2021-04-23 10:12:02');
INSERT INTO `core_clients` VALUES (36, 'ООО Каскад-Технологии и Системы г.Калуга', 'uploads/d9348fa7bc9c1201fe5856674df1aa61.jpg', 1, 1, '2021-04-26 09:31:11');
INSERT INTO `core_clients` VALUES (37, 'Росполь-Электро', 'uploads/e8457246a93946c8702913ff52047c97.jpg', 1, 1, '2021-04-26 09:31:11');
INSERT INTO `core_clients` VALUES (38, 'Брянский ЭТЗ', 'uploads/ed577ef89147a25ce12fe6244025cc7d.jpg', 1, 1, '2021-04-26 09:37:08');
INSERT INTO `core_clients` VALUES (39, 'Стройкомплекс', 'uploads/549b279746162958acc4f098aea01682.jpg', 1, 1, '2021-04-26 09:37:08');
INSERT INTO `core_clients` VALUES (40, 'ТоргМаш Чебоксары', 'uploads/3f87d3492ccfeebdd1fbf04e32ded86b.jpg', 1, 1, '2021-04-26 09:42:50');
INSERT INTO `core_clients` VALUES (41, 'Кий-В', 'uploads/ee17c8078e2ee435d8c01fd06b81b574.jpg', 1, 1, '2021-04-26 09:42:50');
INSERT INTO `core_clients` VALUES (42, 'Арм-Эко', 'uploads/132dfb401f5faea3301a56aacde23bf3.jpg', 1, 1, '2021-04-26 09:42:50');

-- ----------------------------
-- Table structure for core_contacts
-- ----------------------------
DROP TABLE IF EXISTS `core_contacts`;
CREATE TABLE `core_contacts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `departament` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `boss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `displaying_boss` int NOT NULL,
  `displaying_phone` int NOT NULL,
  `displaying_fax` int NOT NULL,
  `displaying_email` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_contacts
-- ----------------------------
INSERT INTO `core_contacts` VALUES (2, 'Приемная', '', '+375 (232) 58-42-72', '+375 (232) 68-35-24', 'raton@inbox.ru', 0, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (3, 'Канцелярия', '', '', '+375 (232) 68-35-24', '', 0, 0, 1, 0, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (4, 'Отдел маркетинга и сбыта', 'Борисенко Кирилл Александрович', '+375 (232) 68-21-04', '+375 (232) 68-25-10', 'raton_om@inbox.ru', 1, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (5, 'Бюро заказов (электротехническая продукция)', '', '+375 (232) 68-21-04 / +375 (232) 68-22-05', '+375 (232) 68-25-10', 'raton_om@inbox.ru', 0, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (6, 'Бюро сбыта (товары народного потребления)', '', '+375 (232) 68-26-11 / +375 (232) 68-25-74', '+375 (232) 68-28-34', 'raton_om@inbox.ru', 0, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (7, 'Ведущий специалист по продажам ТНП (РФ, СНГ, ДЗ)', '', '+375 (232) 68-28-47', '+375 (232) 68-28-34', 'raton_om@inbox.ru', 0, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (8, 'Центральная заводская лаборатория и метрология', 'Ковалева Галина Германовна', '+375 (232) 68-25-39', '', '', 1, 1, 0, 0, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (9, 'Специальное конструкторское бюро', '', '+375 (232) 68-22-53', '', 'skbraton@gmail.com', 0, 1, 0, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (10, 'Отдел снабжения, комплектации и транспорта', 'Даниленко Владимир Александрович', '+375 (232) 68-24-11', '+375 (232) 68-24-11', 'ratonsnab2007@yandex.by', 1, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (11, 'Энергетика', 'Сергачев Антон Михайлович', '+375 (232) 68-35-65', '', '', 1, 1, 0, 0, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (12, 'Отдел технического контроля', '', '+375 (232) 68-25-37', '+375 (232) 68-28-34', 'otk@raton.by', 0, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (13, 'Отдел правовой и кадровой работы', 'Баль Жанна Михайловна', '+375 (232) 68-37-58 / +375 (232) 68-41-55', '+375 (232) 68-35-24', 'jurist@raton.by / raton.kadry@mail.ru', 1, 1, 1, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (14, 'Отдел вычислений и автоматизации', 'Васютин Дмитрий Владимирович', '+375 (232) 68-37-53', '', 'ivc@raton.by', 1, 1, 0, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (15, 'Планово-экономический отдел', 'Пигунова Ирина Ивановна', '+375 (232) 58-42-72', '', '', 1, 1, 0, 0, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (16, 'Технологический отдел', '', '+375 (232) 68-37-05', '', 'raton.ogt1@inbox.ru', 0, 1, 0, 1, '2021-04-20 22:07:43');
INSERT INTO `core_contacts` VALUES (17, 'Бухгалтерия', '', '+375 (232) 68-23-69', '', '', 0, 1, 0, 0, '2021-04-20 22:07:43');

-- ----------------------------
-- Table structure for core_docs
-- ----------------------------
DROP TABLE IF EXISTS `core_docs`;
CREATE TABLE `core_docs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_docs
-- ----------------------------
INSERT INTO `core_docs` VALUES (1, 'Аудиторское заключение по бухгалтерской (финансовой) отчетности за 2018 год', 'uploads/docs/510550d7d287f89a6eccebcf6f071b50.pdf', 2018, 1, '2021-04-26 08:11:54');
INSERT INTO `core_docs` VALUES (2, 'Бухгалтерский баланс,отчет о прибылях и убытках,отчет об изменении собственного капитала,отчет о движении денежных средств за 2018 год', 'uploads/docs/f38295ab09a3c4edd68c4843b92237e2.pdf', 2018, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (3, 'Информация об акционерном обществе и его деятельности по состоянию на 01 января 2019', 'uploads/docs/cf6603abb0bb6ec822d4d1902b386a19.pdf', 2018, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (4, 'Аудиторское заключение по бухгалтерской (финансовой) отчетности за 2019 год', 'uploads/docs/98ca9ab4148caf619cfaf82fae2ae5ec.pdf', 2019, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (5, 'Бухгалтерский баланс,отчет о прибылях и убытках,отчет об изменении собственного капитала,отчет о движении денежных средств за 2019 год', 'uploads/docs/1ce43256916d2d5f36b3c5b0cebaf82e.pdf', 2019, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (6, 'Информация об акционерном обществе и его деятельности по состоянию на 01 января 2020', 'uploads/docs/542efc7fda9386ebe850b595f0abf81b.pdf', 2019, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (7, 'Аудиторское заключение по бухгалтерской (финансовой) отчетности за 2020 год', 'uploads/docs/9ac7cf88c6c4d12db2db3bd4d0d35a67.pdf', 2020, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (8, 'Бухгалтерский баланс, отчет о прибылях и убытках, отчет об изменении собственного капитала, отчет о движении денежных средств за 2020 год', 'uploads/docs/0172192e0704351fc190131dbe3ce6e1.pdf', 2020, 1, '2021-04-26 08:12:26');
INSERT INTO `core_docs` VALUES (9, 'Информация об акционерном обществе и его деятельности по состоянию на 01 января 2021', 'uploads/docs/4b90cc7366ec1fd8f19388619565e786.pdf', 2020, 1, '2021-04-26 08:12:26');

-- ----------------------------
-- Table structure for core_electronic_appeals
-- ----------------------------
DROP TABLE IF EXISTS `core_electronic_appeals`;
CREATE TABLE `core_electronic_appeals`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_electronic_appeals
-- ----------------------------
INSERT INTO `core_electronic_appeals` VALUES (12, '1231', '13131', '123@11231', '13123132', 'user_uploads/144bcfdfcb955e2f7b1568611ce42053.pdf', 0, '2021-04-26 03:22:55', 1);
INSERT INTO `core_electronic_appeals` VALUES (13, 'qweq', 'wqeqe', 'qweq@qweq', 'eqweqeq', 'user_uploads/d8ff344eb7a6be90ed8339840f0d8e92.pdf', 0, '2021-04-26 03:24:40', 1);
INSERT INTO `core_electronic_appeals` VALUES (14, '1231', '3131231', '1@1', '321', 'user_uploads/028b44820a6662186ffd0ef852e3ee09.doc', 0, '2021-04-26 03:26:08', 1);
INSERT INTO `core_electronic_appeals` VALUES (15, '2131', '31231', '3131@131', '123123', 'user_uploads/3059c346011f09b261c5accfed4ee243.doc', 0, '2021-04-26 03:28:22', 1);
INSERT INTO `core_electronic_appeals` VALUES (16, '2q3', 'qweq', 'qwe2@w', 'fsd', 'user_uploads/74d07bd76cbd66dfc902ae18ff5ca020.pdf', 1, '2021-04-26 03:31:41', 1);

-- ----------------------------
-- Table structure for core_files
-- ----------------------------
DROP TABLE IF EXISTS `core_files`;
CREATE TABLE `core_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_files
-- ----------------------------
INSERT INTO `core_files` VALUES (1, 'Изображение завода (История)', 'uploads/files/75cd6a3fbbeb1d1fdafac3dc462cdafa.jpg', '2021-04-26 10:09:34');
INSERT INTO `core_files` VALUES (3, 'Перечень неликвидов (Услуги)', 'uploads/files/cbb13c5e269c5964a4e29a421ff3be58.xlsx', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (4, 'Перечень оборудования (Услуги)', 'uploads/files/640e3de1a9ecaafa9554b4db6123858e.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (5, 'Скачать заявку (Услуги)', 'uploads/files/ffc8674cf0c8d3040757b1f76f119727.doc', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (6, 'Памятка об основных нормах антикоррупционного законодательства (Коррупция)', 'uploads/files/d906828366cbd7c85afb18f4bcdc2658.docx', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (7, 'Формы проявления коррупции (Коррупция)', 'uploads/files/e245f825381a8782de90eeee92a05e5e.docx', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (8, 'Перечень преступлений (Коррпция)', 'uploads/files/1f403abdaea66048be4cdd93f6644b35.docx', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (9, 'План работы комиссии по противодействию коррупции в ОАО \"Ратон\" на 2020 год (Коррупция)', 'uploads/files/7d03b334d2b22a023e406019c8896c3a.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (10, 'План мероприятий по противодействию коррупции в ОАО \"Ратон\" на 2018-2019 гг. (Коррупция)', 'uploads/files/50d2dda564a77b798d890cc283751bf8.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (11, 'План мероприятий по противодействию коррупции в ОАО \"Ратон\" на 2020-2022 гг. (Коррупция)', 'uploads/files/97bfcc9528a1b953a887f36964d4b25f.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (12, 'План мероприятий по противодействию коррупции в ОАО \"Ратон\" на 2020-2022 гг. (с учетом изменений от 28.01.2021, протокол №1) (Коррупция)', 'uploads/files/ae7744104483ac10b217e246b917aa92.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (13, 'План работы комиссии по противодействию коррупции в ОАО \"Ратон\" на 2021 год (Коррупция)', 'uploads/files/29d411437870602eb1651d1b44dbc384.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (14, 'Приказ о создании комиссии по противодействию коррупции в ОАО \"Ратон\" 2019 (Коррупция)', 'uploads/files/a190ac6a37b73e6c3d93fb3bed2b7453.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (15, 'Положение \"О комиссии по противодействию коррупции\" 2019 (Коррупция)', 'uploads/files/d162740a1375f77422034b311d708997.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (16, 'Приказ о создании комиссии по противодействию коррупции в ОАО \"Ратон\" 2021 (Коррупция)', 'uploads/files/9007a6fe3590401022ede81af8b18c31.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (17, 'Положение \"О комиссии по противодействию коррупции\" 2021 (Коррупция)', 'uploads/files/a043e48224a634d824f69f003a402c88.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (18, 'Приказ о введении в действие Положения \"О комиссии по противодействию коррупции\" 2021 (Коррупция)', 'uploads/files/c4ea887ed9abb2378711280b6d3cbc20.pdf', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (19, 'Производство 1', 'uploads/files/d78018894d718eae59165f5169a9c2ea.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (20, 'Производство 2', 'uploads/files/2809096bb5d513739822b5758f9364e7.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (21, 'Производство 3', 'uploads/files/0ed72de1b3df0d1a2e230e811f3b9d29.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (23, 'Производство 5', 'uploads/files/57a9931d7b7e87bf4d2b9f294da70cc1.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (24, 'Производство 4', 'uploads/files/af384f9db84ab847edd6aeb48797424f.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (25, 'Аттестат аккредитации (ЦЗЛиМ) (Услуги)', 'uploads/files/ec640964f3fdca5bc39a1d4b8fb1a641.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (26, 'Здание 1', 'uploads/files/3885119aa17a19316f6b79b2bad835ff.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (27, 'Здание 2', 'uploads/files/0382f06247c18147f9b7a499a931ab12.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (28, 'Здание 3', 'uploads/files/241cdad5352cc4603470edea9f58d6a2.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (29, 'Здание 4', 'uploads/files/9dd1d3bb7320a84128e1cdcf58fdcd32.jpg', '2021-04-26 12:14:45');
INSERT INTO `core_files` VALUES (30, 'Здание 5', 'uploads/files/caf4d0c163548176ba6c021f78d93be2.jpg', '2021-04-26 12:14:45');

-- ----------------------------
-- Table structure for core_item_applications
-- ----------------------------
DROP TABLE IF EXISTS `core_item_applications`;
CREATE TABLE `core_item_applications`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_item_applications
-- ----------------------------
INSERT INTO `core_item_applications` VALUES (1, 19, 'Роман', '+375445137009', 'devwern@gmail.com', 'ПРивет!', 1, '2021-04-26 02:50:01');

-- ----------------------------
-- Table structure for core_item_files
-- ----------------------------
DROP TABLE IF EXISTS `core_item_files`;
CREATE TABLE `core_item_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_item_files
-- ----------------------------
INSERT INTO `core_item_files` VALUES (4, 'Каталог', 2, 'uploads/963d4bc4effc737e0fd6e2b21f347e7e.pdf', 1, '2021-04-21 23:57:52');
INSERT INTO `core_item_files` VALUES (5, 'Проспект', 2, 'uploads/ff96e5317f9048d068a4c8fafd876c71.doc', 1, '2021-04-21 23:57:52');
INSERT INTO `core_item_files` VALUES (6, 'Опросный лист КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/2be69532bc4449cd5f1a23d42479312e.dwg', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (7, 'Сертификат соответствия КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/73c5a77061f7cafb8147f02d85e1e219.pdf', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (8, 'Сертификат продукции собственного производства КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/4f376a01a42219710b9b30ca02b4cad0.jpg', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (9, 'Руководство по эксплуатации', 2, 'uploads/6b23838ee81ad4e2155756c6ae19946c.pdf', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (10, 'Каталог', 3, 'uploads/c735718a8deb81534ec8bd1eb94b772e.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (11, 'Сертификат соответствия КРУ внутренней установки серии Р/БЕЛ', 3, 'uploads/6e7054cc9d9d7520551b0468e97e5030.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (12, 'Сертификат продукции собственного производства КРУ внутренней установки серии Р/БЕЛ', 3, 'uploads/c7603d4e5304026c8f17c8e2e050b827.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (13, 'Руководство по эксплуатации', 3, 'uploads/84f31e7ecd56fa84eca995942263e675.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (14, 'Опросный лист', 3, 'uploads/988a3cde9eb240f01179cb0caf12fd13.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (15, 'Каталог', 4, 'uploads/9969de802a61b018b00262920a8fa175.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (16, 'Сертификат соответствия КРУ внутренней установки серии РТН', 4, 'uploads/98037d1234c2c026cb198019537d101f.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (17, 'Сертификат продукции собственного производства КРУ внутренней установки серии РТН', 4, 'uploads/9229fcd5bed1b58c502050ce0d209532.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (18, 'Руководство по эксплуатации', 4, 'uploads/6ac93541e68ecf327fcd457f3e99b85e.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (19, 'Опросный лист КРУ внутренней установки серии РТН', 4, 'uploads/6f069b74885580fa30c5ccb674a83137.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (20, 'Каталог', 5, 'uploads/b3a7466e50b6ef9e2150949403c1389e.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (21, 'Сертификат продукции собственного производства КРУ внутренней установки серии РТН 20 кВ', 5, 'uploads/194eb49943ab79be7b40f9a2e62cc858.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (22, 'Руководство по эксплуатации', 5, 'uploads/0d36eff72879941f7758a32fe5896a53.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (23, 'Опросный лист КРУ внутренней установки серии РТН 20 кВ', 5, 'uploads/3add6e188a01a8f97f9605e746f7d6de.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (24, 'Каталог', 6, 'uploads/a3f0dc723c362a4f34fbb5e490b32087.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (25, 'Руководство по эксплуатации', 6, 'uploads/71c9b10967db2e4ee1a1e8247cd36337.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (26, 'Опросный лист КРУ внутренней установки серии РТН 35 кВ', 6, 'uploads/20eecc5e3f61a461f5532468e31b5367.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (27, 'Каталог', 7, 'uploads/907df9cc9eb43281351ef9788b77fb90.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (28, 'Сертификат продукции собственного производства КСО внутренней установки серии КСО/БЕЛ', 7, 'uploads/716f82644c50146c3d84190f76318ced.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (29, 'Руководство по эксплуатации', 7, 'uploads/05908919c19ffd212729167a312a8546.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (30, 'Руководство по эксплуатации 2', 7, 'uploads/0764ba10d8c1a1e08296934b48a82c74.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (31, 'Опросный лист КСО серии БЕЛ', 7, 'uploads/e27eae2e0729b8a5eef0cb20fda437dc.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (32, 'Каталог', 8, 'uploads/c4acb1e227053ed8c2e175d544d309f7.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (33, 'Сертификат соответствия КСО внутренней установки серии КСО/РТН', 8, 'uploads/912a874e6a9540a2a176fbd508849953.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (34, 'Сертификат продукции собственного производства КСО внутренней установки серии КСО/РТН', 8, 'uploads/83408a80318f954a55b45aeae760e494.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (35, 'Руководство по эксплуатации', 8, 'uploads/b757feaf1d06622d04b2020151ec1824.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (36, 'Руководство по эксплуатации', 8, 'uploads/e244f7309b3499ca81fddc54c803f94b.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (37, 'Опросный лист КСО серии РТН выкл. нагр', 8, 'uploads/df25a3f9854f84f89654e9c1ec0f5667.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (38, 'Опросный лист КСО серии РТН с вык. эл-том', 8, 'uploads/acad9239fa8bd5624dc0142ddad54576.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (39, 'Опросный лист КСО серии РТН стац', 8, 'uploads/e5329fe334eeb2a3d40c7c82c6e85f00.dwg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (40, 'Каталог', 9, 'uploads/ea7e7deb13942aa6bbd07f4305b8be0e.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (41, 'Сертификат соответствия КРУЭ серии RTN24-L', 9, 'uploads/d547f1e3ee66710907f21c7a51fdd2fd.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (42, 'Сертификат продукции собственного производства КРУЭ серии RTN24-L', 9, 'uploads/4afaf3d8e9b47e6fc785d6c4c5111126.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (43, 'Руководство по эксплуатации', 9, 'uploads/d450ed9ce6cbf888e16ee4dea14931f9.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (44, 'Опросный лист', 9, 'uploads/4ff961289dfe878cc173bcd10e526593.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (45, 'Каталог', 10, 'uploads/f1afe2360adec50384fdeb9e3d11249e.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (46, 'Сертификат соответствия КРУЭ серии RTN24-M(S,D)', 10, 'uploads/2a6c75dcd1bb5aee61d6fc0c0ab1070f.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (47, 'Сертификат продукции собственного производства КРУЭ серии RTN24-M(S,D)', 10, 'uploads/126a6fb21f1c322819d11bf56e0f1b80.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (48, 'Руководство по эксплуатации', 10, 'uploads/b6ae0316071db82022139fd94fa8c196.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (49, 'Каталог', 11, 'uploads/1316ef53629457b0542c252135151d10.doc', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (50, 'Сертификат соответствия НКУ/РТН', 11, 'uploads/87f54f1d615bf0102cf78c042270ba3d.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (51, 'Сертификат продукции собственного производства НКУ/РТН', 11, 'uploads/0fb1bf11ec58dce77f9a21bec32d5b8b.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (52, 'Руководство по эксплуатации', 11, 'uploads/7584f8078d46824af73c27d5c6c8b78f.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (53, 'Проспект', 12, 'uploads/04f7fab834f94d54e6745450b0f8a5c1.doc', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (54, 'Проспект', 13, 'uploads/d0a1fff69b89891d010e7517d9c38e90.doc', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (55, 'Проспект', 14, 'uploads/412cae01c0fcc3e3404c18bf12802d06.doc', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (56, 'Сертификат продукции собственного производства Шкаф распределительно-учетный ШРУ', 14, 'uploads/fb9f14574efbff0b5fb9732bb15b0650.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (57, 'Проспект', 15, 'uploads/0b115bcbee77c56a048449fdefb321ab.doc', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (58, 'Каталог', 16, 'uploads/c84c63a728de1f7518c3f44ef457c358.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (59, 'Сертификат соответствия КТП серии КТП-РТН-К', 16, 'uploads/51b90bd4f1ad0a8c3ac3726863784fc5.jpg', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (60, 'Сертификат продукции собственного производства КТП серии КТП-РТН-К', 16, 'uploads/68367e0af1479b8e5f2fd0ed4e348d11.pdf', 1, '2021-04-23 23:36:17');
INSERT INTO `core_item_files` VALUES (61, 'Каталог', 17, 'uploads/86ef5eeb2b64ad3f6bcbaabba5cd62e8.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (62, 'Сертификат соответствия КТП серии КТП-РТН-С', 17, 'uploads/124443f485631ccd4284122691bcac4c.jpg', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (63, 'Сертификат продукции собственного производства КТП серии КТП-РТН-С', 17, 'uploads/1b861f3b9fd4c08b81abeb7a6c694c65.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (64, 'Каталог', 18, 'uploads/64686ec130c161a97d440cb071d0fec4.doc', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (65, 'Сертификат соответствия КТП серии КТП-РТН–Б', 18, 'uploads/87ebac7b4090403202c38612efb01197.jpg', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (66, 'Сертификат продукции собственного производства КТП серии КТП-РТН–Б', 18, 'uploads/ad55c3e30e66cedebd64c269a3f9b960.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (67, 'Каталог', 19, 'uploads/e4b69ff3ea62eebdab528f7b2b4342f3.doc', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (68, 'Сертификат соответствия КТП серии КТП-РТН–У', 19, 'uploads/10811f2d359568f4bc27b9b57badf267.jpg', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (69, 'Сертификат продукции собственного производства КТП серии КТП-РТН–У', 19, 'uploads/d0e4cf038008e62f8fcdcfff202bc669.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (70, 'Каталог', 20, 'uploads/91caba67ca5023b6d2dc8113bcc0bd20.docx', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (71, 'Руководство по эксплуатации', 20, 'uploads/1f8cecbdbd5c24fd3868a34d34336aa3.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (72, 'Руководство по эксплуатации 2', 20, 'uploads/298d20a1c55332956bf60d067aa7d279.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (73, 'Каталог', 21, 'uploads/457f82864f660cd02610b1a9aee40766.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (74, 'Сертификат соответствия Разъединители РЛНД 10 кВ', 21, 'uploads/d8cc855a085a630dc4b84dba1651ac42.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (75, 'Декларация о соответствии Разъединители РЛНД 10 кВ', 21, 'uploads/757274bbc32a048233f5c06349606906.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (76, 'Сертификат продукции собственного производства Разъединители РЛНД 10 кВ', 21, 'uploads/d53eb4641d085b31c466b25ec4177fcc.jpg', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (77, 'Руководство по эксплуатации', 21, 'uploads/3b12db066413182245f07c09c040798f.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (78, 'Каталог', 22, 'uploads/a682b507a8383b90565893a8b6a30de1.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (79, 'Сертификат продукции собственного производства Разъединители РВ, РВЗ, РВФЗ 10 кВ', 22, 'uploads/94206b46c3d304ad4a72e63100412e59.jpg', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (80, 'Руководство по эксплуатации', 22, 'uploads/4cb2d3db8da19af907939169a048cf23.pdf', 1, '2021-04-24 20:30:06');
INSERT INTO `core_item_files` VALUES (81, 'Каталог', 23, 'uploads/a4f06245262b9d79d00576e4a7a7fc94.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (82, 'Сертификат продукции собственного производства Разъединители РЛК', 23, 'uploads/aba2f209de3f240f5ac7d6eb9c393ee0.jpg', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (83, 'Руководство по эксплуатации', 23, 'uploads/b05adc0b16cb367c9f0ddda5dd8720e5.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (84, 'Каталог', 24, 'uploads/cc13068b84690fa3ff7bc2243884d6fb.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (85, 'Сертификат продукции собственного производства Разъединитель РДЗ', 24, 'uploads/93dfddd8aeda9b07f9ac965f13fab7fa.jpg', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (86, 'Каталог', 25, 'uploads/9f404353bbcd0e15c005b998826dee0c.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (87, 'Сертификат продукции собственного производства Выключатель нагрузки ВН 10 кВ', 25, 'uploads/8698f90196009dc816e15668e3f8c063.jpg', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (88, 'Руководство по эксплуатации', 25, 'uploads/493e909fb61728f91a660fd72f02757e.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (89, 'Каталог', 26, 'uploads/7ef88f0b9399b07a518d5fc41e557da6.doc', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (90, 'Сертификат соответствия Вакуумный выключатель ВВ/РТН-10', 26, 'uploads/a299d7e33378b4dd2f29d02bbd3aa1ba.pdf', 1, '2021-04-24 22:24:26');
INSERT INTO `core_item_files` VALUES (91, 'Сертификат продукции собственного производства Вакуумный выключатель ВВ/РТН-10', 26, 'uploads/51d7a45afdff4c2592f5580bd1dfc16e.jpeg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (92, 'Проспект', 27, 'uploads/84ecae5af383cfcb54c5d4ee82267de4.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (93, 'Сертификат соответствия Блоки испытательные БИ-4, БИ-6', 27, 'uploads/7de7fce2576dda99fb7c732b29390feb.pdf', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (94, 'Сертификат продукции собственного производства Блоки испытательные БИ-4, БИ-6', 27, 'uploads/7dcd9d6355435aa592821206375bcb06.jpg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (95, 'Проспект', 28, 'uploads/468a0055c3d222aa64cfba0451a7d3ab.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (96, 'Проспект', 29, 'uploads/51d8f17c7f81e52951754cdb04230f62.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (97, 'Сертификат продукции собственного производства Предохранитель-выключатель- разъединитель ПВР', 29, 'uploads/e4503574a3ab57690ec92b57cf7a3a6b.jpg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (98, 'Каталог', 30, 'uploads/cc88ff61c581dec63692fc098935be03.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (99, 'Сертификат продукции собственного производства Переключатель поворотный кухонных плит ППКП', 30, 'uploads/2b3aae2c3cc666d80540254fa2471227.jpg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (100, 'Каталог', 31, 'uploads/acfd0a19069892c32e96c434f4670fcd.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (101, 'Руководство по эксплуатации', 31, 'uploads/9b06ecfb6296461f23a48957b25b70ab.pdf', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (102, 'Проспект', 32, 'uploads/092f43d4816c5b76f96f23c63aa52fdf.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (103, 'Сертификат продукции собственного производства Переключатели пакетные коммутационные ППК 16', 32, 'uploads/2883f41dd44b1cdd35c558d7c65c6f74.jpg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (104, 'Проспект', 33, 'uploads/396941d002d77cac9a0f864655201d33.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (105, 'Проспект', 34, 'uploads/dca24474563d0fb05639897d4084618d.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (106, 'Проспект', 35, 'uploads/7e9325ca8650c63146e84c6c9840dcad.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (107, 'Проспект', 36, 'uploads/b2fdf198532d4e4e2f45ad9010460439.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (108, 'Проспект', 37, 'uploads/9d3c2f342c86595537149ef18f977416.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (109, 'Каталог', 38, 'uploads/1a9992dbf113347ce88cf3ebd05000b2.pdf', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (110, 'Проспект', 38, 'uploads/36d1fc8727aa6c7519b3d853601acbe0.doc', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (111, 'Сертификат продукции собственного производства Котел отопительный КС-Т', 38, 'uploads/6b5e0e336a4a230164f9edf54c638934.jpg', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (112, 'Руководство по эксплуатации', 38, 'uploads/794cf5866729d2fc834339f6738d4fee.pdf', 1, '2021-04-24 22:36:25');
INSERT INTO `core_item_files` VALUES (113, 'Каталог', 39, 'uploads/f707858e1372acb0c1323b5d41b5ccfc.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (114, 'Проспект', 39, 'uploads/b34af25733ab45e0489dcb076abf3fe2.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (115, 'Сертификат соответствия Котел отопительный КС-Г', 39, 'uploads/45ec10ecdcdf845af86fd66e50771bb8.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (116, 'Сертификат продукции собственного производства Котел отопительный КС-Г', 39, 'uploads/ad31a4016ffb1b5fbdd0387eca6b63d5.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (117, 'Руководство по эксплуатации', 39, 'uploads/26a4f57652c55dd95a1419fc16dfa93c.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (118, 'Каталог', 40, 'uploads/fbfe72ea207a9e889f7ff6f3b27c1b02.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (119, 'Проспект', 40, 'uploads/0c44d32ebebf759915ae05bc2d57d360.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (120, 'Сертификат соответствия Котел отопительный КС-ТГ', 40, 'uploads/b490c6c6d39adde8a3c1f51d9e25c25c.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (121, 'Декларация о соответствии Котел отопительный КС-ТГ', 40, 'uploads/699c66f51241bd6a5b15e637b1bb05a3.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (122, 'Сертификат продукции собственного производства Котел отопительный КС-ТГ', 40, 'uploads/36dac75c58fb85cf9e55894e507b80c7.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (123, 'Руководство по эксплуатации', 40, 'uploads/8ba701f962b553eb60df8f7d7260ec93.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (124, 'Каталог', 41, 'uploads/314099a9e41eb4bd63bd05b88a0335f6.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (125, 'Проспект', 41, 'uploads/aefecd015fc661a633cf30097442bf40.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (126, ' Проспект Сертификаты и декларации Сертификат соответствия Котел отопительный КС-ТГВ', 41, 'uploads/45239eb2cef469c9f6109e4a10bd8ea3.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (127, 'Сертификат продукции собственного производства Котел отопительный КС-ТГВ', 41, 'uploads/02787967729d1a9334fd0bc1dfc064f1.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (128, 'Руководство по эксплуатации', 41, 'uploads/dc1020cb0957d348a7aa989275dfe3b7.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (129, 'Каталог', 42, 'uploads/db4c12312e9758a5949003174ead61f9.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (130, 'Проспект', 42, 'uploads/effb5db46f102abac322666b28b1d8b3.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (131, 'Сертификат соответствия Котел отопительный КОС-ТВ', 42, 'uploads/9e287c00e0f86acef5ce27a8e8637ac8.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (132, 'Сертификат продукции собственного производства Котел отопительный КОС-ТВ', 42, 'uploads/d898b1a693e9b7824446b73080b5e6c6.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (133, 'Руководство по эксплуатации', 42, 'uploads/6d9e7ca2a6db200300ef2ca0e0274b70.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (134, 'Каталог', 43, 'uploads/0258cb4d990ca3cdca8cb085b1734611.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (135, 'Проспект', 43, 'uploads/25345afac121af2b9cd693258c390222.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (136, 'Сертификат продукции собственного производства Котел отопительный КОС-ТВ-А', 43, 'uploads/dfd54f005b2c8416d7e1e6f79acdef3d.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (137, 'Руководство по эксплуатации', 43, 'uploads/d21814d1e3ee2ace871795be6425cf60.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (138, 'Проспект', 44, 'uploads/9ebcf942b40486a86bf138545378b71a.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (139, 'Каталог', 45, 'uploads/20d166410d7885e2ebd06a07c37c4d73.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (140, 'Проспект', 45, 'uploads/ef079ed0fe3e7dcd4a51b0567966d74c.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (141, 'Сертификат соответствия Устройство газогорелочное УГГ', 45, 'uploads/eb34dd857afe3a9b329ad40e850c8a8b.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (142, 'Декларация о соответствии Устройство газогорелочное УГГ', 45, 'uploads/a8400322553bb966d622ed9cf88254d6.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (143, 'Сертификат продукции собственного производства Устройство газогорелочное УГГ', 45, 'uploads/105e751e22622e5f49f9253a2d924e9e.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (144, 'Каталог', 46, 'uploads/5a3df4c996bfef2a57f75b59fb5e891f.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (145, 'Сертификат соответствия Зеркала автомобильные для различных видов транспорта', 46, 'uploads/f7016aaaba6769844fc4d8c015dd7312.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (146, 'Сертификат продукции собственного производства Зеркала автомобильные для различных видов транспорта', 46, 'uploads/c68492b27956d3168cb35bd460adb0f3.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (147, 'Проспект', 47, 'uploads/d51814366358459ba0a821e64cd415f7.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (148, 'Проспект', 48, 'uploads/f63936ef0d02c6dd4758726d4aac6103.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (149, 'Сертификат продукции собственного производства Инфракрасный обогреватель', 48, 'uploads/1229b21583c18780c2524838d93d566a.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (150, 'Проспект', 49, 'uploads/55789a215a844c16d651abdf349bc904.doc', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (151, 'Декларация о соответствии Шкафы гардеробные', 49, 'uploads/7038836fcdd90c76846e951b0da162cc.jpg', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (152, 'Проспект', 50, 'uploads/ed5386a8dae5ec266044f113ae8a12b7.pdf', 1, '2021-04-24 23:10:14');
INSERT INTO `core_item_files` VALUES (153, 'Проспект', 51, 'uploads/d7d815815a9c278570e73e15e43ca385.pdf', 1, '2021-04-24 23:10:14');

-- ----------------------------
-- Table structure for core_item_images
-- ----------------------------
DROP TABLE IF EXISTS `core_item_images`;
CREATE TABLE `core_item_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `status` int NOT NULL,
  `general` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_item_images
-- ----------------------------
INSERT INTO `core_item_images` VALUES (9, 2, 'uploads/7c2150adb080cd74932314786bcf7120.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (10, 2, 'uploads/1d9f7ea192170c95aa7fb51e7a5ad160.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (11, 2, 'uploads/9a652e0deea41451212c81950e5d522c.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (12, 2, 'uploads/c3df9665c5bc7fa88dbb0b4f198b1873.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (13, 2, 'uploads/c3eff6080bbb1a06ed96a0929fff5748.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (14, 2, 'uploads/292fcc131eef55b2568e56181b312367.jpg', '2021-04-23 09:12:30', 1, 1);
INSERT INTO `core_item_images` VALUES (15, 2, 'uploads/bb04228dfd55715a3c2a49c79a92ca12.jpg', '2021-04-23 09:12:30', 1, 0);
INSERT INTO `core_item_images` VALUES (16, 3, 'uploads/b42fdca38b7964c56c12e92bb1642289.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (17, 3, 'uploads/8d75f338b70500bbbd93019ab2472612.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (18, 4, 'uploads/42480e7648062b44108544a3dee3e6ae.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (19, 5, 'uploads/1dbd85fd87baff65a6be6405966901b2.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (20, 6, 'uploads/95b40b0ad6d2c1b9c5b55ee9358e2626.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (22, 7, 'uploads/10e084cf16ddf2eebcc42dc07ea4ac7e.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (23, 8, 'uploads/c0da7197fd64aa4323096a99d94a6420.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (24, 8, 'uploads/34475b1003df6792fc6ab0c840bad40c.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (25, 9, 'uploads/1d750f316547b96501f8d72512a0448d.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (26, 9, 'uploads/5b35a16fd60a585357ceccc6379e6e37.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (27, 10, 'uploads/b7602376c64eab746dfec9fd724cd5f1.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (28, 11, 'uploads/3c8f2d829984bfaae161965b3b734113.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (29, 11, 'uploads/f9044c0c55ef533cbf4c3dd1d3917c90.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (30, 11, 'uploads/d2c4cb97611851f82daaebf8a331897f.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (31, 11, 'uploads/81f3fb9b8bdd1c16fa6cce58f42ea0f1.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (32, 11, 'uploads/2cd1010a10b58ead6a3584a0cf9ae461.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (33, 11, 'uploads/57603b49a6289b8f91d72c63dd40f40d.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (34, 12, 'uploads/d561e421183de79fbe1fff26008c99c0.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (35, 13, 'uploads/7e1161a37cc197c4ade7532c4393afb6.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (36, 14, 'uploads/abb7dab381501b66d45e8a41f05225ec.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (37, 15, 'uploads/87e19f655e94ec4d330cfda2afa23dc5.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (38, 16, 'uploads/1a53a273473dcef6b2a65855e1db6dbb.jpg', '2021-04-23 23:36:17', 1, 1);
INSERT INTO `core_item_images` VALUES (39, 16, 'uploads/898b2a83f6bff0f7ea2729dfd0ca8614.jpg', '2021-04-23 23:36:17', 1, 0);
INSERT INTO `core_item_images` VALUES (40, 17, 'uploads/ad99b972ef9e5f92d5d463b3b93d66d4.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (41, 18, 'uploads/cdb61697d06d5c78810d1dae8572d0de.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (42, 18, 'uploads/f83b64b47f0667741772a88f5a647a83.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (43, 19, 'uploads/fb2b14de14bf753655e5c60ecbe24bd2.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (44, 19, 'uploads/601e04d3013105d97ad687e5ac7f4f30.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (45, 19, 'uploads/32a6a1b876ab863bfe10fec6222cb9e0.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (46, 19, 'uploads/1df4ef2f2f7088d2a6a42ff09c1ec864.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (47, 19, 'uploads/355c303b83a8ce8356387f202a5487fc.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (48, 19, 'uploads/756c9dad8f08569fa974a0d44c234b4b.jpg', '2021-04-24 20:30:06', 1, 0);
INSERT INTO `core_item_images` VALUES (49, 20, 'uploads/0cdcec5947327ba6b6521ae4f2efb3f8.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (50, 21, 'uploads/247a2a87247e927157d5075dd41de919.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (51, 22, 'uploads/599d998e65b6d9f094fdc5c25bc1ef02.jpg', '2021-04-24 20:30:06', 1, 1);
INSERT INTO `core_item_images` VALUES (53, 23, 'uploads/78c1c612382bf49c965ffb3a86358326.jpg', '2021-04-24 22:24:26', 1, 1);
INSERT INTO `core_item_images` VALUES (54, 24, 'uploads/6393cd32496141444bad58b531f2c4d7.jpg', '2021-04-24 22:24:26', 1, 1);
INSERT INTO `core_item_images` VALUES (55, 25, 'uploads/50504d8ae663fa421a429761bbe4bc90.jpg', '2021-04-24 22:24:26', 1, 1);
INSERT INTO `core_item_images` VALUES (56, 26, 'uploads/3c2bb8644b72f05c355842c8dd2fda6d.jpg', '2021-04-24 22:24:26', 1, 1);
INSERT INTO `core_item_images` VALUES (57, 26, 'uploads/ed564ad5f13309bbe8c5dd3a1a6f0e11.jpg', '2021-04-24 22:24:26', 1, 0);
INSERT INTO `core_item_images` VALUES (58, 27, 'uploads/0789ec8f419859763734a1c54dc41a23.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (59, 27, 'uploads/5c404acf12035b32a490d7a5267c8a73.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (60, 27, 'uploads/efc61c96b1b3fc24892d7899804359dc.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (61, 28, 'uploads/e89b6d3b4bcfaaa3f3e87ef134154879.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (62, 28, 'uploads/76cb06c17006febaf77975d3abf91825.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (63, 28, 'uploads/e31916b80fb7d2405863dbebd56ab193.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (64, 29, 'uploads/378ea1dffcc84f3770a2a5f32738cce8.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (65, 30, 'uploads/bac9b26ba0ad909c002f83eb38bf2a11.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (66, 31, 'uploads/590c1916ba4b9ef613f67d3147025195.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (67, 32, 'uploads/8211205e57cd3836ca5f9262bcd7617a.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (68, 32, 'uploads/4b7e0ea5f04769ad60e9602e9f075239.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (69, 32, 'uploads/d9a4830a4f54599b2020b6d57089e0c3.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (70, 33, 'uploads/b682919d854e426dc666391d34d3ffb8.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (71, 34, 'uploads/4824e4daecd24c0ba4943c263bfe9da5.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (72, 34, 'uploads/8a1da81b70a90f544f76277321deee91.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (73, 35, 'uploads/9d571e4c61a47de07bddbc65c035e136.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (74, 36, 'uploads/90a7deb4b10cfb8d9be2f1ad369821b6.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (75, 36, 'uploads/b4027d81ce803669bd78ae1855b20b16.jpg', '2021-04-24 22:36:25', 1, 0);
INSERT INTO `core_item_images` VALUES (76, 37, 'uploads/23a0cdba1a9232d1a8f94d4b65919cfc.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (77, 38, 'uploads/b4dafcf97049e5f204e7f246b52e78f1.jpg', '2021-04-24 22:36:25', 1, 1);
INSERT INTO `core_item_images` VALUES (78, 39, 'uploads/546e77298e95e4be7b708c459920880d.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (79, 39, 'uploads/6891f7c89b1be9e9ca95969fdb641c59.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (80, 40, 'uploads/8c9e6f02a1669979c066990648421b22.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (81, 41, 'uploads/4e733222e6deece9b90b007a160e4079.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (82, 41, 'uploads/4f6ad73b9ee6b0cf8313bbccb3bee890.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (83, 42, 'uploads/54614ca1faf4dde3db1425f290df6cbc.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (84, 43, 'uploads/02db7c35cd5065acfd6b496e00c28eba.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (85, 44, 'uploads/69f54fd35fd3992fec95a5efcb8e9e17.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (86, 44, 'uploads/e0e09753d43243f2e8c3f6e1cc14fb8f.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (87, 45, 'uploads/fe3131371752eb067ff681a89ed93096.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (88, 46, 'uploads/5a873131928f6c8d75854f6583d4fd21.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (89, 46, 'uploads/6fde15201087dd4fa552662ed9fef67d.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (90, 46, 'uploads/c8b9983a75224c972fbbd867a060facb.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (91, 46, 'uploads/4c4ae312d35f7c38694d1cace90a60ac.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (92, 46, 'uploads/81e8c3188a527bf45017b295febee7be.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (93, 46, 'uploads/26c094dbb2079dabe11314cdb4cfb6db.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (94, 46, 'uploads/0231f7d00f23b84d42004397e56f9a80.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (95, 46, 'uploads/720d845e2818c38b01dc622182c84df1.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (97, 46, 'uploads/5227e16b916d305f9a30e1b0c56a56cf.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (98, 46, 'uploads/2af8b74675ca59fdf843b9c8ae2ae93d.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (99, 47, 'uploads/891539bb784ab6091ba370b06a9d450e.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (100, 47, 'uploads/400e4ae7523ffadc6acb0c8251945585.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (101, 48, 'uploads/f668540b6379824c7f8a99f07545fda7.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (102, 48, 'uploads/71e037dccfc66637d24620e544ca134c.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (103, 49, 'uploads/8c03f5e3f45389ca2c4b030bf84e2bc0.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (104, 49, 'uploads/815e27ff49d7139b8c65da3a0aa7a38c.jpg', '2021-04-24 23:10:14', 1, 0);
INSERT INTO `core_item_images` VALUES (105, 50, 'uploads/4135bd2562bbec56c8afa9cb2e4096e3.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (106, 51, 'uploads/03613bcc3094dd89e04261d3e99f5477.jpg', '2021-04-24 23:10:14', 1, 1);
INSERT INTO `core_item_images` VALUES (107, 51, 'uploads/1f8dc6f21afc413322190e4efbf832ee.jpg', '2021-04-24 23:10:14', 1, 0);

-- ----------------------------
-- Table structure for core_items
-- ----------------------------
DROP TABLE IF EXISTS `core_items`;
CREATE TABLE `core_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_items
-- ----------------------------
INSERT INTO `core_items` VALUES (2, 'КРУ наружной установки серии КРУ/БЕЛ', '<p>Устройства комплектные распределительные в металлической оболочке серии КРУ/БЕЛ (КРУ) предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 6; 10 кВ для сетей с изолированной нейтралью.</p>\r\n\r\n<p>КРУ применяются в сетях сельского хозяйства, в промышленности и электрофикаии железнодорожного транспорта, для комплектования электрических подстанций.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКРУ наружной установки конструктивно представляет из себя блок ячеек (1-6) &ndash; модуль с общей металлоконструкцией и наружными панелями из оцинкованной стали.</p>\r\n\r\n<p>Конструкция модуля предусматривает размещение ячеек различного назначения с выкатными элементами и шкафами управления, смонтированными на общей жесткой раме коридора управления.</p>\r\n\r\n<p>На стенке коридора напротив ячеек предусмотрена установка дополнительных шкафов.</p>\r\n\r\n<p>Конструктивно в ячейках выделены отсеки:</p>\r\n\r\n<p>отсек выкатного элемента;<br />\r\nотсек сборных шин;<br />\r\nотсек ввода;<br />\r\nотсек релейной защиты и управления.<br />\r\nРазделение ячеек на отсеки повышает их локализационную способность.</p>\r\n', 1, 1, '2021-04-21 21:44:18');
INSERT INTO `core_items` VALUES (3, 'КРУ внутренней установки серии Р/БЕЛ', '<p>Устройства комплектные распределительные в металлической оболочке внутренней установки серии Р/БЕЛ предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 6 (10) кВ для сетей с изолированной или компенсированной нейтралью для комплектования распределительных устройств электрических подстанций.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nВид ячеек КРУ в зависимости от встраиваемой аппаратуры и присоединений:</p>\r\n\r\n<p>с вакуумным выключателем;<br />\r\nс секционным разъединителем;<br />\r\nс трансформаторами напряжения;<br />\r\nс силовым трансформатором;<br />\r\nс предохранителями силовыми;<br />\r\nглухого ввода.<br />\r\nПо требованию заказчика могут изготавливаться КРУ с верхним или нижним расположением сборных шин.</p>\r\n\r\n<p>Устройства комплектные распределительные в металлической оболочке внутренней установки серии Р/БЕЛ предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 6 (10) кВ для сетей с изолированной или компенсированной нейтралью для комплектования распределительных устройств электрических подстанций. ОБЩИЕ СВЕДЕНИЯ Вид ячеек КРУ в зависимости от встраиваемой аппаратуры и присоединений: [&hellip;]</p>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (4, 'КРУ внутренней установки серии РТН', '<p>Устройства комплектные распределительные кассетного типа внутренней установки серии РТН (КРУ) предназначены для ввода и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц напряжением 6; 10 кВ для сетей с изолированной или компенсированной нейтралью.<br />\r\nШкаф КРУ представляет собой металлоконструкцию, изготовленную из высококачественной оцинкованной или алюмоцинковой стали, детали которой изготовлены на высокоточном оборудовании методом холодной штамповки.<br />\r\nСоединения выполнены на усиленных стальных вытяжных заклепках и резьбовых соединениях. Наружные элементы конструкции &mdash; двери фасада, боковые панели крайних в ряду шкафов и т.д. окрашены методом порошкового напыления (цвет RAL 7035).<br />\r\nВыдвижной элемент находится в средней части шкафа непосредственно над кабельным отсеком и конструктивно выполнен в виде тележки, которая перемещается из контрольного положения в рабочее и обратно при закрытых дверях шкафа.<br />\r\nВ ремонтном положении выдвижной элемент при помощи инвентарной тележки, которая поставляется вместе с КРУ, выкатывается в коридор обслуживания, при этом шторный механизм автоматически перекрывает доступ к токоведущим частям шкафа.</p>\r\n\r\n<p>Оригинальная конструкция обеспечивает легкий, удобный и безопасный доступ к оборудованию.</p>\r\n\r\n<p>Шкафы КРУ серии РТН изготавливаются одностороннего, двустороннего обслуживания и малогабаритные (с твердой изоляцией).</p>\r\n\r\n<p>КРУ серии РТН одностороннего, двустороннего обслуживания<br />\r\nКонструктивно шкафы КРУ разделены на отсеки вертикальными и горизонтальными металлическими перегородками:<br />\r\n&bull; релейный;<br />\r\n&bull; выдвижного элемента;<br />\r\n&bull; сборных шин;<br />\r\n&bull; кабельных присоединений, в котором располагаются также трансформаторы тока.</p>\r\n\r\n<p>Вид шкафов КРУ в зависимости от встраиваемой аппаратуры и присоединений:<br />\r\n&bull; с вакуумными выключателями;<br />\r\n&bull; с трансформаторами напряжения;<br />\r\n&bull; с разъединителями;<br />\r\n&bull; с силовыми предохранителями;<br />\r\n&bull; с силовыми трансформаторами;<br />\r\n&bull; с кабельными сборками;<br />\r\n&bull; с шинными вводами и шинными перемычками;<br />\r\n&bull; со статическими конденсаторами и разрядниками;<br />\r\n&bull; со вспомогательным оборудованием и аппаратурой.</p>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (5, 'КРУ внутренней установки серии РТН 20 кВ', '<p>Комплектные распределительные устройства серии РТН 20 (далее КРУ) предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 20 кВ и токи 630, 1250, 1600, 2000, 2500 А для сетей с изолированной или заземленной через дугогасительный реактор нейтралью для комплектования закрытых распределительных устройств электрических подстанций и трансформаторных подстанций.<br />\r\nКРУ серии РТН 20 используются:<br />\r\n&ndash; в энергетике;<br />\r\n&ndash; в распределительных сетях энергокомплекса;<br />\r\n&ndash; в сельском хозяйстве;<br />\r\n&ndash; для нужд промышленных предприятий;<br />\r\n&ndash; для городских и муниципальных сетей;<br />\r\n&ndash; в системе собственных нужд электростанций;<br />\r\n&ndash; для энергоснабжения железных дорог.</p>\r\n\r\n<p>Шкафы КРУ серии РТН могут устанавливаться в передвижных распределительных устройствах контейнерного типа, а также в модульных зданиях.</p>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (6, 'КРУ внутренней установки серии РТН 35 кВ', '<p>Устройство комплектное распределительное двухстороннего обслуживания внутренней установки серии КРУ/РТН 35 кВ<br />\r\nШкафы КРУ серии КРУ/РТН эксплуатируются в условиях умеренного климата У3.<br />\r\nШкафы КРУ представляет собой металлоконструкцию, изготовленную из высококачественной оцинкованной стали. Соединения выполнены на усиленных стальных вытяжных заклепках и резьбовых соединениях. Наружные элементы конструкции &mdash; двери фасада, боковые панели окрашены методом порошкового напыления (цвет RAL 7035).</p>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (7, 'КСО внутренней установки серии КСО/БЕЛ', '<p>Камеры сборные одностороннего обслуживания серии КСО/БЕЛ (КСО) предназначены для приема и распределения электрической энергии трехфазного переменного тока частотой 50 Гц на номинальное напряжение до 10 кВ в сетях с изолированной или компенсированной нейтралью и могут использоваться для комплектования распределительных устройств закрытых трансформаторных подстанций и распределительных пунктов.</p>\r\n\r\n<p>КСО представляют собой жесткую каркасную металлическую конструкцию с передней дверью и одной боковой стенкой. Крайние камеры в ряду комплектуются торцевыми панелями. КСО открыты сзади и сверху. Фасадные двери отсеков имеют окна для визуального наблюдения за состоянием встроенной в камеру аппаратуры.</p>\r\n\r\n<p>В верхней части камеры устанавливается отсек релейной защиты.</p>\r\n\r\n<p>Внутри каждой камеры предусматривается местное освещение. Управление освещением осуществляется выключателем, установленным на фасаде.</p>\r\n\r\n<p>Сбоку на фасадных стойках КСО располагаются приводы выключателей нагрузки, разъединителей, заземляющих ножей.</p>\r\n\r\n<p>Камеры КСО унифицированы и, независимо от схем главных и вспомогательных цепей, имеют аналогичную конструкцию основных узлов и одинаковые габаритные размеры.</p>\r\n\r\n<p>При установке КСО в не отапливаемых помещениях может предусматриваться обогрев отсека релейной защиты.</p>\r\n\r\n<p>Виды КСО<br />\r\nВ состав КСО входят камеры, вид которых определяется встраиваемой аппаратурой и присоединениями:</p>\r\n\r\n<p>с вакуумным выключателем;<br />\r\nс выключателем нагрузки;<br />\r\nс трансформаторами напряжения;<br />\r\nс разъединителями;<br />\r\nс предохранителями;<br />\r\nс силовыми трансформаторами собственных нужд;<br />\r\nс кабельными сборками;<br />\r\nшинные мосты;<br />\r\nшинные перемычки;<br />\r\nшинные заземлители;<br />\r\nвставки переходные.<br />\r\nБлокировки:<br />\r\nблокировка (механическая), не допускающая открывание дверей при включенных главных ножах разъединителей и выключателей;<br />\r\nблокировка (механическая), не допускающая включение заземляющих ножей при включенных главных ножах выключателей нагрузки или разъединителей; и не допускающая включение главных ножей выключателей нагрузки или разъединителей при включенных заземляющих ножах;<br />\r\nблокировка, не допускающая отключения шинного и линейного разъединителей при включенном вакуумном выключателе;<br />\r\nблокировка, не допускающая включения заземляющего разъединителя при условии, что в других камерах КСО от которых возможна подача напряжения на участок главной цепи камеры, где расположен заземляющий разъединитель, коммутационные аппараты находятся во включенном положении;<br />\r\nблокировка, не допускающая при включенном положении заземляющего разъединителя включения любых коммутационных аппаратов в других камерах КСО, от которых возможна подача напряжения на участок главной цепи камеры, где расположен заземляющий разъединитель.<br />\r\nТЕХНИЧЕСКИЕ ХАРАКТЕРИСТИКИ</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n			<p><strong>Наименование параметра</strong></p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Значение</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальное напряжение (линейное), кВ</td>\r\n			<td>\r\n			<p>6; 10</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Наибольшее рабочее напряжение (линейное),&nbsp; кВ</td>\r\n			<td>\r\n			<p>7,2; 12</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток главных цепей, А</td>\r\n			<td>\r\n			<p>630</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток сборных шин, А</td>\r\n			<td>\r\n			<p>630; 1000</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток отключения выключателя (встроенного в КСО), А</td>\r\n			<td>\r\n			<p>12,5; 20</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Ток термической стойкости в течение 3с, кА</td>\r\n			<td>\r\n			<p>20</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток электродинамической стойкости главных цепей, кА</td>\r\n			<td>\r\n			<p>51</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"4\">Номинальное напряжение вспомогательных цепей, В:</td>\r\n			<td>оперативных цепей постоянного тока</td>\r\n			<td>\r\n			<p>110, 220</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>оперативных цепей переменного тока</td>\r\n			<td>\r\n			<p>220</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>цепей трансформаторов напряжения</td>\r\n			<td>\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>цепи силового трансформатора</td>\r\n			<td>\r\n			<p>380/220 с глухо заземлённой нейтралью</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Уровень изоляции</td>\r\n			<td>\r\n			<p>Нормальная по ГОСТ 1516.1</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид изоляции</td>\r\n			<td>\r\n			<p>воздушная</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Наличие изоляции токоведущих шин главных цепей</td>\r\n			<td>\r\n			<p>с неизолированными шинами</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Степень защиты (при закрытых дверях камер со сторон облуживания отсеков и релейных шкафов) по ГОСТ 14254</td>\r\n			<td>\r\n			<p>IР 20</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид управления</td>\r\n			<td>\r\n			<p>местное; дистанционное</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид линейных высоковольтных подсоединений</td>\r\n			<td>\r\n			<p>кабельные, шинные</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Габариты камер, мм</td>\r\n			<td>\r\n			<p>800х 940&times;2450</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Масса, не более, кг</td>\r\n			<td>\r\n			<p>380</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Срок службы, лет</td>\r\n			<td>\r\n			<p>25</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (8, 'КСО внутренней установки серии КСО/РТН', '<p>КСО внутренней установки на напряжение 6,10 кВ<br />\r\nПрименение камер КСО<br />\r\nКамеры сборные одностороннего обслуживания серии КСО/РТН (далее &ndash; КСО) предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 6; 10 кВ и токи 630, 1000, 1250А для сетей с изолированной или компенсированной нейтралью для комплектования закрытых распределительных устройств.</p>\r\n\r\n<p>КСО представляет собой сборную металлическую конструкцию, которая может быть дополнена металлическими панелями и перегородками. Корпус камеры КСО изготовлен из оцинкованного стального листа. Двери камер окрашены порошковой краской RAL 7035. Внутри камеры размещена аппаратура главных и вспомогательных цепей.<br />\r\nКамеры КСО в зависимости от встраиваемой аппаратуры подразделяются на:<br />\r\n&bull; КСО с вакуумным выключателем;<br />\r\n&bull; КСО с выключателем нагрузки.<br />\r\n&bull; КСО с разъеденителем;<br />\r\n&bull; КСО с трансформатором напряжения;<br />\r\n&bull; КСО с трансформатором собственных нужд.</p>\r\n\r\n<p>Камеры КСО с вакуумным выключателем изготавливаются как с расположением выключателя на выдвижном элементе, так и на стационарном. Расположение выдвижного элемента находятся в средней части КСО на нём вместо вакуумного выключателя могут распологаться как трансформаторы напряжения, так и предохранители.<br />\r\nВ качестве коммутационных аппаратов в КСО с выдвижным элементом применяются вакуумные выключатели ВВ/ТЕL, VS1, VD4, Evolis, SION. Что касается КСО со стационарным вакуумным выключателем, то могут применятся только BB/TEL и ВВМ-СЭЩ.<br />\r\nКСО с выдвижным элементом для повышения локализационной способности разделены металлическими перегородками на отсеки:<br />\r\n&bull; отсек сборных шин;<br />\r\n&bull; отсек выдвижного элемента и подключений;<br />\r\n&bull; отсек управления камеры.</p>\r\n\r\n<p>КСО со стационарным расположением вакуумного выключателя разделены металлическими перегородками с проходными изоляторами на отсеки:<br />\r\n&bull; отсек сборных шин и выключателя;<br />\r\n&bull; отсек подключений;<br />\r\n&bull; отсек управления камеры.<br />\r\nПри использовании Секций КСО со стационарным вакуумным выключателем, КСО с выключателем нагрузки будет иметь следующие отсеки:<br />\r\n&bull; отсек сборных шин выключателя нагрузки и плдключений;<br />\r\n&bull; отсек управления камеры.<br />\r\nНа двери отсека управления камеры КСО имеется активная мнемосхема.<br />\r\nВ камерах КСО с выключателем нагрузки установлен выключатель нагрузки, имеющий ручное управление.<br />\r\nВ качестве коммутационных аппаратов в КСО с выключателем нагрузки применяются выключатели нагрузки ВНПР, NAL, ОМ, ОМВ.<br />\r\nКСО с выключателем нагрузки разделены на отсеки:<br />\r\n&bull; отсек сборных шин;<br />\r\n&bull; отсек выключателя нагрузки и подключений;<br />\r\n&bull; отсек управления камеры.<br />\r\nПри использовании секций КСО со стационарным вакуумным выключателем, КСО с выключателем нагрузки будет иметь следующие отсеки:<br />\r\n&bull; отсек сборных шин выключателя нагрузки и подключений;<br />\r\n&bull; отсек управления камеры.<br />\r\nВ КСО предусмотрена возможность установки ограничителей перенапряжения (ОПН).<br />\r\nФункции защиты и управления выполнены на базе микропроцессорных устройств (БЭМН, ALSTOM, ABB, Siemens и другие).<br />\r\nДля измерения тока, активной и реактивной электрической энергии предусмотрена возможность установки цифровых измерителей и счетчиков электрической энергии c цифровыми интерфейсами RS 232, RS-485.<br />\r\nКСО предусматривают возможность установки трансформаторов тока нулевой последовательности рамочного типа для подключения трех однофазных кабелей с размерами окна, обеспечивающими их свободную заводку и крепление.<br />\r\nПодключение контрольных кабелей сверху.<br />\r\nОсновные параметры и характеристики</p>\r\n\r\n<table style=\"width:624px\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\"><strong>Наименование параметра</strong></td>\r\n			<td><strong>Значение</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальное напряжение (линейное), кВ</td>\r\n			<td>6; 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Наибольшее рабочее напряжение (линейное),&nbsp; кВ</td>\r\n			<td>7,2; 12</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток главных цепей, А</td>\r\n			<td>630; 1000; 1250</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток сборных шин, А</td>\r\n			<td>630; 1000; 1250</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток отключения выключателя (встроенного в КСО), А</td>\r\n			<td>12,5; 16; 20</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Ток термической стойкости в течение 3с, кА</td>\r\n			<td>12,5; 16; 20</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Номинальный ток электродинамической стойкости главных цепей, кА</td>\r\n			<td>32; 41; 51</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"5\">Номинальное напряжение вспомогательных цепей, В:</td>\r\n			<td>оперативных цепей постоянного тока</td>\r\n			<td>110, 220</td>\r\n		</tr>\r\n		<tr>\r\n			<td>оперативных цепей переменного тока</td>\r\n			<td>220</td>\r\n		</tr>\r\n		<tr>\r\n			<td>цепей трансформаторов напряжения</td>\r\n			<td>100</td>\r\n		</tr>\r\n		<tr>\r\n			<td>цепи силового трансформатора</td>\r\n			<td>380/220 с глухо заземлённой нейтралью</td>\r\n		</tr>\r\n		<tr>\r\n			<td>цепи освещения, не более</td>\r\n			<td>42, 220*\r\n			<p>&nbsp;</p>\r\n\r\n			<p>* при применении устройства защитного заземления</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Уровень изоляции по ГОСТ 1516.1</td>\r\n			<td>Нормальная</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид изоляции</td>\r\n			<td>Воздушная, комбинированная</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Наличие изоляции токоведущих шин главных цепей</td>\r\n			<td>С неизолированными шинами</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Степень защиты (при закрытых дверях камер и отсеков в рабочем положении выдвижного элемента) по ГОСТ&nbsp;14254</td>\r\n			<td>IР 4X</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид управления</td>\r\n			<td>Местное, дистанционное, местное и дистанционное</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Вид линейных высоковольтных подсоединений</td>\r\n			<td>Кабельные, шинные</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Условия обслуживания</td>\r\n			<td>С односторонним обслуживанием</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" rowspan=\"2\">Габариты камер, мм:\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&mdash; КСО с расположением вакуумного выключателя на выкатном элементе;</p>\r\n\r\n			<p>&mdash; КСО со стационарным расположением вакуумного выключателя</p>\r\n			</td>\r\n			<td>&nbsp;\r\n			<p>&nbsp;</p>\r\n\r\n			<p>1300х 750&times;2330</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>1100х750х2520</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"2\">Масса, не более, кг</td>\r\n			<td>КСО с выдвижным элементом</td>\r\n			<td>600</td>\r\n		</tr>\r\n		<tr>\r\n			<td>КСО с выключателем нагрузки</td>\r\n			<td>500</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">Срок службы, лет</td>\r\n			<td>30</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (9, 'КРУЭ серии RTN24-L', '<p>Устройства комплектные распределительные в элегазовой изоляцией КРУЭ серии RTN24-L, изготавливаемые ОАО &laquo;Ратон&raquo;, используются для приема и распределения электрической энергии на трансформаторных и распределительных подстанциях в сетях с изолированной нейтралью, заземлённой через дугогасящий реактор или резистор</p>\r\n\r\n<p>КРУЭ серии RTN24-L является улучшенной версией распределительных устройств в закрытых металлических корпусах с элегазовой изоляцией SF6, класс напряжения 10, 20 кВ.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nНазначение изделия</p>\r\n\r\n<p>КРУЭ серии RTN24-L применяется для реконструкции городских электрических сетей, электрораспределительных подстанций, электростанций, центров электрических нагрузок, в нефтехимической и сталелитейной отрасли, а также в горнодобывающей промышленности, высотных зданиях и др.</p>\r\n\r\n<p>КРУЭ поставляется заполненным элегазом и готовым к эксплуатации. Заполненный объём элегаза указан на паспортной табличке и рассчитан на весь срок службы КРУЭ. При первичном монтаже и при расширении КРУЭ не требуется никаких работ по элегазу.</p>\r\n\r\n<p>Преимущество</p>\r\n\r\n<p>Основные преимущества КРУЭ серии RTN24-L:<br />\r\n&mdash; расширение сборных шин слева и справа;<br />\r\n&mdash; модульный дизайн;<br />\r\n&mdash; конфигурируемость модулей из ячеек;<br />\r\n&mdash; подтвержденное качество в ходе типовых испытаний;<br />\r\n&mdash; гарантия надежности и безопасности.</p>\r\n\r\n<p>Все высоковольтные токоведущие части силового выключателя ячейки КРУ находятся в абсолютно герметичном металлическом корпусе с элегазом SF6, изготовленном из нержавеющей стали толщиной 3 мм. Элегаз изолирует находящиеся под напряжением детали друг от друга и от стенки резервуара. В ячейках с выключателем нагрузки элегаз служит также для гашения дуги. Степень защиты герметичного корпуса с элегазом IP67, внешней оболочки КРУЭ- IP4Х.</p>\r\n\r\n<p>Использование элегазовой изоляции обеспечивает устойчивость к воздействию окружаемой среды, высокую надёжность, безопасность работы КРУЭ и не требует технического обслуживания.</p>\r\n', 2, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (10, 'КРУЭ серии RTN24-M(S,D)', '<p>Устройства комплектные распределительные с элегазовой изоляцией КРУЭ серии RTN24-M, изготавливаемые ОАО &laquo;Ратон&raquo;, используются для приема и распределения электрической энергии на трансформаторных и распределительных подстанциях, а также для выполнения задач коммутации в промышленности.</p>\r\n\r\n<p>Область применения охватывает номинальные напряжения до 24 кВ и номинальные токи до 2500 А.<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nВ отличие от КРУ с воздушной изоляцией в КРУЭ серии RTN24-M вакуумные дугогасительные камеры расположены в герметичных сварных резервуарах из нержавеющей стали, заполненных элегазом (SF6), что обеспечивает двойную изоляцию токоведущих частей и делает КРУЭ нечувствительными к воздействию агрессивных окружающих сред, защищенными от проникновения инородных тел, независимыми от высоты установки, компактными, простыми в обслуживании, значительно более безопасными в эксплуатации и надежными в работе.</p>\r\n\r\n<p>В отличие от КРУЭ других производителей использование в КРУЭ серии RTN24-M, расположенных вне резервуара втычных, однополюсной конструкции, изолированных с внутренним и наружным экранирующими слоями сборных шин и устанавливаемых вне первичного герметизированного корпуса (резервуара) измерительных трансформаторов (тока и напряжения) позволяет, без работ с SF6, оперативно производить замену как самих ячеек полностью, так и измерительных трансформаторов на ячейки и трансформаторы с отличными (другими) техническими характеристиками.</p>\r\n\r\n<p>Использование металлического сильфона для передачи усилий от приводов к полюсам вакуумного выключателя и полюсам трехпозиционного разъединителя-заземлителя выгодно отличает ячейки серии RTN24-M от КРУЭ других производителей, в которых усилие передается с помощью вала через изоляционный уплотнитель, что уменьшает срок герметизации.</p>\r\n\r\n<p>Ресурс вакуумных силовых выключателей, применяемых в КРУЭ, составляет 10 000 коммутационных циклов до технического обслуживания.</p>\r\n', 2, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (11, 'НКУ/РТН', '<p>Низковольтные комплектные устройства серии НКУ/РТН предназначены для приема и распре-деления электрической энергии в сетях напряжением до 690 В включительно, частотой 50 Гц, дистанционного, автоматизированного и ручного управления, контроля, сигнализации и защиты оборудования от токов короткого замыкания и перегрузок, управления и защиты электродвигателей, управление запорной и регулирующей арматурой, защиты людей от поражения электрическим током.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nНКУ применяются в качестве распределительных щитов трансформаторных подстанций, промышленных и общественных зданий и являются альтернативной заменой традиционных ЩО70. Конструктивное решение и применяемое оборудование позволяет увеличить количество отходящих линий типовой трансформаторной подстанции на панелях НКУ, что часто требуется при реконструкции подстанций, а также повысить надежность работы оборудования и безопасность персонала при эксплуатации.</p>\r\n\r\n<p>Панели НКУ применяются в электроустановках с типами систем заземления TN-C, TN-S, TN-C-S, TT и IT. Могут комплектоваться шинными мостами и токовводами.</p>\r\n\r\n<p>НКУ изготавливаются на базе современной аппаратуры и обеспечивают возможность их подключения к аппаратуре действующих систем телемеханики и автоматизированных систем контроля и учета электроэнергии.</p>\r\n\r\n<p>Комплектация панелей НКУ производится в соответствии с опросным листом, согласованным с заказчиком.</p>\r\n\r\n<p>Виды панелей НКУ<br />\r\nвводные;<br />\r\nвводно-линейные;<br />\r\nвводно-секционные;<br />\r\nвводно-линейно-секционные;<br />\r\nсекционные;<br />\r\nлинейные;<br />\r\nучета;<br />\r\nкомпенсации реактивной мощности;<br />\r\nуправления арматурой и механизмами;<br />\r\nшинных и кабельных соединений.</p>\r\n\r\n<p>Основные преимущества панелей НКУ:<br />\r\nМинимальное время устранения неисправностей.<br />\r\nПростота изменения конфигурации моделей.<br />\r\nВзаимозаменяемость различных типов блоков.<br />\r\nПростота модернизации или ремонта.<br />\r\nВозможность применять компоненты от многих мировых производителей.<br />\r\nПоддержка PROFIBUS, DevicelMet, ModBus.<br />\r\nИнсталяция других типов связи.</p>\r\n', 3, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (12, 'Cтойка универсальная UNIBEL-10', '<p>Универсальная стойка серии UNIBEL&ndash;10 используется для размещения сетевого, телекоммуникационного, кроссового, активного и пассивного 19&Prime; оборудования, а также для надежной и быстрой конструкции низковольтных распределительных устройств.<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nСтойка совмещает в себе быстрый монтаж, внутреннее секционирование, инновационные модульные компоненты, разнообразные комплектующие.</p>\r\n\r\n<p>Комплектация:<br />\r\nразборный каркас;<br />\r\nсъемные боковые и задняя панели;<br />\r\nразборное основание;<br />\r\nкомплект регулируемых ножек;<br />\r\nкрыша;<br />\r\nвнутренние монтажные профили;<br />\r\nдверь (цельнометаллическая или обзорная со стеклом), открывающаяся в левую или правую сторону;<br />\r\nзамки и петли;<br />\r\nкрепеж;<br />\r\nрым-болты и транспортные уголки;<br />\r\nширокий ассортимент аксессуаров.</p>\r\n\r\n<p>Каркас состоит из вертикальных и горизонтальных перфорированных профилей и стягивающих элементов, обеспечивающих простую и надежную сборку каркаса.</p>\r\n\r\n<p>Для крепления оборудования и комплектующих используются системы шасси.</p>\r\n\r\n<p>Любая монтажная точка по высоте, ширине, и глубине может быть создана, не только в результате горизонтального монтажа шасси между профилями каркаса, но и в результате комбинации вертикальных и горизонтальных шасси.</p>\r\n\r\n<p>Возможны два независимых уровня крепления шасси: внешний и внутренний.</p>\r\n\r\n<p>Все профили перфорированы под квадрат 9х9 мм с шагом в 25 мм и имеют отверстия под винт самонарезающий &Oslash; 4,3 мм с шагом в 25 мм.</p>\r\n\r\n<p>Основание, крыша и боковые обшивки стойки могут быть глухими или иметь перфорацию для естественной и принудительной вентиляции.</p>\r\n\r\n<p>Двери, крыша и боковые обшивки имеют шпильки заземления с контактной поверхностью.</p>\r\n\r\n<p>Ввод кабелей осуществляется через основание шкафа, с боковых сторон или с задней части постамента через съемные цокольные панели, а также через фальш-панели с резиновыми сальниками. Основание во внутренней части шкафа имеет шторный механизм для подвода кабелей.</p>\r\n\r\n<p>Имеется возможность соединения стоек в линейку во всех направлениях &ndash; влево, вправо, вперед, назад, углом и даже вверх. Скрепление нескольких стоек между собой возможно со снятием боковых панелей (через специальные соединительные аксессуары), либо без демонтажа боковых панелей.</p>\r\n\r\n<p>Система универсальных стоек UNIBEL&ndash;10 является платформой для различных областей применения. Каждая стойка имеет доступ со всех сторон, что позволяет использовать ее для решения разнообразных задач.</p>\r\n\r\n<p>Степень защиты: от IP20 до IP54 по ГОСТ 14254-96.</p>\r\n\r\n<p>Габаритные размеры стойки без учета габаритов постамента, мм:</p>\r\n\r\n<p>ширина &mdash; 500; 600; 800;<br />\r\nглубина &mdash; 400; 600; 800;<br />\r\nвысота &mdash; 1200; 1400; 1600; 1800; 2000.</p>\r\n', 3, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (13, 'Шкаф с монтажной панелью ШМП', '<p>Шкафы с монтажной панелью предназначены для сборки различных электрощитов управления и автоматики. Позволяют производить монтаж аппаратуры как модульного, так и обычного исполнения.</p>\r\n\r\n<p>Шкафы с монтажной панелью могут использоваться на промышленных объектах, в общественных и жилых зданиях, административных сооружениях.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nШкафы представляют собой сварной металлический каркас с дверью и монтажной панелью.</p>\r\n\r\n<p>Монтажная панель установлена на салазках с регулировкой на любую глубину шкафа, что позволяет максимально эффективно использовать внутреннее рабочее пространство шкафа.</p>\r\n\r\n<p>Шкафы предназначены для навесной установки и фиксируются четырьмя шурупами или болтами через специальные монтажные проушины.</p>\r\n\r\n<p>Ввод кабеля производится снизу или сверху (по требованию заказчика) через специальные гермовводы.</p>\r\n\r\n<p>Двери шкафа имеют как правую, так и левую навеску. Дверца корпуса запирается на замок ключом с &laquo;двойной бородкой&raquo;.</p>\r\n\r\n<p>Шкафы поставляются в собранном виде.</p>\r\n', 3, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (14, 'Шкаф распределительно-учетный ШРУ', '<p>Шкаф распределительно-учетный ШРУ предназначен для приема и учета электрической энергии индивидуальных потребителей, а также для защиты от перегрузок и токов короткого замыкания. в сетях переменного тока частотой 50 Гц на номинальное напряжение 380/220 В с заземленной или изолированной нейтралью.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nС целью предотвращения хищений электроэнергии шкафы ШРУ устанавливаются вне помещения и имеет несколько вариантов крепления для установки:</p>\r\n\r\n<p>на железобетонных опорах прямоугольного сечения СВ95 (СВ 110);<br />\r\nна стойке;<br />\r\nна стене помещения.</p>\r\n\r\n<p>Шкаф ШРУ комплектуется: выключателями нагрузки на входе, счетчиками учета электроэнергии и автоматическими выключателями на выходе.</p>\r\n\r\n<p>Номинальный ток автоматического выключателя и тип счетчика указывает заказчик.<br />\r\nПо заявке заказчика может быть изготовлен шкаф ШРУ без комплектации или с неполной комплектацией.</p>\r\n\r\n<p>Конструктивно шкаф ШРУ имеет одно отделение и одну дверь. Дверь шкафа выполнена в антивандальном исполнении, имеет жесткую конструкцию и плотно прилегает к корпусу шкафа, что исключает возможность попадания влаги во внутрь и последующее обмерзание и заклинивание (при отрицательных температурах). Дверь имеет петли внутренней установки и уплотнение из резинового профиля. Замок двери имеет единый спецключ с достаточным уровнем секретности.По заявке заказчика может быть изготовлен шкаф ШРУ без комплектации или с неполной комплектацией.</p>\r\n\r\n<p>Коммутационные приборы закрываются защитной панелью. В защитной панели предусмотрено отверстие для опломбирования. Для потребителя в защитной панели имеется окошко для снятия показаний с приборов учета и имеется доступ для отключения нагрузки.</p>\r\n\r\n<p>Ввод и вывод проводов может осуществляться как снизу шкафа, так и сверху в зависимости от способа установки.</p>\r\n', 3, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (15, 'Щиток этажный ЩЭ', '<p>Шкафы распределительно-учетные ЩЭ предназначены для приема, распределения и учета электроэнергии, а также защиты отходящих линий при перегрузках и коротких замыканиях.</p>\r\n\r\n<p>Шкафы ЩЭ применяются в многоквартирных жилых и общественных зданиях.</p>\r\n\r\n<p>Шкафы ЩЭ используются в сетях напряжением 380/220В переменного тока частотой 50 Гц с типом систем заземления TN-C, TN-S или TN-C-S.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nШкафы распределительно-учетные ЩЭ состоят из металлического каркаса, разделенного на 3 отсека:</p>\r\n\r\n<p>Вводно-учетного, в котором размещаются панели для счетчиков электроэнергии по количеству квартир. Съемная монтажная рама позволяет без дополнительных переходников установить любые типы однофазных счетчиков. В этом же отсеке предусмотрено место для установки автоматического выключателя для отключения магистральной линии.</p>\r\n\r\n<p>Распределительного, в котором располагаются DIN-рейки для установки автоматических выключателей и УЗО, обеспечивающих защиту групповых линий каждой квартиры. Для обеспечения электробезопасности обслуживающего персонала отсек имеет оперативную панель (фальш-панель), снять которую возможно только с применением специального инструмента.<br />\r\nОтсека слаботочного оборудования, в котором установлены перфорированные профили для прокладки теле- и радиосетей, телефонных линий, линий пожарно- охранной сигнализации, сети домофонов, видеонаблюдения и т.п., а также для установки соединительных или ответвительных коробок для каждой из сетей.</p>\r\n\r\n<p>Каждый из отсеков закрывается отдельной дверцей с индивидуальным замком. Дверца вводно-учетного отсека имеет застекленные отверстия, для снятия показаний электросчетчиков.</p>\r\n\r\n<p>В щитке этажном устанавливаются нулевая защитная шина РЕ, имеющая электрическую связь с открытыми проводящими частями ЩЭ, и нулевые рабочие шины N &ndash; изолированные от них.</p>\r\n\r\n<p>По количеству запитываемых квартир ЩЭ выпускаются в трех исполнениях:</p>\r\n\r\n<p>для двух квартир &mdash; ЩЭ2;<br />\r\nдля трех квартир &ndash; ЩЭ3;<br />\r\nдля четырех квартир &ndash; ЩЭ4.</p>\r\n', 3, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (16, 'КТП серии КТП-РТН-К', '<p>Подстанции трансформаторные комплектные серии КТП-РТН-К киоскового типа (КТП) негерметизированные в металлических оболочках общего назначения, предназначенные для приема электрической энергии трехфазного переменного тока частоты 50 Гц напряжением 6 или 10 кВ, транзита её (КТП проходного типа), преобразования в напряжение 0,4 кВ и распределения её потребителям различных отраслей народного хозяйства.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nВысоковольтный ввод в подстанцию и выводы отходящих линий воздушные или кабельные.<br />\r\nШкафное исполнение. Основные составные части соединяются болтовыми соединениями.<br />\r\nУчет активной электрической энергии. По требованию заказчика возможна установка счетчика реактивной энергии, а также счетчика любой модификации (совмещенного, электронного и т.д.).</p>\r\n\r\n<p>Внутреннее освещение и обогрев аппаратуры. Включение электронагревателей может производиться вручную или автоматически.<br />\r\nИмеется фидер уличного освещения, который оснащен устройством ручного и автоматического включения и отключения. По требованию заказчика возможно исполнение КТП без фидера уличного освещения.<br />\r\nКонтроль тока и напряжения на стороне 0,4 кВ.<br />\r\nКТП с воздушным вводом подключается к ЛЭП 10 кВ посредством разъединителя наружной установки, который устанавливается на ближайшей от КТП опоре ЛЭП. Разъединитель имеет стационарные заземляющие ножи со стороны КТП. Поставляется по отдельному заказу.<br />\r\nКТП имеет следующие составные части:<br />\r\n&mdash; устройство со стороны высшего напряжения (УВН) 6; 10 кВ;<br />\r\n&mdash; силовой трансформатор;<br />\r\n&mdash; распределительное устройство со стороны низшего напряжения (РУНН) 0,4 кВ с автоматическими выключателями на отходящих линиях и линией уличного освещения.</p>\r\n\r\n<p>Электрические и механические блокировки (в целях обеспечения безопасной работы обслуживающего персонала и исключения ошибочных переключений) по ГОСТ 12.2.007.4.<br />\r\nВысоковольтные и трансформаторные отсеки имеют защитные и сетчатые ограждения (для осмотра высоковольтного оборудования подстанции без снятия напряжения).<br />\r\nСтепень защиты оболочки &mdash; IP 34 (для шкафа трансформатора &mdash; IP 23).<br />\r\nБезопасны для окружающей среды.<br />\r\nКомплектуется современными трансформаторами герметичного исполнения (серии ТМГ).<br />\r\nКлиматическое исполнение &ndash; У1 по ГОСТ 15150-69.<br />\r\nУсловия эксплуатации:<br />\r\n&mdash; наибольшая высота над уровнем моря &mdash; не более 1000 м;<br />\r\n&mdash; рабочий диапазон температуры окружающей среды: от минус 45 до плюс 40 0С;<br />\r\n&mdash; тип атмосферы &mdash; II по ГОСТ 15150-69;<br />\r\n&mdash; окружающая среда &mdash; не содержащая токопроводящей пыли, агрессивных газов и паров в концентрациях, снижающих параметры КТП в недопустимых пределах.</p>\r\n\r\n<p>КТП не предназначены для установки и эксплуатации в сейсмоопасных, взрывоопасных и пожароопасных зонах.<br />\r\nПривлекательный эстетический вид.<br />\r\nГарантийный срок эксплуатации &mdash; два года со дня ввода в эксплуатацию, но не более 3-х лет со дня получения заказчиком, при соблюдении условий транспортирования, хранения, монтажа и эксплуатации.<br />\r\nСредний срок службы &mdash; 25 лет.</p>\r\n', 4, 1, '2021-04-23 23:36:16');
INSERT INTO `core_items` VALUES (17, 'КТП серии КТП-РТН-С', '<p>Комплектные трансформаторные подстанции КТП-РТН-С столбовые предназначены для приёма, преобразования и распределения электрической энергии трёхфазного переменного тока частотой 50 Гц, для электроснабжения отдельных населённых пунктов, небольших промышленных объектов и прочих потребителей электроэнергии.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКТП представляет собой однотрансформаторную подстанцию наружной установки, с воздушными вводами высокого напряжения и кабельными или воздушными выводами низкого напряжения.<br />\r\nОсобенности КТП:</p>\r\n\r\n<p>Выводы отходящих линий на стороне НН по требованию заказчика кабельные или воздушные;<br />\r\nНа отходящих фидерах 0,4 кВ устанавливаются:<br />\r\n&ndash; рубильники-предохранители;</p>\r\n\r\n<p>&ndash; автоматические выключатели.</p>\r\n\r\n<p>Установка производится на стойку СВ-105-5.0, монтаж и подключение к сети осуществляется в соответствии с действующими типовыми проектами.</p>\r\n\r\n<p>Степень защиты оболочки шкафа РУНН &ndash; IP-54.</p>\r\n\r\n<p>Цепи ВН КТП устойчивы к токам короткого замыкания 10 кА в течение 3 с.</p>\r\n', 4, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (18, 'КТП серии КТП-РТН–Б', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 4, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (19, 'КТП серии КТП-РТН–У', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 4, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (20, 'Устройства релейной защиты и автоматики', '<p>Назначение<br />\r\nУстройства микропроцессорные защиты и автоматики серии РТН-200 (далее &ndash; защита РТН-200) обеспечивают выполнение функций релейной защиты, автоматики, управление и сигнализации присоединений напряжением 6 &mdash; 35 кВ, а также используются в качестве устройств резервной защиты и автома-тики для присоединений 110 кВ.<br />\r\nЗащита РТН-200 подходит и для цепей с изолированной нейтралью и сетей с заземленной нейтралью.<br />\r\nЗащита РТН-200 также используется как резервная защита двигателей, трансформаторов на подстанциях, энергетических<br />\r\nобъектах и промышленных предприятиях.<br />\r\nНабор заданных конфигураций состоит из базовых и расширенных для под-стройки под Вашу специфику. Базовые конфигурации состоят из типичных защит и контроля в зависимости от назначения терминала. Базовые конфигурации мо-гут использоваться с расширенными дополнительными функциями &ndash; расширен-ные конфигурации.</p>\r\n\r\n<p>Защиты РТН-200 воплощают концепцию резервирования аппаратных и про-граммных средств, реализуя тем самым, требования к особо ответственным энер-гетическим объектам.<br />\r\nЗащиты РТН-200 поддерживают широкий спектр стандартных протоколов связи, в том числе Modbus RTU.</p>\r\n', 5, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (21, 'Разъединители РЛНД 10 кВ', '<p>Описание<br />\r\nРазъединители типа РЛНД на напряжение 10 кВ предназначены для универсального использования в высоковольтных сетях и на открытых подстанциях переменного тока частотой 50 Гц секционирования сетей и отсоединения от сети потребителей без тока нагрузки, для образования видимого промежутка в линии.<br />\r\nУстройство разъединителей РЛНД<br />\r\nРазъединитель РЛНД выполнен в виде двухполюсного или трехполюсного аппарата горизонтально-поворотного типа, каждый полюс которого имеет один поворотный и один неподвижный изоляторы, на которых расположена контактная система.<br />\r\nРазъединитель состоит из следующих составных частей: рамы, подвижных колонок изоляторов, неподвижных колонок изоляторов, токоведущей системы и заземляющего контура.<br />\r\nРама имеет сварную конструкцию. К раме крепятся с одной стороны подвижные, а с другой стороны &ndash; неподвижные изоляторы.</p>\r\n\r\n<p>На верхних фланцах изоляторов разъединителя установлены контактные ножи, токоведущая система которых изготовлена из меди или латуни<br />\r\nКонтактные ножи подвижных колонок (главные ножи разъединителя) служат для отключения потребителей без нагрузки и образования видимого разрыва. Каждый нож состоит из двух параллельно расположенных ламелей, между которыми устанавливается токопроводящая пластина. Пластина соединена с выводом разъединителя посредством гибкой связи из ленточной меди.<br />\r\nКаждый нож неподвижной колонки представляет собой медную или латунную шину, которая одновременно является и выводом разъединителя.<br />\r\nЗаземляющие ножи изготовлены из полосовой стали и приварены к валу заземления, который соединен с рамой при помощи гибких связей из ленточной меди.<br />\r\nКонтакты заземления находятся на главных ножах.<br />\r\nРазъединители могут поставляться с комплектом металлоконструкций для монтажа их на железобетонной опоре СВ-110-35 соединительными элементами, полностью исключающими сварочные работы при монтаже комплекса &laquo;разъединитель-привод&raquo;.<br />\r\nРазъединители на базе полимерных изоляторов отличаются повышенной надежностью при тяжелых условиях эксплуатации.<br />\r\nРазъединители исполнения УХЛ1 имеют дополнительные защитные кожуха на основных контактных ножах.<br />\r\nНазначение<br />\r\nРазъединитель является коммутационным аппаратом включение и отключение главной цепи которого осуществляется путём разворота главных контактов в горизонтальной плоскости.<br />\r\nРазмыкаемые соединения главного и заземляющего контуров осуществляются через ламельные контакты, контактное нажатие в которых создается пружинами.<br />\r\nВ двухполюсном и трёхполюсном разъединителях конструкция полюсов, а также предусмотренный способ их соединения обеспечивают одновременное для всех полюсов включение (отключение) главной цепи или цепи заземляющих ножей.<br />\r\nУправление главными и заземляющими ножами осуществляется при помощи поворота соответствующих рукояток привода.<br />\r\nПри включении или отключении главных и заземляющих ножей соответствующая рукоятка привода с фигурным диском поворачивается до ограничителя- поворота. Ограничитель фиксирует поворот рукоятки привода на угол, достаточный для производства полного включения и отключения главных и заземляющих ножей разъединителя.<br />\r\nГарантийный срок эксплуатации &ndash; 5 лет со дня ввода в эксплуатацию</p>\r\n', 6, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (22, 'Разъединители РВ, РВЗ, РВФЗ 10 кВ', '<p>Описание<br />\r\nТрехполюсные разъединители типа РВ, РВЗ и РВФЗ представляют собой три токопровода, установленные на одной раме с основным общим валом и приводным рычагом.<br />\r\nЗаземляющие ножи смонтированы на дополнительном валу, который укреплен в общей раме разъединителя.<br />\r\nМежду валом контактных ножей и валом заземляющих ножей предусмотрена механическая блокировка, которая исключает одновременное включение контактных и заземляющих ножей.<br />\r\nПринцип работы разъединителей<br />\r\nПри вращении вала разъединителя с помощью привода (рычажного механизма, предназначенного для ручного включения и отключения разъединителей) происходит одновременное включение или отключение трех контактных ножей.</p>\r\n\r\n<p>Назначение<br />\r\n-для отключения и включения под напряжением участков электрической цепи высокого напряжения при отсутствии нагрузочного тока или для изменения схемы соединения;<br />\r\n-для безопасного производства работ на отключенном участке;<br />\r\n-для включения и отключения зарядных токов воздушных и кабельных линий, токов холостого хода трансформаторов и токов небольших нагрузок;<br />\r\n-для заземления основного токоведущего контура со стороны снятого напряжения.<br />\r\nСрок службы &ndash; 10 лет;<br />\r\nГарантийный срок службы &ndash; 3 года со дня ввода в эксплуатацию.</p>\r\n', 6, 1, '2021-04-24 20:30:05');
INSERT INTO `core_items` VALUES (23, 'Разъединители РЛК', '<p>Описание<br />\r\nРазъединители РЛК выполнены качающегося типа в трёхполюсном исполнении.<br />\r\nРазъединители состоят из рамы, изоляции, токоведущей системы, заземляющего контура и металлоконструкции для установки на опоре.<br />\r\nРама РЛК повышенной жесткости представляет собой сварную конструкцию из гнутых швеллеров, на которые устанавливаются изоляторы и заземлители.<br />\r\nИзоляция каждого полюса разъединителя РЛК состоит их трех полимерных изоляторов.<br />\r\nТоковедущая система РЛК состоит из главного ножа, основного контакта и гибкой связи.<br />\r\nГлавный нож установлен на неподвижном изоляторе и представляет собой медную изогнутую пластину, один из концов которой является контактным выводом разъединителя.<br />\r\nУправление разъединителем РЛК производится приводом.<br />\r\nСвязь между разъединителем РЛК и приводом выполнена из стальной трубы, которая не входит в стандартную комплектацию и при необходимости данный элемент оговаривается заказчиком в заявке на покупку изделия.<br />\r\nКаждый полюс разъединителя имеет две неподвижные колонки, установленные на раме, и одну подвижную, установленную на подвижном кронштейне и имеющую возможность качаться в направлении продольной оси разъединителя.</p>\r\n\r\n<p>Разъединители специального назначения типа РЛК-С (с дугогасительной системой) предназначены также для отключения тока до 18 А, токов холостого хода трансформаторов и зарядных токов воздушных и кабельных линий до 8 А.<br />\r\nНазначение<br />\r\nРазъединители предназначены для горизонтальной установки и управляются приводами (рычажными механизмами, предназначенными для ручного включения и отключения разъединителей) типа ПР-2Б с механическими блок-замками.</p>\r\n', 6, 1, '2021-04-24 22:24:26');
INSERT INTO `core_items` VALUES (24, 'Разъединитель РДЗ', '<p>Разъединители РДЗ изготавливаются из отдельных полюсов, которые могут соединяться в один однополюсный, двухполюсный или трехполюсный аппарат, устанавливаемый на горизонтальной плоскости.<br />\r\nКонструктивно полюс разъединителя выполнен в виде двухколонкового аппарата с разворотом главных ножей на 90&deg; в горизонтальной плоскости и состоит из цоколя, изоляционных колонн, токоведущей системы и заземляющего устройства.<br />\r\nКонтактные ножи разъединителя выполнены из двух медных параллельных шин, установленных &laquo;на ребро&raquo;, один конец которых гибкими связями соединен с контактным выводом, а на другом образован разъемный контакт.</p>\r\n\r\n<p>Полюс, к которому присоединяется привод, является ведущим.<br />\r\nУ двухполюсного и трёхполюсного разъединителей остальные полюса являются ведомыми. Соединение ведущего полюса с приводом и ведущего полюса с ведомыми выполняется потребителем при подготовке разъединителя к использованию.<br />\r\nПриводы предназначены для оперирования разъединителями. Поворот приводных валов главной цепи и цепи заземлителя осуществляется вручную, с помощью привода ПР-2Б с механическими блок-замками или привода ПРГ с электромагнитными блок-замками.</p>\r\n\r\n<p><br />\r\nДлина пути утечки внешней изоляции серийных разъединителей на фарфоровых изоляторах составляет:</p>\r\n\r\n<ul>\r\n	<li>с изоляцией для степени загрязненности I &ndash; не менее 70 cм;</li>\r\n	<li>с изоляцией для степени загрязненности II &ndash; не менее 105 cм.</li>\r\n</ul>\r\n', 6, 1, '2021-04-24 22:24:26');
INSERT INTO `core_items` VALUES (25, 'Выключатель нагрузки ВН 10 кВ', '<p><strong>Описание</strong><br />\r\nВыключатели нагрузки выполнены в трехполюсном исполнении, с автогазовым гашением дуги. Встроенным пружинным приводом главной цепи и ножами заземления (сверху и снизу), и без заземляющих ножей, управляемыми вручную с помощью съемной рукоятки (местное управление). Кроме того выключатель нагрузки имеет:<br />\r\n&mdash; электромагнит отключения<br />\r\n&mdash; для обеспечения возможности автоматического отключения (в том числе при перегорании предохранителей);<br />\r\n&mdash; вспомогательные контакты (замыкающий и размыкающий)<br />\r\n&mdash; для использования в цепях управления и сигнализации.</p>\r\n\r\n<p><strong>Назначение</strong><br />\r\nВыключатель нагрузки предназначен для коммутации и длительного пропускания номинальных токов в трехфазных цепях переменного тока частоты 50 Гц номинальным напряжением до 10 кВ с изолированной или заземленной нейтралью.<br />\r\nВыключатели нагрузки применяют в составе комплектных электротехнических распределительных устройств, устанавливаемых в помещениях.</p>\r\n', 6, 1, '2021-04-24 22:24:26');
INSERT INTO `core_items` VALUES (26, 'Вакуумный выключатель ВВ/РТН-10', '<p>Выключатель вакуумный серии ВВ/РТН-10 трехполюсного исполнения с пружинным приводом предназначен для коммутации тока в сетях трёхфазного переменного тока частоты 50 Гц с номинальным напряжением не более 10 кВ с изолированной или компенсированной нейтралью. Выключатель обеспечивает оперативную коммутацию потребителей электроэнергии при нормальных и аварийных режимах с номинальным током нагрузки до 1600 А и токами короткого замыкания до 31,5 кА.</p>\r\n\r\n<p>Выключатель предназначен для использования в металлических оболочках комплектных распределительных устройств (КРУ) внутренней установки, устанавливаемых в помещениях категории размещения 3 по ГОСТ 15150-69 с нижним рабочим значением температуры воздуха при эксплуатации минус 25&deg;С.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nВыключатели реализуются в двух исполнениях:<br />\r\nдля эксплуатации в стационарном исполнении<br />\r\nдля эксплуатации в выкатном исполнении с контактами типа тюльпан на выкатной кассете.</p>\r\n\r\n<p>Выключатель предназначен для выполнения следующих операций:<br />\r\nдистанционное оперативное включение и отключение;<br />\r\nручное неоперативное включение и отключение;<br />\r\nавтоматическое повторное включение (выполнение нормированных циклов) по ГОСТ 687-78 и ГОСТ Р 52565-2006 (при поставке в РФ) &laquo;О‑0,3с‑ВО&raquo;, &laquo;О-0,3с-ВО-180с-ВО&raquo; и &laquo;О-0,3с-ВО-20с-ВО&raquo;;<br />\r\nотключение и включение номинальных токов;<br />\r\nавтоматическое отключение и включение токов короткого замыкания.</p>\r\n\r\n<p>Включение и отключение выключателя осуществляется за счет запасенной энергии включающей и отключающей пружины.</p>\r\n', 6, 1, '2021-04-24 22:24:26');
INSERT INTO `core_items` VALUES (27, 'Блоки испытательные БИ-4, БИ-6', '<p>Блоки испытательные серии БИ предназначены для коммутации электрических цепей контроля и защиты переменного напряжения до 380 В частоты 50 и 60 Гц и постоянного напряжения до 220 В и используются в качестве многополюсных штепсельных разъемов в цепях релейной защиты, автоматики и измерительных приборов.<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nТипы блоков испытательных серии БИ:<br />\r\nБИ-4 &ndash; четырехполюсные;<br />\r\nБИ-6 &ndash; шестиполюсные.</p>\r\n\r\n<p>Блоки испытательные обеспечивают заднее и переднее присоединение внешних проводников.</p>\r\n\r\n<p>Вид климатического исполнения УХЛ3 и Т3 по ГОСТ 15150.<br />\r\nСпособ крепления: винтами М4х20 на монтажную панель или дверь.</p>\r\n\r\n<p>Категория применения &mdash; АС-20 и ДС-20 по ГОСТ 12434.<br />\r\nПоложение в пространстве &ndash; любое.</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (28, 'Указатель наличия напряжения УНН-10', '<p>Указатель наличия напряжения УНН-10 предназначен для определения наличия напряжения фаз 10; 6 или 0,4 кВ частотой 50 Гц на токоведущих частях электроустановок, в том числе, комплектных распределительных устройств (КРУ, КСО).</p>\r\n\r\n<p><strong>ОБЩИЕ СВЕДЕНИЯ</strong><br />\r\nДля подключения к токоведущим частям электроустановок 10, 6 кВ в комплект поставки указателя входят емкостные датчики высокого напряжения DCP-10.</p>\r\n\r\n<p>Датчики высокого напряжения и указатель устанавливаются стационарно.</p>\r\n\r\n<p>Два релейных выхода указателя предназначены для сигнализации об отсутствии контролируемого напряжения на всех фазах, неполнофазном режиме и нормальном режиме работы электроустановки.</p>\r\n\r\n<p>Указатель наличия напряжения УНН-10 предназначен для определения наличия напряжения фаз 10; 6 или 0,4 кВ частотой 50 Гц на токоведущих частях электроустановок, в том числе, комплектных распределительных устройств (КРУ, КСО). ОБЩИЕ СВЕДЕНИЯ Для подключения к токоведущим частям электроустановок 10, 6 кВ в комплект поставки указателя входят емкостные датчики высокого напряжения DCP-10.</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -71px; top: 47px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (29, 'Предохранитель-выключатель- разъединитель ПВР', '<p>Предохранитель-выключатель-разъединитель типа ПВР-0,38 на номинальное напряжение 0,38 кВ предназначен для включения, пропускания и отключения переменного тока сети, а также защиты от перегрузок и коротких замыканий посредством плавких вставок.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nПВР устанавливается на кронштейне и может использоваться:</p>\r\n\r\n<p>для подключения отходящих линий на мачтовых и столбовых подстанциях;<br />\r\nсекционирования воздушных линий;<br />\r\nзащиты ответвлений воздушных линий;<br />\r\nзащиты трансформаторов со стороны 0,38 кВ.<br />\r\nПВР по конструктивному исполнению выполнен в виде одно-, двух- или трёх- полюсного аппарата на общем основании , имеет откидывающуюся съемную часть с плавкими вставками габарита 00.</p>\r\n\r\n<p>Оперирование производится с земли при помощи оперативной штанги вручную.</p>\r\n\r\n<p>Сверху ПВР закрывается съёмным кожухом.</p>\r\n\r\n<p>ПВР-3-0,38 может комплектоваться рубильником-заземлителем, предназначенным для заземления, отключенной при помощи ПВР-3-0,38, отходящей линии на мачтовых и столбовых подстанциях при выполнении ремонтных и профилактических работ.</p>\r\n\r\n<p>Скрыть</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (30, 'Переключатель поворотный кухонных плит ППКП', '<p>Переключатель поворотный кухонных плит ППКП предназначен для ручного переключения мощности кухонных плит путем изменения схемы включения нагревательных элементов.<br />\r\nЭксплуатация переключателя осуществляется в следующих условиях: температура окружающей среды &mdash; не более 80&deg;С; относительная влажность &mdash; не более 90%.<br />\r\nКонструкция переключателя допускает поворот ручки в обе стороны от нулевого положения.<br />\r\nБезопасная эксплуатация переключателя обеспечивается использованием ручки, зафиксированной с помощью шурупа и электроизоляционного клина на квадратной оси кулачка.<br />\r\nПереключатель может быть укомплектован различными ручками в зависимости от исполнения.</p>\r\n\r\n<p>Переключатель имеет четыре фиксированных положения:<br />\r\n&mdash; нулевое &mdash; нагрузка отключена (все контакты разомкнуты);<br />\r\n&mdash; первое &mdash; последовательное включение двух электрических цепи нагрузки через контакты 1-3 и 2-4;<br />\r\n&mdash; второе &mdash; включение одной электрической цепи нагрузки через контакты 1-3 и 2-5;<br />\r\n&mdash; третье &mdash; параллельное включение двух электрических цепей нагрузки через контакты 1-3, 1-4 и 2-5.</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (31, 'Пробник напряжения универсальный', '<p>Пробник является переносным прибором и предназначен для:<br />\r\n&mdash; определения наличия фиксированных напряжений переменного и постоянного тока;<br />\r\n&mdash; определения полярности цепей постоянного тока;<br />\r\n&mdash; прозвонки цепей, в том числе обмоток электродвигателей; пускателей, трансформаторов, контакторов;<br />\r\n&mdash; проверки исправности диодов, транзисторов, тиристоров и т.д.<br />\r\nУстройство пробника<br />\r\nКорпус пробника изготовлен из пластмассы. На лицевой панели пробника расположены 6 светодиодов, индицирующих величину и полярность контролируемого напряжения. С одной стороны пробника расположен щуп с индикацией, а с другой стороны &mdash; гибкий щуп длиной не менее 1,3 м.</p>\r\n\r\n<p>В состав пробника входит накопительный конденсатор, который после кратковременной зарядки является источником э.д.с., что позволяет не применять в пробнике гальванических элементов. Зарядка пробника производится от сети переменного тока напряжением 110 &mdash; 380 В в течении 10 &ndash; 20 с.</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (32, 'Переключатели пакетные коммутационные ППК 16', '<p>Переключатели пакетные коммутационные ППК16 применяются в качестве коммутационных аппаратов в электрических цепях переменного тока частотой 50, 60 Гц с номинальным рабочим напряжением 24&hellip;380 В и постоянного тока с номинальным рабочим напряжением 24&hellip;220 В, а также в схемах управления и автоматики в качестве вольтметровых и амперметровых переключателей</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nПереключатели могут быть использованы в электрооборудовании промышленного и сельскохозяйственного машиностроения, в электрооборудовании речных и морских судов, в грузоподъемном оборудовании, в хозяйстве железнодорожного транспорта, в оборудовании управления и распределения электрической энергии коммунальных хозяйств и промышленных предприятий.</p>\r\n\r\n<p>Переключатели собраны из однотипных пластмассовых секций с контактной системой, подвижные контакты которой приводятся в действие кулачками, посаженными на общий металлический вал квадратного сечения.</p>\r\n\r\n<p>Количество коммутирующих цепей &mdash; от 1 до 20.</p>\r\n\r\n<p>Количество коммутационных положений рукоятки &mdash; от 2 до 8.</p>\r\n\r\n<p>Последовательность коммутации контактами электрических цепей нормальная &ndash; размыкание размыкающих контактов происходит ранее замыкания замыкающих контактов с минимальным временем 5 мс.</p>\r\n\r\n<p>Переключатели имеют упор, ограничивающий ход рукоятки в крайних положениях.</p>\r\n\r\n<p>Контактные зажимы переключателей допускают присоединение одного или двух проводников, разделанных под штырь, сечением от 1,0 до 4,0 мм2.</p>\r\n\r\n<p>Способ присоединения проводников &ndash; для бокового присоединения.</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (33, 'Переключатель кнопочный ПК-10', '<p>Переключатели кнопочные ПК-10 предназначены для коммутации электрических цепей управления переменного тока напряжением до 380 В частотой 50&divide; 60 Гц, а также постоянного тока напряжением до 220 В.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nПереключатели применяются для установки на подвижных и неподвижных частях стационарных установок и используются для комплектации панелей, пультов, постов и шкафов управления, в устройствах микропроцессорной техники, металлообрабатывающем оборудовании, автоматических линиях, промышленных роботах, на транспорте.<br />\r\nПереключатели оснащены посеребренными контактами, что значительно повышает их износостойкость, коммутационные параметры, а так же искробезопасность.</p>\r\n\r\n<p>Контактные зажимы переключателей (винты М4) допускают подсоединение к каждому зажиму двух медных или алюминиевых проводов сечением до 2,5 мм2.</p>\r\n\r\n<p>Корпуса и внутренние детали переключателей исполнены из трудногорючего ударопрочного материала.</p>\r\n\r\n<p>Переключатели выпускаются с управляющим элементом следующей цветовой гаммы: черные, красные, желтые.</p>\r\n\r\n<p>Рабочее положение в пространстве: любое.</p>\r\n', 7, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (34, 'Контакты втычные', '<p>Контакты втычные типа &laquo;Тюльпан&raquo; предназначены для использования в подвижных контактных соединениях.</p>\r\n\r\n<p>Контакты используются на выкатных элементах КРУ внутренней и наружной установки.</p>\r\n\r\n<p>Технические характеристики:<br />\r\nНоминальное рабочее напряжение &mdash; 10 кВ<br />\r\nНоминальный длительный ток &mdash; 630-1000 А<br />\r\nНоминальный режим эксплуатации &mdash; продолжительный<br />\r\nНоминальный диаметр контактного стержня &mdash; 24 мм, 36 мм<br />\r\nГабаритные размеры:<br />\r\nдлина &mdash; 51 мм<br />\r\nдиаметр &mdash; 47 мм, 59 мм</p>\r\n\r\n<p>Контакты втычные типа &laquo;Тюльпан&raquo; предназначены для использования в подвижных контактных соединениях. Контакты используются на выкатных элементах КРУ внутренней и наружной установки. Технические характеристики: Номинальное рабочее напряжение &mdash; 10 кВ Номинальный длительный ток &mdash; 630-1000 А Номинальный режим эксплуатации &mdash; продолжительный Номинальный диаметр контактного стержня &mdash; 24 мм, 36 мм Габаритные размеры: длина &mdash; 51 мм</p>\r\n', 8, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (35, 'Кабель-канал', '<p>Цепной кабель-канал (система защиты кабеля) &mdash; необходимый элемент современных машин и механизмов, в которых используется подвижная проводка.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКабель-канал обеспечивает равномерный изгиб жгута, а также защищает изгибающийся жгут от механических воздействий, которые ведут к перелому в местах изгиба и частым повреждениям незащищенного жгута.</p>\r\n\r\n<p>Использование кабель-каналов возможно при серийной комплектации изделий и в таких областях, как ремонт и модернизация устаревшего оборудования.</p>\r\n\r\n<p>Открытая конструкция кабель-канала дает возможность наблюдать за состоянием провода и легко проводить его монтаж и демонтаж.</p>\r\n\r\n<p>Возможны следующие варианты установки кабель-канала: горизонтальная, вертикальная и под наклоном.</p>\r\n\r\n<p>Габаритные размеры (12 звеньев)</p>\r\n\r\n<p>Цепной кабель-канал (система защиты кабеля) &mdash; необходимый элемент современных машин и механизмов, в которых используется подвижная проводка. ОБЩИЕ СВЕДЕНИЯ Кабель-канал обеспечивает равномерный изгиб жгута, а также защищает изгибающийся жгут от механических воздействий, которые ведут к перелому в местах изгиба и частым повреждениям незащищенного жгута. Использование кабель-каналов возможно при серийной комплектации изделий.</p>\r\n', 8, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (36, 'Лоток кабельный', '<p>Лоток кабельный в комплекте с крышкой предназначен для прокладки в нем кабелей.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКабельный лоток и крышка кабельного лотка имеют ребра жесткости и замок.</p>\r\n\r\n<p>Применение лотков кабельных ускоряет сборку элементов кабельных трасс при монтаже оборудования, реализует доступ к элементам наполнения и их сохранность в процессе эксплуатации.<br />\r\nТЕХНИЧЕСКИЕ ХАРАКТЕРИСТИКИ<br />\r\nГабаритные размеры (стандартные):</p>\r\n\r\n<p>&mdash; высота: Н=100 мм;</p>\r\n\r\n<p>&mdash; ширина: В=200 мм;</p>\r\n\r\n<p>&mdash; длина: L=2000 мм.</p>\r\n\r\n<p>По желанию заказчика возможно изготовление лотка других габаритных размеров.</p>\r\n\r\n<p>Материал: оцинкованная сталь толщиной 1,0 мм.</p>\r\n\r\n<p>Возможна пробивка дополнительных отверстий, а также покрытие порошковой краской различного цвета.</p>\r\n\r\n<p>Лоток кабельный в комплекте с крышкой предназначен для прокладки в нем кабелей. ОБЩИЕ СВЕДЕНИЯ Кабельный лоток и крышка кабельного лотка имеют ребра жесткости и замок. Применение лотков кабельных ускоряет сборку элементов кабельных трасс при монтаже оборудования, реализует доступ к элементам наполнения и их сохранность в процессе эксплуатации. ТЕХНИЧЕСКИЕ ХАРАКТЕРИСТИКИ Габаритные размеры (стандартные): &mdash; высота: Н=100&nbsp;</p>\r\n', 8, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (37, 'DIN-рейка', '<p>Направляющая применяется для монтажа (без монтажного инструмента и крепежных деталей) компонентов и модулей одного типоразмера (устройств электрооборудования, выполненного для крепления на Din-рейку).<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nНаправляющая соответствует рейке DIN3 (размер 35х15 мм, толщина 1,2 мм).</p>\r\n\r\n<p>Направляющая выполнена из оцинкованной стали с хроматированием, обладает хорошими механическими свойствами и обеспечивают высокую скорость и высокое качество монтажа.</p>\r\n\r\n<p>Для крепления направляющих используются угловые монтажные кронштейны.</p>\r\n\r\n<p>L=160&hellip;..1650 мм</p>\r\n\r\n<p>Масса 1 мп=0,6 кг</p>\r\n\r\n<p>Масса кронштейна=0,07 кг</p>\r\n', 8, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (38, 'Котел отопительный КС-Т', '<p>Котлы КС-Т-12,5 предназначены для отопления индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКотлы КС-Т-12,5 работают на твердом топливе.</p>\r\n\r\n<p>Расчетным топливом является антрацит марки АО.</p>\r\n\r\n<p>Допускается использовать каменные и бурые угли, дрова, предназначенные для бытовых нужд.</p>\r\n\r\n<p>Котлы представляют собой сварную конструкцию прямоугольной формы, состоящую из топки, конвективного газохода и декоративного кожуха.</p>\r\n\r\n<p>В нижней части топки устанавливают колосники и шуровочный щиток.</p>\r\n\r\n<p>Топка котла сконструирована так, чтобы наиболее эффективно обеспечить качественный и экономичный нагрев воды в котле.</p>\r\n\r\n<p>Специальные стальные надстройки, которые максимально задерживают пламя в котле, позволяют сэкономить топливо и повысить эффективность отопительного котла.</p>\r\n\r\n<p>С помощью заслонки в нижней дверце котла можно вручную регулировать поток воздуха через топочную камеру с помощью регулировочного винта и тем самым изменять интенсивность горения топлива.</p>\r\n\r\n<p>Срок службы котлов не менее 15 лет.</p>\r\n', 9, 1, '2021-04-24 22:36:25');
INSERT INTO `core_items` VALUES (39, 'Котел отопительный КС-Г', '<p>Котлы предназначены для отопления индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом. Принцип работы котлов основан на длительном и эффективном сжигании природного газа с помощью газогорелочных устройств, снабженных автоматическим регулированием и контролем безопасности работы.<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nПринцип работы котлов основан на длительном и эффективном сжигании природного газа с помощью газогорелочных устройств, снабженных автоматическим регулированием и контролем безопасности работы.</p>\r\n\r\n<p>Котлы предназначены для отопления индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом. Принцип работы котлов основан на длительном и эффективном сжигании природного газа с помощью газогорелочных устройств, снабженных автоматическим регулированием и контролем безопасности работы. ОБЩИЕ СВЕДЕНИЯ Принцип работы котлов основан на длительном и [&hellip;]</p>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (40, 'Котел отопительный КС-ТГ', '<p>Котлы предназначены для отопления индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКотлы серии КС-ТГ являются универсальными и могут работать, как на твердом топливе, так и на природном газе.</p>\r\n\r\n<p>Котлы представляют собой сварную конструкцию прямоугольной формы, состоящую из топки, конвективного газохода и декоративного кожуха.</p>\r\n\r\n<p>Для работы на твердом топливе в нижней части топки устанавливают колосники и шуровочный щиток.</p>\r\n\r\n<p>На корпусе котла установлен термометр, показывающий температуру воды на выходе из котла.</p>\r\n\r\n<p>Срок службы котлов не менее 15 лет.</p>\r\n\r\n<p>Для работы на природном газе котлы комплектуется газогорелочными устройствами серии УГГ с автоматикой регулирования безопасности &laquo;Арбат&raquo;.</p>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (41, 'Котел отопительный КС-ТГВ', '<p>Котлы предназначены для автономных систем отопления и горячего водоснабжения (подогрева водопроводной воды) индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКотлы могут работать, как на твердом топливе, так и на природном газе. Для работы на природном газе котлы комплектуются газогорелочными устройствами с автоматикой безопасности &laquo;Арбат&raquo;.</p>\r\n\r\n<p>Котлы оснащены контуром горячего водоснабжения.<br />\r\nСрок службы котлов не менее 15 лет</p>\r\n\r\n<p>Котлы предназначены для автономных систем отопления и горячего водоснабжения (подогрева водопроводной воды) индивидуальных жилых домов, зданий и сооружений, оборудованных системами водяного отопления непрерывного действия с естественной циркуляцией теплоносителя и открытым расширительным сосудом. ОБЩИЕ СВЕДЕНИЯ Котлы могут работать, как на твердом топливе, так и на природном газе. Для работы на природном газе котлы комплектуются газогорелочными устройствами [&hellip;]</p>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (42, 'Котел отопительный КОС-ТВ', '<p>Отопительные водогрейные котлы КОС-ТВ с вертикальной загрузкой предназначены для сжигания твердого топлива (уголь, древесное топливо).</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nБольшой размер двери загрузочной камеры и керамическая вставка позволяет сжигать влажную древесину размером до 40 см.</p>\r\n\r\n<p>Котлы оборудованы системой автоматического контроля режима горения, которая обеспечивает поддержание пламени без необходимости повторного розжига.</p>\r\n\r\n<p>Благодаря правильному выбору размера топки и поверхности теплообменника сжигается столько топлива, сколько необходимо для поддержания заданных параметров, что позволяет добиться КПД выше 84% при значительной экономии топлива.</p>\r\n\r\n<p>Толщина металлических стенок камеры сгорания &ndash; 6 мм.</p>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (43, 'Котел отопительный КОС-ТВ-А', '<p>Котел КОС-ТВА-25 это современная полностью автоматизированная отопительная установка для сжигания твердого топлива.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nИспользуемое топливо:</p>\r\n\r\n<p>Основное &mdash; уголь, топливные гранулы (грануляция 5 &mdash; 20 мм);<br />\r\nТопливо замены &ndash; крупные щепки.</p>\r\n\r\n<p>Котел оборудован системой автоматического контроля режима горения, которая обеспечивает поддержание пламени без необходимости повторного розжига.</p>\r\n\r\n<p>Подача топлива дозируется автоматически через винт подачи бункера промежуточной загрузки, в зависимости от желаемой температуры.<br />\r\nИспользование топки с колосниками позволяет сжигать оптимальное количество топлива, необходимое для поддержания заданных параметров, благодаря чему КПД котла достигает 84% при значительной экономии топлива.</p>\r\n\r\n<p>Дополнительно котел оснащен аварийной решеткой, позволяющей сжигать другие виды топлива в случае отсутствия электричества или перебоев подачи основного топлива.</p>\r\n\r\n<p>Обслуживание котла несложно и сводится к загрузке топлива в бункер промежуточной загрузки и удаления золы из зольника.</p>\r\n\r\n<p>Толщина металлических камеры сгорания &ndash; 6 мм.</p>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (44, 'Котел отопительный КОС-ЭЭ', '<p>&nbsp;&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -164px; top: 38px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>\r\n', 9, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (45, 'Устройство газогорелочное УГГ', '<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nУстройство газогорелочное с автоматическим регулированием и контролем безопасности работы, предназначено для сжигания газа в аппаратах отопительных бытовых с водяным контуром и котлах отопительных водогрейных. Устройство применяется при газификации жилых домов и для перевода ранее установленного оборудования с твердого топлива на природный газ.<br />\r\nГарантийный срок эксплуатации устройств &mdash; 2 года.<br />\r\nСрок службы &mdash; не менее 10 лет.<br />\r\nИзделия сертифицированы, удобны в ремонтном обслуживании.</p>\r\n', 10, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (46, 'Зеркала автомобильные для различных видов транспорта', '<p>Предназначены для обзора дороги с места водителя. Применяются на грузовых автомобилях и седельных тягачах всех типов как отечественного, так и импортного производства, а также на других видах транспортных средств. Корпус зеркал выполнен из ударопрочной пластмассы. Регулировка положения производится по вертикальной и горизонтальной осям. Зеркало МАЗ-020 (основное) устанавливается с двух сторон кабины, может использоваться в комплекте с широкоугольным &mdash; МАЗ-021 и зеркалом бокового обзора МАЗ-022, предназначенного для обзора обочины дороги и правого переднего колеса автомобиля.<br />\r\nСоответствуют Правилам ЕЭК ООН № 46.</p>\r\n\r\n<p>Зеркала наружные серии &laquo;БелАЗ&raquo;</p>\r\n\r\n<p>Предназначены для обзора дороги с места водителя. Применяются на карьерных самосвалах, машинах типа БелАЗ, грузовых автомобилях, троллейбусах, трамваях, автобусах. Корпус зеркал выполнен из металла. Регулировка положения производится по вертикальной и горизонтальной осям.<br />\r\nДиаметр крепления &ndash; 18-25 мм.<br />\r\nСоответствуют Правилам ЕЭК ООН № 46.</p>\r\n\r\n<p>Зеркала внутрисалонные</p>\r\n\r\n<p>Предназначены для полного обзора салона пассажирского транспорта и обеспечивают развернутую панораму обзора салона не искажая форму и цвет отражаемых предметов, что позволяет водителю свободно контролировать перемещение пассажиров.<br />\r\nУстанавливаются на автобусах и троллейбусах.<br />\r\nСоответствуют Правилам ЕЭК ООН № 46.</p>\r\n\r\n<p>Зеркала наружные серии &laquo;УАЗ&raquo;</p>\r\n\r\n<p>Предназначены для обзора дороги с места водителя. Применяются на микроавтобусах типа УАЗ, грузовых автомобилях. Корпус зеркал выполнен из ударопрочной пластмассы. Регулировка положения производится по вертикальной и горизонтальной осям. Диаметр крепления &ndash; 18-25 мм.<br />\r\nСоответствуют Правилам ЕЭК ООН № 46.</p>\r\n\r\n<p>Зеркала наружные серии &laquo;МТЗ&raquo;</p>\r\n\r\n<p>Предназначены для обзора дороги с места водителя. Применяются на тракторах а также на всех типах сельскохозяйственных и дорожностроительных машин. Корпус зеркал выполнен из ударопрочной пластмассы. Регулировка положения производится по вертикальной и горизонтальной осям.<br />\r\nДиаметр крепления &ndash; 18-25 мм.<br />\r\nСоответствуют Правилам ЕЭК ООН № 46.</p>\r\n', 11, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (47, 'Мангал', '<p>&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -39px; top: 38px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>\r\n', 12, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (48, 'Инфракрасный обогреватель', '<p>Инфракрасные электрообогреватели ЭИПС-1,5/220(3) торговой марки &laquo;Ратон&raquo; служат для обогрева закрытых жилых и служебных помещений.</p>\r\n\r\n<p>Инфракрасный обогреватель:</p>\r\n\r\n<p>не сушит воздух в помещении, не сжигает кислород;<br />\r\nнагревает не воздух вокруг себя, а предметы, на которые направлены лучи;<br />\r\nзащищает помещения от бактерий и микроорганизмов;<br />\r\nспособен обогреть помещения со сквозняками и вентиляцией;<br />\r\nработает намного эффективнее других видов обогревателей; эффект от внедрения инфракрасных обогревателей составляет 80-85 % (чем больше высота помещения, тем больше экономия потребления энергии).<br />\r\nОБЩИЕ СВЕДЕНИЯ<br />\r\nРабота обогревателей основана на принципе теплового (инфракрасного) излучения.</p>\r\n\r\n<p>Они нагревают не воздух, а всё, что находится в окружающем пространстве: предметы, поверхности, живые организмы, растения, жидкости, грунт и т. п.</p>\r\n\r\n<p>Обогревают помещение зонами и размещаются непосредственно в тех местах, где необходимо тепло.</p>\r\n\r\n<p>С их помощью легко обогреваются помещения любой высоты и площади.</p>\r\n\r\n<p>Обогреватели относятся к инфракрасным обогревателям с видимым свечением. Практически не нуждаются в техническом обслуживании.</p>\r\n\r\n<p>Работают в продолжительном режиме под надзором.</p>\r\n\r\n<p>Обогреватели не инерционны.</p>\r\n\r\n<p>Тепло, излучаемое ими, начинает ощущаться через несколько секунд после включения прибора.</p>\r\n\r\n<p>По способу установки обогреватели относятся к обогревателям напольного исполнения со ступенчатым регулированием мощности.</p>\r\n\r\n<p>При опрокидывании обогревателя срабатывает кнопка безопасности, встроенная в ножку обогревателя, и питание обогревателя отключается.</p>\r\n', 12, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (49, 'Шкафы гардеробные', '<p>йц</p>\r\n', 12, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (50, 'Пост кнопочный', '<p>&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -198px; top: 38px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>\r\n', 15, 1, '2021-04-24 23:10:14');
INSERT INTO `core_items` VALUES (51, 'Арматура коммутационная', '<p><strong>АРМАТУРА КОММУТАЦИОННАЯ АК</strong></p>\r\n\r\n<p><strong>&nbsp;</strong>Арматура коммутационная АК (далее &mdash; арматура) предназначена для управления кабинами лифтов современного дизайна, устанавливаемых в жилых домах, государственных и частных учреждениях, зданиях промышленных предприятий, и обеспечивает повышенную надежность, антивандальность и пожаро-безопасность.</p>\r\n\r\n<p>Арматура устанавливается как непосредственно в кабине лифта, так и на лифтовых площадках.</p>\r\n\r\n<p>В зависимости от пожелания заказчика арматура коммутационная дополнительно может изготавливаться с подсветкой (красная (КР), зеленая (З) или синяя (С)), а также с устройством УЛ либо РСУЛ.</p>\r\n\r\n<p><strong>Пост кнопочный</strong></p>\r\n\r\n<p>Пост кнопочный предназначен для установки на площадках этажей многоэтажных зданий и служит для вызова кабины лифта на соответствующих этажах. О том, что вызов произошел, сигнализирует загоревшаяся подсветка кнопки, установленной на посту красная (КР), зеленая (З) или синяя (С).</p>\r\n', 15, 1, '2021-04-24 23:10:14');

-- ----------------------------
-- Table structure for core_items_category
-- ----------------------------
DROP TABLE IF EXISTS `core_items_category`;
CREATE TABLE `core_items_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `is_popular` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_items_category
-- ----------------------------
INSERT INTO `core_items_category` VALUES (1, 'Устройства комплектные распределительные на напряжение 6-35 кВ', 'uploads/1d9f7ea192170c95aa7fb51e7a5ad160.jpg', 1, '2021-04-21 15:02:04', 1);
INSERT INTO `core_items_category` VALUES (2, 'Устройства комплектные распределительные с элегазовой изоляцией серии КРУЭ', 'uploads/1d750f316547b96501f8d72512a0448d.jpg', 1, '2021-04-21 15:02:40', 1);
INSERT INTO `core_items_category` VALUES (3, 'Устройства распределения электрической энергии на напряжение 0.4 кВ', 'uploads/f9044c0c55ef533cbf4c3dd1d3917c90.jpg', 1, '2021-04-21 15:18:23', 1);
INSERT INTO `core_items_category` VALUES (4, 'Подстанции трансформаторные комплектные', 'uploads/1a53a273473dcef6b2a65855e1db6dbb.jpg', 1, '2021-04-21 15:18:23', 1);
INSERT INTO `core_items_category` VALUES (5, 'Устройства релейной защиты и автоматики', 'uploads/0cdcec5947327ba6b6521ae4f2efb3f8.jpg', 1, '2021-04-21 15:18:23', 0);
INSERT INTO `core_items_category` VALUES (6, 'Высоковольтная коммутационная аппаратура', 'uploads/3c2bb8644b72f05c355842c8dd2fda6d.jpg', 1, '2021-04-21 15:20:35', 1);
INSERT INTO `core_items_category` VALUES (7, 'Низковольтная коммутационная аппаратура', 'uploads/e89b6d3b4bcfaaa3f3e87ef134154879.jpg', 1, '2021-04-21 15:20:35', 0);
INSERT INTO `core_items_category` VALUES (8, 'Прочая электротехническая продукция', 'uploads/4824e4daecd24c0ba4943c263bfe9da5.jpg', 1, '2021-04-21 15:20:35', 0);
INSERT INTO `core_items_category` VALUES (9, 'Отопительное оборудование', 'uploads/02db7c35cd5065acfd6b496e00c28eba.jpg', 1, '2021-04-21 15:20:35', 1);
INSERT INTO `core_items_category` VALUES (10, 'Газогорелочное устройства', 'uploads/fe3131371752eb067ff681a89ed93096.jpg', 1, '2021-04-21 15:20:35', 0);
INSERT INTO `core_items_category` VALUES (11, 'Автомобильные зеркала ', 'uploads/6fde15201087dd4fa552662ed9fef67d.jpg', 1, '2021-04-21 15:23:38', 0);
INSERT INTO `core_items_category` VALUES (12, 'Прочие ТНП', 'uploads/891539bb784ab6091ba370b06a9d450e.jpg', 1, '2021-04-21 15:23:38', 1);
INSERT INTO `core_items_category` VALUES (13, 'Измерительная техника', NULL, 0, '2021-04-21 15:23:38', 0);
INSERT INTO `core_items_category` VALUES (15, 'Комплектующие к лифтовому оборудованию', 'uploads/03613bcc3094dd89e04261d3e99f5477.jpg', 1, '2021-04-21 15:31:03', 1);

-- ----------------------------
-- Table structure for core_leaderships
-- ----------------------------
DROP TABLE IF EXISTS `core_leaderships`;
CREATE TABLE `core_leaderships`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_leaderships
-- ----------------------------
INSERT INTO `core_leaderships` VALUES (1, 'Директор', 'Приходько Михаил Григорьевич', 'uploads/d654e139dfdbd8c041b887fcdfc6ce24.jpg', '+375 (232) 58-42-72', '+375 (232) 68-20-50', 'raton@inbox.ru', 1, '2021-04-20 09:47:30');
INSERT INTO `core_leaderships` VALUES (4, 'Главный инженер', 'Лакизо Максим Васильевич', 'uploads/Lakizo2.jpg', '+375 (232) 68-27-87', '+375 (232) 68-35-24', 'aton-lakizo.maxim@yandex.ru', 1, '2021-04-20 10:27:29');
INSERT INTO `core_leaderships` VALUES (5, 'Заместитель директора по техническому развитию', 'Щербин Андрей Анатольевич', 'uploads/SHHerbin2.jpg', '+375 (232) 68-20-45', '+375 (232) 68-35-24', 'skbraton@gmail.com', 1, '2021-04-20 10:27:29');
INSERT INTO `core_leaderships` VALUES (6, 'Заместитель директора по производству', 'Рагалевич Игорь Кузьмич', 'uploads/Ragalevich2.jpg', '+375 (232) 68-27-11', '+375 (232) 68-35-24', 'raton@inbox.ru', 1, '2021-04-20 10:30:04');
INSERT INTO `core_leaderships` VALUES (7, 'Заместитель директора по продвижению измерительной техники', 'Уваров Александр Геннадьевич', 'uploads/Uvarov2.jpg', '+375 (232) 68-41-12', '+375 (232) 68-35-24', 'sigma0264@yandex.ru', 1, '2021-04-20 10:30:04');
INSERT INTO `core_leaderships` VALUES (8, 'Заместитель директора по идеологии, кадрам и социально-бытовым вопросам', 'Белова Диана Эдуардовна', 'uploads/Belova2.jpg', '+375 (232) 68-28-52', '+375 (232) 68-35-24', 'raton.kadry@mail.ru', 1, '2021-04-20 10:30:04');
INSERT INTO `core_leaderships` VALUES (9, 'Главный бухгалтер', 'Силкина Ольга Викторовна', 'uploads/Silkina2.jpg', '+375 (232) 68-25-26', '+375 (232) 68-35-24', 'raton@inbox.ru', 1, '2021-04-20 10:30:04');

-- ----------------------------
-- Table structure for core_news
-- ----------------------------
DROP TABLE IF EXISTS `core_news`;
CREATE TABLE `core_news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `views` int NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_news
-- ----------------------------
INSERT INTO `core_news` VALUES (3, 'Обращение к трудовым коллективам предприятий Гомельщины', '<p><em>Последние дни стали тяжелыми и беспокойными для всего белорусского народа.</em></p>\r\n\r\n<p><em><strong>Гомельский областной Союз нанимателей</strong></em><em>, объединяющий в своем составе более&nbsp;<strong>65 предприятий</strong>&nbsp;Гомельской области с общей численностью более&nbsp;<strong>80 тысяч человек,&nbsp;</strong>находится вне политики, однако остаться равнодушными к происходящему мы не можем.</em></p>\r\n\r\n<p><em>В своей работе мы всегда поддерживали атмосферу взаимопонимания и доверия между органами власти, профсоюзами и коллективами промышленных предприятий.</em></p>\r\n\r\n<p><em><strong>Мы против силового противостояния&nbsp;</strong>и за решение всех вопросов исключительно мирным путем&nbsp;<strong>в целях поддержания экономической безопасности страны.</strong></em><br />\r\n<em>Мы считаем, что, только слушая друг друга и доверяя, мы можем достичь большего, а истина может родиться&nbsp;<strong>только в мирном диалоге.</strong></em></p>\r\n\r\n<p><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; В борьбе за политическое переустройство в нашей стране, за предоставление больших свобод и противодействие насилию, народ Беларуси&nbsp;<strong>не должен позволить</strong>&nbsp;увести себя в сторону разрушения и уничтожения нашей экономической основы, которая была создана всем белорусским народом.</em></p>\r\n\r\n<p><em>Сегодня&nbsp;<strong>Вас&nbsp;</strong>призывают нанести&nbsp;<strong>конкретный экономический ущерб действующей власти</strong>, путем остановки работы производств.</em></p>\r\n\r\n<p><em><strong>Задайте себе вопрос &ndash; кому это навредит?</strong></em></p>\r\n\r\n<p><em><strong>Ответ напрашивается сам &ndash; всем вам</strong></em><em>,&nbsp;<strong>всему белорусскому народу</strong>,&nbsp;<strong>а</strong></em></p>\r\n\r\n<p><em><strong>не власти</strong></em><em>.</em></p>\r\n\r\n<p><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Это потеря</strong>&nbsp;&nbsp;</em><strong>прежде всего вашей</strong>&nbsp;<em>заработной платы, отсутствие денежных средств в бюджете&nbsp; для поддержания социальной сферы &ndash; образования, медицины, культуры, жилищно-коммунальной сферы.</em></p>\r\n\r\n<p>Это школы без учителей.</p>\r\n\r\n<p>Больницы без докторов.</p>\r\n\r\n<p><em>Улицы без света и общественного транспорта.</em></p>\r\n\r\n<p><em>Жилищно-коммунальные услуги без льгот</em></p>\r\n\r\n<p><em>Молодые семьи без пособий и доступного жилья</em></p>\r\n\r\n<p><em>Пенсионеры без пенсий.</em></p>\r\n\r\n<p><em>&nbsp;</em><em>Мы все хотим, чтобы жители&nbsp; Беларуси могли свободно передвигаться по улицам своих городов, не опасаясь за свое здоровье и жизнь. Мы все хотим жить в спокойной стране и чувствовать себя защищенными.</em><em>Обращаемся к трудовым коллективам Гомельщины:</em></p>\r\n\r\n<p><em>Реализуя свои демократические права на свободу слова, несогласие и&nbsp;</em><em>протесты, не допустите разрушения своей страны и ее основы &mdash; &nbsp;экономики.&nbsp;</em></p>\r\n\r\n<p><em><strong>Мы &mdash; мирная нация, и в этом наша сила.</strong></em></p>\r\n\r\n<p><em><strong>&nbsp;</strong></em></p>\r\n\r\n<p style=\"text-align:right\"><em><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Члены Гомельского областного союза нанимателей</strong></em></p>\r\n', 'uploads/12186a13fe3945b270cb8bb4737fc884.jpg', 1, 16, 1, '2021-04-21 12:14:03');

-- ----------------------------
-- Table structure for core_news_category
-- ----------------------------
DROP TABLE IF EXISTS `core_news_category`;
CREATE TABLE `core_news_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_news_category
-- ----------------------------
INSERT INTO `core_news_category` VALUES (1, 'Новости', 1, '2021-04-21 12:02:44');
INSERT INTO `core_news_category` VALUES (2, 'Объявления', 1, '2021-04-21 12:02:44');

-- ----------------------------
-- Table structure for core_pages
-- ----------------------------
DROP TABLE IF EXISTS `core_pages`;
CREATE TABLE `core_pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_pages
-- ----------------------------
INSERT INTO `core_pages` VALUES (1, 'personal_reception', 'Личный прием', '<p>График приема по личным вопросам граждан директором и его заместителями:</p>\r\n\r\n<p><strong>Директор &ndash; Приходько Михаил Григорьевич</strong></p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый понедельник с 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n	<li>Запись по телефону: (+375 232) 58-42-72 или у секретаря в приемной</li>\r\n</ul>\r\n\r\n<p><strong>Главный инженер &ndash; Лакизо Максим Васильевич</strong></p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый четверг с 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n	<li>Запись по телефону: (+375 232) 58-42-72 или у секретаря в приемной</li>\r\n</ul>\r\n\r\n<p><strong>Заместитель директора по производству &ndash; Рагалевич Игорь Кузьмич</strong></p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый вторник с 15.30 до 16.30</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n</ul>\r\n\r\n<p><strong>Заместитель директора по идеологии, кадрам и социально-бытовым вопросам&ndash; Белова Диана Эдуардовна</strong></p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый вторник с 15.00 до 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 1-ый этаж, отдел кадров</li>\r\n</ul>\r\n', 1, '2021-04-21 11:08:02');
INSERT INTO `core_pages` VALUES (3, 'jobs', 'Вакансии', '<h3><strong>Список вакансий будет опубликован ближайшее время</strong></h3>\r\n', 1, '2021-04-26 01:15:58');
INSERT INTO `core_pages` VALUES (4, 'history', 'История предприятия', '<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/75cd6a3fbbeb1d1fdafac3dc462cdafa.jpg\" style=\"height:auto; width:100%\" /></p>\r\n\r\n<p>Открытое акционерное общество &laquo;Ратон&raquo; расположено в&nbsp;Северной промышленной части&nbsp;г. Гомеля&nbsp;&mdash; второго по&nbsp;величине города в&nbsp;Республике Беларусь.</p>\r\n\r\n<p>История нашего предприятия начинается с&nbsp;1970&nbsp;года, с&nbsp;момента ввода его в&nbsp;строй. Завод радиотехнологического оснащения РТО&nbsp;&mdash; первенец радиомашиностроения в&nbsp;Беларуси и&nbsp;головное предприятие по&nbsp;выпуску автоматизированных рабочих мест (АРМ) на&nbsp;базе мини-ЭВМ. Завод выпускал сложную наукоемкую продукцию и&nbsp;работал исключительно на&nbsp;нужды обороны.</p>\r\n\r\n<p>1974 год&nbsp;&mdash; на&nbsp;предприятии появилась новая структурная единица &mdash; Специальное конструкторское бюро (СКБ).</p>\r\n\r\n<p>В&nbsp;марте 1992 года на&nbsp;базе завода РТО и&nbsp;СКБ Гомельского завода РТО создано научно-производственное объединение &laquo;Ратон&raquo; (НПО &laquo;Ратон&raquo;).</p>\r\n\r\n<p>В&nbsp;результате проведенной конверсии, предприятие стало выпускать широкую номенклатуру товаров народного потребления, оборудование для агропереработки, медицинское оборудование.</p>\r\n\r\n<p>В&nbsp;1996 году коллектив авторов предприятия удостоен Государственной премии Республики Беларусь за&nbsp;разработку линии моллирования сферических заготовок для автомобильных зеркал.</p>\r\n\r\n<p>В&nbsp;1998 году на&nbsp;базе НПО &laquo;Ратон&raquo; создана свободно-экономическая зона &laquo;Гомель-Ратон&raquo;.</p>\r\n\r\n<p>С&nbsp;1998 года по&nbsp;программе импортозамещения и&nbsp;по&nbsp;заданию концерна &laquo;БелЭнерго&raquo; начато производство электрооборудования среднего напряжения для электрических подстанций, за&nbsp;что в&nbsp;2007 году коллективу разработчиков была присуждена первая премия Министерства промышленности Республики Беларусь.</p>\r\n\r\n<p>2000 год&nbsp;&mdash; НПО &laquo;Ратон&raquo; переименован в&nbsp;Республиканское научно-производственное унитарное предприятие &laquo;Ратон&raquo; (РНПУП &laquo;Ратон&raquo;).</p>\r\n\r\n<p>2007 год&nbsp;&mdash; на&nbsp;предприятии разработана и&nbsp;внедрена система менеджмента качества ISO 9001.</p>\r\n\r\n<p>В&nbsp;2009 году Республиканское научно-производственное унитарное предприятие &laquo;Ратон&raquo; преобразовано в&nbsp;открытое акционерное общество &laquo;Ратон&raquo; (ОАО &laquo;Ратон&raquo;).</p>\r\n\r\n<p>2012 год&nbsp;&mdash; предприятие вошло в&nbsp;состав первого в&nbsp;республике Беларусь электротехнического холдинга&nbsp;&mdash; ГПО &laquo;Минский электротехнический завод&nbsp;им. В.&nbsp;И.&nbsp;Козлова&raquo;.</p>\r\n\r\n<p>Сегодня &laquo;Ратон&raquo; является многопрофильным предприятием, оснащённым современным оборудованием, позволяющим обеспечить высокое качество изделий при минимальных сроках изготовления:</p>\r\n\r\n<ul>\r\n	<li>координатно-пробивной пресс с&nbsp;ЧПУ &laquo;Амада&raquo; (Япония);</li>\r\n	<li>листогибочный пресс с&nbsp;ЧПУ &laquo;Амада&raquo; (Япония);</li>\r\n	<li>комплекс газоплазменной резки &laquo;PIRCE&raquo; (Словакия);</li>\r\n	<li>инструменты ведущих мировых компаний &laquo;Gesipa&raquo;, &laquo;Bosch&raquo; &laquo;Wetdmiller&raquo;.</li>\r\n</ul>\r\n\r\n<p>Предприятие является одним из&nbsp;ведущих производителей в&nbsp;Республике Беларусь устройств распределения электрической энергии на&nbsp;напряжение 6-35&nbsp;кВ, низковольтных распределительных устройств, шкафов, стоек, прочего электротехнического оборудования, бытовых отопительных котлов, зеркал для различных видов транспорта.</p>\r\n', 1, '2021-04-26 10:43:38');
INSERT INTO `core_pages` VALUES (5, 'production', 'Производство', '<p style=\"text-align:center\"><u><strong>ОАО &laquo;Ратон&raquo; является многопрофильным предприятием, имеющим следующие виды производств</strong></u></p>\r\n\r\n<ol>\r\n	<li>механообрабатывающее;</li>\r\n	<li>каркасно-сварочное;</li>\r\n	<li>штамповочное;</li>\r\n	<li>участок обработки листового материала;</li>\r\n	<li>лакокрасочное;</li>\r\n	<li>гальваническое;</li>\r\n	<li>переработка пластмасс;</li>\r\n	<li>оптико-обрабатывающее;</li>\r\n	<li>сборочно-монтажное;</li>\r\n	<li>деревообрабатывающее;</li>\r\n	<li>литье цветных металлов под давлением;</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>МЕХАНООБРАБАТЫВАЮЩЕЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся следующие виды работ: токарная обработка, фрезерование, сверление.Общая площадь механообрабатывающего производства составляет 3840,9 м2.</p>\r\n\r\n<p>Состав производства:</p>\r\n\r\n<ol>\r\n	<li>автоматно-револьверный участок;</li>\r\n	<li>участка холодной высадки и навивки пружин;</li>\r\n	<li>участок универсального металлорежущего оборудования;</li>\r\n	<li>участки станков с ЧПУ.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>КАРКАСНО - СВАРОЧНОЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся следующие виды работ: пробивка деталей всех видов, гибка, сварка, литье цветных металлов.Общая площадь каркасно-сварочного производства составляет 1894,6 м2.</p>\r\n\r\n<p>Состав производства:</p>\r\n\r\n<ol>\r\n	<li>сварочный участок;</li>\r\n	<li>участок литья цветных металлов под давлением;</li>\r\n	<li>слесарно-сборочный участок;</li>\r\n	<li>участок пробивки и гибки токопроводящих шин.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>ШТАМПОВОЧНОЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся следующие виды работ: все виды листовой штамповки, вырубка контура, пробивка, гибка.Общая площадь штамповочного производства составляет 1654 м2.Имеющееся оборудование позволяет обрабатывать детали под давлением с усилием до 160 тонн.</p>\r\n\r\n<p>УЧАСТОК ОБРАБОТКИ ЛИСТОВОГО МАТЕРИАЛА</p>\r\n\r\n<p>Производятся следующие виды работ:</p>\r\n\r\n<ol>\r\n	<li>термическая резка листового металла;</li>\r\n	<li>раскрой, пробивка, гибка листового материала.</li>\r\n</ol>\r\n\r\n<p>Общая площадь участка обработки листового материала составляет 1768,7 м2.</p>\r\n\r\n<p style=\"text-align:center\"><strong>ПЕРЕРАБОТКА ПЛАСТМАСС</strong></p>\r\n\r\n<p>Производятся следующие виды работ: литье пластмассовых изделий на термопластавтоматах, прессование реактопластов и резиновых изделий на прессах.</p>\r\n\r\n<p>Производство и переработка пластмасс составляет 852,4 м2 и состоит из следующих участков:</p>\r\n\r\n<ol>\r\n	<li>участок изготовления деталей из реактопластичных материалов;</li>\r\n	<li>участок изготовления деталей из термопластичных материалов.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>МЕХАНИЧЕСКОЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся следующие виды работ: резка стекла, моллирование, шлифовка и полировка всевозможных оптических деталей, окраски оптических элементов автомобильных зеркал, сборка автомобильных зеркал.</p>\r\n\r\n<p>Оптико-механическое производство составляет площадь 4236 м2 и состоит из следующих участков:</p>\r\n\r\n<ol>\r\n	<li>заготовительный (шлифовка и полировка);</li>\r\n	<li>моллирования;</li>\r\n	<li>вакуумного напыления;</li>\r\n	<li>окрасочного;</li>\r\n	<li>сборочного.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>СБОРОЧНО-МОНТАЖНОЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся следующие виды работ: заготовка проводов, вязка жгутов, пайка печатных плат, настройка и регулировка печатных плат после монтажа, Сборка изделий серии КРУ, трансформаторных подстанций, приводов, разъединителей и других изделий электротехнического назначения, проверка изделий на соответствие ТУ.</p>\r\n\r\n<p>Сборочно-монтажное производство составляет площадь 5582,7 м2 и состоит из следующих участков:</p>\r\n\r\n<ol>\r\n	<li>заготовительный;</li>\r\n	<li>изготовления жгутов;</li>\r\n	<li>электромонтажный;</li>\r\n	<li>слесарно-сборочный;</li>\r\n	<li>регулировочный.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>ЛАКОКРАСОЧНОЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Общая площадь лакокрасочного производства составляет 1753 м2.</p>\r\n\r\n<p>Производство представлено следующими участками:</p>\r\n\r\n<ol>\r\n	<li>Участок традиционных лакокрасочных покрытий на жидких растворителях в составе моечно-сушильного, окрасочно-сушильного конвейеров, тупиковых окрасочных камер и двух сушильных камер. Мощность участка - 30000 м2 покрытий в год. Резервная мощность участка 75 %.</li>\r\n	<li>Участок порошковых покрытий производительностью до 90 тыс. м&sup2; в год, Имеет в составе камеру трибостатического напыления производительностью 7800 м2 покрытий в год, установку оплавления УС-3, а также камеру электростатического напыления и газовую камеру. Общая мощность участка около 140 тыс. м2 покрытий в год.</li>\r\n	<li>Гальваническое отделение 1191,6 м2.</li>\r\n</ol>\r\n\r\n<p style=\"text-align:center\"><strong>ДЕРЕВООБРАБАТЫВАЮЩЕЕ ПРОИЗВОДСТВО</strong></p>\r\n\r\n<p>Производятся работы по изготовлению транспортной тары.</p>\r\n\r\n<p>Общая площадь деревообрабатывающего производства составляет 923 м2.</p>\r\n\r\n<p style=\"text-align:center\"><strong>ТЕХНОЛОГИИ</strong></p>\r\n\r\n<p>Все электротехническое оборудование, выпускаемое ОАО &laquo;Ратон&raquo;, производятся на самом современном оборудовании, позволяющем обеспечить высокую точность и качество изделий при минимальных сроках изготовления.</p>\r\n\r\n<p>Заготовительное производство предприятия оснащено металлорежущими станками нового поколения, сборка и электромонтаж осуществляются с помощью высококачественного инструмента ведущий мировых компаний.</p>\r\n\r\n<p>Металлические оболочки ячеек КРУ, выполняются в виде конструкций бескаркасного типа из алюмооцинкованной, оцинкованной или холодно-катонной листовой стали методом холодной штамповки.<br />\r\nДля вырубки деталей из листа мы применяем высокоточный координатно-пробивной пресс с ЧПУ фирмы &laquo;АMADA&raquo; (Япония). Для гибки используем листогибочный пресс с ЧПУ той же фирмы.</p>\r\n\r\n<p style=\"text-align:justify\">Обработка металла больших толщин производится на комплексе газоплазменной резки &laquo;PIRCE&raquo; (Словакия). Данное оборудование гарантирует необходимый уровень точности изготовления деталей и качество поверхности не требующего дополнительной обработки.</p>\r\n\r\n<p style=\"text-align:justify\">Окрашивание металлических поверхностей осуществляется традиционными лакокрасочными материалами, а также современным прогрессивным методом нанесения порошковых покрытий. Применение порошковой краски позволяет получить защитные покрытия с высокими прочными характеристиками, стойкостью к удару, ушибу, истираемости и др. Данные покрытия увеличивают срок службы изделий в 2-3 раза при этом обладают устойчивыми декоративными свойствами.</p>\r\n\r\n<p style=\"text-align:justify\">Сборка металлоконструкций, ячеек, шкафов производится с применением современных технологий клепки с минимальным количеством сварочных швов. При этом используется инструмент ведущих мировых компаний &laquo;Gesipa&raquo;, &laquo;Bosch&raquo;. Электрический монтаж шкафов управления осуществляется с использованием новейшего обжимочного инструмента фирмы &laquo;Weidm&uuml;ller &raquo;. Адресная маркировка проводов и электрических элементов производится на специальном термопринтере с программным управлением.</p>\r\n\r\n<p style=\"text-align:justify\">После окончательной сборки вся продукция проходит комплексную проверку на работоспособность с обязательной проверкой электрической прочности изоляции на установке УПУ - 10. Все работы, связанные с выпуском подстанционной техники выполняются высококвалифицированным персоналом, имеющим необходимое разрешение на осуществление соответствующего вида деятельности. Это гарантирует качество и надежность на всех этапах производственного процесса от проекта до выхода готовых изделий.</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-lg-3 col-md-3 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/d78018894d718eae59165f5169a9c2ea.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-3 col-md-3 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/2809096bb5d513739822b5758f9364e7.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-3 col-md-3 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/0ed72de1b3df0d1a2e230e811f3b9d29.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-3 col-md-3 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/af384f9db84ab847edd6aeb48797424f.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-3 col-md-3 col-sm-12 col-xs-12\">\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n', 1, '2021-04-26 11:13:23');
INSERT INTO `core_pages` VALUES (6, 'anti-corruption', 'Противодействие коррупции', '<p><strong>Нормативные документы</strong></p>\r\n\r\n<ul>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/pamyatka.docx\" target=\"_blank\"><u>Памятка об основных нормах антикоррупционного законодательства</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/formi.docx\" target=\"_blank\"><u>Формы проявления коррупции</u></a></li>\r\n</ul>\r\n\r\n<p><strong>Перечень коррупционных преступлений</strong></p>\r\n\r\n<ul>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/perechen_prestupleniy.docx\" target=\"_blank\"><u>Перечень преступлений</u></a></li>\r\n</ul>\r\n\r\n<p><strong>План мероприятий</strong></p>\r\n\r\n<ul>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/plan_rabot.PDF\" target=\"_blank\"><u>План работы комиссии по противодействию коррупции в ОАО &quot;Ратон&quot; на 2020 год</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/plan_meropr.pdf\" target=\"_blank\"><u>План мероприятий по противодействию коррупции в ОАО &quot;Ратон&quot; на 2018-2019 гг.</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/plan_2020_2022.pdf\" target=\"_blank\"><u>План мероприятий по противодействию коррупции в ОАО &quot;Ратон&quot; на 2020-2022 гг.</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/plan_meropr_2021.PDF\" target=\"_blank\"><u>План мероприятий по противодействию коррупции в ОАО &quot;Ратон&quot; на 2020-2022 гг. (с учетом изменений от 28.01.2021, протокол №1</u></a><a href=\"https://raton.by/wp-content/themes/raton/plan_meropr_2021.PDF\" target=\"_blank\"><u>)</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/plan_raboty_2021.PDF\" target=\"_blank\"><u>План работы комиссии по противодействию коррупции в ОАО &quot;Ратон&quot; на 2021 год</u></a></li>\r\n</ul>\r\n\r\n<p><strong>Комиссия</strong></p>\r\n\r\n<ul>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/prikaz236.pdf\" target=\"_blank\"><u>Приказ о создании комиссии по противодействию коррупции в ОАО &quot;Ратон&quot; 2019</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/pologenie.pdf\" target=\"_blank\"><u>Положение &quot;О комиссии по противодействию коррупции&quot; 2019</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/prikaz_o_kom_2021.PDF\" target=\"_blank\"><u>Приказ о создании комиссии по противодействию коррупции в ОАО &quot;Ратон&quot; 2021</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/polozenie_o_kom_2021.PDF\" target=\"_blank\"><u>Положение &quot;О комиссии по противодействию коррупции&quot; 2021</u></a></li>\r\n	<li><a href=\"https://raton.by/wp-content/themes/raton/prikaz_polozenie_o_kom_2021.PDF\" target=\"_blank\"><u>Приказ о введении в действие Положения &quot;О комиссии по противодействию коррупции&quot; 2021</u></a></li>\r\n</ul>\r\n', 1, '2021-04-26 11:17:22');
INSERT INTO `core_pages` VALUES (7, 'services-provided', 'Оказываемые услуги', '<h2 style=\"text-align:center\"><span style=\"font-size:16px\"><u><strong>Перечень оказываемых услуг предприятием</strong></u></span></h2>\r\n\r\n<ul>\r\n	<li>механическая обработка изделий;</li>\r\n	<li>лазерная резка металлов (1-16 мм);</li>\r\n	<li>сварка металлоконструкций по чертежам (эскизам) Заказчика;</li>\r\n	<li>плазменная резка;</li>\r\n	<li>обработка листового металла (резка, пробивка на координатно-револьверных прессах с ЧПУ, гибка на прессах с ЧПУ и др.);</li>\r\n	<li>лакокрасочные работы (порошковое и жидкое окрашивание);</li>\r\n	<li>гальванопокрытия;</li>\r\n	<li>штамповка изделий;</li>\r\n	<li>горячая ковка по чертежам (эскизам) Заказчика;</li>\r\n	<li>изготовление изделий из пластмасс;</li>\r\n	<li>изготовление зеркал для автомобилей и сельхозтехники;</li>\r\n	<li>сборочно-монтажное производство.</li>\r\n</ul>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"font-size:16px\"><u><strong>На ОАО &laquo;Ратон&raquo; имеется аккредитованная центральная заводская лаборатория и метрология, которая принимает заказы</strong></u></span></h2>\r\n\r\n<ul>\r\n	<li>проведение лабораторного контроля воздуха рабочей зоны (химические факторы) в том числе и для аттестации рабочих мест;</li>\r\n	<li>проведение измерений физических факторов (шум, вибрация, освещенность, микроклимат) на рабочих местах;</li>\r\n	<li>проведение лабораторного контроля сточных вод;</li>\r\n	<li>проведение лабораторного контроля промышленных выбросов.</li>\r\n</ul>\r\n\r\n<p>Все замеры проводятся в рамках области аккредитации ЦЗЛиМ.</p>\r\n\r\n<p><a href=\"http://127.0.0.1:16000/static/uploads/files/ec640964f3fdca5bc39a1d4b8fb1a641.jpg\" target=\"_blank\">Аттестат акредитации ЦЗЛиМ</a></p>\r\n\r\n<p>Телефон: +375 (232) 68-25-39</p>\r\n\r\n<p>Факс: +375 (232) 68-35-24</p>\r\n\r\n<p>E-mail: czl.raton@gmail.com</p>\r\n\r\n<p>+375 (29) 150-03-08 Ковалева Галина Германовна</p>\r\n\r\n<p>+375 (44) 771-45-27 Белобровик Анна Валерьевна</p>\r\n\r\n<p>+375 (232) 68-25-13 Гончарова Оксана Аркадьевна (услуги населению, индивидуальные заказы)</p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"font-size:16px\"><u><strong>Столовая ОАО &laquo;Ратон&raquo; принимает заказы на проведение свадеб, корпоративных мероприятий, семейных торжеств и поминальных обедов</strong></u></span></h2>\r\n\r\n<p>&nbsp;расположении столовой имеются 3 помещения различной площади: от 10 до 120 посадочных мест.</p>\r\n\r\n<p>От праздника в кругу родных, коллег и друзей всегда должны оставаться только самые приятные и теплые впечатления. Мы поможем Вам провести банкеты, свадьбы, юбилеи, корпоративные вечера и другие торжественные мероприятия. Вас порадуют богатое меню, вкусно приготовленная еда и доступные цены.</p>\r\n\r\n<p>Всегда в наличии свежий хлеб и кондитерские изделия.Изготовливаем фирменный торт &quot;Птичье молоко&quot;.С 12:00 - 15:00 работает столовая и буфет для всех посетителей.</p>\r\n\r\n<p>Телефон: +375 (232) 68-29-00</p>\r\n\r\n<p>Адрес: ул. Федюнинского, 19</p>\r\n', 1, '2021-04-26 11:21:52');
INSERT INTO `core_pages` VALUES (8, 'illiquid-assets', 'Реализация неликвидов и оборудования', '<p>ОАО &laquo;Ратон&raquo; реализует организациям и частным лицам неликвиды. По вопросам приобретения ТМЦ рекомендуем обращаться по указанным контактам, а также к ответственным сотрудникам.</p>\r\n\r\n<p>по оборудованию ведущий инженер-технолог&ndash; Кренгольд Лариса Абрамовна</p>\r\n\r\n<p>Телефон: (+375 232) 68-37-05</p>\r\n\r\n<p>по инструменту начальник ОСКиТ&ndash; Даниленко Владимир Александрович</p>\r\n\r\n<p>Телефон: (+375 232) 68-24-11</p>\r\n\r\n<p>по приборам начальник лаборатории&nbsp;&ndash; Ковалева Галина Германовна</p>\r\n\r\n<p>Телефон: (+375 232) 68-25-39</p>\r\n\r\n<p>Выражаем надежду на совместное плодотворное и взаимовыгодное сотрудничество! Готовы рассмотреть любые ваши предложения!</p>\r\n\r\n<p><a href=\"https://raton.by/wp-content/themes/raton/perechen-ne-likvidov.xlsx\" target=\"_blank\"><u>Перечень неликвидов</u></a></p>\r\n\r\n<p><a href=\"https://raton.by/wp-content/themes/raton/perehen_na_realiz2021.pdf\" target=\"_blank\"><u>Перечень оборудования</u></a></p>\r\n\r\n<p>Стоимость оборудования (приборов, неликвидов) определяется после предоставления ЗАКАЗЧИКОМ заявки на заинтересовавшее заказчика оборудование (приборы, неликвиды) из перечней.</p>\r\n\r\n<p><a href=\"https://raton.by/wp-content/themes/raton/Zayavka.doc\" target=\"_blank\"><u>Скачать заявку</u></a></p>\r\n\r\n<p>ОАО &laquo;Ратон&raquo; предлагает к продаже через аукцион следующие объекты недвижимости:</p>\r\n\r\n<p>1.Корпус №19, расположенный по адресу: г. Гомель, ул. Федюнинского, 19/19, принадлежащий предприятию на праве собственности.</p>\r\n\r\n<p>Общая характеристика объекта:</p>\r\n\r\n<ul>\r\n	<li>общая площадь - 21495,2 м&sup2;;</li>\r\n	<li>здание корпуса включает в себя подвал площадью 1594 м&sup2;, высотой 3 м;</li>\r\n	<li>дата ввода в эксплуатацию - 12.1983 г.</li>\r\n</ul>\r\n\r\n<p>Обращаться по телефону: (+375 232) 68-37-05E-mail: raton.ogt1@inbox.ru</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-lg-4 col-md-4 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/3885119aa17a19316f6b79b2bad835ff.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-4 col-md-4 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/0382f06247c18147f9b7a499a931ab12.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-4 col-md-4 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/241cdad5352cc4603470edea9f58d6a2.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-4 col-md-4 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/9dd1d3bb7320a84128e1cdcf58fdcd32.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n\r\n<div class=\"col-lg-4 col-md-4 col-sm-12 col-xs-12\">\r\n<p><img alt=\"\" src=\"http://127.0.0.1:16000/static/uploads/files/caf4d0c163548176ba6c021f78d93be2.jpg\" style=\"height:auto; width:100%\" /></p>\r\n</div>\r\n</div>\r\n', 1, '2021-04-26 11:42:35');
INSERT INTO `core_pages` VALUES (9, 'standards', 'Стандартизация', '<p>Страница скоро будет наполнена</p>\r\n', 1, '2021-04-28 14:44:12');

-- ----------------------------
-- Table structure for core_phone_questions
-- ----------------------------
DROP TABLE IF EXISTS `core_phone_questions`;
CREATE TABLE `core_phone_questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_phone_questions
-- ----------------------------
INSERT INTO `core_phone_questions` VALUES (1, 'Роман', '+375445137009', 0, '2021-04-27 13:24:14');
INSERT INTO `core_phone_questions` VALUES (2, 'Роман2', '+375445137009', 0, '2021-04-27 13:28:07');

-- ----------------------------
-- Table structure for core_photo_catalogs
-- ----------------------------
DROP TABLE IF EXISTS `core_photo_catalogs`;
CREATE TABLE `core_photo_catalogs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_photo_catalogs
-- ----------------------------
INSERT INTO `core_photo_catalogs` VALUES (1, 'КТП-РТН передвижная - Новая разработка нашего предприятия для  РУП «Белоруснефть»', 'uploads/2.jpg', 1, '2021-04-21 09:00:35');
INSERT INTO `core_photo_catalogs` VALUES (4, 'КРУ серии РТН (аналог D-12) с IP43 для ОАО «Беларуськалий»', 'uploads/17.jpg', 1, '2021-04-21 09:44:05');

-- ----------------------------
-- Table structure for core_photos
-- ----------------------------
DROP TABLE IF EXISTS `core_photos`;
CREATE TABLE `core_photos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `catalog_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_photos
-- ----------------------------
INSERT INTO `core_photos` VALUES (2, 1, 'uploads/1_2.jpg', 1, '2021-04-21 09:25:00');
INSERT INTO `core_photos` VALUES (3, 1, 'uploads/2.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (4, 1, 'uploads/3.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (5, 1, 'uploads/4.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (6, 1, 'uploads/5.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (7, 1, 'uploads/6.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (8, 1, 'uploads/7.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (9, 1, 'uploads/8.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (10, 1, 'uploads/9.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (11, 1, 'uploads/10.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (13, 1, 'uploads/11.jpg', 1, '2021-04-21 09:25:35');
INSERT INTO `core_photos` VALUES (14, 4, 'uploads/1_3.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (15, 4, 'uploads/2_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (16, 4, 'uploads/3_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (17, 4, 'uploads/4_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (18, 4, 'uploads/5_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (19, 4, 'uploads/6_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (20, 4, 'uploads/7_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (21, 4, 'uploads/8_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (22, 4, 'uploads/9_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (23, 4, 'uploads/10_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (24, 4, 'uploads/11_1.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (25, 4, 'uploads/12.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (26, 4, 'uploads/13.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (27, 4, 'uploads/14.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (28, 4, 'uploads/15.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (29, 4, 'uploads/16.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (30, 4, 'uploads/17.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (31, 4, 'uploads/18.jpg', 1, '2021-04-21 09:48:40');
INSERT INTO `core_photos` VALUES (32, 4, 'uploads/19.jpg', 1, '2021-04-21 09:48:40');

-- ----------------------------
-- Table structure for core_questions
-- ----------------------------
DROP TABLE IF EXISTS `core_questions`;
CREATE TABLE `core_questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_questions
-- ----------------------------
INSERT INTO `core_questions` VALUES (1, 'Роман', 'devwern@gmail.com', '+375445137009', 'Привет мир!', 0, '2021-04-27 11:22:15');

-- ----------------------------
-- Table structure for core_reviews
-- ----------------------------
DROP TABLE IF EXISTS `core_reviews`;
CREATE TABLE `core_reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_reviews
-- ----------------------------
INSERT INTO `core_reviews` VALUES (22, 'ВитебскЭнерго', 'uploads/Vitebskenergo-KRU_BEL-KSO_RTN.jpg', 1, '2021-04-20 12:37:48');
INSERT INTO `core_reviews` VALUES (23, 'МогилевЭнерго', 'uploads/Mogilevenergo-KTP-RTN-S.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (24, 'ГомельЭнерго', 'uploads/KTP-Gomelenergo.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (25, 'ГомельПромСтрой', 'uploads/Gomelpromstroj-KTPB.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (26, 'ВитебскЭнерго KSO RTN', 'uploads/Vitebskenego-KSO_RTN-1-1.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (27, 'БелЭнергоРемНаладка', 'uploads/Belenergoremnaladka-KRUE.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (28, 'ГомельЭнерго KSO', 'uploads/Gomelenergo-KSO.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (29, 'ГомельЭнерго KTP', 'uploads/Gomelenergo-KTP.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (30, 'Жлобинские Электрические сети', 'uploads/KTP-RTN-K-ZHlobinskie-ES.jpg', 1, '2021-04-20 12:48:17');
INSERT INTO `core_reviews` VALUES (31, 'РосПоль-Электро', 'uploads/Rospol-Elektro-2019.jpg', 1, '2021-04-20 12:48:17');

-- ----------------------------
-- Table structure for core_settings
-- ----------------------------
DROP TABLE IF EXISTS `core_settings`;
CREATE TABLE `core_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_settings
-- ----------------------------
INSERT INTO `core_settings` VALUES (1, 'VERSION', '2.0.208', 'string');
INSERT INTO `core_settings` VALUES (2, 'PROJECT_NAME', 'ОАО «Ратон»', 'string');
INSERT INTO `core_settings` VALUES (3, 'PROJECT_STATUS', 'True', 'bool');
INSERT INTO `core_settings` VALUES (4, 'TECHNICAL_WORKS', 'False', 'bool');
INSERT INTO `core_settings` VALUES (5, 'TEMPLATES_AUTO_RELOAD', 'True', 'bool');
INSERT INTO `core_settings` VALUES (6, 'MAIL_TITLE', 'ОАО «Ратон» | Гомельский завод электротехнической аппаратуры', 'string');
INSERT INTO `core_settings` VALUES (7, 'MAIL_SERVER', 'smtp.yandex.ru', 'string');
INSERT INTO `core_settings` VALUES (8, 'MAIL_PORT', '465', 'int');
INSERT INTO `core_settings` VALUES (9, 'MAIL_USE_SSL', 'True', 'bool');
INSERT INTO `core_settings` VALUES (10, 'MAIL_USERNAME', 'no-reply@crossapi.ru', 'string');
INSERT INTO `core_settings` VALUES (11, 'MAIL_PASSWORD', 'vmntopsejyrwrskv', 'string');
INSERT INTO `core_settings` VALUES (12, 'MAIL_ENABLED', 'True', 'bool');
INSERT INTO `core_settings` VALUES (13, 'MAIL_USE_TLS ', 'False', 'bool');
INSERT INTO `core_settings` VALUES (14, 'METRIKS_ENABLE', 'False', 'bool');
INSERT INTO `core_settings` VALUES (15, 'CURRENT_GENERAL_URL', 'http://127.0.0.1:16000', 'string');
INSERT INTO `core_settings` VALUES (16, 'NOTIFICATION_EMAIL', 'info@wern.dev', 'string');
INSERT INTO `core_settings` VALUES (17, 'NOTIFICATIONS_STATUS', 'True', 'bool');
INSERT INTO `core_settings` VALUES (18, 'TNP_MAP', '<iframe src=\"https://yandex.ru/map-widget/v1/?um=constructor%3Aaae90f74834beeda6ba6446316ebde6378c9de19b880b9dd228786983071c182&amp;source=constructor\" width=\"100%\" height=\"400\" frameborder=\"0\"></iframe>', 'string');
INSERT INTO `core_settings` VALUES (19, 'ELECTRO_MAP', '<iframe src=\"https://yandex.ru/map-widget/v1/?um=constructor%3Abb3afac30f6fa440e64ae2412f6be9fb28ca87f33f7feb8f6c9749db614c3bd3&amp;source=constructor\" width=\"100%\" height=\"400\" frameborder=\"0\"></iframe>', 'string');

-- ----------------------------
-- Table structure for core_shops
-- ----------------------------
DROP TABLE IF EXISTS `core_shops`;
CREATE TABLE `core_shops`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `displaying_email` int NOT NULL,
  `displaying_site` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_shops
-- ----------------------------
INSERT INTO `core_shops` VALUES (1, 'ООО «АнтаресМаркет»', 1, 'г. Бобруйск, ул. Комсомольская 41', '+375 (44) 772-35-80', '', '', 1, '2021-04-26 15:35:25', 0, 0);
INSERT INTO `core_shops` VALUES (2, 'ООО «Весна-7»', 1, 'г. Гомель, ул. Федюнинского 19-а', '+375 (232) 68-38-50 / +375 (232) 68-32-50', 'www.stroi-ka.by', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (3, 'ЧП «Дымоход плюс»', 1, 'г. Гомель ул. Лещинская 2а/5', '+375 (29) 969-20-81 / +375 (232) 23-10-81', 'www.dymplus.by', 'dymohodplus@mail.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (4, 'ОДО «Кранлюкс»', 1, 'г. Гомель, ул. Ильича 161д', '+375 (44) 567-85-19  / +375 (44) 567-85-96', 'www.kranlux.by', 'kranlux.shop@mail.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (5, 'ООО «Обогреем»', 1, 'г. Могилёв, ул. Габровская 11Б', '+375 (29) 990-28-50 / +375 (29) 234-63-17', '', '', 1, '2021-04-26 15:37:21', 0, 0);
INSERT INTO `core_shops` VALUES (6, 'ООО «Котловбай»', 1, 'г. Минск ул. Притыцкого 77 ст.м. Кунцевщина', '+375 (17) 234-40-41 / +375 (29) 354-40-41', 'www.kotlov.by', 'info@kotlov.by', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (7, 'ООО «БЛК7»', 1, 'г. Минск, ул. Монтажников 9', '+375 (17) 275-01-92 / +375 (29) 107-15-55', 'www.100kotlov.by', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (8, 'ООО «Пирмок»', 1, 'Солигорский район, пгт. Старобин, ул. Гуляева 89', '+375 (174) 29-65-37 / +375 (29) 699-65-37', 'www.pirmok.by', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (9, 'ООО «Лешантер»', 1, 'Полоцкий р-н, д. Экимань-1, ул. Центральная, 63', '+375 (214) 77-45-23 / +375 (214) 77-32-55', 'www.remtehnika.by', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (10, 'ЧТУП «Триотив»', 1, 'Минская обл., г. Столбцы, ул. Набережная 4', '+375 (171) 77-12-71', '', '', 1, '2021-04-26 15:37:21', 0, 0);
INSERT INTO `core_shops` VALUES (11, 'ИП Гейшалев Н. Н.', 1, 'Жлобин, ул. Первомайская 67/1', '+375 (29) 363-81-47', '', '', 1, '2021-04-26 15:37:21', 0, 0);
INSERT INTO `core_shops` VALUES (12, 'ООО «Гмина-сервис»', 1, 'г. Минск, пр.Дзержинского 24 (м. Грушевка)', '+375 (17) 216-24-16 / +375 (17) 241-82-73', 'www.gazteplovoda.by', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (13, 'ООО «ТД «Регион Маркет»', 1, '142103, РФ, г. Подольск, ул. Бронницкая 7', '+8 (499) 674-05-75 /  +8 (499) 674-06-72', 'www.belazmarket.ru', 'mail@belautomarket.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (14, 'ООО «Торгмаш Чебоксары»', 2, '428008, РФ, Чувашская Республика, г. Чебоксары, ул. Текстильщиков 8, корпус 17', '+7 (8352) 21-84-84 / +7 (8961) 347-82-88', 'www.21torg.ru', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (15, 'ООО «Кристалл-Холод»', 2, '422540, РФ, Республика Татарстан, г. Зеленодольск, ул. Новостроительная 40а', '+8 (84371) 4-59-83 / +8 (84371) 4-53-03', 'www.crystal-kholod.ru', 'с.kholod@mail.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (16, 'ООО «Вяткомплект»', 2, '610007, РФ, г. Киров, ул. Ленина 184, корпус 4', '+8 (8332) 35-26-74 / +8 (8332) 35-26-75', 'www.vyatkomplekt.ru', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (17, 'ИП Филиппов В.А.', 2, '610037, РФ, г. Киров, ул. Егоровская 3-67', '+8 (8332) 35-26-74 / +8 (8332) 35-26-75', 'www.vyatkomplekt.ru', '', 1, '2021-04-26 15:37:21', 0, 1);
INSERT INTO `core_shops` VALUES (18, 'ООО «Теплоф»', 2, '424000, РФ, Республика Марий Эл, г. Йошкар-Ола, ул. Красноармейская 43б, этаж подвал,', '+8 (8362) 49-73-20 / +8 (8362) 49-72-10', 'www.teplof.company', 'director@teplof.company', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (19, 'ООО Фирма «Биохимтех»', 2, '109341, г. Москва, ул. Верхние поля', '+8 (495) 956-79-29 / +8 (917) 504-39-49', 'www.bioshop.ru', 'res@bioshop.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (20, 'ЗАО ЦОРМ «Торгтехника»', 2, '141706, РФ, Московская обл., Мытищинский р-н, д. Грибки, 62', '+8 (495) 505-51-15 / +8 (495) 221-75-85', 'www.corm.ru', 'zip@corm.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (21, 'ООО «МИТЭК»', 2, '188640, Всеволожское городское поселение, Ленинградская область, Россия', '+7 (812) 325-43-10 / +7 (812) 325-43-00', 'www.mitek.spb.ru', 'zakaz@mitek.spb.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (22, 'ООО«ПромЭнергоСтрой»', 2, '620078, РФ, г. Екатеринбург, ул. Гагарина 53, офис 2', '+8 (343) 379-05-22 / +8 (343) 270-00-75', 'www.pk66.ru', 'info@pk66.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (23, 'ООО «ЭЛТКОМ»', 2, '111141, РФ, г. Москва, ул.Перовская 33А, кабинет 32', '+8 (495) 652-63-63 / +8 (495) 652-36-64', 'www.eltcom.ru', 'zakaz@элтком.рф', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (24, 'ООО «АРМ-ЭКО»', 2, '35364, Украина, Ровенская область, Ровенский район, с. Грушвица Друга, ул. 40 рокив Пэрэмоги 1', '+3 (80362) 63-19-47', 'arm-eko@ukr.net', 'arm-eko@ukr.net', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (25, 'ООО «AVS AGRO VATANPARVAR»', 2, '100115, Республика Узбекистан, г. Ташкент, массив Чиланзар, ул. Арнасай 1а', '+9 (9871) 277-88-07', 'www.avs-techno-food.gl', 'avs_agro@mail.ru', 1, '2021-04-26 15:37:21', 1, 1);
INSERT INTO `core_shops` VALUES (26, 'ООО «Энергия»', 2, '614022, РФ, Пермский край, г. Пермь, ул. Рязанская 19а, офис 7', '+7 (342) 250-55-50', '', '', 1, '2021-04-26 15:37:21', 0, 0);

-- ----------------------------
-- Table structure for core_sliders
-- ----------------------------
DROP TABLE IF EXISTS `core_sliders`;
CREATE TABLE `core_sliders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_sliders
-- ----------------------------
INSERT INTO `core_sliders` VALUES (8, 'uploads/947d70533d0b7b3ed9b9d7c734d7be9a.jpg', 1, '2021-04-28 02:02:09');
INSERT INTO `core_sliders` VALUES (10, 'uploads/47f4d387e703c2e9f4d70d852d93f8a4.jpg', 1, '2021-04-28 02:02:09');
INSERT INTO `core_sliders` VALUES (11, 'uploads/67131eeed113f9be08e7ff56d6fa3054.jpg', 1, '2021-04-28 11:42:15');

-- ----------------------------
-- Table structure for core_videos
-- ----------------------------
DROP TABLE IF EXISTS `core_videos`;
CREATE TABLE `core_videos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of core_videos
-- ----------------------------
INSERT INTO `core_videos` VALUES (33, 'ОАО «Ратон»', 'https://www.youtube.com/embed/ZIzM-D3Va2E', 1, '2021-04-21 10:21:21');
INSERT INTO `core_videos` VALUES (35, 'Видеосюжет о предприятии', 'https://www.youtube.com/embed/dgdZYKC9VM0', 1, '2021-04-26 01:45:11');
INSERT INTO `core_videos` VALUES (36, 'Передвижная КТП', 'https://www.youtube.com/embed/u1EidI3Zj7g', 1, '2021-04-26 01:45:11');

SET FOREIGN_KEY_CHECKS = 1;
