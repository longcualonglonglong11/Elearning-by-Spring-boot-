-- Bam run de chay tu dau toi cuoi
CREATE SCHEMA `elearning` DEFAULT CHARACTER SET utf8;
USE elearning;

CREATE TABLE IF NOT EXISTS roles (
   id INT(11) NOT NULL AUTO_INCREMENT,
   name VARCHAR(30) NOT NULL UNIQUE,
   description VARCHAR(255),
   CONSTRAINT pk_role PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    fullname VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    avatar VARCHAR(255),
    phone VARCHAR(20),
    address VARCHAR(255),
    role_id INT(11) NOT NULL,
    balance DOUBLE,
    CONSTRAINT pk_user PRIMARY KEY(id),
    CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL UNIQUE,
    icon VARCHAR(50) NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS courses (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    letures_count INT(11) NOT NULL,
    length_videos INT(11) NOT NULL,
    view_count INT(11) DEFAULT '0',
    price FLOAT DEFAULT '0',
    discount INT(11) DEFAULT '0',
    promotion_price DECIMAL DEFAULT '0',
    description VARCHAR (255) NOT NULL,
    content TEXT,
    category_id INT(11) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author VARCHAR (255) NOT NULL,
    CONSTRAINT pk_course PRIMARY KEY(id),
    CONSTRAINT fk_course_category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS targets(
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    course_id INT(11) NOT NULL,
    CONSTRAINT pk_target PRIMARY KEY(id),
    CONSTRAINT fk_target_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS videos (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    tag VARCHAR(255),
    url VARCHAR(255) NOT NULL,
    length INT NOT NULL DEFAULT 1,
    time_count INT(11) NOT NULL,
    course_id INT(11) NOT NULL,
    CONSTRAINT pk_video PRIMARY KEY(id),
    CONSTRAINT fk_video_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_courses(
    user_id INT(11) NOT NULL,
    course_id INT(11) NOT NULL,
    role_id INT(11) NOT NULL,
	last_enrolled TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_in_cart boolean default false,
    is_buy boolean default false,
    CONSTRAINT pk_account_course PRIMARY KEY (user_id, course_id),
    CONSTRAINT fk_user_course_user FOREIGN KEY (user_id) REFERENCES users(id)  ON DELETE CASCADE,
    CONSTRAINT fk_user_course_course FOREIGN KEY (course_id) REFERENCES courses(id)  ON DELETE CASCADE
);






-- ROLE
INSERT INTO `elearning`.`roles` (`name`, `description`) VALUES ('ROLE_ADMIN', 'Administration');
INSERT INTO `elearning`.`roles` (`name`, `description`) VALUES ('ROLE_USER', 'User');
INSERT INTO `elearning`.`roles` (`name`, `description`) VALUES ('ROLE_LECTURER', 'Lecturer');
INSERT INTO `elearning`.`roles` (`name`, `description`) VALUES ('ROLE_SUB_LECTURER', 'Teaching assistant');
-- USER



INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (1,'admin@yahoo.com','Nguyễn Hoàng Long','$2a$10$Ze3chHFNknBlT8WejzoBTeRQ/C9cwbfQwO15R7kCktqjET.3DdEAe','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600702847/Elearning/Untitled.gif',987652413,'A45/20A3 Xã Bình Hưng Huyện Bình Chánh',1,0);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (2,'teacher@gmail.com','Teacher Demo','$2a$10$VA0mgZQwHX64Ts5f1VxA1O25hmQmERt9ozO6OdYy.QbGwNTYicwCe','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600392912/Elearning/yasuotruedamage.jpg',976251799,'115 Đường 10, Nguyễn Văn Cừ Quận 5',3,0);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (3,'user@yahoo.com','User Demo','$2a$10$.BaNfM0t2LtKkC9NwqtzP.pdIkON444ivRbfD2GTEHXjVK3C9cHiq','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600393034/Elearning/b18b5b62dc5a10a1f95304f8875de114.jpg',3545716621,'Số 56 Đường Nguyễn Trãi Quận 5',2,10000.5);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (4,'marketingmaster@gmail.com','Nguyễn Tiến Anh','$2a$10$Vr4bGTpRT7rzCQTtydNAoOWkyMB/nglUwgkf6NR5YmLlu3kfjVnbK','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600747504/Elearning/ava1.jpg',971662515,'18a Nguyễn Văn Trỗi, Hồ Chí Minh',3,0);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (5,'designteacher@gmail.com','Nguyễn Thị Viên Trưng','$2a$10$EDEQbjBkr/w3uuC.4wUbBeCobACXU0IDWL9X9dUCeqKTDDnQrniu2','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600748625/Elearning/ava2.jpg',7823251429,'9473 Phố Minh Đà Nẵng',3,0);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (6,'user2@yahoo.com','Nguyễn Thị Bích Vân','$2a$10$SJGmcbdtlt8ktZAwsGtJruW9AzPRBN87B9X4OnRFipzjwIyICpKzy','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600749557/Elearning/ava3.jpg',3917518145,'10 Phố Tống Anh Dân Đà Nẵng',4,631.100009765625);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (7,'bunissment@gmail.com','Phạm Phú Tân','$2a$10$O.RsBpYQFL9qwf6eK6EC9.zyqahiWvMWFGCdr8l/JFf4ml4gWUiBC','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600750664/Elearning/ava4.jpg',8752473691,'24 Phố Nhậm Nguyệt Ân Cần Thơ',3,0);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (8,'user3@yahoo.com','Đỗ Ngọc Kiều My','$2a$10$QfXGRc61P9Tzilcc92.G3.G/TKZyQrtQfSVgzjnIWXeobQDx5qppC','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600766507/Elearning/ava5.jpg',0949225199,'18 Số 6 Đường Hoàng Xuân Diệu Hồ Chí Minh',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (9,'user4@yahoo.com','Trần Yến Trang','$2a$10$mxQS.LtcThKFVo2Mc.dBTezBap5O6y.MoA1h5oUvqHneXWFfL4bdG','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600766618/Elearning/ava6.jpg',093624194,'A50/20/39/89B1 Đường Bùi Xuân Diệu Quận 1',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (10,'user5@yahoo.com','Đinh Đan','$2a$10$dHAbeKwbPmpPxyMa.yXJLOyq5n1z29T7kuSaYvSt/4lVwk3b8ZrG2','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600766708/Elearning/ava7.jpg',0935175181,'Hẻm số 17 Nguyễn Trãi Q5',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (11,'user6@gmail.com','Phương Anh','$2a$10$.7dh1KGu9zsvIdetT74.y.P0GtYn1E28Mlzf0DBzmIzVcjIFau49i','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600766821/Elearning/ava8.jpg',0939175181,'80/100 Số 9 Đường 3/2',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (12,'user7@yahoo.com','Đỗ Xuân Như','$2a$10$8.7sSA3Gm3fzB7fAxJzDBOP/Q2UFVfY5DAWDGOr4XNPGTTrKXrs2m','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600766915/Elearning/ava9.jpg',0989523199,'150 Hồng Bàng Q5',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (13,'user8@yahoo.com','Trần Khánh Vi','$2a$10$7WflEQmiy3.wZwV3JvwAi.HBNld.5RTccdgJm9rIYj7qdaderQPF.','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767041/Elearning/ava10.jpg',0989175181,'Hẻm 137 Ngã 6 Đường Cộng Hòa',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (14,'user9@yahoo.com','Trần Hoàng Thanh','$2a$10$WUyYPfSIRRrTEeeILzpWpuLDXkOfIE2Y9e7lmegv194LLVZngQYBS','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767142/Elearning/ava11.jpg',0459175181,'Đường 1 Hẻm 9 Tân Kì Tân Quý',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (15,'member1@gmail.com','Trần Ngọc Mỹ','$2a$10$g09xDNrZluysYw3MNjSF6O/zQQqABahcH15iwrgmyJrSe9HLfkuhK','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767204/Elearning/ava12.png',0989625199,'A32/20 Bình Hưng',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (16,'member2@gmail.com','Hồ Phương Anh','$2a$10$CR88VSIzdt5RG1xUeSUuteloAfWMkSaaxYn5LZSEX0oGyYRrPnDni','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767280/Elearning/ava13.jpg',0952131199,'Khu phố 1 Phường Tân Hưng',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (17,'member3@yahoo.com','Nguyễn Mỹ Linh','$2a$10$Z0FDe4tnbbr4/aF2gRQ.bO19HJP5J7hWDapDz7e9YLsswJLkH29yK','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767366/Elearning/ava14.jpg',0358463439,'122 Đường số 30 Nguyễn Văn Linh',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (18,'member6@yahoo.com','Ngô Đức Thịnh','$2a$10$L/DZQsexXpmzMZV2EMe7vuzdfKOX/8M5OkdZtpQB1Xp33QwzX3NnG','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767470/Elearning/ava15.jpg',0441235148,'125 Nút Giao Ngã Sáu Cộng Hòa',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (19,'member7@apcs.vn','Lê Minh Trí','$2a$10$UG5HVelWJUUFVd.njic0jeW48yv/wHm4QdrbzqExCqH1T9eL4xase','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767563/Elearning/ava13.png',0989625199,'Đường 60 Ngã Bảy Cần Giuộc',2,1000);
INSERT INTO `elearning`.`users`(id,email,fullname,password,avatar,phone,address,role_id,balance) VALUES (20,'ngohoangbaothach@apcs.vn','Ngô Hoàng Bảo Thạch','$2a$10$JpBI.RdAt0wpjIDtr769oePQdZQ/IbPH0P0ZylxQJBs0tA.RkL2m6','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600767713/Elearning/ava16.jpg',0965146541,'65 Số 7 Ngã rẽ Cộng Hòa Quận 6 TPHCM',2,1000);




-- CATEGORY


INSERT INTO `elearning`.`categories` (`icon`, `title`) VALUES ('fa fa-laptop mr-1', 'Development');
INSERT INTO `elearning`.`categories` (`icon`, `title`) VALUES ('fa fa-handshake-o mr-1', 'Marketing');
INSERT INTO `elearning`.`categories` (`icon`, `title`) VALUES ('fa fa-pencil-square-o mr-1', 'Design');
INSERT INTO `elearning`.`categories` (`icon`, `title`) VALUES ('fa fa-camera-retro mr-1', 'Photography');
INSERT INTO `elearning`.`categories` (`icon`, `title`) VALUES ('fa fa-bar-chart mr-1', 'Business');




-- COURSE


INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (1,'Data Science: Deep Learning in Python','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600708154/Elearning/2020%20Complete%20Python%20Bootcamp.jpg',0,0,0,12.99,76,3,'The MOST in-depth look at neural network theory, and how to code one with pure Python and Tensorflow','This course will get you started in building your FIRST artificial neural network using deep learning techniques. Following my previous course on logistic regression, we take this basic building block, and build full-on non-linear neural networks right out of the gate using Python and Numpy. All the materials for this course are FREE.',1,'2020-09-22 11:27:52','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (2,'Machine Learning A-Z™: Hands-On Python & R In Data Science','https://res.cloudinary.com/dyqx4xje5/image/upload/v1600707242/Elearning/Machine%20Learning%20A-Z.jpg',0,0,0,79.99,25,60,'Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.','This is an amazing course for the beginners who want to understand about everything in machine learning. Thank you to the instructors (Hadelin de Ponteves and Kirill Eremenko) for explained it clearly and easy to understand. I hope this knowledge can help me for developing my start-up, advancing technology, and giving benefits to others.',1,'2020-09-22 14:34:15','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (3,'The Data Science Course 2020: Complete Data Science Bootcamp','https://res.cloudinary.com/dyqx4xje5/image/upload/v1600707769/Elearning/The%20Data%20Science%20Course%202020%20Complete%20Data%20Science%20Bootcamp.jpg',0,0,0,59.99,27,44,'Complete Data Science Training: Mathematics, Statistics, Python, Advanced Statistics in Python, Machine & Deep Learning','Data scientist is one of the best suited professions to thrive this century. It is digital, programming-oriented, and analytical. Therefore, it comes as no surprise that the demand for data scientists has been surging in the job marketplace.',1,'2020-09-22 08:51:26','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (4,'Ultimate Google Ads Training 2020: Profit with Pay Per Click','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600747255/Elearning/Google%20Ads%202020.jpg',0,0,0,0,0,0,'Google Ads 2020: How our clients have transformed their sales using Google Ads & get your Google Ads certification!','Win back your business from your competition by really learning Google AdWords like an expert. This Google AdWords Course has the *HIGHEST STUDENT SATISFACTION RATING in Udemy''s entire marketing and advertising section! *(Reported by Udemy)',2,'2020-09-22 11:36:19','Nguyễn Tiến Anh');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (5,'Complete SEO Training With Top SEO Expert Peter Kent!','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600748058/Elearning/Comple%20SEO.jpg',0,0,0,129.99,10,117,'Win The SEO Game & Dominate The Search Engines With the Author of Best-Selling Search Engine Optimization for Dummies.','You''ll begin by understanding the importance of keywords to SEO, how to find out what people are actually searching for online and how often, and how to pick the right SEO keywords. You''ll also hear about the things you can do to your site to prepare, to ensure the site has the best chance to rank well.',2,'2020-09-22 15:04:02','Nguyễn Thị Viên Trưng');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (6,'Crash Course Electronics and PCB Design','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600748723/Elearning/C%20Course.jpg',0,0,0,199.99,37,126,'Learn Electronics and PCB Design from the Ground up with Altium CircuitMaker and Labcenter Proteus','Crash Course Electronics was designed for one thing -- to take you from mystery to mastery in Electronics and PCB Design. This massive course was custom made for those interested in learning electronics from the ground up that wish to leverage that knowledge to build actual printed circuit boards (PCBs). There is no other course like this in existence that has the depth and breadth of Crash Course Electronics. The course starts with atomic physics and the electron, before you know it you are learning Ohm''s Law, circuit analysis, AC, DC, complex impedance, RC and RL circuits,  filters, amplifiers, transistors, FETs,  analog and digital theory -- too much to list here!',3,'2020-09-22 11:27:30','Nguyễn Thị Viên Trưng');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (7,'Drawing and Painting on the iPad with Procreate','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600749231/Elearning/drawwing.jpg',0,0,0,0,0,0,'Learn everything you need to know about Procreate with hands on drawing lessons. Now updated for Procreate 5.','From the moment Steve Jobs walked on stage and unveiled the iPad I’ve wanted to draw on one. It took a couple years for the hardware and software to catch up but now the iPad a fantastic little art studio you can easily take anywhere.',3,'2020-09-22 11:33:51','Nguyễn Tiến Anh');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (8,'iPhone Photography | Take Professional Photos On Your iPhone','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600749739/Elearning/iphone.jpg',0,0,0,18.99,62,7,'Your Online Guide to Taking Stunning iPhone Photography Like a Professional Digital Photographer','This online photography course will teach you everything you need to know to become a professional digital photographer with nothing more than an iPhone or similar smartphone. It is designed to keep you engaged and hone your skills for taking your pictures to the next level.',4,'2020-09-22 11:47:13','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (9,'Night Photography: You Can Shoot Stunning Night Photos','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600750025/Elearning/nighy.jpg',0,0,0,0,0,0,'You will shoot amazing night photos that impress your family and friends with this complete night photography course!','With this complete night photography course, you''ll learn the ins and outs from the gear we recommend, the settings we use, the composition tips we have, and the photo editing process we use to end up with award-winning night photo',4,'2020-09-22 16:03:36','Nguyễn Thị Viên Trưng');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (10,'Affinity Photo: Solid Foundations','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600750116/Elearning/affi.jpg',0,0,0,0,0,0,'The best selling beginners guide to Affinity Photo - complete with a 50 page PDF to aid your study!','This course has been designed with that in mind. With around 80 lectures and 11 hours of content, Affinity Photo: Solid Foundations takes you from complete beginner through to accomplished user. The major features of the 1.5 and 1.6 updates have been added for free to the course - this course intends to grow as Affinity Photo does.',4,'2020-09-22 11:48:44','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (11,'Beginner to Pro in Excel: Financial Modeling and Valuation','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600750553/Elearning/beg.jpg',0,0,0,199.99,50,100,'Financial Modeling in Excel that would allow you to walk into a job and be a rockstar from day one!','This course is suitable for graduates who aspire to become investment bankers as it includes a well-structured DCF model and goes through the theoretical concepts behind it. Moreover, it will encourage you to be more confident when coping with daily tasks and will give you the edge when the firm must decide whether to take you on for a full-time position.',5,'2020-09-22 15:16:38','Phạm Phú Tân');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (12,'Writing With Flair: How To Become An Exceptional Writer','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600750791/Elearning/wri.jpg',0,0,0,0,0,0,'Ex-Wall Street Journal Editor Teaches How To Write With Confidence, Style & Impact','WELCOME TO THE BESTSELLING WRITING COURSE ON UDEMY, WITH MORE THAN 73,000 STUDENTS, THOUSANDS OF 5-STAR REVIEWS, AND NEWLY UPDATED CONTENT AND RESOURCES.',5,'2020-09-22 11:59:52','Phạm Phú Tân');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (13,'Unreal Engine C++ Developer: Learn C++ and Make Video Games','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600759326/Elearning/unreal.jpg',0,0,0,399.99,40,240,'Created in collaboration with Epic Games. Learn C++ from basics while making your first 4 video games in Unreal','Learn how to create and mod video games using Unreal Engine 4, even if you''re a complete beginner. Unreal is a free-to-use game development engine used by AAA studios and indie developers worldwide. It can be a complex beast to get into, but we break it down step-by-step',1,'2020-09-22 15:19:39','Phạm Phú Tân');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (14,'Mathematics for Computer Games Development using Unity','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600759771/Elearning/math.jpg',0,0,0,0,0,0,'A Beginner''s Guide to Essential Mathematics, Data Structures and Algorithms used in Game Programming applied in Unity','Did you know computer games use mathematics to perform every single task, from rendering to animation and physics to AI?  Mathematics is everywhere.  A fundamental understanding of mathematics is critical in every occupation and nowhere is it more important than in games development. It underpins all primary operations performed by a game engine.  You can''t even move a character across the screen without it.  Keen to learn more and build up your knowledge in mathematics to improve your game development skills?  Then this course is for you.',1,'2020-09-22 14:29:31','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (15,'Deep Learning: GANs and Variational Autoencoders','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600760752/Elearning/deep.jpg',0,0,0,129.99,33,87,'Generative Adversarial Networks and Variational Autoencoders in Python, Theano, and Tensorflow','Variational autoencoders and GANs have been 2 of the most interesting developments in deep learning and machine learning recently.',1,'2020-09-22 14:45:52','Phạm Phú Tân');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (16,'Careers in Data Science A-Z™','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600761302/Elearning/caree.jpg',0,0,0,129.99,50,65,'How to Become a Top Level Data Scientist - Learn What to Expect, How to be Prepared, How to Stand Out and More...','If you want to get valuable insights, advice, hacks & tips, recommendations, lessons from failures and successes from our careers and learn how to apply it to your own and take your Data Science career to the next level, then this course is just for you.',1,'2020-09-22 15:12:43','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (17,'Professional Retouching Course in Photoshop','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600761549/Elearning/prf.jpg',0,0,0,159.99,33,107,'Photoshop Non-destructive Retouching Techniques. Learn Portrait, Beauty and Outdoor Retouching in Photoshop.','You are in the right place. I am Marcin Mikus, Photo Retoucher and Photoshop instructor. For Years I have been exploring photoshop to finally settle in retouching area. I know how difficult is to find the right course where You can learn retouching for different kind of Photography - that’s why i came with this course where i cover different retouching with different images.',4,'2020-09-22 14:59:42','Phạm Phú Tân');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (18,'Ultimate Guide to Landscape and Nature Photography','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600761686/Elearning/ul.jpg',0,0,0,139.99,77,32,'Learn how lighting, composition, and photography techniques help you create stunning landscape and nature photography','In this course jam packed with p[hotography tips, you will learn the key ingredients to creating amazing landscape and nature photos. You will learn about the gear best suited for landscape photography, how to obtain a perfect exposure, how to develop your ‘Eye’ to see striking compositions, and how to ‘see’ the light.',4,'2020-09-22 15:13:36','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (19,'Blender Environment Artist: Create 3D Worlds','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600762945/Elearning/bl.jpg',0,0,0,0,0,0,'Learn Blender 2.8 basics & its Eevee Rendering Engine. Create 3D Assets For Video Games & Make Unique Environment Props','This course is continually updated in response to student suggestions and feedback. If you would like to see something else relevant in the course just let us know.',3,'2020-09-22 16:02:09','Teacher Demo');
INSERT INTO `elearning`.`courses`(id,title,image,letures_count,length_videos,view_count,price,discount,promotion_price,description,content,category_id,last_update,author) VALUES (20,'Creating 3D environments in Blender','http://res.cloudinary.com/dyqx4xje5/image/upload/v1600763210/Elearning/cr.jpg',0,0,0,0,0,0,'This course helps you creating wonderful environment scenes, organizing your workflow, and find the right inspiration.','After four years, the creating 3D environments course, is now finally here for Blender 2.81. Thousands of students participated in the first version of this course and there were a lot of requests for a follow-up course. Prepare for a new chapter in the world of 3D environments!',1,'2020-09-22 16:02:46','Teacher Demo');



-- VIDEO



INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (1,'Practical Deep Learning Tutorial with Python Intro p.1','OGxgnH8y2NM','https://www.youtube.com/watch?v=OGxgnH8y2NM',11,0,1);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (2,'Machine Learning Basics','ukzFI9rgwfU','https://www.youtube.com/watch?v=ukzFI9rgwfU',8,0,2);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (3,'Regression Intro - Practical Machine Learning Tutorial with Python p.2','X-FKcenZ-jo','https://www.youtube.com/watch?v=X-FKcenZ-jo',37,0,1);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (4,'Natural Language Processing in Python','xvqsFTUsOmc','https://www.youtube.com/watch?v=xvqsFTUsOmc',111,0,1);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (5,'Machine Learning & Artificial Intelligence: Crash Course Computer Science','z-EtmaFJieY','https://www.youtube.com/watch?v=z-EtmaFJieY',12,0,2);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (6,'Supervised vs Unsupervised vs Reinforcement Learning','xtOg44r6dsE','https://www.youtube.com/watch?v=xtOg44r6dsE',19,0,2);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (7,'Machine Learning Fundamentals: Bias and Variance','63NTeLmDANo','https://www.youtube.com/watch?v=63NTeLmDANo',12,0,2);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (8,'Workshop Data & Machine Learning - How to Start','xvdXi4ejk2w','https://www.youtube.com/watch?v=xvdXi4ejk2w',133,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (9,'What is Data Science?  Introduction to Data Science','KxryzSO1Fjs','https://www.youtube.com/watch?v=KxryzSO1Fjs',49,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (10,'Real Talk with Instagram Data Scientist','dYZJxhYjBE8','https://www.youtube.com/watch?v=dYZJxhYjBE8',12,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (11,'What Do You Need to Become a Data Scientist in 2020?','UXi8Ml2UoYk','https://www.youtube.com/watch?v=UXi8Ml2UoYk',9,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (12,'Natural Language Processing in Python','xvqsFTUsOmc','https://www.youtube.com/watch?v=xvqsFTUsOmc',111,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (13,'Introduction to Data Science with R - Data Analysis Part 1','32o0DnuRjfg','https://www.youtube.com/watch?v=32o0DnuRjfg',81,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (14,'Introduction to Data Science with R - Data Analysis Part 2','u6sahb7Hmog','https://www.youtube.com/watch?v=u6sahb7Hmog',59,0,3);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (15,'Resources to Learn Marketing in 2020','ZYw52nVZl_0','https://www.youtube.com/watch?v=ZYw52nVZl_0',5,0,4);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (16,'Marketing 101, understanding marketing basics, and fundamentals','A2t-yhFaUC0','https://www.youtube.com/watch?v=A2t-yhFaUC0',90,0,4);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (17,'Digital Marketing Course For Beginner','kpgerCE095A','https://www.youtube.com/watch?v=kpgerCE095A',77,0,5);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (18,'Secret Formula of Sales and Marketing','Jxe8Tgnz2SA','https://www.youtube.com/watch?v=Jxe8Tgnz2SA',15,0,5);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (19,'LEARN DIGITAL MARKETING FOR FREE | BEST ONLINE RESOURCES WITH CERTIFICATION','jgezhPOzS5Q','https://www.youtube.com/watch?v=jgezhPOzS5Q',4,0,5);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (20,'What Is Digital Marketing? | Digital Marketing Tutorial For Beginners','s7sUDQni0LI','https://www.youtube.com/watch?v=s7sUDQni0LI',23,0,5);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (21,'Basics of Stock Market For Beginners Lecture 1 By CA Rachana Phadke Ranade','Xn7KWR9EOGQ','https://www.youtube.com/watch?v=Xn7KWR9EOGQ',95,0,5);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (22,'Learn PCB Designing in 15 Minutes','H9pGbLJknDk','https://www.youtube.com/watch?v=H9pGbLJknDk',5,0,6);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (23,'Starting with OrCAD and Cadence Allegro PCB - Tutorial for Beginners','giEKigazwjk','https://www.youtube.com/watch?v=giEKigazwjk',73,0,6);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (24,'IPAD PAINTING TUTORIAL - Lake and trees landscape art in Procreate','W4CbTznZU1o','https://www.youtube.com/watch?v=W4CbTznZU1o',26,0,7);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (25,'Ipad pro Procreate Portrait Painting 09062019','tI0AYxY5bh8','https://www.youtube.com/watch?v=tI0AYxY5bh8',19,0,7);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (26,'5 Free (and Really Good) Drawing & Painting Apps','g43CV4X3rmk','https://www.youtube.com/watch?v=g43CV4X3rmk',13,0,7);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (27,'7 STEPS TO STARTING AN ONLINE BUSINESS','Ev8wR0gBV9s','https://www.youtube.com/watch?v=Ev8wR0gBV9s',11,0,8);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (28,'HOW TO START RTW BUSINESS ONLINE ⎮STEP BY STEP GUIDE','MuHjxlhIyJc','https://www.youtube.com/watch?v=MuHjxlhIyJc',15,0,8);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (29,'INTRODUCE TO NIGHT PHOTOGRAPHY','HPytBIKUD-k','https://www.youtube.com/watch?v=HPytBIKUD-k',11,0,9);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (30,'21 Minutes of Pure Night Rainy Photography','4eTlKwZNlmc','https://www.youtube.com/watch?v=4eTlKwZNlmc',21,0,9);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (31,'How To Edit Moody Night Photo','GWWe-Oy64Vg','https://www.youtube.com/watch?v=GWWe-Oy64Vg',8,0,9);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (32,'Affinity Photo - Tutorial for Beginners in 12 MINUTES !','lDQn7Ol1z2Q','https://www.youtube.com/watch?v=lDQn7Ol1z2Q',12,0,10);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (33,'Applying Blender Filmic Looks (Affinity Photo)','YaoeGnv3FGg','https://www.youtube.com/watch?v=YaoeGnv3FGg',11,0,10);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (34,'AFFINITY PHOTO vs PHOTOSHOP','J9fz4Pn_GSM','https://www.youtube.com/watch?v=J9fz4Pn_GSM',14,0,10);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (35,'Double Exposure - Affinity Photo Tutorial','Iu-ffLXJbJ8','https://www.youtube.com/watch?v=Iu-ffLXJbJ8',12,0,10);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (36,'Intermediate Excel Skills, Tips, and Tricks Tutorial','lxq_46nY43g','https://www.youtube.com/watch?v=lxq_46nY43g',20,0,11);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (37,'Power BI Tutorial From Beginner to Pro','AGrl-H87pRU','https://www.youtube.com/watch?v=AGrl-H87pRU',60,0,11);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (38,'How to Improve Your Writing Using Simplicit','O5YxBVYVMqg','https://www.youtube.com/watch?v=O5YxBVYVMqg',38,0,12);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (39,'How to Write a Good Paragraph','L1J9ZPVydrc','https://www.youtube.com/watch?v=L1J9ZPVydrc',6,0,12);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (40,'Unreal For All Creators - Deep Dive | Inside Unreal','3wcTor5rwmE','https://www.youtube.com/watch?v=3wcTor5rwmE',113,0,13);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (41,'Unreal Engine 5 Revealed!','qC5KtatMcUw','https://www.youtube.com/watch?v=qC5KtatMcUw',9,0,13);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (42,'10 Graphically INSANE Levels Created In UNREAL ENGINE 4','QVbRO-6MFV4','https://www.youtube.com/watch?v=QVbRO-6MFV4',10,0,13);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (43,'Create a Forest in UE4 in 1 Hour','FzoY062kY1s','https://www.youtube.com/watch?v=FzoY062kY1s',53,0,13);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (44,'Mathematics for Computer Games Development using Unity','yg6h4XQqPNQ','https://www.youtube.com/watch?v=yg6h4XQqPNQ',179,0,14);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (45,'MAKE GAMES WITHOUT CODE! - Unity 3D Game Kit','qsU4nM0L_n0','https://www.youtube.com/watch?v=qsU4nM0L_n0',13,0,14);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (46,'Essential Mathematics For Aspiring Game Developers','DPfxjQ6sqrc','https://www.youtube.com/watch?v=DPfxjQ6sqrc',47,0,14);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (47,'Math for Game Programmers: Interaction With 3D Geometry','GpsKrAipXm8','https://www.youtube.com/watch?v=GpsKrAipXm8',67,0,14);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (48,'Deep Learning: GANs and Variational Autoencoders','DkFGQe-yIyc','https://www.youtube.com/watch?v=DkFGQe-yIyc',4,0,15);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (49,'Deep Generative Modeling | MIT 6.S191','rZufA635dq4','https://www.youtube.com/watch?v=rZufA635dq4',40,0,15);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (50,'S18 Lecture 16: Variational Autoencoders','cOJHA3Gag9I','https://www.youtube.com/watch?v=cOJHA3Gag9I',81,0,15);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (51,'Introduction to Data Science with R - Data Analysis Part 1','32o0DnuRjfg','https://www.youtube.com/watch?v=32o0DnuRjfg',81,0,16);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (52,'Introduction to Data Science with R - Data Analysis Part 2','u6sahb7Hmog&t=2s','https://www.youtube.com/watch?v=u6sahb7Hmog&t=2s',59,0,16);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (53,'The ULTIMATE guide to COMPOSITION in landscape photography','bWS_4IQPXlk','https://www.youtube.com/watch?v=bWS_4IQPXlk',14,0,18);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (54,'Landscape Photography | Spectacular SNOWDONIA - DINORWIC Slate Quarry - ULTIMATE Guide Part One','0uLsdjeUAQY','https://www.youtube.com/watch?v=0uLsdjeUAQY',30,0,18);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (55,'Ultimate Guide to Backpacking(Trekking) with Photography Gear ( Equipment List Included )','lKSj-FChaUc','https://www.youtube.com/watch?v=lKSj-FChaUc',29,0,18);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (56,'The Ultimate Guide to Architecture Presentation Boards *Life Changing*','Rx6lF79zCdo','https://www.youtube.com/watch?v=Rx6lF79zCdo',10,0,18);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (57,'Creating Large-Scale Environments in Blender 2.8','xZJVwpU-1zE','https://www.youtube.com/watch?v=xZJVwpU-1zE',16,0,19);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (58,'World Building: Part 1 3D design for the 2D artist','i4N-d21Ub_Q','https://www.youtube.com/watch?v=i4N-d21Ub_Q',17,0,19);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (59,'Creating 3D Environments Udemy course','C3AxVvGgvMQ','https://www.youtube.com/watch?v=C3AxVvGgvMQ',1,0,19);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (60,'Creating 3D environments launch trailer','FalqUemTOo0','https://www.youtube.com/watch?v=FalqUemTOo0',1,0,20);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (61,'Creating Large-Scale Environments in Blender 2.8','xZJVwpU-1zE','https://www.youtube.com/watch?v=xZJVwpU-1zE',16,0,20);
INSERT INTO `elearning`.`videos`(id,title,tag,url,length,time_count,course_id) VALUES (62,'Blender - Easy Environment Design (Blender 2.8)','Vt-_Htl-R90','https://www.youtube.com/watch?v=Vt-_Htl-R90',13,0,20);




-- TARGET


INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (1,'Learn how Deep Learning REALLY works (not just some diagrams and magical black box code)',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (2,'Learn how a neural network is built from basic building blocks (the neuron)',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (3,'Code a neural network from scratch in Python and numpy',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (4,'Code a neural network using Google''s TensorFlow',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (5,'Describe different types of neural networks and the different types of problems',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (6,'Derive the backpropagation rule from first principles',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (7,'Create a neural network with an output that has K > 2 classes using softmax',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (8,'Describe the various terms related to neural networks',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (9,'Install TensorFlow',1);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (10,'Master Machine Learning on Python & R',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (11,'Have a great intuition of many Machine Learning models',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (12,'Make robust Machine Learning models',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (13,'Make powerful analysis',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (14,'Use Machine Learning for personal purpose',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (15,'Handle specific topics like Reinforcement Learning, NLP and Deep Learning',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (16,'Know which Machine Learning model to choose for each type of problem',2);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (17,'The course provides the entire toolbox you need to become a data scientist',3);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (18,'Impress interviewers by showing an understanding of the data science field',3);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (19,'Learn how to pre-process data',3);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (20,'Understand the mathematics behind Machine Learning',3);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (21,'Start coding in Python and learn how to use it for statistical analysis',3);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (23,'Drive Consistent, Round-The-Clock Traffic To Your Website or Landing Page',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (24,'Use Conversion Tracking To Determine The Value Of Your Ad Campaigns',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (25,'Create, Develop and Optimize Your Own Profitable Google AdWords Campaigns',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (26,'Remarket to Your Previous Website Visitors To Get Them Coming Back To Your Site',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (27,'Advertise Your Products And Services Online Effectively',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (28,'Monetize The More Than 6 Billion Daily Searches On Google',4);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (29,'Students will be able to analyze and construct basic analog and digital circuits.',6);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (30,'Students will be able to leverage this knowledge to build and produce electronic products completely themselves.',6);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (31,'Students will be able to use numerous CAD and design tools such as schematic entry, PCB layout and routing, circuit simulators, MATLAB, and more.',6);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (32,'Students will learn how to use basic electronics lab equipment such as oscilloscopes, power supplies, signal generators, and more.',6);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (33,'Students will learn hands on techniques such as circuit construction with solderless breadboards, wire wrapping, and soldering.',6);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (34,'Users will have a deep understanding of Procreate',7);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (35,'Create Speedraw videos they can post online',7);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (36,'Create and import custom brushes',7);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (37,'Have a basic understanding of how to compose and create a painting',7);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (38,'How to replicate professional digital photography with your iPhone.',8);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (39,'How to take stunning photos by utilizing shot composition.',8);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (40,'How to professionally edit photos with Lightroom (free) on your iPhone.',8);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (41,'How to utilize surrounding light to propely light your subjects.',8);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (42,'How to optimize iPhone settings for taking the best photos.',8);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (43,'You will learn how to take beautiful night photographs - like the pros!',9);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (44,'You will be happier with the photos you shoot than ever before!',9);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (45,'You will learn how to shoot light trail photos with your camera',9);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (46,'You will know what equipment you need to shoot great night photos',9);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (47,'You will learn how to edit night photos to make them look even better',9);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (48,'Design distributed systems that manage',12);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (49,'Use HDFS and MapReduce for storing and analyzing data at scale.',12);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (50,'A former Wall Street Journal editor, will teach you the secret to making your writing sparkle',12);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (51,'You will discover the four ingredients of exceptional writing',12);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (52,'Master Microsoft Excel and many of its advanced features',11);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (53,'Become one of the top Excel users in your team',11);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (54,'Design professional and good-looking advanced charts',11);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (55,'C++, the games industry standard language.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (56,'How to use the Unreal Engine 4 Editor.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (57,'Git as a version control and backup system.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (58,'Object Oriented Programming and how to put it into practice.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (59,'Sound effects and audio to add depth to your games.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (60,'Unreal''s Terrain Editor to create epic landscapes.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (61,'Animation Blueprint for custom character animation.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (62,'Advanced vehicle physics.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (63,'Blackboard and Behaviour Tree for customizable AI.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (64,'C++ template programming to reduce repetition.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (65,'Vector maths for game play and physics calculations.',13);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (66,'The knowledge you need to do the SEO work yourself',5);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (67,'Supervise an SEO optimization team or outside SEO firm.',5);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (68,'How to use bitwise operations to optimise processing and storage in games.',14);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (69,'The principles and practice behind collision detection with lines',14);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (70,'The beauty of affine transformations and the fundamentals in transforming game objects.',14);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (71,'What a quaternion is and how it is used to rotate game objects.',14);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (72,'How to build a mathematics library in C# from scratch.',14);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (73,'Learn the basic principles of generative models',15);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (74,'Build a variational autoencoder in Theano and Tensorflow',15);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (75,'Build a GAN (Generative Adversarial Network) in Theano and Tensorflow',15);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (76,'The basic steps on how to become a Data Scientist',16);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (77,'How to take their Data Science career to the next level',16);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (78,'Hacks, tips & tricks for their Data Science career',16);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (79,'You will gain the ability to find subjects and scenes worthy of photographing.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (80,'You will understand what great light is and the best light for different subjects.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (81,'You will learn to master composition and compose better photographs.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (82,'You will understand what photo equipment is best for broad or narrow landscapes.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (83,'You will learn the Exposure Triangle and capture perfect exposures each time.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (84,'How to take a mundane RAW file and make it look fabulous.',18);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (85,'Learn Blender 2.8 (the newest version of this amazing 3D software) to an intermediate level.',19);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (86,'Create complete environmental scenes that look stunning.',19);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (87,'Create marvellous materials and textures that bring your worlds to life.',19);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (88,'Cleverly light your environments to create different moods and atmospheres.',19);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (89,'Learn workflow tips that will boost your productivity',19);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (90,'Creating stunning unique environments',20);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (91,'Organize your workflow to make large environment scenes',20);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (92,'More than 250 unique 2K / 4K textures',20);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (93,'Lots of medieval reference photos',20);
INSERT INTO `elearning`.`targets`(id,title,course_id) VALUES (94,'6 Characters to fill up your scene',20);





-- USER_COURSE

INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,1,2,'2020-09-22 10:46:29',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,2,2,'2020-09-22 08:13:50',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,3,2,'2020-09-22 09:42:11',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,4,2,'2020-09-22 11:17:53',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,5,2,'2020-09-22 11:32:20',1,0);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,6,2,'2020-09-22 11:28:41',1,0);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,7,2,'2020-09-22 11:36:46',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (3,14,2,'2020-09-22 12:19:24',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,1,4,'2020-09-22 12:19:24',1,0);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,2,2,'2020-09-22 11:39:58',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,3,2,'2020-09-22 11:40:02',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,4,2,'2020-09-22 11:39:53',1,0);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,5,2,'2020-09-22 12:20:21',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,6,2,'2020-09-22 11:54:04',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,7,2,'2020-09-22 11:39:48',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,8,2,'2020-09-22 11:44:26',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,9,2,'2020-09-22 11:53:54',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,10,2,'2020-09-22 11:53:49',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,11,2,'2020-09-22 12:19:13',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,12,2,'2020-09-22 12:19:05',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,13,2,'2020-09-22 14:34:50',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (6,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (7,3,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (8,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (9,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (10,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (11,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (12,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (13,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,1,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,2,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,3,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,4,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,5,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,6,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,7,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,8,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,9,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,10,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,11,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,12,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,13,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,14,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,15,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,16,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,17,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,18,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,19,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (14,20,2,'2020-09-22 14:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,1,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,2,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,3,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,5,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,6,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,7,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,8,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,9,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,10,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,11,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,12,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,13,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,14,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,15,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,16,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,17,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,18,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,19,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (15,20,2,'2020-09-22 15:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,1,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,2,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,3,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,5,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,6,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,7,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,8,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,9,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,11,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,14,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,15,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,16,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,17,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,18,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,19,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (16,20,2,'2020-09-22 16:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,1,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,2,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,3,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,6,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,7,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,9,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,11,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,12,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,17,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,19,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (17,20,2,'2020-09-22 17:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,3,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,4,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,5,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,7,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,8,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,10,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,11,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,13,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,17,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,18,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,19,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (18,20,2,'2020-09-22 18:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,1,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,2,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,3,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,4,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,5,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,11,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,12,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,13,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,17,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,18,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,19,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (19,20,2,'2020-09-22 19:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,1,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,2,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,3,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,4,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,5,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,7,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,8,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,9,2,'2020-09-22 20:34:41',0,1);
INSERT INTO `elearning`.`user_courses`(user_id,course_id,role_id,last_enrolled,is_in_cart,is_buy) VALUES (20,10,2,'2020-09-22 20:34:41',0,1);
