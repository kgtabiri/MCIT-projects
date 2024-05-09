-- This script creates the tables I used to fill the SalesReports table.
-- Please run before creating SalesReports table.

-- Please un-comment and run the following to clear the tables from the database before running this script
/*
DROP TABLE [dbo].[highestcustomer]
DROP TABLE [dbo].[highestcategory]
DROP TABLE [dbo].[highestsupplier]
DROP TABLE [dbo].[ttlrunsales]
*/


-- Category with maximum sales
SELECT Year, Month, ProductCategory, CategorySales INTO highestcategory
FROM (
    SELECT YEAR(SaleDate) AS Year, MONTH(SaleDate) AS Month, 
    ProductCategory, COUNT(ProductCategory) as CategorySales,
	ROW_NUMBER() OVER(PARTITION BY YEAR(SaleDate), MONTH(SaleDate) ORDER BY 
						COUNT(productcategory) DESC) AS Ranking
    FROM Sales S
    JOIN SalesOrderDetail sod ON s.SaleID = sod.OrderDetailID
    GROUP BY YEAR(SaleDate), MONTH(SaleDate), ProductCategory
) AS HighestCat 
WHERE Ranking = 1


-- Customer with highest sales in each month
SELECT Year, Month, CustomerName, SaleTotal INTO highestcustomer FROM (
SELECT Year, Month, CustomerName, SUM(TotalSales) AS SaleTotal,
ROW_NUMBER() OVER(PARTITION BY YEAR, MONTH 
					ORDER BY SUM(totalsales) DESC) AS Ranking 
FROM (
SELECT YEAR(S.SaleDate) AS Year, MONTH(S.SaleDate) AS Month, CustomerName, Email, TotalSales
from Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
JOIN SalesOrderDetail sod ON S.SaleID = sod.OrderDetailID
WHERE Email LIKE '%gmail%' OR Email LIKE '%hotmail%'
) AS HighestCust1
GROUP BY YEAR, MONTH, CustomerName
) AS HighestCust1 WHERE Ranking = 1


-- Supplier with the highest number of product sold in each month
SELECT Year, Month, ServiceProviderName, ProductsSold INTO highestsupplier
FROM (
    SELECT YEAR(s.saledate) as Year, MONTH(s.saledate) as Month, ServiceProviderName,
	count(ServiceProviderName) as ProductsSold,
	ROW_NUMBER() OVER(PARTITION BY YEAR(SaleDate), MONTH(SaleDate) 
						ORDER BY COUNT(ServiceProviderName) DESC) AS Ranking
    FROM Sales S
    JOIN SalesOrderDetail sod on S.SaleID = sod.OrderDetailID
    GROUP BY YEAR(SaleDate), MONTH(SaleDate), ServiceProviderName
) AS HighestSupplier 
WHERE Ranking = 1


-- Total Sales and Cumulative sales in each month
SELECT YEAR(S.SaleDate) as Year, MONTH(S.SaleDate) AS Month, SUM(TotalSales) AS MonthlyTotal,
SUM(SUM(TotalSales)) OVER(ORDER BY YEAR(S.SaleDate), MONTH(S.SaleDate)) AS CumulativeSalesAmt
INTO ttlrunsales
FROM Sales S
JOIN SalesOrderDetail sod ON S.SaleID = sod.OrderDetailID
GROUP BY YEAR(S.SaleDate), MONTH(S.SaleDate)

