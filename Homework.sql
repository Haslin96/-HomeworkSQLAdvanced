CREATE TABLE IF NOT exists genre (
	genre_id SERIAL primary key,
	name VARCHAR(80) not null
);

CREATE TABLE IF NOT exists genre_executor (
	genre_id INTEGER references genre(genre_id),
	executor_id INTEGER references executor(executor_id),
	constraint pk primary key (genre_id, executor_id)
);

CREATE TABLE IF NOT exists executor(
	executor_id SERIAL primary key,
	name VARCHAR(80) not null,
	genre_id INTEGER not null references genre(genre_id)
);

CREATE TABLE IF NOT exists executor_album (
	executor_id INTEGER references executor(executor_id),
	album_id INTEGER references album(album_id),
	constraint pk_1 primary key (executor_id, album_id)
);

CREATE TABLE IF NOT exists album(
	album_id SERIAL primary key,
	name VARCHAR(100),
	year_of_issue DATE,
	executor_id INTEGER not null references executor(executor_id)
);

CREATE TABLE IF NOT exists song(
	song_id SERIAL primary key references album(album_id),
	name VARCHAR(80) not null,
	duration VARCHAR (20) not null
);

CREATE TABLE IF NOT exists song_compilation (
	song_id INTEGER references song(song_id),
	compilation_id INTEGER references compilation(compilation_id),
	constraint pk_2 primary key (song_id, compilation_id)
);

CREATE TABLE IF NOT exists compilation(
	compilation_id SERIAL primary key,
	name VARCHAR(100),
	year_of_issue DATE,
	song_id INTEGER not null references song(song_id),
	album_id INTEGER not null references album(album_id)
);



