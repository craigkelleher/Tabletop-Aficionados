-- Query for add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language

-- Register
-- INSERTS a new user into the users table
INSERT INTO Users (userFirstName, userLastName, email) VALUES 
(:firstName, :lastName, :email_input);
-- SELECTS the inserted user to get the auto_incremented userID
SELECT userID, userFirstName FROM users WHERE userFirstName = :firstName;

-- Login
-- SELECTS information to login a user
SELECT email, password FROM Users WHERE email = :email_input;

-- INSERTS a new boardgame listing into the database
INSERT INTO Boardgames (boardgameName,publisherName,rating,genre) VALUES 
(:gameName,:pubName,:rating,:release:genre);

-- INSERTS a new Primary designer listing into the database 
INSERT INTO PrimaryDesigners (designerFirstName, designerLastName, gamesPublished, yearEstablished) VALUES
(:designFirst,:designLast,:gamesPub,:yearEst);

-- INSERTS a new Primary Publisher listing into the database
INSERT INTO PrimaryPublisher (publisherName,gamesPublished,yearEstablished) VALUES 
(:pubName,:gamesPub,:yearEst);

-- SELECTS all information on a listing
SELECT * FROM Boardgames WHERE (boardgameName =:gameName OR designerFirstName =:designFirst OR designerLastName =:designLast OR 
publisherName =:pubName OR rating =:rating OR releaseDate =:release ORgenre =:genre);

-- UPDATES all information on a paticular user's account
UPDATE Users SET userFirstName =:userFirst WHERE userID =:userID_from_updateform;
UPDATE Users SET userLastName =:userLast WHERE userID =:userID_from_updateform;
UPDATE Users SET email =:email WHERE userID =:userID_from_updateform;

-- UPDATES a boardgame's rating
UPDATE Boardgames SET rating =:rating WHERE boardgameName =:gameName AND userID =:userID_from_updateform;

-- DELETE a boardgame from the boardgame's table
DELETE FROM Boardgames WHERE boardgameName =:gameName AND userID =:userID_from_updateform;

-- (M-to-M relationship deletion) Dis-associate a boardgame from a user's list 
DELETE from UsersBoardgames WHERE userID = :userID_selected AND boardgameID = :boardgameID_selected

 
