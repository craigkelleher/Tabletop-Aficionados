CREATE TABLE Users (
    'userID' int(11) NOT NULL AUTO_INCREMENT,
    'userFirstName' varchar(255) NOT NULL,
    'userLastName' varchar(255) NOT NULL,
    'email' varchar(255) NOT NULL,
    PRIMARY KEY ('userID')
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE UsersBoardgames (
    'userID' int(11) NOT NULL AUTO_INCREMENT,
    'boardgameID' int(11) NOT NULL AUTO_INCREMENT,
    FOREIGN KEY ('userID') REFERENCES 'Users'('userID'),
    FOREIGN KEY ('boardgameID') REFERENCES 'Boardgames'('boardgameID')
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE Boardgames (
    'boardgameID' int(11) NOT NULL AUTO_INCREMENT,
    'boardgameName' varchar(255) NOT NULL,
    'designerID' int(11) NOT NULL,
    'publisherName' varchar(255) NOT NULL,
    'rating' int(11),
    'releaseDate' DATE,
    'genre' varchar(255),
    PRIMARY KEY ('boardgameID'),
    FOREIGN KEY ('designerID') REFERENCES 'PrimaryDesigners'('designerID'),
    FOREIGN KEY ('publisherName') REFERENCES 'PrimaryPublishers'('publisherID')
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE PrimaryDesigners (
    'designerID' int(11) NOT NULL AUTO_INCREMENT,
    'designerFirstName' varchar(255) NOT NULL,
    'designerLastName' varchar(255) NOT NULL,
    PRIMARY KEY ('designerID')
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE PrimaryPublisher (
    'publisherID' int(11) NOT NULL AUTO_INCREMENT,
    'publisherName' varchar(255) NOT NULL,
    'gamesPublished' int(11),
    'yearEstablished' int(11),
    PRIMARY KEY ('publisherID')
) ENGINE=InnoDB DEFAULT CHARSET=latin1

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

SELECT * FROM 'Boardgames' WHERE ('boardgameID' = ':gameID','boardgameName' = ':gameName', 'designerID' = ':designID', 'publisherName' = ':pubName', 'rating' = ':rating',
 'releaseDate' = ':release', 'genre' = ':genre');

 
