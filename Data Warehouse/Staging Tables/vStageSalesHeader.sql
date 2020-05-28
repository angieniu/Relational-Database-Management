USE [niuyDW]
GO

create view vStageSalesHeader AS
SELECT [SalesHeaderID]
      ,[Date]
      ,[ChannelID]
      ,[StoreID]
      ,[CustomerID]
      ,[ResellerID]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageSalesHeader]
GO


