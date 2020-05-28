USE [niuyDW]
GO

create view vStageProductType AS
SELECT [CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[ProductTypeID]
      ,[ProductCategoryID]
      ,[ProductType]
  FROM [dbo].[StageProductType]
GO


