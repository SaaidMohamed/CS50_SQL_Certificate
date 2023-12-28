CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "full_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "schools_universities"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "location" TEXT,
    "year_founded" TEXT,
    PRIMARY KEY ("id")

);

CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "users_connections"(
    "id" INTEGER,
    "user_A_id" INTEGER,
    "user_B_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_A_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("user_B_id") REFERENCES "users" ("id")
);

CREATE TABLE IF NOT EXISTS "users_schools"(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_university_id" INTEGER,
    "affiliation_start_date" TEXT NOT NULL,
    "affiliation_end_date" TEXT NOT NULL,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY("school_university_id") REFERENCES "schools_universities"("id")
);


CREATE TABLE IF NOT EXISTS "users_companies"(
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "work_start_date" TEXT NOT NULL,
    "work_end_date" TEXT NOT NULL,
    "job_title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
