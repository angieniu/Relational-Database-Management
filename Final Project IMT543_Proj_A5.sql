-- create the database IMT543_Proj_A5

CREATE DATABASE IMT543_Proj_A5

-- use the database in the sql server
USE IMT543_Proj_A5

-- Creating tables: 
/*
Parkride gateway -- 
Iot_gateway -- 
Pr_usage_detail
Usage_detail
Parkride --
Zipcode --
Employee 
Pr_emp_maint
Maintenance
-Owner
-Note
-Note-type
-City
-Subarea
-County
*/

-- IoT_gateway
CREATE TABLE IOT_GATEWAY
(GatewayID INT IDENTITY (1, 1) PRIMARY KEY,
GatewayDescription varchar (500) 
)
INSERT INTO IOT_GATEWAY
VALUES ('This gateway was installed in 2020 to monitor the parking availability of the whole parking lot.'),
 ('This gateway was installed in 2020 to monitor the parking availability of the whole parking lot.'),
  ('This gateway was installed in 2020 to monitor the parking availability of the whole parking lot.'),
   ('This gateway was installed in 2020 to monitor the parking availability of the whole parking lot.'),
    ('This gateway was installed in 2020 to monitor the parking availability of the whole parking lot.')
GO
select * from IOT_GATEWAY

-- ZipCode
CREATE TABLE ZIPCODE
(ZipCodeID INT IDENTITY (1,1) PRIMARY KEY,
ZipCode varchar (5) not null,
CityID int  foreign key references CITY (CityID) not null)
insert into ZIPCODE
VALUES ('98001', '6'),
('98390', '1'),
('98155', '2'),
('98026', '3'),
('98370', '4'),
('98052', '5')
Go
select * from ZIPCODE

-- Parkride
CREATE TABLE PARKRIDE
(ParkRideID INT IDENTITY (1, 1) PRIMARY KEY,
ParkRideName varchar (60) not null,
ParkRideAddress varchar (60) not null,
ZipCodeID int foreign key references CITY (CityID) not null,
OwnerID int foreign key references OWNER (OwnerID) not null)
insert into PARKRIDE
values ('Bonney Lake South (SR 410)', '9101 184th Ave E', '1', '1'),
('Buddha Jewel Monastery', '17418 8th Ave NE', '2', '2'),
('Calvary Chapel', '8330 212th St SW', '3', '3'),
('Gateway Fellowship', '18901 8th Ave NE', '4', '4'),
('Redwood Family Church', '11500 Redmond-Woodinville Rd NE', '5', '5'),
('Auburn Garage at Auburn Station', '23 A St SW', '6', '6')
go
select * from PARKRIDE

-- parkride gateway
CREATE table PARKRIDE_GATEWAY
(ParkRideGatewayID INT identity (1,1) primary key,
ParkRideID int foreign key references PARKRIDE (ParkRideID) not null,
GatewayID int foreign key references IOT_GATEWAY (GatewayID) not null,
OccupiedSpaces int not null,
Time smalldatetime not null)
INSERT INTO PARKRIDE_GATEWAY
VALUES ('1', '1', '318', '2020-05-19 08:00:00'),
('1', '1', '340', '2020-05-19 08:15:00'),
('1', '1', '356', '2020-05-19 08:30:00'),
('1', '1', '320', '2020-05-19 08:45:00'),

('1', '1', '28', '2020-05-19 08:00:00'),
('1', '1', '33', '2020-05-19 08:15:00'),
('1', '1', '38', '2020-05-19 08:30:00'),
('1', '1', '40', '2020-05-19 08:45:00'),

('1', '1', '0', '2020-05-19 08:00:00'),
('1', '1', '0', '2020-05-19 08:15:00'),
('1', '1', '0', '2020-05-19 08:30:00'),
('1', '1', '0', '2020-05-19 08:45:00'),

('1', '1', '116', '2020-05-19 08:00:00'),
('1', '1', '123', '2020-05-19 08:15:00'),
('1', '1', '140', '2020-05-19 08:30:00'),
('1', '1', '156', '2020-05-19 08:45:00'),

('1', '1', '0', '2020-05-19 08:00:00'),
('1', '1', '5', '2020-05-19 08:15:00'),
('1', '1', '8', '2020-05-19 08:30:00'),
('1', '1', '10', '2020-05-19 08:45:00'),

('1', '1', '516', '2020-05-19 08:00:00'),
('1', '1', '506', '2020-05-19 08:15:00'),
('1', '1', '520', '2020-05-19 08:30:00'),
('1', '1', '520', '2020-05-19 08:45:00')
GO
select * from PARKRIDE_GATEWAY

-- Usage_Detail
CREATE table USAGE_DETAIL
(DetailID INT identity (1,1) primary key,
DetailName varchar (30) not null,
DetailDescr varchar (500))
INSERT INTO USAGE_DETAIL
VALUES ('Capacity', 'The maximum number of parking spaces that the parking lot could provide.'),
('Bicycle lockers', 'Whether the parking facility has bicycle lockers provided as amenities.'),
('Bicycle racks', 'Whether the parking facility has bicycle racks provided as amenities.'),
('King County Metro Service', 'Whether the parking facility is served by routes operated by King County Metro'),
('Carpool?', 'Allow carpools or not.')
go 
select * from USAGE_DETAIL

--Pr_usage_detail
CREATE table PR_USAGE_DETAIL
(ParkRideDetailID INT identity (1,1) primary key,
ParkRideID int foreign key references PARKRIDE (ParkRideID) not null,
DetailID int foreign key references USAGE_DETAIL (DetailID) not null,
Value varchar (10) not null)
INSERT INTO PR_USAGE_DETAIL
VALUES ('1', '1', '356'),
('2', '1', '40'),
('3', '1', '20'),
('4', '1', '156'),
('5', '1', '10'),
('6', '1', '520')
go 
select * from PR_USAGE_DETAIL




-- Employee 
-- Pr_emp_maint
-- Maintenance
CREATE TABLE EMPLOYEE
(EmployeeID INT IDENTITY (1, 1) PRIMARY KEY, 
EmployeeFname varchar(60) not null,
EmployeeLname varchar(60) not null,
Gender char(1) not null,
EmployeePhone char(10) not null,
EmployeeEmail varchar(80) not null)
Go
SELECT * FROM EMPLOYEE
-- 
INSERT INTO EMPLOYEE
VALUES ('James', 'Brown', 'M', '2057785543', 'jamesbrown@gmail.com'),
('Robert', 'Miller', 'M', '2087775656', 'robertmiller@gmail.com'),
('David', 'Martin', 'M', '2069998884', 'davidmartin@hotmail.com'),
('Emory', 'Kelly', 'F', '2066667878', 'emoryk@hotmail.com'),
('Jerry', 'Cooper', 'M', '2078895848', 'jerycooper@gmail.com')
GO


CREATE TABLE MAINTENANCETYPE 
(MaintenanceTypeID INT IDENTITY (1, 1) PRIMARY KEY, 
MaintenanceTypeName varchar(50) not null,
MaintenanceDescription varchar(500) not null)
Go
SELECT * FROM MAINTENANCETYPE
--- 
INSERT INTO MAINTENANCETYPE
VALUES ('Sweeping and cleaning', 'Regular cleaning removes debris and reveals areas where repairs are needed'),
('Striping', 'Marks painted on the lot need to be repainted every so often to make sure they remain clear and visible'),
('Crack filling', 'Potholes and cracks allow water or debris to penetrate the surface layer, causing further damage if they are not filled in'),
('Asphalt overlay', 'Stripping the top layer off the pavement and replacing it with a new layer of asphalt helps extend the life of the pavement while giving a “like new” appearance'),
('Repaving', 'Once a parking lot begins to crumble, repaving and reconstructing it is typically the only course. Ideally, this is only necessary once every few decades.'),
('Sensor Maintenance', 'Sensor maintenance allows staff to check whether sensors in the parking spaces work well and contact technical support when needed.')
GO

CREATE TABLE PR_EMP_MAINT
(EmpMaintenanceID INT IDENTITY (1, 1) PRIMARY KEY,
ParkRideID INT FOREIGN KEY REFERENCES PARKRIDE (ParkRideID) not null,
MaintenanceTypeID INT FOREIGN KEY REFERENCES MAINTENANCETYPE (MaintenanceTypeID) not null,
EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE (EmployeeID) not null,
EmpMaintDateTime DateTime not null)
Go



-- we created the owner table first
CREATE TABLE OWNER
(OwnerID INT IDENTITY (1, 1) PRIMARY KEY, 
OwnerName varchar(100) not null, 
OwnerType varchar(50) not null,
OwnerEmail varchar(80) null,
-- since we only store us phone numbers so we use char(10)
OwnerPhone char(10) null)
Go
SELECT * FROM OWNER
-- 
INSERT INTO OWNER
VALUES ('Pierce Transit', 'Public', NULL, '2535818000'),
('Private', 'Private', NULL, NULL),
('Community Transit', 'Public', 'riders@commtrans.org','8005621375'),
('Private', 'Private', NULL, NULL),
('King County Metro Transit', 'Public', null, '2065533000'),
('Sound Transit', 'Public', 'main@soundtransit.org', '8888896368')
GO

-- we create the note now, all these table can only run when the PARKRIDE table
-- was created
CREATE TABLE NOTETYPE
(NoteTypeID INT IDENTITY (1, 1) PRIMARY KEY,
NoteTypeName varchar(50) not null)
Go
SELECT * FROM NOTETYPE
--
INSERT INTO NOTETYPE 
VALUES ('Short')
GO

INSERT INTO NOTETYPE 
VALUES ('Medium'),
('Long'),
('Very Long'),
('Paper')
GO

CREATE TABLE NOTE
(NoteID INT IDENTITY (1, 1) PRIMARY KEY,
ParkRideID INT FOREIGN KEY REFERENCES PARKRIDE (ParkRideID) not null, 
NoteTypeID INT FOREIGN KEY REFERENCES NOTETYPE (NoteTypeID) not null,
Date date not null,
NoteContent varchar(300) null)
Go


/* now let's create 
City
Subarea
County
*/
CREATE TABLE COUNTY
(CountyID INT IDENTITY (1, 1) PRIMARY KEY, 
CountyName varchar(50) not null)
Go
select * from COUNTY
-- NOW WE INSERT DATA FROM DATA WE HAVE 

INSERT INTO COUNTY 
VALUES ('Pierce County'),
('King County'),
('Snohomish County'),
('Kitsap County')
Go

----------------------- subarea
CREATE TABLE SUBAREA
(SubareaID INT IDENTITY (1, 1) PRIMARY KEY, 
SubareaName varchar(50) not null,
CountyID INT FOREIGN KEY REFERENCES COUNTY (CountyID) not null)
Go

SELECT * FROM SUBAREA
-- INSERT VALUES
INSERT INTO SUBAREA
VALUES ('Pierce County', 1),
('North King County', 2),
('Snohomish County', 3),
('Kitsap County', 4), 
('East King County', 2),
('Sounth King County', 2)
GO

-------------------------- City
CREATE TABLE CITY
(CityID INT IDENTITY (1, 1) PRIMARY KEY, 
CityName varchar(50) not null,
SubareaID INT FOREIGN KEY REFERENCES SUBAREA (SubareaID) not null)
Go
SELECT * FROM CITY
--
INSERT INTO CITY
VALUES ('Bonney Lake', 1),	
('Shoreline', 2),
('Edmonds', 3),
('Poulsbo', 4),
('Redmond', 5)
('Aubum', 6)
Go


