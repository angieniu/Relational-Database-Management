/*
"No car from BMW may have a service for tire rotation"
*/

CREATE FUNCTION fn_NoTireRotationBMW()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (SELECT * FROM tblMFG M JOIN tblMODEL MD ON M.MfgID = MD.MfgID
	JOIN tblCAR C ON MD.ModelID = C.ModelID
	JOIN tblCUSTOMER_SERVICE CS ON C.CarID = CS.CarID
	JOIN tblSERVICE S ON CS.ServiceID = S.ServiceID
	WHERE MFG_NAME = 'BMW'
	AND S.ServiceName = 'Tire Rotation'
	) --code for the violation goes here
	BEGIN
	      SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblCUSTOMER_SERVICE
ADD CONSTRAINT CK_BMW_DudntLikeTiresRotated
CHECK (dbo.fn_NoTireRotationBMW() = 0)
