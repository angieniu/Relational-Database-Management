USE [niuyDW]
GO

create view vFactTargetChannel AS
SELECT [TargetChannelStoreResellerID]
      ,[TargetChannelName]
      ,[ChannelKey]
      ,[StoreKey]
      ,[ResellerKey]
      ,[DateID]
      ,[DailySalesTargetAmount]
  FROM [dbo].[FactTargetChannel]
GO


