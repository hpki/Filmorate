CREATE TABLE IF NOT EXISTS users
(
    id       INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email    VARCHAR(50) NOT NULL UNIQUE CHECK (email LIKE '%_@_%_.__%'),
    login    VARCHAR(50) NOT NULL UNIQUE,
    name     VARCHAR(50) NOT NULL,
    birthday DATE        NOT NULL CHECK (birthday <= NOW())
);

CREATE TABLE IF NOT EXISTS friends
(
    user_id       INTEGER NOT NULL,
    friend_id     INTEGER NOT NULL,
    friendstorage VARCHAR(50) DEFAULT 'неподтверждённая',
    PRIMARY KEY (user_id, friend_id)
);

CREATE TABLE IF NOT EXISTS films
(
    id           INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    description  VARCHAR(50) NOT NULL,
    release_date DATE        NOT NULL CHECK (release_date >= '1895-12-28'),
    duration     INTEGER     NOT NULL CHECK (duration > 0),
    mpa_id       INTEGER
);

CREATE TABLE IF NOT EXISTS likes
(
    user_id INTEGER NOT NULL,
    film_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, film_id)
);

CREATE TABLE IF NOT EXISTS film_genres
(
    film_id  INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE IF NOT EXISTS genres
(
    id   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS mpa
(
    id   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);