USE [niuyDW]
GO

create view vDimCustomer AS
SELECT [CustomerKey]
      ,[CustomerID]
      ,[FirstName]
      ,[LastName]
      ,[Gender]
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
  FROM [dbo].[DimCustomer]
GO


