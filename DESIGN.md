# Design Document

By Biliam Thapa

Video overview: 

## Scope

The purpose of this database is to allow users to see concert events being held. They can sort using city, artist names, and artist genre to see if there are any concerts that they would be interested in.

* Users who are the people looking for the concert eevents, inculdes their basi informattion.
* Concert which is what artist is playing along with information such as the artist genre, how much tickets cost, date and time.
* Venue which is where concert is being held along with capacity of the venue.

Out out scope elements are features that would allow user to search for concerts accroding to distance, venue restrictions, and cocnerts
featuring multiple artists.

## Functional Requirements

This database will support:

* Searching for a concert according to a specific artist, genre, or address of the venue.
* Searching for a concert accoridng to the ticket price.

* Searching for if venues hve certain restirctions such as no outside food or drinks will not be supported.

## Representation
Entities will be in the SQLite tables.
### Entities
This database has the following entitites:

### Users
The `users` table includes:
* `id` which is the unique id of the user as an `INTEGER`. This will also have the `PRIMARY KEY` constraint applied.
* `user_name` which is the username of the user as a `TEXT` since it's appropriate for name with a `UNIQUE` constraint so that no two users have the same username.
* `city` which is the city where the user resides in set as a `TEXT`.

### Concert
The `concert` table includes:
* `id` which is the unique id of the concert as an `INTEGER`. This will also have the `PRIMARY KEY` constraint applied.
* `venue_id` which specifies the id of the venue where concert is being held as an `INTEGER`. This coulmn has the `FOREIGN KEY` constraint
applied since it references the `id` column in the `venue` table so that each concert is referenced back to a venue.
* `artist_id` which specifies the id of the artist performing at the concert as an `INTEGER`. This coulmn has the `FOREIGN KEY` constraint
applied since it references the `id` column in the `artist` table so that each concert is referenced back to an aritst.
`concert_tix_amount` which is the amount for the concert tict as a `DECIMAL`(5,2) meaning it prices go up to five figures and in the cent
values.
* `concert_title` which is the name of the concert as a `TEXT`.
* `concert_desc` which is a descripiton of the concert as a `TEXT`.
* `concert_date` which is the date of the concert perfromance as a `DATE` since it's appropriate for dates.
* `concert_start_time` which is the the time when concert will start as a `TIME`.

### Venue
The `venue` table includes:
* `id` which is the unique id of the venue as an `INTEGER`. This will also have the `PRIMARY KEY` constraint applied.
* `venue_name` which is the name of the venues as a `TEXT`.
* `address` which is the address ofb the venue as a `TEXT` with the `UNIQUE` constraint applied as each venue will have a different address.
* `city` which is the city that the venue is located in as a `TEXT`.
* `capacity` which is the capacity of people that the venue can hold as an `INT` since this will be a number.

### Artist
THE `artist` table includes:
* `id` which is the unique id of the venue as an `INTEGER`. This will also have the `PRIMARY KEY` constraint applied.
* `artist_name` which is the name of the artist performing at the concert as a `TEXT` with the `UNIQUE` constraint applied.
* `artist_genre` which specifies the genre of music the artist performing belongs to as a `TEXT`.

### Ticket
The `ticket` table includes:
* `id` which is the unique id of the ticket as an `INTEGER`. This will also have the `PRIMARY KEY` constraint applied.
* `concert_id` which specifies the id of the concert for the ticket as an `INTEGER`. This coulmn has the `FOREIGN KEY` constraint
applied since it references the `id` column in the `concert` table so that each ticket is referenced back to a concert.
* `user_id` which specifies the id of the user the ticked is linked to as an `INTEGER`. This coulmn has the `FOREIGN KEY` constraint
applied since it references the `id` column in the `user` table so that each ticket is referenced back to a user.
* `ticket_price` which is the price of the the ticket for a concert as a `NUMERIC` where ticket price can go up to five figures and into two
decimals for cents
* `buy` which is whether user decides to buy the ticket as `NUMERIC CHECK` where the value 0 will return as not purchased and the value 1 will return as purchased.

All columuns will have the `NOT NULL` constraint applied wherever a `PRIMARY KEY` or `FOREIGN KEY` constraint isn't present since they will all be requried.

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.
* One user can search for many tickets, however a ticket is only associated with one user.
* A concert features one artist, but has many ticktes.
* A concert can only be held at one venue and a venue can only hold only concert.

## Optimizations

Due to the typical queries in `queries.sql`, it would be commone for users of the database to search for concerts by aritist name which is why the an index is created on the `artist_name` column from the `artist` table.

Users would also commonly search for concerts by  the city a venue is located in and the capacity of the venue as they could have preferences on whether they want to go to a large, arena-type concert or a small venue which is why a index is created on the `city` and `capacity` columns from the `venue` table.

Users could also search for concerts by concert genre and artists under that genre  which is why a index is created on the `artist_genre` and `artist_name` columns from the `artist` table.

Lastly users would commonly search for concerts by specific date if they have a free day or want to go to a concert on a specific day which is why an index is created on the `concert_date` column from the `concert` table.

## Limitations

In this schema, it's assumed that one concert has only one artist performing. For multiple artists to perform at a concer would require
a one to many relationship between concert and artist.
