-- insert values in countries table.
INSERT INTO `countries` (`country`, `Currency`)
VALUES (`US`, `dollar`),
       (`FR`, `euro`);


-- insert values in Hotels table.
INSERT INTO `Hotels` (`name`, `address`, `city`)
VALUES (`fivestar hotel`, `9 south west rd methuen LA`, `methuen`);



-- insert values in guests table.
INSERT INTO `guests` (`name`, `address`)
VALUES (`Jacob wall`, `10 middle rd mass NY`);


-- update specefic guest's address.
UPDATE `guests`
SET `address` = `37 newdev rd dinver WD`
WHERE `id` = 1;


-- select all data from a view.
SELECT * FROM `US_Hotels_view` LIMIT 50;


-- delete a guest's booking from room_bookings table.
DELETE FROM `room_bookings` WHERE `guest_id` = (SELECT `id` FROM `guests` WHERE name = `Jacob wall`);
