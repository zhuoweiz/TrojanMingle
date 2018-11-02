DROP DATABASE IF EXISTS trojanmingle; 
CREATE DATABASE trojanmingle;
USE trojanmingle;

CREATE TABLE Users (
	userID INT(11) PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    picLink VARCHAR(500) NOT NULL,
    age INT(11) NOT NULL,
    major VARCHAR(100) NOT NULL,
    hashedpw VARCHAR(500) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    yr INT(11) NOT NULL,
    standing VARCHAR(50) NOT NULL,
    idealDate VARCHAR(100) NOT NULL,
    lastLogin VARCHAR(100) NOT NULL,
    bio VARCHAR(500)
);

CREATE TABLE Matches (
	userID INT(11) NOT NULL,
    liked INT(11) NOT NULL,
    FOREIGN KEY fk1 (userID) REFERENCES Users(userID)
);

CREATE TABLE MessageHistory (
    chatID INT(11) PRIMARY KEY AUTO_INCREMENT,
    senderID INT(11) NOT NULL,
    receiverID INT(11) NOT NULL,
    message VARCHAR(5000) NOT NULL,
    FOREIGN KEY fk4 (senderID) REFERENCES Users(userID),
    FOREIGN KEY fk5 (receiverID) REFERENCES Users(userID)
);


INSERT INTO Users(fname, email, picLink, age, major, hashedpw, gender, yr, standing, idealDate, lastLogin, bio)
	VALUES ('Jeff', 'jeff@usc.edu', 'jeff.jpg', 21, 'Computer Science', 'definitelyahashedpassword', 'Male', 4, 'undergraduate', 'sports game', 'Wed Apr 21 10:05 (BST)', 'bio'),
		   ('Michael', 'mike@usc.edu', 'michael.jpg', 20, 'Computer Science', 'noplaintexthere', 'Male', 5, 'undergraduate', 'coffee', 'Tue Sep 21 12:05 (BST)', 'bio'),
           ('Sandra', 'sandra@usc.edu', 'sandra.jpg', 22, 'Computer Science', 'totallysecure', 'Female', 3, 'graduate', 'dinner', 'Sat Oct 15 3:46 (PST)', 'bio');

INSERT INTO Matches(userID, liked)
	VALUES ('1', '2'),
		   ('2', '3'),
           ('2', '1');
           
INSERT INTO MessageHistory(senderID, receiverID, message)
	VALUES ('2', '1', 'hey wanna analyze some algorithms?'),
		   ('1', '2', 'yeah sure');

