# Movie Rating System - Database Design

## Overview

The movie rating system stores movie metadata, generes, users, and ratings submitted by users.

The database design contains 3 main entities: Movies, Genres and Users. 
Two associative relations, MovieGenre and Ratings, are used to represent the many-to-many relationships between Movies and Genres, and between Users and Movies.

The relational design consists of the following relations:

- Movies
- Genres
- MovieGenre
- Users
- Ratings

## Movies

The Movies relation stores metadata for each movie in the system.

**Primary Key:** `movie_id`

### Attributes

- `movie_id` - uniquely identifies a movie.
- `title` - the title of the movie.
- `overview` - an optional description of the movie.
- `release_date` - the movie's release date.
- `runtime` - the runtime of the movie in minutes.
- `budget` - the reported movie budget.
- `revenue` - the reported movie revenue.
- `vote_average` - the average vote imported from the source dataset.
- `vote_count` - the number of votes represented by the source dataset.

The source vote information is kept separate from ratings submitted by
users of the Movie Rating System.

## Genres

The Genres relation stores the available movie genres.

**Primary Key:** `genre_id`

**Alternate Key:** `genre_name`

### Attributes

- `genre_id` - uniquely identifies a genre.
- `genre_name` - the unique name of the genre.

A genre can be associated with many movies, and a movie can be associated
with many genres. Therefore, Movies and Genres have a many-to-many
relationship.

## MovieGenre

MovieGenre is an associative relation used to resolve the many-to-many
relationship between Movies and Genres.

**Primary Key:** (`movie_id`, `genre_id`)

**Foreign Keys:**

- `movie_id` references `Movies(movie_id)`.
- `genre_id` references `Genres(genre_id)`.

The composite primary key prevents the same genre from being associated
with the same movie more than once.

## Users

The Users relation stores accounts for users of the movie rating system.

**Primary Key:** `user_id`

**Alternate Keys:** `username`, `email`

### Attributes

- `user_id` - uniquely identifies a user.
- `username` - the user's unique username.
- `password` - stores the user's password representation.
- `email` - the user's unique email address.
- `date_created` - records when the account was created.

Username and email are unique so that two accounts cannot use the same
username or email address.

## Ratings

Ratings represents the relationship between Users and Movies in which a
user assigns a rating to a movie and may optionally provide a written
review.

**Primary Key:** (`user_id`, `movie_id`)

**Foreign Keys:**

- `user_id` references `Users(user_id)`.
- `movie_id` references `Movies(movie_id)`.

### Attributes

- `user_id` - identifies the user submitting the rating.
- `movie_id` - identifies the movie being rated.
- `rating` - a numeric rating between 1.0 and 5.0.
- `review` - an optional written review.
- `rating_date` - records when the rating was submitted.

Users and Movies have a many-to-many relationship: a user may rate many
movies, and a movie may receive ratings from many users.

The composite primary key (`user_id`, `movie_id`) ensures that each user
can rate a particular movie at most once.


## Relationships

### Movies and Genres

Movies and Genres have a many-to-many relationship.

- A movie may belong to multiple genres.
- A genre may contain multiple movies.
- The relationship is implemented by the `MovieGenre` relation.

### Users and Movies

Users and Movies have a many-to-many relationship through Ratings.

- A user may rate multiple movies.
- A movie may receive ratings from multiple users.
- A user may rate a particular movie at most once.
- The relationship is implemented by the `Ratings` relation.