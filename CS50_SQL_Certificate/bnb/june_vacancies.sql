CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name",  COUNT("listings"."id") AS "days_vacant" FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "availabilities"."date" BETWEEN '2023-06-01' AND '2023-06-30' AND "availabilities"."available" = "TRUE"
GROUP BY "availabilities"."listing_id";
