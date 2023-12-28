CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" FLOAT,
    "unit" TEXT NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE IF NOT EXISTS "donuts"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten-free" TEXT,
    "price" FLOAT,
    PRIMARY KEY ("id")

);


CREATE TABLE IF NOT EXISTS "orders"(
    "id" INTEGER,
    "order_number" TEXT NOT NULL,
    "donuts_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donuts_id") REFERENCES "donuts" ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")

);


CREATE TABLE IF NOT EXISTS "customers"(
    "id" INTEGER,
    "full_name" TEXT NOT NULL,
    "order_history" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("order_history") REFERENCES "orders" ("id")
);
