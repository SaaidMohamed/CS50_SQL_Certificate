CREATE INDEX "courses_id" ON "courses" ("id");

CREATE INDEX "courses_department" ON "courses" ("department", "number", "semester")
WHERE "semester" = 'Fall 2023';

CREATE INDEX "courses_title" ON "courses" ("title")
WHERE "semester" = 'Fall 2024';

CREATE INDEX "requirements_title" ON "requirements" ("name")
WHERE "semester" = 'Fall 2023';

