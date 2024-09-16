-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Find the name of a venue where a specific artist is playing
SELECT "venue"."venue_name" FROM "concert"
JOIN "artist" ON "concert"."artist_id" = "artist"."id"
JOIN "venue" ON "concert"."venue_id" = "venue"."id"
WHERE "artist"."artist_name" = 'Kendrick Lamar';


-- Find concerts in Oakland and only show the top 20 with biggest capacity
SELECT "concert_title" FROM "concert"
WHERE "venue_id" IN (
    SELECT "id" FROM "venue"
    WHERE "city" = 'Oakland'
    ORDER BY "capacity" DESC
    LIMIT 20
);

-- Find all artist perfoming under rock genre, order by alphabetical order and only show the first 10
SELECT "artist_name" FROM "artist"
WHERE "artist_genre" = 'Rock'
ORDER BY "artist_name" DESC
LIMIT 10;

-- Find all the concerts happening and the venue names within a certain date range
SELECT "concert"."concert_title", "concert"."concert_date", "venue"."venue_name" FROM "concert"
JOIN "venue" ON "concert"."venue_id" = "venue"."id"
WHERE "concert"."concert_date" BETWEEN '2024-06-01' AND '2024-07-01';
