# CREATE statements allow us to create a new table in the database
SELECT * FROM celebs;
CREATE TABLE celebs (
 	id INTEGER,
 	name TEXT,
 	age INTEGER
);

# The INSERT statement inserts a new row into a table
INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 22);
INSERT INTO celebs (id, name, age)
VALUES (2, 'Beyonce Knowles', 33);
INSERT INTO celebs (id, name, age)
VALUES (3, 'Jeremy Lin', 26);
INSERT INTO celebs (id, name, age)
VALUES (4, 'Taylor Swift', 26);

# SELECT statements are used to fetch data from a database
SELECT name FROM celebs; 

# The ALTER TABLE statement adds a new column to a table
ALTER TABLE celebs
ADD COLUMN twitter_handle TEXT;
SELECT * FROM celebs;

# The UPDATE statement edits a row in a table
UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;
SELECT * FROM celebs;

# The DELETE FROM statement deletes one or more rows from a table
DELETE FROM celebs
WHERE twitter_handle IS NULL;
SELECT * FROM celebs;

# Constraints that add information about how a column can be used are invoked after specifying the data type for a column
CREATE TABLE awards (
   id INTEGER PRIMARY KEY,
   recipient TEXT NOT NULL,
   award_name TEXT DEFAULT 'Grammy'
);
