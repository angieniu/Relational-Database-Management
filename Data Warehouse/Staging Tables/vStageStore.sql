USE [niuyDW]
GO

create view vStageStore AS
SELECT [StoreID]
      ,[SubSegmentID]
      ,[StoreNumber]
      ,[StoreManager]
      ,[Address]
      ,[City]
      ,[StateProvince]
      ,[Country]
      ,[PostalCode]
      ,[PhoneNumber]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[StageStore]
GO


