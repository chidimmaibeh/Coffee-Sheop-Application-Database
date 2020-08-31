--AddressList View 

--this is a view of the address 
--this view would be useful for an analyst and marketing team

CREATE VIEW [dbo].[AddressLIst]
AS 
SELECT Address, City,State, ZipCode 
FROM Addresses;



--CustomerList View

--this is a view of the customer and their personal information. The customer and address tables are joined. 
--this information would be useful for a support and marketing staff

CREATE VIEW [dbo].[CustomerList]
AS
SELECT CustomerID, Customers.AddressID, FirstName,LastName, Addresses.Address, Addresses.State, Addresses.City, Addresses.ZipCode
FROM Customers INNER JOIN Addresses  
ON Customers.AddressID = Addresses.AddressID;


--OrderItemList View

-- a view of the total amount of items sold
-- this information would be useful to the business owner

CREATE VIEW [dbo].[OrderItemList]
AS
SELECT ItemID, OrderID
FROM OrderItems; 

--OrderList View

--this view would be useful to the store manager
--this is a view of the orders

CREATE VIEW [dbo].[OrderList]
AS 
SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, OrderItems.ItemID, OrderItems.ProductID, ItemPrice, DiscountAmount, Quantity
FROM Orders INNER JOIN OrderItems 
ON Orders.OrderID = OrderItems.OrderID;


--ProductList View

--this inormation would be useful to the stoe manager and warehouse staff 
--this view gives an overview of all the products. 

CREATE View [dbo].[ProductLIst] 
AS 
SELECT ProductName, ProductDescription 
FROM Products; 