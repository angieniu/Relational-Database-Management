USE [niuyDW]
GO

create view vStageChannel AS
SELECT [ChannelID]
      ,[ChannelCategoryID]
      ,[Channel]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageChannel]
GO


