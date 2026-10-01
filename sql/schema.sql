CREATE DATABASE IF NOT EXISTS movie_rating_system;
USE movie_rating_system;



CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    overview TEXT,
    release_date DATE,
    runtime DECIMAL(6,1),
    budget BIGINT,
    revenue BIGINT,
    rating_average DECIMAL(3,1),
    rating_count INT
);




CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);





CREATE TABLE MovieGenre(
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);



CREATE TABLE Users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP

);




CREATE TABLE Ratings(
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    review TEXT,
    rating_date DATETIME DEFAULT CURRENT_TIMESTAMP,


    PRIMARY KEY (user_id, movie_id),

    FOREIGN KEY (user_id) 
        REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) 
        REFERENCES Movies(movie_id),

    CHECK (rating >=1 AND rating <= 5)
);