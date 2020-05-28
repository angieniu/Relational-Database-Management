USE [niuyDW]
GO

create view vDimProduct AS
SELECT [ProductKey]
      ,[ProductID]
      ,[Product]
      ,[ProductCategory]
      ,[ProductCategoryID]
      ,[ProductType]
      ,[ProductTypeID]
      ,[Color]
      ,[Style]
      ,[Weight]
      ,[Price]
      ,[Cost]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[WholesalePrice]
  FROM [dbo].[DimProduct]
GO


