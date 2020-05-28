USE [niuyDW]
GO

create view vStageProduct AS
SELECT [ProductID]
      ,[ProductTypeID]
      ,[Product]
      ,[Color]
      ,[Style]
      ,[UnitofMeasureID]
      ,[Weight]
      ,[Price]
      ,[Cost]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[WholesalePrice]
  FROM [dbo].[StageProduct]
GO


