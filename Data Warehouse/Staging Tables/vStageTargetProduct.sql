USE [niuyDW]
GO

create view vStageTargetProduct AS
SELECT [ProductID]
      ,[Product]
      ,[Year]
      ,[ SalesQuantityTarget ]
  FROM [dbo].[StageTargetProduct]
GO


