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

 Date: 22/04/2021 01:04:00
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
INSERT INTO `core_accounts` VALUES (1, 'admin@wern.dev', '73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', 1, '127.0.0.1', NULL, '2021-04-20 00:27:31', '2021-04-20 00:27:35', 'Морозов Роман Сергеевич', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_clients
-- ----------------------------
INSERT INTO `core_clients` VALUES (1, 'Энергохолдинг «Каскад»', 'uploads/partners1.jpg', 1, 1, '2021-04-20 11:19:04');
INSERT INTO `core_clients` VALUES (3, 'RosPol - Electro', 'uploads/partners5.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (4, 'Брянский Электротехнический завод', 'uploads/partners3.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (5, 'Регион маркет', 'uploads/partners6.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (6, 'Trade Киев', 'uploads/partners2.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (7, 'Кристалл Холод', 'uploads/partners4.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (8, 'Торгмаш Чебоксары', 'uploads/partners7.jpg', 1, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (9, 'ОАО «Могилевхимволокно»', 'uploads/partnersin1.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (10, 'Беларусь Калий', 'uploads/partnersin2.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (11, 'Брестэнерго', 'uploads/partnersin3.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (12, 'МЭТЗ им. В.И.Козлова', 'uploads/partnersin4.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (13, 'Витескэнерго', 'uploads/partnersin5.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (14, '??', 'uploads/partnersin6.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (15, 'Су - 117', 'uploads/partnersin7.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (16, 'ОАО «ГродноПромСтрой»', 'uploads/partnersin8.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (17, 'Белорусская железная дорога', 'uploads/partnersin9.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (18, 'ГомельЭнерго', 'uploads/partnersin10.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (19, 'Гомсельмаш', 'uploads/partnersin11.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (20, 'Белоруснефть', 'uploads/partnersin12.jpg', 2, 1, '2021-04-20 11:38:47');
INSERT INTO `core_clients` VALUES (21, 'Белаз', 'uploads/partnersin13.jpg', 2, 1, '2021-04-20 11:38:47');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
-- Table structure for core_electronic_appeals
-- ----------------------------
DROP TABLE IF EXISTS `core_electronic_appeals`;
CREATE TABLE `core_electronic_appeals`  (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_key` int NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_electronic_appeals
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_item_applications
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_item_files
-- ----------------------------
INSERT INTO `core_item_files` VALUES (4, 'Каталог', 2, 'uploads/963d4bc4effc737e0fd6e2b21f347e7e.pdf', 1, '2021-04-21 23:57:52');
INSERT INTO `core_item_files` VALUES (5, 'Проспект', 2, 'uploads/ff96e5317f9048d068a4c8fafd876c71.doc', 1, '2021-04-21 23:57:52');
INSERT INTO `core_item_files` VALUES (6, 'Опросный лист КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/2be69532bc4449cd5f1a23d42479312e.dwg', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (7, 'Сертификат соответствия КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/73c5a77061f7cafb8147f02d85e1e219.pdf', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (8, 'Сертификат продукции собственного производства КРУ наружной установки серии КРУ/БЕЛ', 2, 'uploads/4f376a01a42219710b9b30ca02b4cad0.jpg', 1, '2021-04-21 23:59:57');
INSERT INTO `core_item_files` VALUES (9, 'Руководство по эксплуатации', 2, 'uploads/6b23838ee81ad4e2155756c6ae19946c.pdf', 1, '2021-04-21 23:59:57');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_item_images
-- ----------------------------
INSERT INTO `core_item_images` VALUES (1, 2, 'uploads/KRUN-edinichka.jpg', '2021-04-21 23:01:44', 1, 0);
INSERT INTO `core_item_images` VALUES (2, 2, 'uploads/KRUN-shesterochka.jpg', '2021-04-21 23:02:57', 1, 0);
INSERT INTO `core_item_images` VALUES (3, 2, 'uploads/P4170303.jpg', '2021-04-21 23:02:57', 1, 0);
INSERT INTO `core_item_images` VALUES (4, 2, 'uploads/P5302461.jpg', '2021-04-21 23:02:57', 1, 0);
INSERT INTO `core_item_images` VALUES (5, 2, 'uploads/P6037417.jpg', '2021-04-21 23:02:57', 1, 1);
INSERT INTO `core_item_images` VALUES (6, 2, 'uploads/P8212202.jpg', '2021-04-21 23:02:57', 1, 0);
INSERT INTO `core_item_images` VALUES (8, 2, 'uploads/P8222233.jpg', '2021-04-21 23:11:55', 1, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_items
-- ----------------------------
INSERT INTO `core_items` VALUES (2, 'КРУ наружной установки серии КРУ/БЕЛ', '<p>Устройства комплектные распределительные в металлической оболочке серии КРУ/БЕЛ (КРУ) предназначены для приема и распределения электрической энергии переменного трехфазного тока промышленной частоты 50 Гц на номинальное напряжение 6; 10 кВ для сетей с изолированной нейтралью.</p>\r\n\r\n<p>КРУ применяются в сетях сельского хозяйства, в промышленности и электрофикаии железнодорожного транспорта, для комплектования электрических подстанций.</p>\r\n\r\n<p>ОБЩИЕ СВЕДЕНИЯ<br />\r\nКРУ наружной установки конструктивно представляет из себя блок ячеек (1-6) &ndash; модуль с общей металлоконструкцией и наружными панелями из оцинкованной стали.</p>\r\n\r\n<p>Конструкция модуля предусматривает размещение ячеек различного назначения с выкатными элементами и шкафами управления, смонтированными на общей жесткой раме коридора управления.</p>\r\n\r\n<p>На стенке коридора напротив ячеек предусмотрена установка дополнительных шкафов.</p>\r\n\r\n<p>Конструктивно в ячейках выделены отсеки:</p>\r\n\r\n<p>отсек выкатного элемента;<br />\r\nотсек сборных шин;<br />\r\nотсек ввода;<br />\r\nотсек релейной защиты и управления.<br />\r\nРазделение ячеек на отсеки повышает их локализационную способность.</p>\r\n', 1, 1, '2021-04-21 21:44:18');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_items_category
-- ----------------------------
INSERT INTO `core_items_category` VALUES (1, 'Устройства комплектные распределительные на напряжение 6-35 кВ', 'uploads/KRUN-shesterochka.jpg', 1, '2021-04-21 15:02:04');
INSERT INTO `core_items_category` VALUES (2, 'Устройства комплектные распределительные с элегазовой изоляцией серии КРУЭ', NULL, 1, '2021-04-21 15:02:40');
INSERT INTO `core_items_category` VALUES (3, 'Устройства распределения электрической энергии на напряжение 0,4 кВ. шкафы, стойки', NULL, 1, '2021-04-21 15:18:23');
INSERT INTO `core_items_category` VALUES (4, 'Подстанции трансформаторные комплектные', NULL, 1, '2021-04-21 15:18:23');
INSERT INTO `core_items_category` VALUES (5, 'Устройства релейной защиты и автоматики', NULL, 1, '2021-04-21 15:18:23');
INSERT INTO `core_items_category` VALUES (6, 'Высоковольтная коммутационная аппаратура', NULL, 1, '2021-04-21 15:20:35');
INSERT INTO `core_items_category` VALUES (7, 'Низковольтная коммутационная аппаратура', NULL, 1, '2021-04-21 15:20:35');
INSERT INTO `core_items_category` VALUES (8, 'Прочая электротехническая продукция', NULL, 1, '2021-04-21 15:20:35');
INSERT INTO `core_items_category` VALUES (9, 'Котлы отопительные', NULL, 1, '2021-04-21 15:20:35');
INSERT INTO `core_items_category` VALUES (10, 'Газогорелочное устройства', NULL, 1, '2021-04-21 15:20:35');
INSERT INTO `core_items_category` VALUES (11, 'Автомобильные зеркала ', NULL, 1, '2021-04-21 15:23:38');
INSERT INTO `core_items_category` VALUES (12, 'Прочие ТНП', NULL, 1, '2021-04-21 15:23:38');
INSERT INTO `core_items_category` VALUES (13, 'Измерительная техника', NULL, 0, '2021-04-21 15:23:38');
INSERT INTO `core_items_category` VALUES (15, 'Комплектующие к лифтовому оборудованию', NULL, 1, '2021-04-21 15:31:03');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_leaderships
-- ----------------------------
INSERT INTO `core_leaderships` VALUES (1, 'Директор', 'Приходько Михаил Григорьевич', 'uploads/Direktor2.jpg', '+375 (232) 58-42-72', '+375 (232) 68-20-50', 'raton@inbox.ru', 1, '2021-04-20 09:47:30');
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_news
-- ----------------------------
INSERT INTO `core_news` VALUES (3, 'Test123', '<p>Test123</p>\r\n', 'uploads/7_2.jpg', 3, 0, 1, '2021-04-21 12:14:03');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_news_category
-- ----------------------------
INSERT INTO `core_news_category` VALUES (2, 'Новости', 0, '2021-04-21 12:02:44');
INSERT INTO `core_news_category` VALUES (3, 'Объявления', 0, '2021-04-21 12:02:44');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_pages
-- ----------------------------
INSERT INTO `core_pages` VALUES (1, 'personal_reception', 'Личный прием', '<h3>ГРАФИК ПРИЕМА</h3>\r\n\r\n<p>по личным вопросам граждан директором и его заместителями</p>\r\n\r\n<p>Директор &ndash; Приходько Михаил Григорьевич</p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый понедельник с 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n	<li>Запись по телефону: (+375 232) 58-42-72 или у секретаря в приемной</li>\r\n</ul>\r\n\r\n<p>Главный инженер &ndash; Лакизо Максим Васильевич</p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый четверг с 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n	<li>Запись по телефону: (+375 232) 58-42-72 или у секретаря в приемной</li>\r\n</ul>\r\n\r\n<p>Заместитель директора по производству &ndash; Рагалевич Игорь Кузьмич</p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый вторник с 15.30 до 16.30</li>\r\n	<li>Местонахождение: заводоуправление, 4-ый этаж</li>\r\n</ul>\r\n\r\n<p>Заместитель директора по идеологии, кадрам и социально-бытовым вопросам&ndash; Белова Диана Эдуардовна</p>\r\n\r\n<ul>\r\n	<li>Время приема: каждый вторник с 15.00 до 16.00</li>\r\n	<li>Местонахождение: заводоуправление, 1-ый этаж, отдел кадров</li>\r\n</ul>\r\n', 1, '2021-04-21 11:08:02');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_photo_catalogs
-- ----------------------------
INSERT INTO `core_photo_catalogs` VALUES (1, 'КТП-РТН ПЕРЕДВИЖНАЯ — НОВАЯ РАЗРАБОТКА ОАО «РАТОН» ДЛЯ РУП «БЕЛОРУСНЕФТЬ»', 'uploads/2.jpg', 1, '2021-04-21 09:00:35');
INSERT INTO `core_photo_catalogs` VALUES (4, 'КРУ СЕРИИ РТН (АНАЛОГ D-12) С IP43 ДЛЯ ОАО «БЕЛАРУСЬКАЛИЙ»', 'uploads/17.jpg', 1, '2021-04-21 09:44:05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_questions
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_sliders
-- ----------------------------
INSERT INTO `core_sliders` VALUES (1, 'uploads/1.jpg', 1, '2021-04-20 08:54:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_videos
-- ----------------------------
INSERT INTO `core_videos` VALUES (33, 'ОАО «Ратон»', 'https://www.youtube.com/embed/ZIzM-D3Va2E', 1, '2021-04-21 10:21:21');

SET FOREIGN_KEY_CHECKS = 1;
