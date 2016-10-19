DROP VIEW IF EXISTS albums_vw;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 primary key,
  name VARCHAR(100)
);

CREATE TABLE albums (
  id SERIAL4 primary key,
  name VARCHAR(100),
  artist_id INT4 REFERENCES artists(id)
);

CREATE VIEW albums_vw AS SELECT
  ab.id "album_id",
  ab.name "name",
  at.name "artist"
FROM albums ab
  INNER JOIN artists at ON ab.artist_id = at.id;
