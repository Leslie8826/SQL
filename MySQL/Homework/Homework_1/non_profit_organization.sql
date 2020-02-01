create database non_profit_organization;

use non_profit_organization;

/**********************************/
/******* CREATING THE TABLES **********/
/*******  DDL STATEMENTS **********/
/**********************************/

--
-- TABLE STRUCTURE FOR 'VOLUNTEER'
--
CREATE TABLE volunteer (
  volunteerId int NOT NULL AUTO_INCREMENT,
  volunteerName varchar(45) NOT NULL,
  volunteerAddress varchar(45) NOT NULL,
  volunteerTelephone varchar(45) DEFAULT NULL,
  PRIMARY KEY (volunteerId)
);


--
-- TABLE STRUCTURE FOR 'TASK_TYPE'
--
CREATE TABLE task_type (
  taskTypeId int NOT NULL AUTO_INCREMENT,
  taskTypeName varchar(45) NOT NULL,
  PRIMARY KEY (taskTypeId)
);


--
-- Table structure for table `task_status`
--
CREATE TABLE task_status (
  taskStatusId int NOT NULL AUTO_INCREMENT,
  taskStatusName varchar(45) NOT NULL,
  PRIMARY KEY (taskStatusId)
);


--
-- Table structure for table `packing_list`
--
CREATE TABLE packing_list (
  packingListId int NOT NULL AUTO_INCREMENT,
  packingListName varchar(45) NOT NULL,
  packingListDescription varchar(100) NOT NULL,
  PRIMARY KEY (packingListId)
);


--
-- Table structure for table `package_type`
--
CREATE TABLE package_type (
  packageTypeId int NOT NULL AUTO_INCREMENT,
  packageTypeName varchar(45) NOT NULL,
  PRIMARY KEY (packageTypeId)
);


--
-- Table structure for table `item`
--
CREATE TABLE item (
  itemId int NOT NULL AUTO_INCREMENT,
  itemDescription varchar(45) NOT NULL,
  itemValue float NOT NULL,
  quantityOnHand int NOT NULL,
  PRIMARY KEY (itemId)
);


--
-- Table structure for table `task`
--
CREATE TABLE task (
  taskCode int NOT NULL AUTO_INCREMENT,
  packingListId int DEFAULT NULL,
  taskTypeId int NOT NULL,
  taskStatusId int NOT NULL,
  taskDescription varchar(45) NOT NULL,
  PRIMARY KEY (taskCode),
  KEY `fk-taskType_idx` (`taskTypeId`),
  KEY `fk-taskStatus_idx` (`taskStatusId`),
  KEY `fk-packingList_idx` (`packingListId`),
  CONSTRAINT `fk-packingList` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk-taskStatus` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk-taskType` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
);


--
-- Table structure for table `assignment`
--
CREATE TABLE assignment (
  volunteerId int NOT NULL,
  taskCode int NOT NULL,
  startDateTime datetime NOT NULL,
  endDateTime datetime NOT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `fk-task_idx` (`taskCode`),
  KEY `fk-volunteer_idx` (`volunteerId`),
  CONSTRAINT `fk-task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk-volunteer` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
);

--
-- Table structure for table `package`
--
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` datetime NOT NULL,
  `packageWeight` float NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk-task_idx` (`taskCode`),
  KEY `fk-packageType_idx` (`packageTypeId`),
  CONSTRAINT `fk-package-task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk-packageType` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
);


--
-- Table structure for table `package_contents`
--
create table package_contents
(itemId int not null,
packageId int not null,
itemQuantity int not null,
PRIMARY KEY (`itemId`,`packageId`),
KEY `fk-item_idx` (`itemId`),
KEY `fk-package_idx` (`packageId`),
CONSTRAINT `fk-item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
CONSTRAINT `fk-package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
);


/*************************************************************/
/*************** INSERTING DATA IN THE TABLES ***************/
/********************  DML STATEMENTS ************************/
/*************************************************************/

--
-- Data for volunteer table
--
INSERT INTO volunteer VALUES (1,'Harry Smith','123 Main St, New York, NY',NULL),
(2,'John Brown','876 Broadway, New York NY','212 555 1212'),
(3,'Joan Simmons','932 E 11st St, New Brunswick, NJ',NULL),
(4,'Tom Perry','495 Blvd E, Edgewater, NJ','201 443 5734'),
(5,'George Daniels','1402 Main St, Westport, CT','203 323 5534'),
(6,'David Jones','20 Westbury Ave, Westbury NY','917 330 2201'),
(7,'Sally Markham','14 W 72nd St, New York, NY','212 756 4399'),
(8,'Gerry Banks','29 Highway 46, Wayne NJ','201 333 2232'),
(9,'Paul Lewin','45 Harlem Drive, Bronx, NY','917 452 8888'),
(10,'Sue Spencer','783 Fairfield Dr, Mahwah NJ','201 783 8837');

select * from volunteer;


--
-- Data for task_type table
-- 
INSERT INTO task_type VALUES (1,'recurring'),(2,'packing'),(3,'transporting');

select * from task_type;


--
-- Data for task_status table
-- 
INSERT INTO task_status VALUES (1,'ongoing'),(2,'open'),(3,'closed'),(4,'pending');

select * from task_status;

--
-- Data for packing_list table
-- 
INSERT INTO packing_list VALUES (1,'Major distribution','include all of the basic needs to help at least 1,000 people'),
(2,'Additional food','Provide additional food to 100 people'),
(3,'Basic Medical','Contains basic medical supplies for 150 people after major catastrophe'),
(4,'Large water','Large shipment of water containers'),
(5,'Basic clothes','Basic clothes to support 20 families'),
(6,'Winter clothes','Coats and sweaters for 50 people'),
(7,'Burn kits','Special medical supplies for burn victims'),
(8,'Shelter kits','Tents, sleeping bags and blankets for 50 families'),
(9,'Basic Child care','Formula, clothes, toys for 50 children'),
(10,'Medium Water','Medium shipment of water containers');

select * from packing_list;

--
-- Data for packing_type table
--
INSERT INTO package_type VALUES (1,'basic medical'),
(2,'child-care'),
(3,'food and water'),
(4,'shelter'),
(5,'clothing');

select * from package_type;


--
-- Data for item table
--
INSERT INTO item VALUES (1,'spam',10,100),
(2,'dried fruit',5,50),
(3,'1 gallon water bottle',2,1000),
(4,'blanket',20,500),(5,'tent',100,1),
(6,'bottle of morphine',150,375),
(7,'pack of bandages',20,1300),
(8,'Bottle of antibiotics',125,1000),
(9,'Baby formula',10,632),
(10,'men\'s coat',125,513),
(11,'women\'s coat',134,476),
(12,'sleeping bag',75,950);

select * from item;



--
-- Data for task table
--
INSERT INTO task VALUES (101,NULL,1,1,'answer the telephone'),
(102,1,2,2,'prepare 5,000 packages'),
(103,9,2,3,'prepare 20 children\'s packages'),
(104,2,2,4,'Prepare 100 food packages'),
(105,5,2,2,'Prepare 50 clothing packages'),
(106,4,2,2,'Prepare 100 water packages'),
(107,NULL,3,4,'Transport packages to airport'),
(108,9,2,2,'prepare 20 children\'s packages'),
(109,5,2,2,'Prepare 80 clothing packages'),
(110,NULL,3,2,'Take packages to the warehouse');

select * from task;


--
-- Data for assignment table
--
INSERT INTO assignment VALUES (1,101,'2019-07-01 09:00:00','2019-08-31 17:00:00'),
(2,105,'2019-08-02 09:00:00','2019-08-06 23:00:00'),
(3,103,'2019-05-01 09:00:00','2019-05-03 18:00:00'),
(3,106,'2019-07-25 12:00:00','2019-08-15 12:00:00'),
(4,103,'2019-05-01 09:00:00','2019-05-03 18:00:00'),
(4,108,'2019-08-02 09:00:00','2019-08-10 23:00:00'),
(5,107,'2019-06-01 12:00:00','2019-06-01 23:00:00'),
(7,102,'2019-08-01 12:00:00','2019-08-10 12:00:00'),
(8,102,'2019-08-01 12:00:00','2019-08-10 12:00:00'),
(9,109,'2019-08-04 07:00:00','2019-08-04 22:00:00');

select * from assignment;

--
-- Data for package table
--
INSERT INTO package VALUES (1,102,3,'2019-08-02 00:00:00',32),
(2,102,3,'2019-08-02 00:00:00',34),
(3,102,2,'2019-08-03 00:00:00',54),
(4,102,4,'2019-08-03 00:00:00',132),
(5,105,5,'2019-08-05 00:00:00',68),
(6,103,2,'2019-05-05 00:00:00',55),
(7,106,3,'2019-07-27 00:00:00',103),
(8,106,3,'2019-07-29 00:00:00',102),
(9,106,3,'2019-07-31 00:00:00',103),
(10,109,5,'2019-08-04 00:00:00',79);

select * from package;

--
-- Data for package_contents table
--
insert into package_contents values
(1, 3, 450),
(2, 3, 1000),
(3, 3, 550),
(6, 3, 80),
(7, 2, 70),
(8, 2, 50),
(9, 2, 100),
(11, 1, 50),
(12, 1, 90),
(7, 3, 10),
(7, 1, 60),
(6, 1, 95),
(10, 2, 45);

select * from package_contents;




