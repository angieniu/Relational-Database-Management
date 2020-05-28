USE [niuyDW]
GO

create view vStageSalesDetail AS
SELECT [SalesDetailID]
      ,[SalesHeaderID]
      ,[ProductID]
      ,[SalesQuantity]
      ,[SalesAmount]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageSalesDetail]
GO


