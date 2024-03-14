SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

 CREATE TABLE albums (
    album_id INT(10) NOT NULL PRIMARY KEY,
    album_name VARCHAR(128) NOT NULL,
    album_release_date DATE NOT NULL
);
CREATE TABLE artists (
    artist_id INT(10) NOT NULL PRIMARY KEY,
    artist VARCHAR(255) NOT NULL
);
CREATE TABLE countries (
    country_id INT(10) PRIMARY KEY,
    country VARCHAR(45) DEFAULT NULL
);
CREATE TABLE music_details (
    music_id INT(10) PRIMARY KEY  NOT NULL,
    is_explicit VARCHAR(45) NOT NULL,
    duration_ms INT(10) NOT NULL,
    song_key INT(8) NOT NULL,
    song_mode TINYINT(1) NOT NULL,
    tempo DECIMAL(25,20) NOT NULL,
    time_signature INT(8) NOT NULL
);
CREATE TABLE song_attributes (
    attribute_id INT(10) PRIMARY KEY NOT NULL,
    danceability DECIMAL(25,20) NOT NULL,
    energy DECIMAL(25,20) NOT NULL,
    loudness DECIMAL(25,20) NOT NULL,
    speechiness DECIMAL(25,20) NOT NULL,
    acousticness DECIMAL(25,20) NOT NULL,
    instrumentalness DECIMAL(25,20) NOT NULL,
    liveness DECIMAL(25,20) NOT NULL,
    valence DECIMAL(25,20) NOT NULL
);
CREATE TABLE songs (
    spotify_id VARCHAR(45) PRIMARY KEY NOT NULL,
    song VARCHAR(128) NOT NULL,
    music_id INT(10) NOT NULL,
    artist_id INT(10) NOT NULL,
    album_id INT(10) NOT NULL,
    attribute_id INT(10) NOT NULL,
    FOREIGN KEY (music_id) REFERENCES music_details(music_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (attribute_id) REFERENCES song_attributes(attribute_id)
);
CREATE TABLE performance (
    performance_id INT(10) PRIMARY KEY NOT NULL,
    daily_rank INT(10) NOT NULL,
    daily_movement INT(10) NOT NULL,
    weekly_movement INT(10) NOT NULL,
    popularity INT(10) NOT NULL,
    spotify_id VARCHAR(45) NOT NULL,
    country_id INT(10),
    FOREIGN KEY (spotify_id) REFERENCES songs(spotify_id),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
