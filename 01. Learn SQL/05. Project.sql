# Create a Table
CREATE TABLE friends (
	id INTEGER,
  name TEXT,
  birthday DATE
);
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Jane Doe', '1990-05-30');
SELECT *
FROM friends;
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Herik Pham', '1998-10-21');
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Alex Le', '1998-02-14');
UPDATE friends
SET name = 'Jane Smith'
WHERE id = 1;
ALTER TABLE friends
ADD COLUMN email TEXT;
UPDATE friends
SET email = 'jane@codecademy.com'
WHERE id = 1;
DELETE FROM friends
WHERE id = 1;
SELECT *
FROM friends;
