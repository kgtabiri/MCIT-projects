--The code that  creates the tables I used to fill in the SalesReports table are 
--in the create_tables script. Please run that script before this one.

-- Please un-comment and run the following to clear the tables from the database before running this script
/*DROP TABLE [dbo].[Customers]
DROP TABLE [dbo].[Suppliers]
DROP TABLE [dbo].[Product]
DROP TABLE [dbo].[Address]
DROP TABLE [dbo].[Sales]
DROP TABLE [dbo].[SalesOrderDetail]
DROP TABLE [dbo].[SalesReports]
 */


-- Create Customers table
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY
	,FirstName VARCHAR(50)
	,LastName VARCHAR(50)
	,Email VARCHAR(100)
	);

-- Insert records into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Prince', 'Boakye', 'princebo@gmail.com'),
(4, 'Francis', 'Kyei', 'kyei.bugyei@mail.com'),
(5, 'Deborah', 'Yeboah', 'debbieyeb@hotmail.com'),
(6, 'Samuel', 'Gyedu', 'samwise1@gmail.com'),
(7, 'Yaw', 'Afrane', 'yaw.afrane@mail.com'),
(8, 'Clement', 'Ahulu', 'clahulu@gmail.com'),
(9, 'Robert', 'Afotey', 'rafotey@example.com'),
(10, 'Ransmond', 'Berchie', 'ransberch@hotmail.com'),
(11, 'Stephanie', 'Tawiah', 'steph.tawiah@mail.com'),
(12, 'Josephine', 'Essilfie', 'josessilfie@mail.com'),
(13, 'Benedict', 'Acheampong', 'benache@gmail.com'),
(14, 'Maxwell', 'Tetteh', 'max.tetteh@example.com'),
(15, 'Edmond', 'Quaye', 'eddie.quaye@yahoo.com'),
(16, 'Kofi', 'Ampomah', 'kampomah@example.com'),
(17, 'Priscilla', 'Forson', 'prforson@example.com'),
(18, 'Christian', 'Kwakye', 'chris.kwakye@example.com'),
(19, 'Ebenezer', 'Baffour', 'eben.baffour@yahoo.com'),
(20, 'Kwabena', 'Kuffuor', 'kkuffuor@yahoo.com'),
(21, 'Theresah', 'Pomaah', 'tess.pomaah@example.com'),
(22, 'Godfred', 'Nti', 'gonti@example.com'),
(23, 'Gad', 'Nkrumah', 'gadite.nk@gmail.com'),
(24, 'Kingsley', 'Prempeh', 'kprempeh@example.com'),
(25, 'Florent', 'Vagba', 'fvagba@example.com'),
(26, 'Alexander', 'Johnston', 'alex.johnston@example.com'),
(27, 'Brennan', 'McLachlan', 'brenmcl@example.com'),
(28, 'Rohan', 'Dutta', 'rohan.dutta@example.com'),
(29, 'Saraswata', 'Chaudhuri', 'saraswata.chaudhuri@example.com'),
(30, 'Rui', 'Castro', 'rui.castro@example.com');


-- Create Suppliers table
CREATE TABLE Suppliers (
	SupplierID VARCHAR(10) PRIMARY KEY
	,SupplierName VARCHAR(100)
	,ContactPerson VARCHAR(50)
	,Email VARCHAR(100)
	);

-- Insert 10 records into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, Email)
VALUES
('SUP-1', 'John Garments', 'John Supplier', 'john.supplier@example.com'),
('SUP-2', 'Yankee Fashion World', 'Jane Contact', 'jane.contact@example.com'),
('SUP-3', 'Lisa Textiles', 'Lisa Supplier', 'lisa.supplier@example.com'),
('SUP-4', 'Mark Clothing', 'Mark Supplier', 'mark.supplier@example.com'),
('SUP-5', 'Emma Apparel', 'Emma Supplier', 'emma.supplier@example.com'),
('SUP-6', 'James Fashions', 'James Supplier', 'james.supplier@example.com'),
('SUP-7', 'Eva Couture', 'Eva Supplier', 'eva.supplier@example.com'),
('SUP-8', 'Daniel Style', 'Daniel Supplier', 'daniel.supplier@example.com'),
('SUP-9', 'Olivia Garb', 'Olivia Supplier', 'olivia.supplier@example.com'),
('SUP-10', 'William Wearables', 'William Supplier', 'william.supplier@example.com');

-- Create Product table
CREATE TABLE Product (
	PID VARCHAR(10) PRIMARY KEY
	,PName VARCHAR(100)
	,Size VARCHAR(10) -- Sizes are S,M,L,X-L,XXX-L,X4-L,X5-L
	,Price DECIMAL(8, 2) 
	);

INSERT INTO Product (PID, PName, Size, Price)
VALUES
    (1,'Shirt_Tops', 'M', 20.00),
    (2, 'Blouse_Tops', 'L', 25.50),
    (3, 'T-shirt_Tops', 'S', 15.00),
    (4, 'Sweater_Tops', 'X-L', 30.00),
    (5, 'Jacket_Tops', 'M', 45.00),
    (6, 'Tank Top_Tops', 'S', 12.50),
    (7, 'Cardigan_Tops', 'L', 35.00),
    (8, 'Blazer_Tops', 'X-L', 50.00),
    (9, 'Bustier_Tops', 'S', 18.00),
    (10, 'Camisole_Tops', 'M', 22.00),
    (11, 'Pant_Bottoms', 'M', 35.00),
    (12, 'Short_Bottoms', 'S', 18.50),
    (13, 'Skirt_Bottoms', 'L', 28.00),
    (14, 'Trouser_Bottoms', 'X-L', 40.00),
    (15, 'Jeans_Bottoms', 'M', 38.50),
    (16, 'Jumpsuit_Bottoms', 'L', 42.00),
    (17, 'Legging_Bottoms', 'S', 20.00),
    (18, 'Dress_Dresses', 'M', 55.00),
	(19, 'Vest_Tops', 'L', 60.00),
	(20, 'Hoody_Tops', 'S', 25.00);


-- Create Address table
CREATE TABLE Address (
	AddressID INT PRIMARY KEY
	,CustomerID INT
	,SupplierID INT
	,Address VARCHAR(200)--Address must consists of HouseNumber,City,State
	,IsCustomer BIT
	);

INSERT INTO Address (AddressID, CustomerID, SupplierID, Address, IsCustomer)
VALUES
(1, 1, NULL, '1234, Toronto, Ontario', 1), -- This means that we are inserting the CustomerAddress because SupplierId is NULL
(2, NULL, '1', '1234, Montreal, Quebec', 0), -- This means that we are inserting the SupplierAddress because CustomerID is NULL
(3, 2, NULL, '5678, Vancouver, British Columbia', 1),
(4, NULL, '2', '5678, Calgary, Alberta', 0),
(5, 3, NULL, '91011, Edmonton, Alberta', 1),
(6, NULL, '3', '91011, Ottawa, Ontario', 0),
(7, 4, NULL, '1213, Halifax, Nova Scotia', 1),
(8, NULL, '4', '1213, Quebec City, Quebec', 0),
(9, 5, NULL, '1415, Winnipeg, Manitoba', 1),
(10, NULL, '5', '1415, Saskatoon, Saskatchewan', 0),
(11, 6, NULL, '3480, Guelph, Ontario', 1),
(12, NULL, '6', '695, Verdun, Quebec', 0),  
(13, 7, NULL, '855, Victoria, British Columbia', 1),
(14, NULL, '7', '3400, Calgary, Alberta', 0),
(15, 8, NULL, '1011, Edmonton, Alberta', 1),
(16, NULL, '8', '7678, Hamilton, Ontario', 0),
(17, 9, NULL, '1201, Truro, Nova Scotia', 1),
(18, NULL, '9', '3123, Quebec City, Quebec', 0),
(19, 10, NULL, '550, Winnipeg, Manitoba', 1),
(20, NULL, '10', '165, Laval, Quebec', 0);



-- Create Sales table
CREATE TABLE Sales (
	SaleID INT PRIMARY KEY
	,CustomerID INT
	,SupplierID INT
	,ProductID VARCHAR(50)
	,SaleDate DATE
	,TotalAmount DECIMAL(10, 2)
	);

-- Insert 50 records into Sales table
INSERT INTO Sales (SaleID, CustomerID, SupplierID, ProductID, SaleDate, TotalAmount)
VALUES
(1, 1, 1, 'Pant', '2023-01-01', 105.00),
(2, 3, 1, 'Pant', '2023-01-02', 140.00),
(3, 2, 2, 'Pant', '2023-01-02', NULL),   
(4, 1, 1, 'Skirt', '2023-02-04', 56.00),
(5, 4, 2, 'Trouser', '2023-11-02', 120.00),
(6, 5, 4, 'Jeans', '2023-03-20', 77.00),
(7, 2, 3, 'Jumpsuit', '2023-06-12', 84.00),
(8, 6, 5, 'Tank Top', '2023-01-22', 25.00),
(9, 7, 9, 'Sweater', '2023-11-02', 60.00),
(10, 3, 6, 'Jacket', '2023-04-13', 90.00),
(11, 4, 5, 'Legging', '2023-10-06', 20.00),
(12, 10, 1, 'Camisole', '2023-04-17', 22.00),
(13, 2, 8, 'Cardigan', '2023-12-02', 140.00),
(14, 3, 3, 'Blazer', '2023-12-03', 100.00),
(15, 8, 7, 'Blouse', '2023-07-09', 77.50),
(16, 9, 10, 'Shirt', '2023-02-14', 40.00),
(17, 2, 4, 'Tank Top', '2023-02-14', 12.50),
(18, 1, 4, 'Short', '2023-07-13', 37.00),
(19, 5, 2, 'Pant', '2023-01-04', 70.00),
(20, 1, 1, 'Pant', '2023-05-02', 105.50),
(21, 2, 4, 'Trouser', '2023-01-05', 80.00),
(22, 5, 2, 'Trouser', '2023-02-07', 40.00),
(23, 1, 3, 'Blazer', '2023-08-20', 50.00),
(24, 6, 4, 'Camisole', '2023-05-25', 44.00),
(25, 5, 4, 'Bustier', '2023-10-02', 36.00),
(26, 1, 3, 'Cardigan', '2023-11-12', 100.00),
(27, 3, 3, 'Shirt', '2023-09-11', 60.00),
(28, 1, 1, 'Legging', '2023-09-13', 40.00),
(29, 2, 3, 'Blouse', '2023-01-02', 51.00),
(30, 10, 9, 'Pant', '2023-11-02', 100.00),
(31, 1, 2, 'Pant', '2023-10-02', 175.00),
(32, 2, 1, 'Shirt', '2023-08-02', 100.00),
(33, 2, 3, 'Dress', '2023-01-02', 55.00),
(34, 3, 3, 'Shirt', '2023-01-30', 80.00),
(35, 4, 1, 'Pant', '2023-10-02', 35.00),
(36, 1, 10, 'Dress', '2023-07-02', 85.50),
(37, 3, 3, 'Bustier', '2023-08-02', 54.00),
(38, 2, 2, 'Pant', '2023-04-02', 70.00),
(39, 1, 3, 'Camisole', '2023-09-10', 66.00),
(40, 9, 10, 'Skirt', '2023-01-31', 84.00),
(41, 1, 1, 'Skirt', '2023-02-28', 56.00),
(42, 2, 3, 'Blazer', '2023-06-03', 110.00),
(43, 4, 7, 'Camisole', '2023-01-12', 44.00),
(44, 5, 5, 'Skirt', '2023-05-11', 28.00),
(45, 4, 7, 'Shirt', '2023-01-12', 100.00),
(46, 3, 2, 'Pant', '2023-06-12', 70.00),
(47, 4, 7, 'Pant', '2023-06-04', 105.50),
(48, 3, 6, 'Skirt', '2023-04-12', 112.00),
(49, 1, 2, 'Camisole', '2023-11-11', 88.00),
(50, 7, 4, 'Camisole', '2023-12-10', 22.00);


-- Create SalesOrderDetail table
CREATE TABLE SalesOrderDetail (
	OrderDetailID INT PRIMARY KEY IDENTITY
	,SaleID INT
	,CustomerName VARCHAR(50) 
	,CustomerCity VARCHAR(50)
	,CustomerState VARCHAR(50)
	,ServiceProviderName VARCHAR(50)
	,ServiceProviderCity VARCHAR(50)
	,ServiceProviderState VARCHAR(50)
	,ProductName VARCHAR(50)      --ProductName first Part
	,ProductCategory VARCHAR(50)  --ProductName LastPart after _
    ,Quantity INT
	,PricePerUnit DECIMAL(8, 2) 	--This will come From ProductTable
	,TotalSales DECIMAL(19, 2) 
	);

INSERT INTO SalesOrderDetail 
(SaleID, CustomerName, CustomerCity, CustomerState, ServiceProviderName, ServiceProviderCity,
ServiceProviderState, ProductName, ProductCategory, Quantity, PricePerUnit, TotalSales)

SELECT S.SaleID, 
	   C.FirstName + ' ' + C.LastName,
	   SUBSTRING(A.[Address], CHARINDEX(',', A.[Address]) + 2, CHARINDEX(',', A.[Address], CHARINDEX(',', A.[Address]) + 1) - CHARINDEX(',', A.[Address]) - 2),
	   SUBSTRING(A.[Address], CHARINDEX(',', A.[Address], CHARINDEX(',', A.[Address]) + 1) + 2, LEN(A.[Address])),
	   Su.SupplierName,
	   SUBSTRING(A1.[Address], CHARINDEX(',', A1.[Address]) + 2, CHARINDEX(',', A1.[Address], CHARINDEX(',', A1.[Address]) + 1) - CHARINDEX(',', A1.[Address]) - 2),
	   SUBSTRING(A1.[Address], CHARINDEX(',', A1.[Address], CHARINDEX(',', A1.[Address]) + 1) + 2, LEN(A1.[Address])),
	   SUBSTRING([PName], 1, CHARINDEX('_', [PName]) - 1),
	   SUBSTRING([PName], CHARINDEX('_', [PName]) + 1, LEN([PName])),
	   S.TotalAmount / P.Price,
	   P.Price,
	   S.TotalAmount	   
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
JOIN Suppliers Su ON S.SupplierID = SUBSTRING(Su.[SupplierID],5,2)
JOIN Product P ON S.ProductID = SUBSTRING(P.[PName], 1, CHARINDEX('_', P.[PName]) - 1)
JOIN Address A ON S.CustomerID = A.CustomerID
JOIN Address A1 ON SUBSTRING(Su.[SupplierID],5,2) = A1.SupplierID


-- Create SalesReports
CREATE TABLE SalesReports (
	 [Year] INT
	,[Month] INT
	,[ProductCategory] VARCHAR(50)
	,[Top1Customer] VARCHAR(50) --who bought the maximum , only those customers they have @gmail or @outlook emails
	,[Top1Supplier] VARCHAR(50) --who's product is sold the max 
	,[TotalSales] DECIMAL(19, 2)
	,TotalRunningSales DECIMAL (19, 2)
	);
 
INSERT INTO SalesReports
(Year, Month, ProductCategory, Top1Customer, Top1Supplier, TotalSales, TotalRunningSales)

SELECT HC.Year, HC.Month,
	   HCAT.ProductCategory,
	   HC.CustomerName,
	   HS.ServiceProviderName,
	   TTL.MonthlyTotal,
	   TTL.CumulativeSalesAmt
FROM [dbo].[highestcustomer] AS HC
	JOIN [dbo].[highestcategory] AS HCAT ON HC.Year = HCAT.Year AND HC.Month = HCAT.Month
	JOIN [dbo].[highestsupplier] AS HS ON HC.Year = HS.Year AND HC.Month = HS.Month
	JOIN [dbo].[ttlrunsales] AS TTL ON HC.Year = TTL.Year AND HC.Month = TTL.Month
	