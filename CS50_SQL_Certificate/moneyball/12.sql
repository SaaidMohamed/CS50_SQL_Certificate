SELECT "first_name","last_name"
FROM "players"
WHERE "players"."id" IN (SELECT "players"."id"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE ("salary" / "H") AND "performances"."year" = "salaries"."year" AND "performances"."year" = '2001' AND "H" != 0
ORDER BY ("salary" / "H") ASC, "first_name" ASC, "last_name" ASC LIMIT 10
) AND "players"."id" IN (SELECT "players"."id"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE ("salary" / "RBI") AND "performances"."year" = "salaries"."year" AND "performances"."year" = '2001' AND "H" != 0
ORDER BY ("salary" / "RBI") ASC, "first_name" ASC, "last_name" ASC LIMIT 10)
ORDER BY "players"."id" ASC;
