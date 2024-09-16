-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX,
-- CREATE VIEW, etc. statements that compose it
-- Represents users who are buying concert tickets
CREATE TABLE "users"(
    "id" INTEGER,
    "user_name" TEXT UNIQUE NOT NULL,
    "city" TEXT NOT NULL,
    PRIMARY KEY("id")
);
-- Represents concert where users are going
CREATE TABLE "concert"(
    "id" INTEGER,
    "venue_id" INTEGER,
    "artist_id" INTEGER,
    "concert_title" TEXT NOT NULL,
    "concert_desc" TEXT NOT NULL,
    "concert_date" DATE NOT NULL,
    "concert_start_time" TIME NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("venue_id") REFERENCES "venue"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artist"("id")
);
-- Represents venue where concert will be held
CREATE TABLE "venue"(
    "id" INTEGER,
    "venue_name" TEXT NOT NULL,
    "address" TEXT UNIQUE NOT NULL,
    "city" TEXT NOT NULL,
    "capacity" INT NOT NULL,
    PRIMARY KEY("id")
);
-- Represents arist who are playing at concert
CREATE TABLE "artist"(
    "id" INTEGER,
    "artist_name" TEXT UNIQUE NOT NULL,
    "artist_genre" TEXT NOT NULL,
    PRIMARY KEY("id")
);
-- Represents ticket for a concert
CREATE TABLE "ticket"(
    "id" INTEGER,
    "concert_id" INTEGER,
    "user_id" INTEGER,
    "ticket_price" DECIMAL(5,2) NOT NULL, -- ticket price can go up to 5 figures and 2 decimals for cents
    "buy" NUMERIC NOT NULL CHECK("buy" BETWEEN 0 and 1), --0 for not purchased and 1 for purchased
    PRIMARY KEY("id"),
    FOREIGN KEY("concert_id") REFERENCES "concert"("id"),
    FOREIGN KEY("user_id") REFERENCES "user"("id")
);

-- Create indexes to speed up common searches
CREATE INDEX "artist_name" ON "artist"("artist_name");
CREATE INDEX "venue_city_capacity" ON "venue"("city", "capacity");
CREATE INDEX "artist_genre_name" ON "artist"("aritst_genre", "artist_name");
CREATE INDEX "concert_date" ON "concert"("conncert_date");
