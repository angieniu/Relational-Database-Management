USE [niuyDW]
GO

create view vDimDate AS
SELECT [DimDateID]
      ,[FullDate]
      ,[DayNumberOfWeek]
      ,[DayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekdayFlag]
      ,[WeekNumberOfYear]
      ,[MonthName]
      ,[MonthNumberOfYear]
      ,[CalendarQuarter]
      ,[CalendarYear]
      ,[CalendarSemester]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[DimDate]
GO


