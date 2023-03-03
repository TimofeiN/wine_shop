USE wine_shop;


INSERT INTO `categories` VALUES
	(1,'Wines'),(2,'Sparkling Wines'),(3,'Strong Drinks'),(4,'Beers'),(5,'Soft Drinks');


INSERT INTO `product_types` VALUES
	(1,'White Semi-sweet',1),(2,'Red Dry',2),(3,'Prosecco',3),(4,'Champagne',4),(5,'Whiskey',5),
	(6,'Cognac',1),(7,'Lager',2),(8,'Stout',3),(9,'Water',4),(10,'Lemonade',5);


INSERT INTO `producers` VALUES 
	(1,'Pfeffer','http://www.pfeffer.com/','Et nihil est et animi deserunt voluptatum ad fugiat.','karley57@yahoo.com'),
	(2,'Veum','http://veum.com/','Ad ipsum sed ullam nostrum.','ramon37@gmail.com'),
	(3,'Wind','http://www.windlerschuster.org/','Corrupti similique et et dolorem non nam.','mckenzie.jaron@lang.com'),
	(4,'Cronin','http://www.cronin.org/','Qui autem ea asperiores vero deserunt voluptas modi.','herta.kreiger@yahoo.com'),
	(5,'Mitch','http://mitchellboehm.info/','Consequatur nam numquam omnis delectus voluptatem.','demario.skiles@gmail.com'),
	(6,'Lord','http://www.gaylordauer.com/','Velit illo sapiente magni laboriosam a.','rwillms@gutkowskiokon.com'),
	(7,'Spencer Hill','http://spencer.com/','Est est ab aliquam.','icasper@yahoo.com'),
	(8,'Walter','http://www.schowalter.com/','Quasi ea velit aut laboriosam.','kylie.bogan@hotmail.com'),
	(9,'Rose','http://www.kuphalboyer.org/','Impedit est rerum ad ducimus sit quaerat facilis.','hoeger.dedrick@powlowski.com'),
	(10,'Dibbert','http://www.dibbert.com/','Harum facere consequatur consequuntur hic ut.','ygaylord@heaney.com');


INSERT INTO `products` VALUES 
	(1,'Eos',3137.00,1,1,'2016-01-27 04:53:19','2011-01-01 21:02:43'),
	(2,'Est',8875.00,2,2,'1999-10-01 16:40:48','1982-03-30 11:50:24'),
	(3,'Nostrum',7925.00,3,3,'1975-03-04 14:38:24','1994-06-09 00:27:40'),
	(4,'Natus',5891.00,4,4,'1982-02-23 14:31:40','1984-08-03 16:39:13'),
	(5,'Facere',2263.00,5,5,'2013-05-12 16:41:11','2003-09-12 18:35:23'),
	(6,'Rerum',4807.00,6,6,'2022-01-14 05:06:53','1973-09-15 08:04:35'),
	(7,'Culpa',6027.00,7,7,'1995-04-25 08:06:26','2019-10-13 08:08:32'),
	(8,'Explicabo',3270.00,8,8,'2015-10-05 03:14:08','1970-11-27 23:04:03'),
	(9,'Non',8835.00,9,9,'2010-08-04 04:57:46','1997-10-30 06:44:04'),
	(10,'Rem',1514.00,10,10,'2014-12-05 06:09:12','2009-08-09 15:41:37');


INSERT INTO `fotos` VALUES 
	(1,'et',3,'tmp/95e7f7c5ae7a49c6c1be7b052a8ce1c7.jpg',NULL),
	(2,'ut',9602,'tmp/83d8086156d7ea66a70469be84d9f82e.jpg',NULL),
	(3,'consequuntur',776994,'tmp/746893320e9278de26e96da1be5f4acc.jpg',NULL),
	(4,'error',168653,'tmp/c951950eb356a2d095047161cd8208f3.jpg',NULL),
	(5,'maiores',1440844,'tmp/40cd4b5a1ad6e27854c662c232251668.jpg',NULL),
	(6,'consequatur',2966244,'tmp/d89838f191eb9b2d915bd0591eab5749.jpg',NULL),
	(7,'blanditiis',403315804,'tmp/7aab41c02a8c049bb9c8a9777646bd3f.jpg',NULL),
	(8,'ut',6062,'tmp/ceb22757243dd9850d9462a790f3ecca.jpg',NULL),
	(9,'reprehenderit',531,'tmp/85c2c1f5264fae0fc388b1dd36469273.jpg',NULL),
	(10,'ut',8,'tmp/76488ff804172192601f3f2272124c90.jpg',NULL);


INSERT INTO `product_profiles` VALUES 
	(1,1,'Northern Mariana Islands','NorthCarolina','Non minus dolore.',14.00,0.750,'Aspernatur praesentium earum sint ex provident eum consequuntur.','\0'),
	(2,2,'Algeria','Maine','Ea aut.',9.00,3.000,'Sunt voluptate vero odit ut dolorem. Repellat nihil aut et exercitationem.','\0'),
	(3,3,'Korea','Mississippi','Voluptatem quod pariatur.',40.45,0.375,'Et earum nihil deleniti eos.',''),
	(4,4,'Georgia','Colorado','Aperiam quaerat.',4.50,0.750,'Unde corporis qui ut. Quia reiciendis labore laudantium voluptatem aut vitae.','\0'),
	(5,5,'Comoros','Louisiana','Corrupti et cum.',0.00,1.000,'Autem sunt aut impedit nam.','\0'),
	(6,6,'Dominica','Pennsylvania','Reprehenderit aut velit.',6.00,0.750,'Eius eum sapiente et ut deserunt quae harum.',''),
	(7,7,'Oman','Wyoming','Nulla vero.',14.00,9.000,'Delectus tempore aut reprehenderit voluptate. Cupiditate consequatur laborum at qui ea odit.',''),
	(8,8,'Tunisia','NorthDakota','Ad mollitia.',40.00,1.250,'Qui unde inventore mollitia alias ut aut.','\0'),
	(9,9,'Panama','Illinois','Est beatae pariatur.',6.30,0.500,'Et libero fuga ut totam quae sit sunt et.','\0'),
	(10,10,'Pitcairn Islands','Florida','Voluptas illo quo.',0.00,1.250,'Sed qui quia voluptas laborum exercitationem ea beatae.','\0');


INSERT INTO `users` VALUES 
	(1,'Durward','Hand','stan.purdy@example.com','caf5c1cbabaa4906cf192762381855b369bcaf33','1973-12-31',89989463097,'2005-04-13 02:39:16'),
	(2,'Avery','Steuber','jmccullough@example.com','f50a6cbde35273efd6b464d02d0df6c5c288b782','1984-06-21',89929582102,'1991-06-15 09:33:09'),
	(3,'Lenny','Green','hassan.west@example.net','9e2fd10f9d17ea13714be13f073be73efebdcd21','1978-07-25',89446465210,'1980-05-05 14:22:39'),
	(4,'Aiden','Braun','kuhlman.lacy@example.net','00baa27d9cfc910769e3b0fc53bc1548e458e869','2002-02-18',89821426754,'1973-08-21 03:33:13'),
	(5,'Vilma','Kautzer','william.borer@example.com','0917cae4532af694db5c2ad5b508c3c11c5d105d','2019-10-03',89275668106,'2020-12-04 20:10:58'),
	(6,'Edison','Turcotte','beahan.xander@example.org','be3aed3be94bb2a08befcb5ade65c332acdf34c2','2012-02-01',89625036801,'1971-12-24 10:46:02'),
	(7,'Winifred','Schamberger','kkeebler@example.org','4acfa5a9c9d1ae8bdc5efe1b1c014ce848df63a6','1971-09-21',89461412170,'2020-12-15 03:56:15'),
	(8,'Tristian','Okuneva','stiedemann.kaya@example.com','84762ba8e8229682ff45567b99864ad48b0bf669','1995-10-01',89120044018,'1979-09-05 10:11:32'),
	(9,'Jimmie','Marquardt','caden.kassulke@example.org','4e694f7fb0201a674b665f0e70662433dc70905c','2020-02-06',89326949767,'1993-10-13 20:35:24'),
	(10,'Erin','Brakus','alyce.bode@example.com','3d3fb8db14644027cf9d0c9ea427a015a2f8fc8e','1991-10-24',89193842495,'1982-08-17 12:34:19');


INSERT INTO `discounts` VALUES 
	(1,2,10,'2004-01-20 18:08:23','2015-08-23 03:23:12','2003-10-31 00:15:00'),
	(2,4,8,'1995-07-11 04:19:11','1995-12-18 12:14:55','2003-08-26 23:55:06'),
	(3,5,21,'1990-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(4,6,0,'1990-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(5,7,0,'1991-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(6,8,0,'1992-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(7,9,0,'1993-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(8,10,0,'1994-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(9,1,50,'1995-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46'),
	(10,3,0,'1999-03-16 07:54:31','2013-07-29 00:00:49','2017-07-10 21:08:46');

INSERT INTO `user_orders` VALUES 
	(1,1,1,100,2,10),
	(2,2,2,9,4,8),
	(3,3,3,5,5,21),
	(4,4,4,10,4,8),
	(5,5,5,9,5,21),
	(6,6,1,8,1,50),
	(7,7,2,9,2,10),
	(8,8,3,5,3,NULL),
	(9,1,6,10,2,10),
	(10,1,7,1,2,10);

INSERT INTO `product_rating` VALUES
	(1,53,62,9.9,0.9),
	(2,64,54,9.9,0.9),
	(3,88,59,9.9,0.9),
	(4,56,97,3.0,0.9),
	(5,53,66,9.9,0.9),
	(6,70,74,9.9,0.9),
	(7,66,81,9.9,0.9),
	(8,52,78,3.0,0.9),
	(9,80,74,9.9,0.9),
	(10,68,87,5.0,0.9);



INSERT INTO `stock` VALUES 
	(1,200),
	(2,60),
	(3,16),
	(4,36),
	(5,17),
	(6,68),
	(7,8),
	(8,20),
	(9,0),
	(10,5);


INSERT INTO `wine_shop_raiting` VALUES
	(1,1,5,'1979-05-11 21:58:18'),
	(2,2,2,'1977-11-17 05:33:29'),
	(3,3,5,'1995-04-10 07:36:11'),
	(4,4,4,'1999-08-18 23:54:52'),
	(5,5,1,'1984-03-22 19:23:35'),
	(6,6,4,'1992-12-06 01:38:41'),
	(7,7,2,'1978-06-10 13:27:01'),
	(8,8,4,'1984-05-05 00:52:11'),
	(9,9,5,'1989-07-26 22:28:32'),
	(10,10,5,'2022-03-08 05:51:42'),
	(1,2,3,'2022-11-01 15:40:00');
