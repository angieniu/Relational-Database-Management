USE [niuyDW]
GO

create view vStageCustomer AS
SELECT [CustomerID]
      ,[SubSegmentID]
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
  FROM [dbo].[StageCustomer]
GO


