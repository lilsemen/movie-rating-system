# Movie Rating System Requirements

## 1. Movies

- R1: The system shall store information about movies.
- R2: Each movie shall be uniquely identified by a movie ID.
- R3: A movie shall have a title.
- R4: A movie may contain an overview, release date, runtime, budget,
  revenue, source vote average, and source vote count.
- R5: Source vote information imported with movie metadata shall remain
  separate from ratings submitted by users of this system.

## 2. Genres

- R6: The system shall store movie genres.
- R7: Each genre shall be uniquely identified by a genre ID.
- R8: Each genre shall have a unique name.
- R9: A movie may belong to multiple genres.
- R10: A genre may be associated with multiple movies.

## 3. Users

- R11: The system shall store registered users.
- R12: Each user shall be uniquely identified by a user ID.
- R13: Each user shall have a unique username.
- R14: Each user shall have a unique email address.
- R15: The system shall store a password for each user.
- R16: The system shall record when a user account was created.

## 4. Ratings and Reviews

- R17: A user may rate movies stored in the system.
- R18: A movie may receive ratings from multiple users.
- R19: A user may rate a particular movie at most once.
- R20: User ratings shall be between 1.0 and 5.0.
- R21: A user may optionally include a written review with their rating.
- R22: The system shall record when a rating was submitted.
- R23: A rating must reference an existing user.
- R24: A rating must reference an existing movie.

## 5. Rating Statistics

- R25: The system shall be able to calculate the average user rating
  for a movie from ratings submitted by users.
- R26: The system shall be able to determine the number of user ratings
  submitted for a movie.