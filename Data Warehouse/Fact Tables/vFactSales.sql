USE [niuyDW]
GO

create view vFactSales AS
SELECT [SalesID]
      ,[StoreKey]
      ,[CustomerKey]
      ,[ProductKey]
      ,[ResellerKey]
      ,[ChannelKey]
      ,[DateID]
      ,[SalesHeaderKey]
      ,[SalesQuantity]
      ,[SalesAmount]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[FactSales]
GO


