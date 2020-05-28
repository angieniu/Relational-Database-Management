select PDS.DimDateID, PDS.ProductKey, PDS.SalesQuantity, FTP.DailyTarget
FROM
(
select FS.ProductKey, DD.DimDateID, sum(FS.SalesQuantity) As SalesQuantity
from dbo.FactSales as FS
join dbo.DimProduct as DP
on DP.ProductKey = FS.ProductKey
join dbo.DimDate as DD
on DD.DimDateID = FS.DateID
Group by FS.ProductKey, DD.DimDateID) as PDS
join FactTargetProduct as FTP
on PDS.DimDateID = FTP.DateID 
and PDS.ProductKey = FTP.ProductKey

order by PDS.DimDateID, PDS.ProductKey












SELECT A.DimDateID, A.ProductKey,A.SalesQuantity, ftp.DailyTarget
FROM 
(
SELECT fs.ProductKey, dd.FullDate,dd.DimDateID, SUM(fs.SalesQuantity) AS SalesQuantity
FROM dbo.FactSales AS fs
JOIN dbo.DimProduct AS ddp
ON ddp.ProductKey = fs.ProductKey
JOIN dbo.DimDate AS dd
ON dd.DimDateID = fs.DateID
GROUP BY fs.ProductKey, dd.FullDate,dd.DimDateID)
AS A
JOIN FactTargetProduct AS ftp
ON A.DimDateID = ftp.DateID

create view vdimProduct as