USE PEEPS
GO

/*
1) Determine which customer are from the zip code 80471.
*/
Select CustomerID, CustomerFname, CustomerLname
From tblCUSTOMER
Where CustomerZIP = '80471'

/*
2) Determine which customer have 'Blvd' in their address.
*/
Select CustomerID, CustomerFname, CustomerLname
From tblCUSTOMER
Where CustomerAddress like '%Blvd%'

/*
3) Determine which customers have last names that match the pattern 'F**R' and reside in either Florida or Texas.
*/
Select CustomerID, CustomerFname, CustomerLname
From tblCUSTOMER
Where CustomerLname like 'F__R%'
/*SUBSTRING(CustomerLname, 1, 1) = 'F' 
and SUBSTRING(CustomerLname, 4, 4) = 'R'*/
and CustomerState like 'Florida%' or CustomerState like 'Texas%' 

/*
4) Determine which customers have a first name beginning with ‘Ra’ and live in California.
*/
Select CustomerID, CustomerFname, CustomerLname
From tblCUSTOMER
Where CustomerFname like 'Ra%'
and CustomerState like 'California%'

/*
5) Determine which customers have ‘Leaf’ in their address and have the two letters ‘ba’ together in any part of the county they live in.
*/
Select CustomerID, CustomerFname, CustomerLname
From tblCUSTOMER
Where CustomerAddress like '%Leaf%'
and CustomerCounty like '%ba%'

/*
6) Determine which states have at least 100,000 customers.
*/
Select CustomerState, COUNT(CustomerID) as NumOfCustomers
From tblCUSTOMER
Group by CustomerState
Having COUNT(CustomerID) >= 100000

/*
7) Determine which customers are at least 65 years - old and do NOT live in Wyoming, Iowa, Colorado or Nebraska.
*/
Select CustomerID, CustomerFname, CustomerLname, DATEDIFF(year, DateOfBirth, GetDate()) AS Age
From tblCUSTOMER
Where (DATEDIFF(YEAR, DateOfBirth, GetDate()) >= 65)
and (CustomerState Not Like 'Wyoming%' or CustomerState Not Like 'Iowa%' or CustomerState Not Like 'Colorado%' or CustomerState Not Like 'Nebraska%')

/*
8) Determine which customers are younger than 50, have a phone number in area code '206', '360' or '425' and also have a last name beginning with 'J'.
*/
Select CustomerID, CustomerFname, CustomerLname, DATEDIFF(Day, DateOfBirth, GetDate()) / 365.25 AS Age
From tblCUSTOMER
Where (DATEDIFF(Day, DateOfBirth, GetDate()) / 365.25 < 50)
and (AreaCode Like '206' or AreaCode Like '360' or AreaCode Like '425')
and (CustomerLname Like 'J%')

/*
9) Determine who the oldest customer is from Florida.
*/
Select top 1 CustomerID, CustomerFname, CustomerLname, DATEDIFF(Day, DateOfBirth, GetDate()) / 365.25 AS Age
From tblCUSTOMER
Where CustomerState Like 'Florida%'
order by Age desc

/*
10) Determine the average age of all customers from Oregon.
*/
Select AVG(DATEDIFF(Day, DateOfBirth, GetDate()) / 365.25) as AverageAge
From tblCUSTOMER
Where CustomerState Like 'Oregon%'