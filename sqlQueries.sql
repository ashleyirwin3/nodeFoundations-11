-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;


-- Using the INSERT statement, add one of your favorite artists to the Artist table NSERT INTO ARTIST

-- insert artist to artist table
INSERT INTO ARTIST (ArtistName,YearEstablished)
VALUES ("Pink Floyd", 500);

-- insert album to album table
INSERT INTO ALBUM (Title,ReleaseDate,AlbumLength,Label,ArtistId,GenreId)
VALUES ("Fearless", "August 8, 2008", 200, "Big Machine", 24, 3);

-- insert song into song
INSERT INTO SONG (Title,SongLength,ReleaseDate,GenreId,ArtistId,AlbumID)
VALUES ('Breathe', 3, 'August 8, 2008', 3, 24, );

-- LIVE CODING IN CLASS --

-- inserting new artist
INSERT INTO artist
VALUES (null, 'Billy Beetz', 2017)


-- inserting album with sub queries
INSERT INTO album
VALUES(null, 'Bears and Beetz', '02/28/2017', 75848, 'Epic Records',
(SELECT artistid FROM artist WHERE artistname = 'Billy Beetz'),
(SELECT genreid FROM genre WHERE label = 'Latin'))


-- insert song into album
INSERT INTO song
VALUES(null, 'Beetz for Dinner', 5757, '02/10/17',(SELECT genreid FROM genre WHERE label = 'Latin'),
(SELECT artistid FROM artist WHERE artistname = 'Billy Beetz'),
(SELECT albumid FROM album WHERE Title = 'Bears and Beetz') )

-- another song
INSERT INTO song
VALUES(null, "Stayin' Aliver", 57573, '03/10/17',
(SELECT genreid FROM genre WHERE label = 'Latin'),
(SELECT artistid FROM artist WHERE artistname = 'Billy Beetz'),
(SELECT albumid FROM album WHERE Title = 'Bears and Beetz') )


-- show song titles, ablum titles, and artist
SELECT song.title AS 'Song Title', album.title AS Album, artist.artistname FROM artist
LEFT JOIN album ON artist.artistid = album.artistid
LEFT JOIN song ON artist.artistid = song.artistid
WHERE artist.artistname = 'Billy Beetz'

-- Display album name and number of tracks
SELECT album.title AS Album,
COUNT(song.title) AS '# of tracks'
FROM album, song
ON album.albumid = song.albumid
GROUP BY album.title

-- show how many songs each artist has
SELECT artist.artistname AS Rocker,
COUNT(song.title) AS '# of tracks'
FROM artist, song
ON artist.artistid = song.artistid
GROUP BY artist.artistname

-- find the longest album
SELECT title, max(albumlength)
FROM album

-- find the longest song
SELECT title, MAX(songlength)
FROM song

-- now show title of album
SELECT album.title, song.title, MAX(songlength)
FROM song
JOIN album
ON song.albumid = album.albumid
