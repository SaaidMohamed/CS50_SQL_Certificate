CREATE VIEW "most_populated" AS
SELECT "district", SUM("families") , SUM("households"), SUM("population") AS "POPSUM", SUM("male"), SUM("female") FROM census GROUP BY "district" ORDER BY "POPSUM" DESC;
