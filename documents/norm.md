# Database Normalization

The Movie Rating System relational schema was designed to satisfy
Boyce-Codd Normal Form (BCNF).

## Functional Dependencies

### Movies

Primary key: `movie_id`

`movie_id -> title, overview, release_date, runtime, budget, revenue,
vote_average, vote_count`

The determinant is a candidate key; therefore Movies satisfies BCNF.

### Genres

Candidate keys: `genre_id`, `genre_name`

`genre_id -> genre_name`

`genre_name -> genre_id`

Both determinants are candidate keys; therefore Genres satisfies BCNF.

### MovieGenre

Primary key: (`movie_id`, `genre_id`)

MovieGenre contains no non-key attributes. Neither movie_id nor genre_id
alone determines the other because Movies and Genres have a many-to-many
relationship.

Therefore MovieGenre satisfies BCNF.

### Users

Candidate keys: `user_id`, `username`, `email`

Each candidate key determines all other attributes in the relation.
All identified determinants are candidate keys; therefore Users
satisfies BCNF.

### Ratings

Primary key: (`user_id`, `movie_id`)

`(user_id, movie_id) -> rating, review, rating_date`

Neither user_id nor movie_id alone determines the non-key attributes.
The determinant is the candidate key; therefore Ratings satisfies BCNF.

## Normal Form Summary

The relations satisfy First Normal Form because attributes contain atomic
values and repeating or multivalued data, such as movie genres, is stored
in separate relations.

The relations with composite keys do not contain partial dependencies, so
the schema satisfies Second Normal Form.

Non-key attributes do not determine other non-key attributes, avoiding
transitive dependencies and satisfying Third Normal Form.

Finally, every identified non-trivial functional dependency has a
superkey as its determinant. Therefore, under the specified functional
dependencies, the relational schema satisfies BCNF.