CREATE TYPE PROFESSION AS ENUM('actor', 'director', 'screenwriter', 'composer', 'operator', 'producer', 'painter', 'editor');
CREATE TYPE GENDER AS ENUM('male', 'female');

CREATE TABLE film (
	id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    rating NUMERIC NOT NULL
);

CREATE TABLE recommendation (
	id SERIAL PRIMARY KEY,
    film1_id int REFERENCES film(id) ON DELETE CASCADE,
    film2_id int REFERENCES film(id) ON DELETE CASCADE
);

CREATE TABLE trailer (
	id SERIAL PRIMARY KEY,
    video_link VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    film_id INT REFERENCES film(id) ON DELETE CASCADE
);

CREATE TABLE still (
	id SERIAL PRIMARY KEY,
    picture_link VARCHAR NOT NULL,
    description VARCHAR,
    film_id INT REFERENCES film(id) ON DELETE CASCADE
);

CREATE TABLE person (
	id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    gender GENDER,
    birthday DATE
);

CREATE TABLE person_to_film (
	id SERIAL PRIMARY KEY,
    profession PROFESSION NOT NULL,
    film_id INT REFERENCES film(id) ON DELETE CASCADE,
    person_id INT REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE site_user (
	id SERIAL PRIMARY KEY,
    login VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
    gender GENDER,
    birthday DATE
);

CREATE TABLE review (
	id SERIAL PRIMARY KEY,
    date_of_publication TIMESTAMP,
    rating NUMERIC,
    film_id INT REFERENCES film(id) ON DELETE CASCADE,
    user_id INT REFERENCES site_user(id)
);

CREATE TABLE viewed_film (
	id SERIAL PRIMARY KEY,
    film_id INT REFERENCES film(id) ON DELETE CASCADE,
    user_id INT REFERENCES site_user(id) ON DELETE CASCADE
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR
);

CREATE TABLE genre_of_film (
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genre(id) ON DELETE CASCADE,
    film_id INT REFERENCES film(id) ON DELETE CASCADE
);