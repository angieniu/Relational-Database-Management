USE [niuyDW]
GO

create view vStageChannelCategory AS
SELECT [ChannelCategoryID]
      ,[ChannelCategory]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageChannelCategory]
GO


