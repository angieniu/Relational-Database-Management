/*
tblSERIES --> ID,Name, Descr, BeginYear
tblEPISODE --> ID, Name, Season, SeriesID(FK)
tblVIEWING --> ?????????
tblSTUDENT --> ID, Fname, Lname

 

1) Build (write out the schema/create table script) for 4 tables (3 look-up and 1 Associative table)
2) Populate with ~3 rows each --> INSERT INTO statements
3) Write a stored procedure to manage the INSERTs into the Associative table
* parameters of names
* variables to do the look-ups
*/

-- 1) 3 look-up tables
-- created the database in the sql server
CREATE DATABASE PROJ_Niu

USE PROJ_Niu

-- create a Series table 
CREATE TABLE tblSERIES
(SeriesID INT IDENTITY (1, 1) primary key,
SeriesName varchar(50) not null,
SeriesDescr varchar(500) NULL,
BeginYear Date not null)
GO

-- create a Episode table
CREATE TABLE tblEPISODE
(EpisodeID INT IDENTITY (1, 1) primary key,
EpisodeName varchar(100) not null,
EpisodeSeason INT not null,
SeriesID INT FOREIGN KEY REFERENCES tblSERIES (SeriesID) not null)
GO

-- create a Student table 
CREATE TABLE tblSTUDENT
(StudentID INT IDENTITY (1, 1) primary key,
StudentFName varchar(50) not null,
StudentLName varchar(50) not null)
GO


-- 1 associative table
-- create a Viewing table
CREATE TABLE tblVIEWING 
(ViewingID INT IDENTITY (1, 1) primary key,
SeriesID INT FOREIGN KEY REFERENCES tblSERIES (SeriesID) not null, 
EpisodeID INT FOREIGN KEY REFERENCES tblEPISODE (EpisodeID) not null, 
StudentID INT FOREIGN KEY REFERENCES tblSTUDENT (StudentID) not null)
GO



-- 2) Populate with ~ 3 rows each -----> INSERT INTO statements
/*
insert values to series table.
*/
INSERT INTO tblSERIES
VALUES ('Rick and Morty', 'After having been missing for nearly 20 years, Rick Sanchez suddenly arrives at daughter Beth doorstep to move in with her and her family. Although Beth welcomes Rick into her home, her husband, Jerry, is not as happy about the family reunion. Jerry is concerned about Rick, a sociopathic scientist, using the garage as his personal laboratory.', '2013-12-02')
GO

INSERT INTO tblSERIES
VALUES ('Westworld', 'Westworld is not your typical amusement park. Intended for rich vacationers, the futuristic park -- which is looked after by robotic "hosts" -- allows its visitors to live out their fantasies through artificial consciousness. No matter how illicit the fantasy may be, there are no consequences for the park guests, allowing for any wish to be indulged.', '2016-10-02')
GO

INSERT INTO tblSERIES
VALUES ('Star Wars: The Clone Wars', 'The first weekly TV series from Lucasfilm Animation chronicles the adventures of Anakin Skywalker, Yoda, Obi-Wan Kenobi and other popular characters from the Star Wars universe during the violent Clone Wars, as dwindling numbers of Jedi knights struggle to restore peace.', '2008-10-03')
GO

/*
insert values to episode table.
*/
INSERT INTO tblEPISODE
VALUES ('Ricksy Business', 1, 1)
GO

INSERT INTO tblEPISODE
VALUES ('Rixty Minutes', 1, 1)
GO

INSERT INTO tblEPISODE
VALUES ('Lawnmower Dog', 1, 1)
GO


/*
insert students to the student table
*/
INSERT INTO tblSTUDENT
VALUES ('Angie', 'Niu')
GO

INSERT INTO tblSTUDENT
VALUES ('Jess', 'Wang')
GO

INSERT INTO tblSTUDENT
VALUES ('Judy', 'Lee')
GO


-- 3) stored procedure
GO
CREATE PROCEDURE 
insertAssociateTableValues @FName varchar(50), @SeriesName varchar(50), @EpisodeName varchar(100) 
AS 
DECLARE @SeriesID INT 
SET @SeriesID = (SELECT SeriesID FROM tblSERIES WHERE SeriesName = @SeriesName)  
DECLARE @EpisodeID INT
SET @EpisodeID = (SELECT EpisodeID FROM tblEPISODE WHERE EpisodeName = @EpisodeName)
DECLARE @StudentID INT
SET @StudentID = (SELECT StudentID FROM tblSTUDENT WHERE StudentFName = @FName) 
BEGIN 
INSERT INTO [dbo].[tblVIEWING] ([SeriesID], [EpisodeID],[StudentID])
VALUES (@SeriesID, @EpisodeID, @StudentID)
END 
GO


-- Test the stored procedure.
EXEC insertAssociateTableValues @FName = 'Angie', @SeriesName = 'Rick and Morty', @EpisodeName = 'Ricksy Business'

EXEC insertAssociateTableValues @FName = 'Jess', @SeriesName = 'Rick and Morty', @EpisodeName = 'Ricksy Business'

EXEC insertAssociateTableValues @FName = 'Angie', @SeriesName = 'Rick and Morty', @EpisodeName = 'Rixty Minutes'

EXEC insertAssociateTableValues @FName = 'Judy', @SeriesName = 'Rick and Morty', @EpisodeName = 'Lawnmower Dog'