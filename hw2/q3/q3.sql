set global local_infile = 1;
CREATE DATABASE adbdb;
use adbdb;
DROP TABLE IF EXISTS Likes, Friend;

CREATE TABLE Likes(person INTEGER, artist INTEGER);
CREATE TABLE Friend(person1 INTEGER, person2 INTEGER);

LOAD DATA LOCAL INFILE 'D:\HW2\p3\like.txt' INTO TABLE Likes
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\HW2\p3\friend.txt' INTO TABLE Friend
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;


DROP VIEW IF EXISTS tmp1, tmp2, tmp3, tmp4;

CREATE VIEW tmp1 AS
SELECT person1, person2, artist 
FROM Likes
JOIN Friend
ON person2 = person;

CREATE VIEW tmp2 AS
SELECT person2, person1, artist 
FROM Likes 
JOIN Friend
ON person1 = person;

CREATE VIEW tmp3 AS
SELECT person1, person2, artist 
FROM tmp1
WHERE not exists (
    SELECT * 
    FROM Likes 
    WHERE Likes.person = person1 AND Likes.artist = tmp1.artist 
);

CREATE VIEW tmp4 AS
SELECT person2, person1, artist 
FROM tmp2
WHERE not exists (
    SELECT * 
    FROM Likes 
    WHERE Likes.person = person2 AND Likes.artist = tmp2.artist 
);

SELECT *
FROM tmp3 
UNION
SELECT *
FROM tmp4;
