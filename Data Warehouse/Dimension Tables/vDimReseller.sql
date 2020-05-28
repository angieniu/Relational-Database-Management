USE [niuyDW]
GO

create view vDimReseller AS
SELECT [ResellerKey]
      ,[ResellerID]
      ,[ResellerName]
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
  FROM [dbo].[DimReseller]
GO


