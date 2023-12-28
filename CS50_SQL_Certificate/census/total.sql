CREATE VIEW "total" AS
SELECT SUM("families") AS "familiesSUM", SUM("households") AS "households", SUM("population") AS "populationSUM" , SUM("male") AS "maleSUM" , SUM("female") AS "femaleSUM" FROM census ;
