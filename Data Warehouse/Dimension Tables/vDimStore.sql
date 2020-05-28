USE [niuyDW]
GO

create view vDimStore AS
SELECT [StoreKey]
      ,[StoreID]
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
  FROM [dbo].[DimStore]
GO


