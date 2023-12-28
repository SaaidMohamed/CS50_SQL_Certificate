CREATE VIEW "one_bedrooms" AS
SELECT "listings"."id", "property_type", "host_name",  "accommodates" FROM "listings" WHERE  "bedrooms" = 1;
