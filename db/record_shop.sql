DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
-- DROP TABLE IF EXISTS stock;
--
-- CREATE TABLE stock (
--   low INT,
--   medium INT,
--   high INT,
--   id SERIAL PRIMARY KEY
-- );

CREATE TABLE artists (
  name VARCHAR (255),
  id SERIAL PRIMARY KEY
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  title VARCHAR(255),
  genre VARCHAR(255),
  quantity INT,
  stock_level VARCHAR(255)
);
