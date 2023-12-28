-- To create Database
CREATE DATABASE HinC.db;

-- To USE HinC.db Database
USE HinC.db;

--drop table countries and create new one if it already exists
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(50) NOT NULL,
    `Currency` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);



--drop table Hotels and create new one if it already exists
DROP TABLE IF EXISTS `Hotels`;
CREATE TABLE `Hotels`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50),
    `address` VARCHAR(150) NOT NULL,
    `city` VARCHAR(50),
    PRIMARY KEY (`id`)

);



--drop table guests and create new one if it already exists
DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `address` VARCHAR(150) NOT NULL,
    PRIMARY KEY (`id`)
);




--drop table rooms and create new one if it already exists
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `hotel_id` INT UNSIGNED NOT NULL,
    `room_number` VARCHAR(50) NOT NULL,
    `floor_number` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`)
);




--drop table ratings and create new one if it already exists
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE  `ratings`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `country_id` INT UNSIGNED NOT NULL,
    `Hotel_id` INT UNSIGNED NOT NULL,
    `room_id` INT UNSIGNED NOT NULL,
    `guest_id` INT UNSIGNED NOT NULL,
    `rating` DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
    FOREIGN KEY (`Hotel_id`) REFERENCES `Hotels` (`id`),
    FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
    FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`)
);




--drop table room_bookings and create new one if it already exists
DROP TABLE IF EXISTS `room_bookings`;
CREATE TABLE  `room_bookings`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `country_id` INT UNSIGNED NOT NULL,
    `Hotel_id` INT UNSIGNED NOT NULL,
    `room_id` INT UNSIGNED NOT NULL,
    `guest_id` INT UNSIGNED NOT NULL,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
    FOREIGN KEY (`Hotel_id`) REFERENCES `Hotels` (`id`),
    FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
    FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`)
);





--drop table room_bookings and create new one if it already exists
DROP TABLE IF EXISTS `updates`;
CREATE TABLE  `updates`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `new_name` VARCHAR(50) ,
    `old_name` VARCHAR(50) ,
    `new_address` VARCHAR(50) ,
    `old_address` VARCHAR(50),
    PRIMARY KEY (`id`)
);

-- Create indexes to speed room_bookings, Hotels and ratings searches
CREATE INDEX `room_bookings_index` ON `room_bookings` (`country_id`,`Hotel_id`, `room_id`,`guest_id`);
CREATE INDEX `Hotels_index` ON `Hotels` (`name`);
CREATE INDEX `Hotels_index` ON `ratings` (`Hotel_id`);


-- Create US_Hotels_view to abstract and simplify Hotels table.
CREATE VIEW `US_Hotels_view` AS
SELECT `name` FROM `Hotels`
WHERE `country_id` = (SELECT `id` FROM `countries` WHERE `name` = `US`);



-- Create log_updates TRIGGER to log any updates on guests in updates table.
CREATE TRIGGER `log_updates`
AFTER UPDATE OF `name`, `address` ON `guests`
FOR EACH ROW
BEGIN
    INSERT INTO `updates` (`new_name`, `old_name`, `new_address`, `old_address`)
    VALUES (NEW.`name`, OLD.`name`, NEW.`address`, OLD.`address`);
END;


