

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_boatdealer','Båd Forhandler',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_boatdealer','Båd Forhandler',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('boatdealer','Båd Forhandler')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('boatdealer',0,'recruit','Lærling',1250,'{}','{}'),
	('boatdealer',1,'novice','Sælger',1000,'{}','{}'),
	('boatdealer',2,'experienced','Erfaren Sælger',1000,'{}','{}'),
	('boatdealer',3,'experienced','Adm. Direktør',700,'{}','{}'),
	('boatdealer',4,'boss','Butikschef',600,'{}','{}')
;


CREATE TABLE `boatdealer_vehicles` (
	`id` int NOT NULL AUTO_INCREMENT,
	`vehicle` varchar(255) NOT NULL,
	`price` int NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle_sold_boat` (
	`client` VARCHAR(50) NOT NULL,
	`model` VARCHAR(50) NOT NULL,
	`plate` VARCHAR(50) NOT NULL,
	`soldby` VARCHAR(50) NOT NULL,
	`date` VARCHAR(50) NOT NULL,
	`price` VARCHAR(50) NOT NULL DEFAULT '0 DKK',

	PRIMARY KEY (`plate`)
);

CREATE TABLE `vehicle_categories_boat` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories_boat` (name, label) VALUES
	('boat','Båd'),
;

CREATE TABLE `vehicles_boat` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles_boat` (name, model, price, category) VALUES
	('Jetski','seashark',15000,'boat'),
;
