USE UNIVERSITY
/*done*/
/*1. Write the query to determine the most-frequent classroom type 
assigned to business classes held since 1996 during summer quarters.*/

SELECT TOP 1 WITH TIES  CT.ClassroomTypeName, COUNT(*) AS NUM
FROM tblCLASSROOM_TYPE CT JOIN tblCLASSROOM C 
ON CT.ClassroomTypeID=C.ClassroomTypeID
JOIN tblCLASS CL ON CL.ClassroomID=C.ClassroomID 
JOIN tblQUARTER Q ON Q.QuarterID=CL.QuarterID 
JOIN tblCourse CO ON CO.CourseID=CL.CourseID 
JOIN tblDEPARTMENT DE ON DE.DeptID=CO.DeptID
JOIN tblCOLLEGE CG on CG.CollegeID = DE.CollegeID
WHERE CL.Year>=1996 AND 
Q.QuarterName='Summer'
AND CollegeName like '%Business%'
GROUP BY CT.ClassroomTypeName 
ORDER BY NUM DESC

/* 2. Write the query to determine the oldest person registered for MATH389 Spring 2016.*/
SELECT STU.StudentFname,STU.StudentLname
FROM  tblCLASS CL
JOIN tblQUARTER Q ON Q.QuarterID=CL.QuarterID 
JOIN tblCourse Co ON Co.CourseID=CL.CourseID 
JOIN tblCLASS_LIST CLI ON CLI.ClassID=CL.ClassID
JOIN tblSTUDENT STU ON STU.StudentID=CLI.StudentID 
WHERE Q.QuarterName='Spring'
AND Co.Coursename='MATH389'
AND CL.Year=2016
ORDER BY STU.StudentBirth ASC 

 /*3.Write the query to determine the number of 'Academic Assistant' 
 in the School of Medicine hired before November 21, 2016.*/
 SELECT COUNT(*) AS NumAcademicAssistantsMed
 FROM tblCOLLEGE COL JOIN tblDEPARTMENT DEP
 ON  COL.CollegeID=DEP.CollegeID
 JOIN tblSTAFF_POSITION STP 
 ON STP.DeptID=DEP.DeptID
 JOIN tblPOSITION PO 
 ON PO.PositionID=STP.PositionID
 JOIN tblPOSITION_TYPE PTY 
 ON PTY.PositionTypeID=PO.PositionTypeID
 WHERE PO.PositionName='Academic Assistant'
 AND COL.CollegeName='Medicine'
 AND STP.BeginDate<'2016-11-21'


 /*4. Write the query to determine which 3 classroom types are most-frequently assigned for 400-level Psychology courses.*/

SELECT TOP 3 WITH TIES CT.ClassroomTypeName, COUNT(*) AS NUM
FROM tblCLASSROOM_TYPE CT JOIN tblCLASSROOM C 
ON CT.ClassroomTypeID=C.ClassroomTypeID
JOIN tblCLASS CL ON CL.ClassroomID=C.ClassroomID 
JOIN tblCourse CO ON CO.CourseID=CL.CourseID 
JOIN tblDEPARTMENT DE ON DE.DeptID=Co.DeptID
WHERE DeptName='Psychology'
AND CO.CourseName LIKE '%4__'
GROUP BY CT.ClassroomTypeName 
ORDER BY NUM DESC

 /*5.Create a stored procedure to register an existing student to an existing class. 
 Pass-in 'name' values as parameters and use variables to 'look-up' required values as necessary. */
Alter PROCEDURE usp_Registration
@studentFname varchar(60),
@studentLname varchar(60),
@Birth Date,
@Year varchar(4),
@Quarter varchar(30),
@Section char(3),
@CourseName varchar(75),
@RegistrationFee numeric(10, 2)

AS
DECLARE @StudentID INT
DECLARE @ClassID INT
DECLARE @Grade FLOAT
DECLARE @RegistrationDate DATE

SET @StudentID = (SELECT StudentID
					FROM tblSTUDENT
					WHERE StudentFname = @studentFname
					AND StudentLname = @studentLname
					AND StudentBirth = @Birth)
SET @ClassID = (SELECT c.ClassID
				FROM tblCLASS c
				JOIN tblCOURSE course ON c.CourseID = course.CourseID
				JOIN tblQUARTER Q ON C.QuarterID = Q.QuarterID
				WHERE course.CourseName = @CourseName
				AND Q.QuarterName = @Quarter
				AND c.[Year] = @Year
				AND c.Section = @Section
				)
SET @Grade = NULL
SET @RegistrationDate = GETDATE()

BEGIN TRAN T_Registration
INSERT INTO tblCLASS_LIST(StudentID, ClassID, Grade, RegistrationDate, RegistrationFee)
VALUES (@StudentID, @ClassID, @Grade, @RegistrationDate, @RegistrationFee)
COMMIT TRAN T_Registration
-- note: Since the student and the class were not connected before, I could not use tblCLASS_LIST the transactional table to do stored procedure.
-- note: stored-procedure is to populate transactional table, tblCLASS_LIST, insert table into it.


 /*6. Create check constraint to restrict the type of instructor assigned to 400-level courses 
 in Biology or Philosophy courses during summer quarters to Assistant or Associate Professor.*/
CREATE FUNCTION dbo.fn_instructorcheck()
RETURNS INT
AS
BEGIN 
DECLARE @ret INT=0
IF EXISTS 
(SELECT *
 FROM tblQUARTER Q 
JOIN tblCLASS CL ON Q.QuarterID=CL.QuarterID 
JOIN tblCOURSE CO ON CO.CourseID=CL.CourseID 
JOIN tblDEPARTMENT DE ON DE.DeptID=CO.DeptID 
JOIN tblINSTRUCTOR_CLASS INC ON INC.ClassID=CL.ClassID
JOIN tblINSTRUCTOR INS ON INS.InstructorID=INC.InstructorID 
JOIN tblINSTRUCTOR_INSTRUCTOR_TYPE IIT ON IIT.InstructorID=INS.InstructorID
JOIN tblINSTRUCTOR_TYPE IT ON IIT.InstructorTypeID=IT.InstructorTypeID
WHERE DE.DeptName='Biology' or DE.DeptName='Philosophy'
AND Q.QuarterName='Summer'
AND IT.InstructorTypeName not in ('Assistant Professor', 'Associate Professor')
AND CO.CourseName LIKE '%4__')
BEGIN 
SET @ret=1
END 
RETURN @ret
END 

ALTER TABLE tblINSTRUCTOR_TYPE WITH NOCHECK
ADD CONSTRAINT INSTRUCTORCHECK
CHECK ( dbo.fn_instructorcheck()=0)