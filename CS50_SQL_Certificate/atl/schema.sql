CREATE TABLE IF NOT EXISTS "passengers" (
	"id" INTEGER PRIMARY KEY,
   	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"age" INTEGER
);

CREATE TABLE IF NOT EXISTS "check-ins" (
	"id" INTEGER ,
    "passenger_id" INTEGER ,
    "flight_id" INTEGER,
   	"datetime" TEXT NOT NULL,
     PRIMARY KEY ("id"),
     FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id")
     FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE IF NOT EXISTS "airlines" (
	"id" INTEGER ,
    "name" TEXT NOT NULL,
   	"concourse" TEXT NOT NULL,
     PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "flights" (
	"id" INTEGER ,
    "passenger_id" INTEGER ,
    "airline_id" INTEGER,
   	"flight number" INTEGER,
    "departing_airport" TEXT,
    "distination_ airport" TEXT,
    "expected_departure" TEXT,
    "expected_arrival" TEXT,
     PRIMARY KEY ("id"),
     FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("id")
     FOREIGN KEY ("airline_id") REFERENCES "airlineS" ("id")
);
