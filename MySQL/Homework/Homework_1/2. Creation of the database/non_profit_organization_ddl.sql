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
