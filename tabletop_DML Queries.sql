-- Query for add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language

INSERT INTO 'Users' ('userFirstName', 'userLastName', 'email') VALUES (':firsName', 
':lastName', ':email_input');

INSERT INTO 'Boardgames' ('boardgameName', 'publisherName', 'rating', 'genre') VALUES 
(':gameName', ':pubName', ':rating', ':release' ':genre');

INSERT INTO 'PrimaryDesigners' ('designerFirstName', 'designerLastName', 'gamesPublished', 'yearEstablished') VALUES
(':designFirst', ':designLast', ':gamesPub', ':yearEst');

INSERT INTO 'PrimaryPublisher' ('publisherName', 'gamesPublished', 'yearEstablished') VALUES 
(':pubName', ':gamesPub', ':yearEst');

SELECT * FROM 'Boardgames' WHERE ('boardgameName' = ':gameName' OR 'designerFirstName' = ':designFirst' OR 'designerLastName' = ':designLast' OR 
'publisherName' = ':pubName' OR 'rating' = ':rating' OR 'releaseDate' = ':release' OR 'genre' = ':genre');

UPDATE 'Users' SET 'userFirstName' = ':userFirst' WHERE 'userID' = ':userID_from_updateform';
UPDATE 'Users' SET 'userLastName' = ':userLast' WHERE 'userID' = ':userID_from_updateform';
UPDATE 'Users' SET 'email' = ':email' WHERE 'userID' = ':userID_from_updateform';

UPDATE 'Boardgames' SET 'rating' = ':rating' WHERE 'boardgameName' = ':gameName' AND 'userID' = ':userID_from_updateform';
DELETE FROM 'Boardgames' WHERE 'boardgameName' = ':gameName' AND 'userID' = ':userID_from_updateform';

 
