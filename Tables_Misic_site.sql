create table if not exists artists (
	artist_ID SERIAL primary key,
	name VARCHAR(80) not null
);

create table if not exists genres (
	genre_ID SERIAL primary key,
	name VARCHAR(80) not null
);

create table if not exists albums (
	album_ID SERIAL primary key,
	title VARCHAR(80) not null,
	release_year INT not null
);

create table if not exists digests (
	digest_ID SERIAL primary key,
	name VARCHAR(80) not null,
	release_year INT not null
);

create table if not exists tracks (
	track_ID SERIAL primary key,
	title VARCHAR(80) not null,
	duration DECIMAL(4,2) not null,
	album_ID INT,
	FOREIGN key (album_ID) REFERENCES albums(album_ID)
);

create table if not exists artists_ganres (
	artist_ID INT REFERENCES artists(artist_ID),
	genre_ID INT REFERENCES genres(genre_ID),
	primary key (artist_ID, genre_ID)
);

-- INcorect approach
--create table if not exists artists_albums (
--	artist_album_ID SERIAL primary key,
--	CONSTRAINT fk_artist_ID FOREIGN KEY(artist_ID) REFERENCES artists(artist_ID),
--	CONSTRAINT fk_genre_ID FOREIGN KEY(genre_ID) REFERENCES genres(genre_ID)
--);

-- Создание промежуточной таблицы artists_albums (связь многие-ко-многим)
CREATE TABLE IF NOT EXISTS artists_albums (
    artist_id INT REFERENCES artists(artist_id),
    album_id INT REFERENCES albums(album_id),
    PRIMARY KEY (artist_id, album_id)
);

-- Создание промежуточной таблицы artists_albums (связь многие-ко-многим)
CREATE TABLE IF NOT EXISTS tracks_digests (
    digest_ID INT REFERENCES digests(digest_ID),
    track_ID INT REFERENCES tracks(track_ID),
    PRIMARY KEY (digest_ID, track_ID)
);
