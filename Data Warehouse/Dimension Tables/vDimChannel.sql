USE [niuyDW]
GO

--DROP VIEW vDimChannel


create view vDimChannel AS
SELECT [ChannelKey]
      ,[ChannelID]
      ,[Channel]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[ChannelCategory]
      ,[ChannelCategoryID]
  FROM [dbo].[DimChannel]
GO


