-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: jobdb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_day` date DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_blog_user_idx` (`user_id`),
  CONSTRAINT `fk_blog_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Tôi cần tìm việc làm bán thời gian! Mong mọi người giúp đỡ em ạ',46,'2023-09-23',_binary ''),(2,'Tôi cần tìm việc làm bán thời gian tại Hải Phòng! Mong mọi người giúp đỡ em ạ',51,'2023-09-23',_binary ''),(3,'Tôi cần tìm việc kế toán!',48,'2023-09-29',_binary ''),(4,'Tôi cần tìm việc thiết kế!',60,'2023-09-29',_binary '');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `create_day` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user_id`),
  KEY `fk_company_idx` (`company_id`),
  CONSTRAINT `fk_company_cmt` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4,'tốt',44,33,'2023-09-17'),(5,'doanh nghiệp thân thiện, môi trường làm việc chuyên nghiệp',46,38,'2023-09-17'),(6,'Công việc tốt, đồng nghiệp hòa đồng',44,38,'2023-09-19'),(7,'công việc phù hợp với tôi! Cảm ơn doanh nghiệp',51,38,'2023-09-22');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establish` tinytext COLLATE utf8mb4_unicode_ci,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (33,'Công Ty Cổ Phần Dược Phẩm MEDBOLIDE','Phòng 09, Lầu 10, Tòa Nhà The Everrich 1, Số 968 Đường Ba Tháng Hai, Phường 15, Quận 11','2013','https://res.cloudinary.com/dtoc5lqfe/image/upload/v1694787924/ozfvxx3gtvzhnd5ak80b.webp','medbolide@gmail.com','Công ty Cổ Phần Dược Phẩm MEDBOLIDE là công ty chuyên phát triển và phân phối các dược phẩm đặc trị như ung thư, viên gan, tim mạch, v.v... Với sứ mệnh tạo ra những viên thuốc có chất lượng tốt nhất nhằm góp phần vào việc chăm sóc sức khỏe người dân Việt Nam, Công ty Cổ Phần Dược Phẩm MEDBOLIDE lấy phương châm “Tiên phong trong chất lượng” ','https://medbolide.com/'),(34,'Công ty TNHH DOTEA','Số 22 Đường 37, KDC Vạn Phúc, Hiệp Bình Chánh, TP. Thủ Đức','2015','https://res.cloudinary.com/dtoc5lqfe/image/upload/v1694787133/o4rejlt9srqgpzzbr8um.webp','Dotea564@gmail.com','Từ lâu, uống trà, thưởng trà đã trở thành một phần không thể thiếu trong đời sống của người dân Việt. Trà có thể sử dụng nhất ẩm – uống trà một mình, hoặc cùng bạn tâm giao đàm đạo thơ văn, chính sự, nhân sinh nuôi dưỡng tầm hồn.','https://dotea.vn/'),(37,'Tổ chức Giáo dục & Đào tạo Apollo Việt Nam','Số 181 Phố Huế, Hai Bà Trưng, Hà Nội','2008','https://res.cloudinary.com/dtoc5lqfe/image/upload/v1694846504/qqesseunhadquucelvud.webp','apollo@gmail.com','Với chúng tôi, phần thưởng lớn nhất là được nhìn thấy cuộc sống của mọi người tốt đẹp hơn nhờ sự nỗ lực và nhiệt huyết của đội ngũ giáo viên tài năng tại Apollo.','http://apollo.edu.vn/'),(38,'Công ty Cổ phần GUMAC','313/15 Phan Huy Ích, Phường 14, Gò Vấp, Hồ Chí Minh','2016','https://res.cloudinary.com/dtoc5lqfe/image/upload/v1694842374/cjhvkdbmwcph6lyst89q.webp','mac@gmail.com','Với mô hình kinh doanh: Siêu thị thời trang hạnh phúc dành cho mọi người, mọi nhà, GUMAC mong muốn người tiêu dùng không chỉ được trải nghiệm sản phẩm chất lượng, không gian mua sắm ấm áp như ở nhà mà họ còn cảm thấy tự hào và hạnh phúc với sản phẩm thời trang đến từ một thương hiệu thuần Việt.','https://gumac.vn/'),(40,'Công ty TMA Solutions','Tòa nhà TMA, Công viên phần mềm Quang Trung, P. Tân Chánh Hiệp, Quận 12','1999','https://www.tma.vn/Themes/TMAVN.Theme/Images/TMA-logo2.png','tma@gmail.com','TMA tự hào nhận được sự tin tưởng của khách hàng là những tập đoàn lớn đến từ 30 quốc gia trên thế giới. TMA nhiều năm liền vinh dự được bình chọn trong top doanh nghiệp CNTT Việt Nam, liên tục được vinh danh trong top 10 doanh nghiệp xuất khẩu phần mềm, Top 10 doanh nghiệp Fintech, Top 10 doanh nghiệp AI – IoT',' https://www.tma.vn/'),(41,'CÔNG TY TNHH JOLLIBEE VIỆT NAM',' Tầng 26, Tòa nhà CII Tower, số 152 Điện Biên Phủ, Phường 25, Quận Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam','1975','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697116943/x5srwwlsxewktlhvchqp.png','jolibee@gmail.com','Tất cả những gì mà chúng tôi phải làm là mang đến những hương vị tuyệt vời trong từng món ăn, mang lại niềm vui ẩm thực cho tất cả mọi người.','https://jollibee.com.vn/'),(45,'CÔNG TY TÀI CHÍNH VIỆT NAM THỊNH VƯỢNG SMBC','Tòa nhà FE, Lầu 7, Số 144 Cộng Hoà, Phường 12, Q. Tân Bình, Hồ Chí Minh','2003','https://res.cloudinary.com/dtoc5lqfe/image/upload/v1694841550/o4rcs5zk5jy1p1tlmb0k.webp','fecredit@gmail.com','FE CREDIT đã thiết lập một nền tảng vững chắc để trở thành công ty dẫn đầu thị trường tài chính tiêu dùng với mạng lưới trải dài trên toàn quốc tại hơn 13,000 điểm bán hàng cùng hơn 17,500 nhân viên, FE CREDIT kết hợp với hơn 9,000 đối tác','https://fecredit.com.vn/');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `day_apply` date DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_job_cv_idx` (`job_id`) /*!80000 INVISIBLE */,
  KEY `fk_user_cv_idx` (`user_id`),
  CONSTRAINT `fk_job_cv` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_user_cv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (11301423,'1234','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697094385/r6llzvxy1v9ok5l1xrel.png',27,52,'2023-10-12',_binary '\0'),(18819496,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697102552/cguscsy7gzvrys5xc6az.png',27,51,'2023-10-12',_binary '\0'),(21477660,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697268233/pinz21relkimlc0wxmuu.jpg',41,60,'2023-10-14',_binary '\0'),(43376158,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697268372/uz2qm3p8pv2868xo56cw.jpg',33,60,'2023-10-14',_binary '\0'),(43534381,'123','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694915477/yax4rraew4eoofscrosb.jpg',29,46,'2023-09-17',_binary ''),(45886063,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697102667/movrab9mbamtwqgzudmx.jpg',27,44,'2023-10-12',_binary ''),(61711319,NULL,'https://res.cloudinary.com/dfhexl1gh/image/upload/v1697076524/gcvjimvtdhr1nl0dfzsb.png',40,60,'2023-10-12',_binary ''),(66902043,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697094768/il3urvvy6arwo4nne1yb.png',27,52,'2023-10-12',_binary ''),(76593693,'','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697094739/squnfi5o3ptnzx127p6y.jpg',27,52,'2023-10-12',_binary ''),(98343682,'123','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697076524/gcvjimvtdhr1nl0dfzsb.png',27,52,'2023-10-12',_binary ''),(98400652,NULL,'https://res.cloudinary.com/dfhexl1gh/image/upload/v1697076524/gcvjimvtdhr1nl0dfzsb.png',42,61,'2023-10-12',_binary ''),(99012009,NULL,'https://res.cloudinary.com/dfhexl1gh/image/upload/v1697076524/gcvjimvtdhr1nl0dfzsb.png',39,57,'2023-10-12',_binary '');
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_day` date DEFAULT NULL,
  `out_of_day` date DEFAULT NULL,
  `experience` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int NOT NULL,
  `company_id` int NOT NULL,
  `major_id` int NOT NULL,
  `position_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_idx` (`location_id`),
  KEY `fk_company_idx` (`company_id`),
  KEY `fk_major_idx` (`major_id`),
  KEY `fk_rank_idx` (`position_id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_major` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (25,'Nhân Viên Kinh Doanh','Tìm kiếm khách hàng trên tất cả các kênh: online và offline, xây dựng nguồn data và phát triển thị trường khách hàng\r\n Tư vấn về sản phẩm, test mẫu và gửi mẫu cho KH.\r\n CSKH và giải đáp các thắc mắc của khách hàng.','Trình độ cao đẳng \r\nLàm việc full time','2023-09-17','2023-09-29','Từ 2-5 năm','10 - 15 triệu',22,34,13,9),(26,'Nhân viên phục vụ','Phục vụ khách hàng','Chăm chỉ siêng năng','2023-09-17','2023-10-07','không yêu cầu kinh nghiệm','2 - 3 triệu',22,34,13,10),(27,'Nhân viên tiếp tân','Hướng dẫn và nhận đặt bàn','Chăm chỉ, có ngoại hình','2023-09-17','2023-09-29','không yêu cầu kinh nghiệm','8 - 9 triệu',22,34,13,9),(29,'Nhân viên tổ chức sự kiện','Tổ chức các sự kiện theo yêu cầu của khách hàng','làm việc Full-time','2023-09-17','2023-09-20','Không yêu cầu kinh nghiệm','8 - 9 triệu',21,34,15,9),(33,'Nhân Viên Kinh Doanh','Tìm kiếm khách hàng trên tất cả các kênh: online và offline, xây dựng nguồn data và phát triển thị trường khách hàng\r\n Tư vấn về sản phẩm, test mẫu và gửi mẫu cho KH.\r\n CSKH và giải đáp các thắc mắc của khách hàng.','Ưu tiên có kinh nghiệm 06 tháng trở lên ở vị trí tương đương: CSKH, Telesales...\r\n Từng làm qua pha chế hoặc các công việc khác trong ngành F&B, pha chế là lợi thế.\r\n Bằng tốt nghiệp từ THPT, trung cấp, cao đẳng trở lên và sử dụng được tin học văn phòng.','2023-10-14','2023-10-21','Từ 2-5 năm','12-15 triệu',16,41,13,9),(34,'Chuyên Viên Phân Tích Đầu Tư','- Chuẩn bị hồ sơ đề xuất đầu tư và phối hợp với Phòng Phát triển dự án để thực hiện thủ tục xin cấp phép/ điều chỉnh chủ trương đầu tư dự án\r\n - Nhận diện và phân tích các rủi ro có thể ảnh hưởng đến Dự án đầu tư;\r\n - Thực hiện kiểm soát hợp đồng xây dựng và các hợp đồng khác trong quá trình đầu tư dự án','Có kỹ năng giao tiếp, đám phán tốt, kỹ năng giải quyết tình huống, sử dụng thành thạo tin học văn phòng và biết soạn thảo các văn bản, báo cáo nghiệp vụ.\r\n Trung thực, cẩn thận, mong muốn gắn bó lâu dài','2023-10-14','2023-10-28','Dưới 1 năm','10-12 triệu',18,38,15,9),(35,'UX/ UI Designer','Work closely with supervisor to deliver excellent user experiences.\r\n Create wireframes and mockups or prototypes to articulate the desired experience to wide audiences.\r\n  Translate high-level requirements into beautiful, intuitive, and functional user interfaces.','Working in an international, dynamic and professional environment with many opportunities to develop career.\r\n Having opportunities of being trained oversea and working directly with oversea customer\r\n A stable and rewarding position where your long-term commitment will be highly valued.','2023-10-14','2023-10-28','Từ 2-5 năm','Lương thỏa thuận',16,40,14,9),(36,'QA/QC Tech Lead','• Reviewing software requirements and preparing test scenarios.\r\n • Executing tests on software usability.\r\n • Analyzing test results on database impacts, errors or bugs, and usability.\r\n • Preparing reports on all aspects related to the software testing carried out and reporting to the design team.','Having opportunities of being trained oversea and working directly with oversea customer\r\n A stable and rewarding position where your long-term commitment will be highly valued.\r\n Technical & Soft skills internal training courses','2023-10-14','2023-10-31','Từ 2-5 năm','Lương thỏa thuận',16,40,14,9),(37,'Nữ Tư Vấn - Chăm Sóc Khách Hàng','+ Hướng dẫn khách hàng là thành Viên của ThuVienPhapLuat sử dụng. (Họ là các chuyên viên pháp lý, luật sư, viên chức, doanh nhân, quản lý phòng ban, kế toán ...);\r\n \r\n + Nếu khách hàng có nhu cầu sử dụng các Dịch Vụ trả phí thì bạn tư vấn đăng ký gói phí phù hợp, kích hoạt, hướng dẫn để khách hàng sử dụng 1 cách hiệu quả.','- Giọng nói chuẩn, không ngọng lắp, quá địa phương.\r\n - Tốt nghiệp các chuyên ngành: Kinh tế, QTKD, Marketing, Luật, CNTT,… ;','2023-10-14','2023-10-21','Từ 2-5 năm','8-9 triệu',20,33,17,9),(38,'Front-End Engineer ( ReactJS )','• Develop and enhance function for web service.\r\n • Working & communicating with onsite team.\r\n • Have change to improve knowledge on investment and finance domain.','• “FPT care” health insurance provided by AON and is exclusive for FPT employees.\r\n • Annual Summer Vacation: follows company’s policy and starts from May every year\r\n • Salary review 2 times/year or on excellent performance','2023-10-14','2023-10-31','Từ 2-5 năm','Lương thỏa thuận',26,40,14,9),(39,'Chuyên Viên Quản Lý KOL','Tìm kiếm, nghiên cứu và phát triển danh sách Influencer (KOLs) phù hợp\r\n Chịu trách nhiệm phát triển bản thân và liên hệ với các KOL chất lượng cao để tìm kiếm sự hợp tác thông qua YouTube, Instagram, Tiktok, FaceBook và các kênh khác để thúc đẩy tiêu thụ sản phẩm\r\n Liên hệ hợp tác, xử lý hợp đồng và phối hợp với KOLs trong quá trình triển khai','Tốt nghiệp Đại học/Cao đẳng chuyên ngành Marketing, Quản trị Kinh Doanh hoặc tương đương\r\n Có kinh nghiệm ít nhất 6 tháng ở vị trí tương tự, hoặc có kinh nghiệm làm ở các agency, adnetwork, content MKT','2023-10-14','2023-11-02','Trên 5 năm','Lương thỏa thuận',16,38,18,12),(40,'Content Marketing','Lập kế hoạch nội dung: Xây dựng các chủ đề nội dung trong cộng đồng bóng đá để thu hút người dùng;\r\n Sản xuất nội dung: Biên tập các nội dung chất lượng, thiết lập cơ chế vận hành các nhà sáng tạo nội dung, chịu trách nhiệm đối với số lượng bài viết, chất lượng bài viết, mức độ tương tác của người dùng;','Thành thạo tiếng Trung;\r\n Kỹ năng phân tích và tư duy đánh giá tính hiệu quả của nội dung;\r\n Kỹ năng biên tập cơ bản, thành thạo công việc vận hành nội dung: Lập kế hoạch, sản xuất, kiểm duyệt, phân phối và truyền thông nội dung;','2023-10-14','2023-11-03','Từ 2-5 năm','Lương thỏa thuận',16,38,18,9),(41,'Nhân Viên Quản Lý Học Vụ','Full-time teaching staff.\r\n Part-time teaching staff\r\n Arrange teachers for classes and activities when requested\r\n Record / update all daily changes of classes/teacher’s situation and update to Educational Consultants with solution','Good communication skills in English\r\n Proactive, result-driven, organized and detail-oriented\r\n Ability to work independently as well as in a team environment\r\n Computer literacy – MS Office applications (Word, Excel, PowerPoint, Outlook)','2023-10-14','2023-11-03','Từ 2-5 năm','Lương thỏa thuận',17,37,16,9),(42,'Nhân Viên Kế Toán','Xuất hóa đơn các chi nhánh và ký phát hành hóa đơn điện tử.\r\n Xuất hóa đơn sàn TMĐT, ví điện tử …\r\n Thực hiện tập hợp hạch toán hóa đơn các chi nhánh lên phần mềm, hạch toán chi phí phát sinh, kết chuyển doanh thu, chi phí tại các chi nhánh và gửi báo cáo cho Leader.','Tối thiểu 1 năm kinh nghiệm ở các vị trí tương đương.\r\n Tốt nghiệp Trung cấp trở lên chuyên ngành Kế toán, Tài chính kế toán,...\r\n Am hiểu về thuế và có mong muốn phát triển theo mảng thuế.','2023-10-14','2023-11-11','1 năm','2-3 triệu',17,37,20,9),(43,'Content Marketing','Lập kế hoạch nội dung: Xây dựng các chủ đề nội dung trong cộng đồng bóng đá để thu hút người dùng;\r\n  Sản xuất nội dung: Biên tập các nội dung chất lượng, thiết lập cơ chế vận hành các nhà sáng tạo nội dung, chịu trách nhiệm đối với số lượng bài viết, chất lượng bài viết, mức độ tương tác của người dùng;','Thành thạo tiếng Trung;\r\n  Kỹ năng phân tích và tư duy đánh giá tính hiệu quả của nội dung;\r\n  Kỹ năng biên tập cơ bản, thành thạo công việc vận hành nội dung: Lập kế hoạch, sản xuất, kiểm duyệt, phân phối và truyền thông nội dung;','2023-10-14','2023-11-11','Từ 2-5 năm','12-15 triệu',18,45,18,9),(44,'Lead Marketing','-  Lên kế hoạch và thực hiện các chương trình, hoạt động quảng bá nhằm nâng cao giá trị và nhận biết thương hiệu HD Collagen Drink (Event, PR, Digital, Activation, Promotion,……)\r\n- Nắm bắt thị trường để đưa ra chiến lược, định hướng MKT phù hợp.\r\n- Lên ý tưởng, xây dựng các chiến dịch quảng bá sản phẩm và triển khai các chiến dịch quảng cáo trên nền tảng MXH (FB + Tiktok) và sản thương mại điện tử Shopee ...\r\n- Thống kê, phân tích các số liệu và tối ưu các chiến dịch quảng cáo.\r\n- Phối hợp cùng Ban Lãnh Đạo thực hiện các hoạt động Marketing hướng tới khách hàng và nghệ sĩ trực thuộc Công ty.\r\n- Phối hợp với team lên kế hoạch chăm sóc khách hàng.','- Có kinh nghiệm từ 06 tháng tới 1 năm trở lên ở vị trí tương đương\r\n\r\n- Có khả năng tổng hợp, phân tích và đưa ra đánh giá tốt\r\n\r\n- Quyết liệt, cầu tiến hướng tới mục tiêu đã cam kết\r\n\r\n- Tư duy sáng tạo, cởi mở\r\n\r\n- Kỹ năng giao tiếp tốt, làm việc nhóm là một lợi thế','2023-10-14','2023-11-11','Trên 5 năm','Lương thỏa thuận',16,45,18,12),(45,' Nhân viên phục vụ','Chuẩn bị set up trước khi diễn ra tiệc: ngăn nắp, gọn gàng, theo quy trình tiêu chuẩn của Công ty\r\n\r\nSẵn sàng trả lời và giải đáp mọi thắc mắc của khách hàng\r\n\r\nPhục vụ khách với thái đội vui vẻ, chuyên nghiệp\r\n\r\nBáo cáo với quản lý tất cả các sự cố xảy ra trong tiệc\r\n\r\nVệ sinh ngăn nắp khu vực trước, trong và sau khi làm làm việc\r\n\r\nThực hiện các công việc khác theo sự phân công của quản lý trực tiếp','- Giao tiếp tốt, nhanh nhẹn, cẩn thận\r\n\r\n- Sức khỏe tốt','2023-10-14','2023-11-23','Không yêu cầu kinh nghiệm','2-3 triệu',16,41,13,10),(46,'Nhân viên cửa hàng','Lập bill chi tiền & hoàn quỹ tiền mặt cho cửa hàng\r\nTheo dõi tiền sale từng ngày của cửa hàng\r\nLập báo cáo sale\r\nTheo dõi hóa đơn đầu ra từng cửa hàng','- Mới ra trường hoặc có 1 năm kinh nghiệm trong lĩnh vực kế toán\r\n- Tốt nghiệp Cao đẳng/Đại học chuyên ngành Kế toán, Tài chính hoăc các khối ngành Kinh tế.\r\n- Thành thạo tin học văn phòng (Excel, word…)\r\n- Trung thực, nhanh nhẹn, chăm chỉ và có trách nhiệm với công việc được giao','2023-10-14','2023-11-10','1 năm','Lương thỏa thuận',17,41,13,12),(47,'Nhân viên Phụ bếp','- Thực hiện các bước sơ chế như cắt, rửa rau củ quả, rã đông & Thực hiện chiên, nướng, nấu theo tiêu chuẩn các món của cửa hàng;\r\n\r\n- Giao nhận hàng tại khu vực bếp;\r\n\r\n- Kiểm tra chất lượng sản phẩm và nguyên tắc sử dụng sản phẩm theo biểu mẫu;\r\n\r\n- Trưng bày và lên món theo order.\r\n\r\nNhân viên Phục vụ\r\n- Đón tiếp và phục vụ khách hàng ở khu vực ăn uống theo tiêu chuẩn Jollibee;\r\n\r\n- Tiếp nhận đặt phần ăn và tính tiền cho khách tại quầy;\r\n\r\n- Đảm bảo vệ sinh trong khu vực ăn uống và bếp;\r\n\r\n- Các công việc khác theo yêu cầu của Quản lý.','Độ tuổi: Nam Nữ từ đủ 18t - 22t (ưu tiên gắn bó lâu dài, không tuyển thời vụ);\r\nSẵn sàng làm việc các ngày cuối tuần, Lễ, Tết;\r\nNgoại hình ưa nhìn, sức khỏe tốt, nhanh nhẹn, không có hình xăm, yêu thích công việc phục vụ khách hàng.','2023-10-14','2023-12-29','Không yêu cầu kinh nghiệm','2-3 triệu',16,41,13,10),(48,'Nhân Viên Nghiên Cứu Thị Trường','1. Nghiên cứu thị trường\r\n\r\n-Xây dựng và đánh giá các phương pháp thu thập dữ liệu\r\n\r\n- Thu thập dữ liệu nghiên cứu thị trường: làm việc với số liệu thống kê, sử dụng phần mềm dữ liệu để quản lý và tổ chức thông tin, tìm kiếm thông tin chi tiết về thị trường…\r\n\r\n- Nghiên cứu về sản phẩm (máy móc, công nghệ sản xuất…), các công ty cạnh tranh (giá thị phần, năng lực sản xuất…)\r\n\r\n- Lập và trình bày báo cáo với khách hàng và ban lãnh đạo, tham mưu cho ban lãnh đạo về đối thủ, chiến lược, đầu tư và mở rộng công ty…\r\n\r\n2. Hỗ trợ các hoạt động nội bộ của công ty\r\n\r\n3. Thực hiện nhiệm vụ theo yêu cầu của Ban Giám đốc và quản lý cấp trên\r\n\r\n','- Độ tuổi: từ 21 đến 35 tuổi\r\n\r\n- Tiếng Anh giao tiếp trôi chảy\r\n\r\n- Tốt nghiệp Đại học, chuyên ngành Marketing (Ưu tiên những bạn có kinh nghiệm)\r\n\r\n- Có kiến thức về nghiên cứu thị trường (Ưu tiên những bạn có kinh nghiệm làm sale xuất khẩu, B2B)\r\n\r\n- Thành thạo về các kĩ năng tin học văn phòng','2023-10-14','2023-11-29','Không yêu cầu kinh nghiệm','Lương thỏa thuận',23,33,17,9),(49,'Nhân Viên Tư Vấn','Tiếp nhận, tư vấn hỗ trợ theo yêu cầu của khách hàng.\r\nCung cấp thông tin các sản phẩm của công ty cho khách hàng.\r\nĐược hướng dẫn và đào tạo kỹ năng nâng cao về Kinh doanh.\r\nHỗ trợ khách hàng về thủ tục giao dịch, chăm sóc và duy trì mối quan hệ với khách hàng.\r\nCập nhật thông tin thị trường Bất động sản, nắm bắt nhu cầu của Khách hàng.\r\nLàm việc tại Văn phòng (Không đi thị trường).','- Nam/nữ, tuổi từ 18 – 30, ngoại hình ưa nhìn, tác phong phù hợp.\r\n\r\n- Sức khỏe tốt.\r\n\r\n- Trình độ: Tối thiểu THCS trở lên.\r\n\r\n- Có điện thoại di động, Laptop, xe máy.\r\n\r\n- Biết sử dụng vi tính văn phòng (Word, Excel căn bản).\r\n\r\n- Ưu tiên có kinh nghiệm làm trong lĩnh vực BĐS, tư vấn tài chính, bảo hiểm,… Chưa có kinh nghiệm sẽ được đào tạo.\r\n\r\n- Siêng năng nhiệt tình và có trách nhiệm trong công việc.\r\n\r\n- Vui vẻ, năng động, hoạt bát, giao tiếp tốt, không ngại khó, ham học hỏi, chí cầu tiến cao.\r\n\r\n- Yêu thích kinh doanh.','2023-10-14','2023-11-11','1 năm','Lương thỏa thuận',23,33,17,9),(50,'Giáo Viên IELTS','1. Truyền tải kiến thức một cách toàn diện, sáng tạo qua sự nghiên cứu kỹ về bài giảng, phương pháp giảng dạy .\r\n\r\n2. Tương tác, chia sẻ với từng học viên tăng tính năng động, thân mật và thấu hiểu của lớp học.\r\n\r\n3. Tham gia vào việc soạn thảo, sửa đổi và bổ sung giáo trình (sách giáo khoa, bài tập về nhà, bài viết mẫu …)\r\n\r\n4. Theo dõi và đánh giá tỉ mỉ quá trình học của từng học viên để có các phương án phản hồi tích cực và hiệu quả.\r\n\r\n5. Hợp tác chặt chẽ cùng các giáo viên khác và tham gia vào buổi họp chuyên môn định kỳ\r\n\r\n6. Không ngừng nỗ lực nâng cao kiến thức của bản thân và đóng góp xây dựng giáo trình tốt hơn.\r\n\r\n7. Sẵn lòng thực hiện các chính sách và thủ tục của trung tâm.','1 Giới tính / Độ tuổi / Ngoại hình / Sức khỏe: Nam/ Nữ/ Độ tuổi < 28 tuổi/Khá/Tốt\r\n\r\n2 Trình độ học vấn / chuyên môn:  Đại học\r\n\r\n3 Trình độ ngoại ngữ / tin học: Tốt\r\n\r\n4 Năng lực / kỹ năng: Tốt\r\n\r\n5 Số năm kinh nghiệm làm việc: 1 năm trở lên\r\n\r\n6 Các yêu cầu khác (nếu có)\r\n\r\nBắt buộc:\r\n\r\n- Sinh viên năm 4 hoặc ứng viên đã tốt nghiệp các khối trường chuyên về đào tạo tiếng Anh như ĐH Ngoại Ngữ, Đại học Hà Nội, ĐH Ngoại Thương, Ngoại Giao, RMIT, Đại học Sư phạm Hà Nội.\r\n\r\n- Có chứng chỉ IELTS từ 8.0, (Ứng viên vui lòng gửi bản scan chứng chỉ đính kèm)\r\n\r\nƯu tiên các ứng viên có lợi thế sau:\r\n\r\n- Ứng viên đã đi du học là một lợi thế\r\n\r\n- Ưu tiên các ứng viên có kỹ năng sư phạm và truyền đạt tốt, có phương pháp giảng dạy đặc biệt và truyền được cảm hứng cho học viên.\r\n\r\n- Sáng tạo và nhiệt tình, Tác phong chuyên nghiệp','2023-10-14','2023-11-16','Từ 2-5 năm','Lương thỏa thuận',16,37,16,9);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (20,'An Giang'),(27,'Bến Tre'),(22,'Bình Dương'),(26,'Bình Định '),(23,'Đà Nẵng'),(21,'Đồng Nai'),(17,'Hà Nội'),(18,'Hải Phòng'),(16,'Hồ Chí Minh'),(24,'Huế'),(19,'Long An');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (16,'Giáo dục đào tạo'),(15,'Hành chính văn phòng'),(14,'IT Phần mềm'),(20,'Kế toán kiểm toán'),(13,'Kinh doanh / bán hàng'),(18,'Marketing truyền thông quảng cáo'),(17,'Tư vấn'),(19,'Vận tải kho vận');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (10,'Nhân viên bán thời gian'),(9,'Nhân viên chính thức'),(12,'Quản lý'),(8,'Thực tập sinh'),(11,'Trưởng phòng');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `company_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_id_idx` (`company_id`),
  KEY `fk_location_user_idx` (`location_id`),
  CONSTRAINT `fk_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_location_user` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (44,'Nguyễn Thị ','Huyền','Nữ','2051050017anh@ou.edu.vn','0147894574','thuyen','$2a$10$zWcnDj4aw6PVvFJK99EB3uRmsrXXyfC9PNzDDoNQIR7/j7XKFSXzC','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694885739/uhc7kjjemzgms6ltgiqo.jpg','ROLE_USER',_binary '',NULL,22),(46,'An','Võ Văn','Nam','2051050017anh@ou.edu.vn','0981541215','an','$2a$10$hdBLDRQzHMgZL23D4TqHM.BhQbW7GNjKrjO3SVKfWYkJKWmOyYnmi','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694914127/wanvinoejzyailllmzny.jpg','ROLE_USER',_binary '',NULL,18),(48,'Nguyễn Thị ','Lan','Nữ','2051050017anh@ou.edu.vn','0797141246','lan','$2a$10$JDOnny689LmTRMw7Hg6L4egi8VjPmh7ioB0z3GJYcpmPJJovtVera','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694914281/opzt9bezzkq4sezqw0wp.jpg','ROLE_EMPLOYER',_binary '',34,17),(51,'Trần Thị Bích','Ngọc','Nữ','2051050017anh@ou.edu.vn','0147894575','ngoc','$2a$10$UE9obu2QwFcmLqRwUldC.el44mpLC1pqoWZSdHTBeMtzBvtOdlmAC','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694915701/ydqlwkobeatb7gx9da2j.jpg','ROLE_USER',_binary '',NULL,23),(52,'Nguyễn Thị ','Mai','Nữ','2051050017anh@ou.edu.vn','0518740544','test2','$2a$10$dSt3LJpw.uGXOUXaJ3wrOuTsYwQl6amUZzPfDmI3DGqWnRXXPyT.C','https://res.cloudinary.com/dfhexl1gh/image/upload/v1695794273/prxzokoqrribguzdksvt.png','ROLE_EMPLOYER',_binary '',38,24),(55,'Võ Thị Trâm','Anh','Nữ','2051050017anh@ou.edu.vn','0797014886','Admin','$2a$10$2p/Zag0bvFZZQdBmdEPYoOeTgEvUpnLuOIMb9JejlOZxcji2whdFW','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697119437/dguo9fy6vkyhtjjlp63k.jpg','ROLE_ADMIN',_binary '',NULL,20),(56,'Trần Văn','Bé','Nữ','2051050017anh@ou.edu.vn','0797141245','test1','$2a$10$s5Z485n5WRrjBzc7xa4exe3LcO0K3g/4pSTQaSS75C8p7UV4633uG','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697215292/kzby3x0xauhp48osxqoe.jpg','ROLE_EMPLOYER',_binary '\0',40,26),(57,'Nguyễn Văn ','An','Nam','2051050017anh@ou.edu.vn','0797141247','test3','$2a$10$2p/Zag0bvFZZQdBmdEPYoOeTgEvUpnLuOIMb9JejlOZxcji2whdFW','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697119437/dguo9fy6vkyhtjjlp63k.jpg','ROLE_EMPLOYER',_binary '',37,21),(58,'Nguyễn Ái ','Nữ','Nữ','2051050017anh@ou.edu.vn','0981541187','test4','$2a$10$2p/Zag0bvFZZQdBmdEPYoOeTgEvUpnLuOIMb9JejlOZxcji2whdFW','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697119437/dguo9fy6vkyhtjjlp63k.jpg','ROLE_EMPLOYER',_binary '',41,24),(59,'Võ Phú','Đạt','Nam','2051050017anh@ou.edu.vn','0981548517','test5','$2a$10$UE9obu2QwFcmLqRwUldC.el44mpLC1pqoWZSdHTBeMtzBvtOdlmAC','https://res.cloudinary.com/dfhexl1gh/image/upload/v1694915701/ydqlwkobeatb7gx9da2j.jpg','ROLE_EMPLOYER',_binary '\0',33,18),(60,'Nguyễn Thị ','Mai','Nữ','2051050017anh@ou.edu.vn','0797141247','mai@123','$2a$10$fg51DJKdyLSxF1k6lZfZUOEenRnpWesL6dDpl4yt.dUYWRuWTbZJe','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697266940/dbudk30icaipghjd9gcc.jpg','ROLE_USER',_binary '',NULL,24),(61,'Trần Văn','Hoàng','Nam','2051050017anh@ou.edu.vn','0147894598','test7','$2a$10$5SKBDC51FXAaUDvhShg63OwB2IXPHSbO8BdVxi9SiV.P7Hv3rFCJG','https://res.cloudinary.com/dfhexl1gh/image/upload/v1697267347/nbwmymbqsbv96ikzurmk.jpg','ROLE_EMPLOYER',_binary '\0',45,26);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23 15:10:14
