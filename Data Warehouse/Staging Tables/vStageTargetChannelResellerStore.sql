USE [niuyDW]
GO

create view vStageTargetChannelResellerStore AS
SELECT [Year]
      ,[ChannelName]
      ,[TargetName]
      ,[ TargetSalesAmount ]
  FROM [dbo].[StageTargetChannelResellerStore]
GO


