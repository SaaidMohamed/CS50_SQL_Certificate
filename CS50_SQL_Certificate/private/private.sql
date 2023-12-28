CREATE TABLE "messages" (
    "id" INTEGER,
    "phrase" TEXT,
    PRIMARY KEY("id")
);
INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 14), 98, 4)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 114), 3, 5)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 618), 72, 9)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 630), 7, 3)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 932), 12, 5)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 2230), 50, 7)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 2346), 44, 10)
FROM "sentences" LIMIT 1;

INSERT INTO "messages" ("phrase")
SELECT substr((SELECT "sentence" FROM "sentences" WHERE "id" = 3041), 14, 5)
FROM "sentences" LIMIT 1;

CREATE VIEW "message" AS
SELECT "phrase" FROM "messages";
