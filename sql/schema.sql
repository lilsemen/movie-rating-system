-- NOTE YOU MUST REPLACE MY NAME WITH YOUR OWN USER IN PATH DIRECTORY.

CREATE DATABASE IF NOT EXISTS movie_rating_system;
USE movie_rating_system;

SET GLOBAL local_infile=ON;

-- Create the Movies table.
-- Stores movie metadata imported from the dataset.

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    overview TEXT,
    release_date DATE,
    runtime DECIMAL(6,1),
    budget BIGINT,
    revenue BIGINT,
    rating_average DECIMAL(3,1),
    rating_count INT,

    CHECK (runtime IS NULL OR runtime >= 0),
    CHECK (budget IS NULL OR budget >= 0),
    CHECK (revenue IS NULL OR revenue >= 0),
    CHECK (rating_average IS NULL
           OR (rating_average >= 0 AND rating_average <= 10)),
    CHECK (rating_count IS NULL OR rating_count >= 0)
);

LOAD DATA LOCAL INFILE '/Users/morgs/Documents/CSC370/movie-rating-system/data/cooked/movies.csv'
INTO TABLE Movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    @movie_id,
    @title,
    @overview,
    @release_date,
    @runtime,
    @budget,
    @revenue,
    @rating_average,
    @rating_count
)
SET
    movie_id = @movie_id,
    title = @title,
    overview = NULLIF(@overview, ''),
    release_date = NULLIF(@release_date, ''),
    runtime = NULLIF(@runtime, ''),
    budget = NULLIF(@budget, ''),
    revenue = NULLIF(@revenue, ''),
    rating_average = NULLIF(@rating_average, ''),
    rating_count = NULLIF(@rating_count, '');


-- Create the Genres table.
-- Stores each genre once.

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

LOAD DATA LOCAL INFILE '/Users/morgs/Documents/CSC370/movie-rating-system/data/cooked/genres.csv'
INTO TABLE Genres
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    @genre_id,
    @genre_name
)
SET
    genre_id = @genre_id,
    genre_name = @genre_name;




-- Create the MovieGenre table.
-- This is a many-to-many relationship table that links movies to genres.

CREATE TABLE MovieGenre(
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,

    PRIMARY KEY (movie_id, genre_id),

    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),

    FOREIGN KEY (genre_id) 
        REFERENCES Genres(genre_id)
);

-- Create the Users table.
-- Stores account information for users of the movie rating system.

CREATE TABLE Users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP

);


-- Create the Ratings table.
-- Represents a user's rating of a movie.
-- A user can rate a movie only once.

CREATE TABLE Ratings(

    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    review TEXT,
    rating_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,


    PRIMARY KEY (user_id, movie_id),

    FOREIGN KEY (user_id) 
        REFERENCES Users(user_id),

    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),

    CHECK (rating >=1.0 AND rating <= 5.0)
);