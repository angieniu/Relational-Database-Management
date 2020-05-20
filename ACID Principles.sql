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

INSERT INTO yanjieORDER (CustID, ProdID, Quantity, OrderDate)
VALUES (1, 3, 5, 'Mar 3, 2020')
-- syntax is correct, but insert it before foreign key table is avilable, pk/fk violation, consistency.



