CREATE TYPE PROFESSION AS ENUM('actor', 'director', 'screenwriter', 'composer', 'operator', 'producer', 'painter', 'editor');
CREATE TYPE GENDER AS ENUM('male', 'female');

CREATE TABLE film (
	id SERIAL PRIMARY KEY,
    name VARCHAR,
    rating NUMERIC
);

CREATE TABLE recommendation (
	id SERIAL PRIMARY KEY,
    film1_id int REFERENCES film(id),
    film2_id int REFERENCES film(id)
);

CREATE TABLE trailer (
	id SERIAL PRIMARY KEY,
    video_link VARCHAR,
    description VARCHAR,
    film_id INT REFERENCES film(id)
);

CREATE TABLE still (
	id SERIAL PRIMARY KEY,
    picture_link VARCHAR,
    description VARCHAR,
    film_id INT REFERENCES film(id)
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
    profession PROFESSION,
    film_id INT REFERENCES film(id),
    person_id INT REFERENCES person(id)
);

CREATE TABLE site_user (
	id SERIAL PRIMARY KEY,
    login VARCHAR,
    password VARCHAR,
    gender GENDER,
    birthday DATE
);

CREATE TABLE review (
	id SERIAL PRIMARY KEY,
    date_of_publication TIMESTAMP,
    rating NUMERIC,
    film_id INT REFERENCES film(id),
    user_id INT REFERENCES site_user(id)
);

CREATE TABLE viewed_film (
	id SERIAL PRIMARY KEY,
    film_id INT REFERENCES film(id),
    user_id INT REFERENCES site_user(id)
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    description VARCHAR
);

CREATE TABLE genre_of_film (
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genre(id),
    film_id INT REFERENCES film(id)
);