
-- *** The Lost Letter ***
SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'; ---To get id of the source address---
SELECT * FROM "PACKAGES" WHERE "from_address_id" = 432; ---To get the content and id of the package sent ---
 SELECT * FROM "scans" WHERE "package_id" = 384; ---To check if the package was picked and dropped and also get driver id and the address id where it was dropped ---
SELECT * FROM "addresses" WHERE "id" = 854; ---To make sure it was delivered to the right address ---

-- *** The Devious Delivery ***
SELECT * FROM PACKAGES WHERE "from_address_id" IS NULL ; --- To get content and to_address id and package id.---
SELECT * FROM scans where package_id = 5098; --- to get address_id and action.---
SELECT * FROM addresses WHERE "id" = 348; ---To get address and type where the package was dropped at.---



-- *** The Forgotten Gift ***
SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street'; ---To get id of the source address---
SELECT * FROM "PACKAGES" WHERE "from_address_id"=9873; ---To get the content and id of the package sent ---
SELECT * FROM "addresses" WHERE "id"=4983; ---To get the address the package was delivered to ---
SELECT * FROM "scans" WHERE "address_id"=9873 ; ---To check if the package was picked and when ---
SELECT * FROM "scans" WHERE "package_id"=9523 ; ---To check if the package was delivered and where ---
SELECT * FROM "drivers" WHERE "id"= 17; --- to get driver who has the package --
