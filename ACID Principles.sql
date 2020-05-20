CREATE DATABASE PANAMANIU
USE PANAMANIU

/*
CREATE several tables 
Populate them with a few rows
Write some queries
-- long the way ACID principles --> purposeful mistakes to show ACID in action

-- CUSTOMER
-- PRODUCT_TYPE
-- PRODUCT
-- ORDER
*/

CREATE TABLE yanjieCUSTOMER
(CustID INT IDENTITY(1,1) primary key, -- IDENTITY() --> enabling the auto-increment --> sequential, seed number, and increament by
Fname varchar(20) not null,
Lname varchar(20) not null,
BirthDate Date not null)
GO

CREATE TABLE yanjiePRODUCT_TYPE
(ProdTypeID INT IDENTITY(1,1) primary key,
ProdTypeName varchar(50) not null,
ProdTypeDescr varchar(500) NULL) -- for people, NULL
GO

CREATE TABLE yanjiePRODUCT
(ProdID INT IDENTITY(1,1) primary key,
ProdName varchar(50) not null,
ProdTypeID INT FOREIGN KEY REFERENCES yanjiePRODUCT_TYPE (ProdTypeID) not null,
ProdDescr varchar(500) null) --? 
GO

CREATE TABLE yanjieORDER
(OrderID INT IDENTITY(1, 1) primary key,
CustID INT FOREIGN KEY REFERENCES yanjieCUSTOMER (CustID) not null,
ProdID INT FOREIGN KEY REFERENCES yanjiePRODUCT (ProdID) not null,
Quantity INT not null, 
OrderDate Date NOT NULL)
GO

INSERT INTO yanjieCUSTOMER (Fname, Lname, BirthDate)
VALUES ('Kenny', 'TheCat', 'October 3, 2012'), ('Mitch', 'TheCat', 'November 7, 2011'), ('Lisa', 'TheCat', 'October 13, 2010'), ('Jazzy', 'TheCat', 'June 5, 2016')
-- one transaction four statements/rows
-- consistency + atomicity (all or nothing), malformed statement in position 2 failed and also caused well-formed statement in position 1 to fail ("Lisa"), so even 3 and 4 failed and you recreated, it will start from 5 and 6. 
-- durability(truth): saw evidence of the failure with pk values being skipped. (truth)

BEGIN TRANSACTION G1
INSERT INTO yanjieCUSTOMER (Fname, Lname, BirthDate)
VALUES ('Max', 'TheFriendsCate', 'April 20, 2015')

UPDATE yanjieCUSTOMER
SET Fname = 'Jasmine'
WHERE Fname = 'Jazzy'
-- one transactio ntwo statements 
-- select * from yanjieCUSTOMER, the other data is locked, read table being locked. --select * from yanjieCUSTOMER with (nolock) -- changing isolation level.
COMMIT TRANSACTION G1

-- but if we     rollback transaction G1     means in memory but not committed transaction.
-- isolation: select * was blocked. -- isolation: nolock. -- isolation: rolledback,  -- atomicity, durability, consistency (previous known good state): Jazzy to Jasmine disappeared, "max" disappeared.  isolation: rollback. 
-- the default is read committed. if (nolock), read uncommitted data in flight.

INSERT INTO yanjieORDER (CustID, ProdID, Quantity, OrderDate)
VALUES (1, 3, 5, 'Mar 3, 2020')
-- syntax is correct, but insert it before foreign key table is avilable, pk/fk violation, consistency.




