--This query checks if a last name begins with Mc

SELECT FirstName, LastName
FROM Customers
WHERE LastName LIKE 'Mc%';

--Ater the purchases, this query checks the remaining stock amount at the Coffee Shop 

SELECT  Products.ProductID, ProductName, SUM( Stock - Quantity) AS InStockAmount
FROM Products
  JOIN OrderItems
     ON Products.ProductID = OrderItems.ProductID
GROUP BY Products.ProductID, ProductName;

	 

--This query checks the total amount paid by each customer that is greater than $22. 

SELECT FirstName, LastName,SUM( ( Quantity * (ItemPrice - (ItemPrice * DiscountAmount))) * (1+ TaxAmount) )  AS TotalPrice  
FROM Customers
   JOIN Orders
      ON Customers.CustomerID = Orders.CustomerID
   JOIN OrderItems
       ON Orders.OrderID = OrderItems.OrderID 
	   GROUP BY FirstName, LastName
	   HAVING SUM( (ItemPrice * Quantity) * (1+ TaxAmount)) >22
	   ORDER BY FirstName;

-- This query orders the quantity (items solds) in descending order 

SELECT ProductName, Quantity AS BestSeller
FROM OrderItems
   JOIN Products 
   ON OrderItems.ProductID = Products.ProductID
   ORDER BY Quantity DESC;
go

--This query shows customer purchases details and orders the table by quantity in descending order

SELECT  Customers.CustomerID, Orders.OrderID, ProductID, FirstName, LastName, Quantity
FROM Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN OrderItems ON OrderItems.OrderID = Orders.OrderID
  ORDER BY Quantity DESC;

  go

 --cThis query calculates the total number of items brought by the customer

SELECT FirstName, LastName, SUM(Quantity) AS TotalItems 
FROM Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN OrderItems ON OrderItems.OrderID = Orders.OrderID
 GROUP BY FirstName, LastName
 ORDER BY SUM(Quantity) DESC;


  go 

	   
--This function calculates the sale price of an item.

alter FUNCTION GetProductDiscount
          (@ItemPrice money,
           @DiscountAmount float)
           RETURNS money


BEGIN
     RETURN  (@ItemPrice-(@ItemPrice * @DiscountAmount));
END;



--This query checks each product's sale price

SELECT ProductName, DiscountAmount, dbo.GetProductDiscount(ItemPrice, DiscountAmount) AS ProductDiscounted
FROM Products
  JOIN OrderItems
    ON Products.ProductID = OrderItems.ProductID 
ORDER BY ProductDiscounted ASC;
	   


