use UNIVERSITY
/*
select --> list of columns 
from -> list of tables (entities)
where -> filter
*/
select *
from tblCOLLEGE
where CollegeName like 'E%'
order by CollegeName DESC

-- Let's see all the departments for each college. 
Select CollegeName, DeptName
from tblCOLLEGE C
join tblDEPARTMENT D on C.CollegeID = D.CollegeID

 -- now abbreviate the table names!
 
 -- now ... add a filter ! "Which courses are provided by the Information school"
 select CollegeName, CO.CourseName
 from tblCOLLEGE C
 join tblDEPARTMENT D On C.CollegeID = D.CollegeID
 join tblCourse CO on D.DeptID = CO.DeptID
 where C.CollegeName = 'Information School'
 order by CourseName desc

 -- which classes are offered Winter 2006 from the Information School
 select CollegeName, CO.CourseName, Q.QuarterName, CS.[YEAR]
 from tblCOLLEGE C
 join tblDEPARTMENT D On C.CollegeID = D.CollegeID
 join tblCourse CO on D.DeptID = CO.DeptID
 join tblClass CS on CO.CourseID = CS.CourseID
 JOIN tblQUARTER Q on CS.QuarterID = Q.QuarterID

 where c.CollegeName = 'Information School'
 and Q.QuarterName = 'Winter'
 and CS.[YEAR] = '2006'
 order by CourseName desc

 -- get the list students from Winter 2006 who registerede for an IMT class (boom)
 select C.CollegeName, CO.CourseName, Q.QuarterName, CS.[YEAR], S.StudentFname, S.StudentLname, CL.RegistrationDate
 from tblCOLLEGE C
 join tblDEPARTMENT D On C.CollegeID = D.CollegeID
 join tblCourse CO on D.DeptID = CO.DeptID
 join tblClass CS on CO.CourseID = CS.CourseID
 JOIN tblQUARTER Q on CS.QuarterID = Q.QuarterID
 JOIN tblCLASS_LIST CL on CS.ClassID = CL.ClassID
 JOIN tblSTUDENT S ON CL.StudentID = S.StudentID

 where c.CollegeName = 'Information School'
 and Q.QuarterName = 'Winter'
 and CS.[YEAR] = '2006'
 and CO.CourseName LIKE 'IMT%'
 order by CourseName desc

