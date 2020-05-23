/* Error - Handling
"Fail-Early":
- any work done after a process is "doomed" is wastered effort.
- easier to fial before transaction.
"Be- communicative"
- provide your brethren with enough info to troubleshoot failure.

To methods error-handling:
1. Raiserror: 
- old-school --> 1970's, 
- centralized development
- messages com from one team/person.
- not work well with distributed teams.

2. THROW:
- new school - 2000s
- allow impromptu messages
- supports distributed dev teams

Executive Suite
Single Staff
Single Academic
Double Academic
*/

USE UNIVERSITY
GO

SELECT * FROM tblBUILDING
-- write the stored procedure with error-handling to process inserts into tblOFFICE
GO
CREATE PROCEDURE yanjieINSERT_OFFICE
@BldgName varchar(50), -- no building ID , coz no want separate lookup.
@OT_Name varchar (50),
@O_Name varchar(25)
AS
DECLARE @B_ID INT, @OT_ID INT

SET @B_ID = (SELECT BuildingID FROM tblBUILDING WHERE BuildingName = @BldgName)

-- error-handling goes here -->  example of old-school RAISERROR
IF @B_ID IS NULL
BEGIN
	PRINT 'Hey... system cannot locate an ID value for the Building just submitted.'
	RAISERROR ('@B_ID is NULL; the INSERT statement is being terminated', 11, 1) -- 11 severity
	RETURN 
	-- kill connection
END


SET @OT_ID = (SELECT OfficeTypeID FROM tblOFFICE_TYPE WHERE OfficeTypeName = @OT_Name)
-- another set of error-handling goes here
BEGIN
	PRINT 'Hey... system cannot locate an ID value for the Building just submitted.';
	THROW 50445, '@B_ID is NULL; the INSERT statement is being terminated', 1; -- 50445 call the message by number
	-- throw terminates automatically connection
END
 

INSERT INTO tblOFFICE (OfficeName, OfficeTypeID, BuildingID)
VALUES (@O_Name, @OT_ID, @B_ID)

