use spoftify2;

INSERT INTO artists (artist_id, artist)
SELECT DISTINCT Artist_id, artists
FROM Raw_Data_CSV
WHERE Artist_id IS NOT NULL AND artists IS NOT NULL;

INSERT IGNORE INTO albums (album_id, album_name, album_release_date)
SELECT DISTINCT Album_id, album_name, STR_TO_DATE(album_release_date, '%d/%m/%Y') AS album_release_date
FROM Raw_Data_CSV
WHERE Album_id IS NOT NULL AND album_name IS NOT NULL AND album_release_date IS NOT NULL;

INSERT INTO countries (country_id, country)
SELECT DISTINCT Country_id, country
FROM Raw_Data_CSV;

INSERT IGNORE INTO music_details (music_id, is_explicit, duration_ms, song_key, song_mode, tempo, time_signature)
SELECT DISTINCT Music_id, is_explicit, duration_ms, song_key, song_mode, tempo, time_signature
FROM Raw_Data_CSV
WHERE Music_id IS NOT NULL AND is_explicit IS NOT NULL AND duration_ms IS NOT NULL AND song_key IS NOT NULL AND song_mode IS NOT NULL AND tempo IS NOT NULL AND time_signature IS NOT NULL;

INSERT INTO song_attributes (attribute_id, danceability, energy, loudness, speechiness, acousticness, instrumentalness, liveness, valence)
SELECT DISTINCT Attribute_id, danceability, energy, loudness, speechiness, acousticness, instrumentalness, liveness, valence
FROM Raw_Data_CSV
WHERE Attribute_id IS NOT NULL AND danceability IS NOT NULL AND energy IS NOT NULL AND loudness IS NOT NULL AND speechiness IS NOT NULL AND acousticness IS NOT NULL AND instrumentalness IS NOT NULL AND liveness IS NOT NULL AND valence IS NOT NULL;

INSERT IGNORE INTO songs (spotify_id, song, music_id, artist_id, album_id, attribute_id)
SELECT DISTINCT Spotify_id, name, Music_id, Artist_id, Album_id, Attribute_id
FROM Raw_Data_CSV
WHERE Spotify_id IS NOT NULL AND name IS NOT NULL AND Music_id IS NOT NULL AND Artist_id IS NOT NULL AND Album_id IS NOT NULL AND Attribute_id IS NOT NULL;

INSERT INTO performance (performance_id, daily_rank, daily_movement, weekly_movement, popularity, spotify_id, country_id)
SELECT DISTINCT Performance_Id, daily_rank, daily_movement, weekly_movement, popularity, Spotify_id, Country_id
FROM Raw_Data_CSV
WHERE Performance_Id IS NOT NULL AND daily_rank IS NOT NULL AND daily_movement IS NOT NULL AND weekly_movement IS NOT NULL AND popularity IS NOT NULL AND Spotify_id IS NOT NULL AND Country_id IS NOT NULL;