SELECT "city", COUNT("name") AS "number of public schools" FROM "schoolS" WHERE "type"= 'Public School' GROUP BY "city" HAVING "number of public schools" <= 3 ORDER BY "number of public schools" DESC, "city" ASC;
