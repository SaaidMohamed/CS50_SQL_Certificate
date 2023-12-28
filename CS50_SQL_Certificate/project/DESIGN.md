# Design Document

By Mohamed Saaid

Video overview: <https://youtu.be/msMsz7xh0PA>

## Scope

HinC database's purpose is to track tourists' booking accommodations and ratings all over the world, to make it easier for tourists or new visitors to get the best experience out of their trips or visits to a new country or a city, included in the database's scope is:

* countries, in addition to basic identifying information like currency.
* Hotels of each country, in addition to basic identifying information such as address and city.
* guests, in addition to guests addresses
* ratings, in addition to basic identifying information.
* bookings, including basic identifying information like start date and end date.

Out of scope are multiple rooms if any and accounts are not included in the database.

## Functional Requirements

HinC.db will support:

* finding best hotels in a convenient location in any place in the world.
* ratings of countries and hotels
* best prices with best hotel services

HinC.db will not support:
* hotels' images and zip codes?

## Representation

HinC.db Entities are stored in Mysql tables with the following schema.

### Entities

HinC.db represents all recent hotel bookings in the world. To do so,HinC.db represents the following entities:

#### countries

The `countries` table includes:

* `id`, which is the unique ID for the country as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `country` as `VARCHAR(50)` for the name of the country, `NOT NULL` as a constraint to always have a country name.
* `Currency` as `VARCHAR(50)` for the name of the country's currency, `NOT NULL` to always have a currency name.

#### Hotels

The `Hotels` table includes:

* `id`, which is the unique ID for the Hotel as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `name` as `VARCHAR(50)` for the name of the Hotel, `NOT NULL` as a constraint to always have a Hotel name.
* `Address` as `VARCHAR(50)` for the Address of the Hotel, `NOT NULL` to always have a Hotel Address.
* `city` as `VARCHAR(50)` for the name of the Hotel's city, `NOT NULL` to always have a Hotel's city.

#### guests

The `guests` table includes:

* `id`, which is the unique ID for the guest as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `name` as `VARCHAR(50)` for the name of the guest, `NOT NULL` as a constraint to always have a guest name.
* `Address` as `VARCHAR(50)` for the Address of the guest, `NOT NULL` to always have a guest's Address.

#### rooms

The `rooms` table includes:

* `id`, which is the unique ID for each Hotel's room as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `Hotel_id` as `INT` and foreign Key to reference the hotels' table id.
* `room_number` as `VARCHAR(50)` for the room floor in a hotel.
* `floor_number` as `VARCHAR(50)`  for the room floor in a hotel.

#### ratings

The `ratings` table includes:

* `id`, which is the unique ID for each Hotel's rating as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `Hotel_id` as `INT` and foreign Key to reference the hotels' table id.
* `country_id` as `INT` and foreign Key to reference the countries' table id.
* `room_id` as `INT` and foreign Key to reference the rooms' table id.
* `guest_id` as `INT` and foreign Key to reference the guests' table id.
* `rating` as a `decimal` to get rating of every guest and `NOT NULL` to alawys get a rating.

#### bookings

The `bookings` table includes:

* `id`, which is the unique ID for each booking as an `INTEGER`. it has `PRIMARY KEY` constraint applied.
* `Hotel_id` as `INT` and foreign Key to reference the hotels' table id.
* `country_id` as `INT` and foreign Key to reference the countries' table id.
* `room_id` as `INT` and foreign Key to reference the rooms' table id.
* `guest_id` as `INT` and foreign Key to reference the guests' table id.
* `start_date` as `date` to get start date of booking, `NOT NULL` to alawys get a date.
* `end_date` as `date` to get start date of booking, `NOT NULL` to alawys get a date.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](DBSchemaDiagram.png)

As detailed by the diagram:

* One country can have at least one or multiple ratings, room bookings and hotels.
* One hotel can have one or multiple rooms,ratings and room bookings.
* One Guest can book at least one or multiple times and add one or more ratings
* One room can have one or multiple ratings and can be part of one or more bookings.
* One rating will include one country, hotel, room and guest.
* One booking will have one country, hotel, guest and room.

## Optimizations

Based on the database's purpose, queries will be used frequently are viewing hotels in specific country or city and viewing rating of both. for reason, indexes were created on `name`,`country_id`, `room_id`,`hotel_id` and `guest_id` to speed those queries that include those columns.

In addition, views were created to abstract and simplify few tables for for database users and or devolopers.

## Limitations

The database is limited to bookings dates, ratings' dates are not included. User accounts and the hotels staff are not included in The database either.
