USE [niuyDW]
GO

create view vStageProductCategory AS
SELECT [ProductCategoryID]
      ,[ProductCategory]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageProductCategory]
GO


