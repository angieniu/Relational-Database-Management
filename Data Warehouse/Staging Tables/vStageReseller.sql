USE [niuyDW]
GO

create view vStageReseller AS
SELECT [ResellerID]
      ,[Contact]
      ,[EmailAddress]
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
      ,[ResellerName]
  FROM [dbo].[StageReseller]
GO


