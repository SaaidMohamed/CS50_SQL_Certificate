CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name",  COUNT("reviews"."listing_id" ) AS "review" FROM "listings"
JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "reviews"."listing_id"
ORDER BY "review" DESC LIMIT 100;
