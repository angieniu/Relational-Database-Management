USE [niuyDW]
GO

create view vFactTargetProduct AS
SELECT [TargetProduct]
      ,[ProductKey]
      ,[DateID]
      ,[DailyTarget]
  FROM [dbo].[FactTargetProduct]
GO


