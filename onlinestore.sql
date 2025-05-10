

DROP TABLE IF EXISTS `active_template`;
CREATE TABLE IF NOT EXISTS `active_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `template_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `active_template`
--

INSERT INTO `active_template` (`id`, `store_id`, `template_id`) VALUES(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `store_template_fields`
--

DROP TABLE IF EXISTS `store_template_fields`;
CREATE TABLE IF NOT EXISTS `store_template_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `field_type` enum('text','color','file','textarea') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `store_template_fields`
--

INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(1, 1, 'text_color', 'color', 'Text Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(2, 1, 'header_bg', 'color', 'Header BG Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(3, 1, 'menu_txtcolor', 'color', 'Menu Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(4, 1, 'menu_txtcolorhover', 'color', 'Menu Color Hover');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(5, 1, 'text_size', 'text', 'Text Size (px)');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(6, 1, 'banner_image', 'file', 'Banner Image');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(7, 1, 'contact_info', 'textarea', 'Contact Info');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(8, 1, 'footer_bg', 'color', 'Footer Bg Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(9, 2, 'text_color', 'color', 'Text Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(10, 2, 'header_bg', 'color', 'Header BG Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(11, 2, 'menu_txtcolor', 'color', 'Menu Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(12, 2, 'menu_txtcolorhover', 'color', 'Menu Color Hover');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(13, 2, 'text_size', 'text', 'Text Size (px)');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(14, 2, 'banner_image', 'file', 'Banner Image');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(15, 2, 'contact_info', 'textarea', 'Contact Info');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(16, 2, 'footer_bg', 'color', 'Footer Bg Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(17, 3, 'text_color', 'color', 'Text Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(18, 3, 'header_bg', 'color', 'Header BG Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(19, 3, 'menu_txtcolor', 'color', 'Menu Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(20, 3, 'menu_txtcolorhover', 'color', 'Menu Color Hover');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(21, 3, 'text_size', 'text', 'Text Size (px)');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(22, 3, 'banner_image', 'file', 'Banner Image');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(23, 3, 'contact_info', 'textarea', 'Contact Info');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(24, 3, 'footer_bg', 'color', 'Footer Bg Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(25, 4, 'text_color', 'color', 'Text Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(26, 4, 'header_bg', 'color', 'Header BG Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(27, 4, 'menu_txtcolor', 'color', 'Menu Color');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(28, 4, 'menu_txtcolorhover', 'color', 'Menu Color Hover');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(29, 4, 'text_size', 'text', 'Text Size (px)');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(30, 4, 'banner_image', 'file', 'Banner Image');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(31, 4, 'contact_info', 'textarea', 'Contact Info');
INSERT INTO `store_template_fields` (`id`, `template_id`, `field_name`, `field_type`, `label`) VALUES(32, 4, 'footer_bg', 'color', 'Footer Bg Color');

-- --------------------------------------------------------

--
-- Table structure for table `store_template_field_values`
--

DROP TABLE IF EXISTS `store_template_field_values`;
CREATE TABLE IF NOT EXISTS `store_template_field_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `field_id` int DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `store_template_field_values`
--

INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(1, 1, 1, 1, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(2, 1, 1, 2, '#80d9ff');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(3, 1, 1, 3, '#ffffff');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(4, 1, 1, 4, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(5, 1, 1, 5, '16');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(6, 1, 1, 6, 'uploads/template_1/681e47a570d76.jpg');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(7, 1, 1, 7, 'Name: Ainal<br/>\r\nPhone: 01717426371<br/>\r\nEmail: test@gmail.com<br/>');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(8, 1, 1, 8, '#4da9ff');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(9, 1, 2, 9, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(10, 1, 2, 10, '#7a2e8e');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(11, 1, 2, 11, '#ffffff');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(12, 1, 2, 12, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(13, 1, 2, 13, '16');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(14, 1, 2, 14, 'uploads/template_2/681e4907d1e54.png');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(15, 1, 2, 15, 'Name: Ainal Haque<br/>\r\nPhone: 01717426372<br/>\r\nEmail: test@gmail.com<br/>');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(16, 1, 2, 16, '#7ad3ff');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(17, 1, 3, 17, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(18, 1, 3, 18, '#e3abf7');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(19, 1, 3, 19, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(20, 1, 3, 20, '#b5b0b0');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(21, 1, 3, 21, '16');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(22, 1, 3, 22, 'uploads/template_3/681e49f3ce75e.png');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(23, 1, 3, 23, 'Name: Ainal<br/>\r\nPhone: 01717426371<br/>\r\nEmail: test@gmail.com<br/>');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(24, 1, 3, 24, '#c2c2c2');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(25, 1, 4, 25, '#5c4747');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(26, 1, 4, 26, '#c1ba9a');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(27, 1, 4, 27, '#fafafa');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(28, 1, 4, 28, '#000000');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(29, 1, 4, 29, '16');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(30, 1, 4, 30, 'uploads/template_4/681e4ac6d0949.png');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(31, 1, 4, 31, 'Name: Ainal<br/>\r\nPhone: 01717426371<br/>\r\nEmail: test@gmail.com<br/>');
INSERT INTO `store_template_field_values` (`id`, `store_id`, `template_id`, `field_id`, `value`) VALUES(32, 1, 4, 32, '#b700fa');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `html_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `thumbnail`, `html_file`) VALUES(1, 'Modern Blue', 'assets/thumbs/preview1.png', 'templates/template_1.html');
INSERT INTO `templates` (`id`, `name`, `thumbnail`, `html_file`) VALUES(2, 'Classic Red', 'assets/thumbs/preview2.png', 'templates/template_2.html');
INSERT INTO `templates` (`id`, `name`, `thumbnail`, `html_file`) VALUES(3, 'Minimalist Dark', 'assets/thumbs/preview3.png', 'templates/template_3.html');
INSERT INTO `templates` (`id`, `name`, `thumbnail`, `html_file`) VALUES(4, 'Fresh Green', 'assets/thumbs/preview4.png', 'templates/template_4.html');

