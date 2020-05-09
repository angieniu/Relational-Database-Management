USE UNIVERSITY
GO
/*
Which students enrolled in a class from the Information School during Winter quarter 1998?
*/

select * --> name of all columns (mandatory for any 'select' statement)
/*
Select 'today is Saturday' --> string call
select 7 * 9 + (9 * 30)
select GetDate()
*/
from --> list of tables (mandatory ... unless calling a function, doing math or callign a string)
	JOIN second_table_name_name_goes_here on pk/fk connection goes here
	JOIN third_table_name_name_goes_here on pk/fk connection goes here
	JOIN fourth_table_name_name_goes_here on pk/fk connection goes here
where --> filter logic (optional)
order by --> sorting of the data in the results --> what 'order' do we see the data? (optional)

-- very basic query --> which students were born in 1970?
-- all data we need is in one single table (Student...no JOIN required)
select StudentFname, StudentLname, StudentBirth
from tblSTUDENT
where StudentBirth >= 'January 1, 1970' AND StudentBirth <= 'December 31, 1970'
-- format different ways, once it's date, '1/1/1970' '12/31/1970'.   StudentBirth between '1/1/1970' and '12/31/1970' (inclusive).

select StudentFname, StudentLname, StudentBirth
from tblSTUDENT
where Month(StudentBirth) = '7' -- YEAR(StudentBirth) = '1970'
order by StudentBirth, StudentLname
-- order by StudentLname DESC --- ASC default.

select distinct CourseName
from
(select /* top 50 */ StudentFname, StudentLname, StudentPermCity, StudentPermState, C.CollegeName, Q.QuarterName, CS.[Year], CR.CourseName
from tblSTUDENT S
	JOIN tblCLASS_List CL ON S.StudentID = CL.StudentID
	JOIN tblCLASS CS on CL.ClassID = CS.ClassID
	JOIN tblQuarter Q on CS.QuarterID = Q.QuarterID
	JOIN tblCOURSE CR on CS.CourseID = CR.CourseID
	JOIN tblDEPARTMENT D on CR.DeptID = D.DeptID
	JOIN tblCOLLEGE C ON D.CollegeID = C.CollegeID
where C.CollegeName = 'Information School'
and Q.QuarterName = 'Winter'
and CS.[YEAR] = '1998') Jeff -- name it as a table
order by StudentLname DESC

select * from tblCOLLEGE

-- aggregate functions needed when grouping use "group by"： min(), max(), avg(), sum(), count(), 
-- system functions: minute(), hour(), day(), year(), month(), getDate().

-- find me the student with the 'oldest' date of birth (may be alive!!)

-- please notice max() does not get us the oldest person --> MAX() is a date not age!!
select Min(StudentBirth)
from tblSTUDENT

-- okay ... now we found the smallest date ==> the oldest person's birthdate use min

-- now we have found the person who has the 'oldest' birthdate!! are they still alive? Nope --> DateOfDeath needs to be > today -- > (select GetDate())
select StudentFname, StudentLname, StudentBirth
From tblSTUDENT
WHERE StudentBirth = (SELECT MIN(StudentBirth) from tblSTUDENT)
and DateOfDeath is null
-- DateOfDeath > (select GetDate())

select top 10 StudentFname, StudentLname, StudentBirth
From tblSTUDENT
WHERE -- DateOfDeath is null and 
DateOfDeath > (select GetDate())
order by StudentBirth

select StudentFname, StudentLname, StudentBirth
From tblSTUDENT
WHERE StudentBirth = (SELECT MIN(StudentBirth) from tblSTUDENT)
and DateOfDeath > (select GetDate())
-- DateOfDeath is null

select TOP 1 StudentFname, StudentLname, StudentBirth, DateOfDeath, DateDiff(Day, StudentBirth, GetDate()) / 365.25 AS Age   --- DateDiff(Year, StudentBirth, DateOfDeath)
-- DateDiff(YEAR, StudentBirth, GetDate()) , Month, Day accuracy.
From tblSTUDENT
WHERE DateOfDeath > (SELECT GetDate())
Order By StudentBirth

/*
AGGREGATE FUNCTIONS
MIN()
MAX()
AVG()
SUM()
COUNT()
*/

-- What was the average grade for the students who took an Information School class winter 1998?
--> without GROUP BY I must execute the query once for each collegeName!!!
select top 3 C.CollegeID, CollegeName, AVG(CL.Grade) AS AverageCollegeGrade1998Winter
from tblSTUDENT S
	JOIN tblCLASS_List CL ON S.StudentID = CL.StudentID
	JOIN tblCLASS CS on CL.ClassID = CS.ClassID
	JOIN tblQuarter Q on CS.QuarterID = Q.QuarterID
	JOIN tblCOURSE CR on CS.CourseID = CR.CourseID
	JOIN tblDEPARTMENT D on CR.DeptID = D.DeptID
	JOIN tblCOLLEGE C ON D.CollegeID = C.CollegeID
where -- C.CollegeName = 'Information School' and 
Q.QuarterName = 'Spring'
and CS.[YEAR] = '1989'
GROUP BY C.CollegeID, CollegeName
HAVING AVG(CL.Grade) >= 3.38 -- could not use alias name, last could be executed would be select. from, where, join, logic, group by, having, select, order by. so counting is not yet used before.
Order by AverageCollegeGrade1998Winter DESC

-- "What are the total number of credits with a grade above 3.4 for each student born afterMArch 9, 1963."
select top 50 with ties S.StudentID, StudentFname, StudentLname, SUM(Credits) AS TotalCreds_BornAfter1963
-- with ties, do you care more matching
From tblStudent S
	Join tblCLASS_LIST CL on S.StudentID = CL.StudentID
	JOIN tblClass CS on CL.ClassID = CS.ClassID
	JOIN tblCourse CR on CS.CourseID = CR.CourseID
WHERE S.StudentBirth > 'March 9, 1963'
AND CL.Grade > 3.9
Group by S.StudentID, StudentFname, StudentLname, S.StudentBirth  -- need unique identifier, like StudentID, faster
HAVING sum(Credits) > 200
Order by TotalCreds_BornAfter1963 DESC
