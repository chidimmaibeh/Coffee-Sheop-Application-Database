USE CoffeeShop


SET IDENTITY_INSERT Addresses on -- you must 

INSERT INTO Addresses
      ( AddressID, Address, State, City, ZipCode)

VALUES
   (101, '34 Greenroad Ave', 'TX', 'Redwood', '05678'),
   (102, '45 Broadway Ave', 'NJ', 'Clark', '74532'),
   (103, '1000 James Street', 'NC', 'Harrisville', '54321'),
   (104, '67 Bricks Street', 'VA', 'South Park', '56739'),
   (105, '97 North Gibbs', 'CA', 'Caton', '34567')

SET IDENTITY_INSERT Addresses OFF



SET IDENTITY_INSERT Customers ON

INSERT INTO Customers
      ( CustomerID, AddressID, FirstName, LastName, Address, Phone, City, State, ZipCode)

VALUES
   ( 301, 101, 'James', 'McWade' , '34 Greenroad Ave', '345-444-2186' ,'Redwood' ,'TX', '05678'),
   (302, 102, 'Jennifer', 'Williams', '45 Broadway Ave', ' 708-456-4567', 'Clark', 'NJ', '74532'),
   (303, 103, 'Sara', 'Greene', '1000 James Street', '667-344-0001', 'Harrisville', 'NC', '54321'),
   (304, 104, 'Lisa', 'Jackson', '67 Bricks Street', '814-939-2662', 'South Park', 'VA', '56739'),
   (305, 105, 'Shawn', 'Robbins', '97 North Gibbs', ' 973-777-7788', 'Caton', 'CA', '34567') 

SET IDENTITY_INSERT Customers OFF






SET IDENTITY_INSERT Products ON 


INSERT INTO Products
      (ProductID, ProductName,ProductDescription, ProductPrice, DateAdded,Stock)

VALUES
   (432, 'Small Coffee', '6oz hot coffee', 1.05, '01/22/2019', '300'), 
   (433, 'Medium Coffee', '8 oz hot coffee', 1.50, '01/25/2019','500'),
   (434, 'Carrot Cake', 'Rich Cream Cheese frosting carrot based cake batter', 4.75, '01/25/2019', '80'),
   (435, 'Plain Bagel', '', 1.25, '01/22/19', '100' ),
   (436, 'Bacon', '4 strips of bacon', 1.75, '01/22/19', '100'),
   (437, 'Scramble Eggs' ,'', 1.10, '01/25/2019', '150')

   
SET IDENTITY_INSERT Products OFF



SET IDENTITY_INSERT Orders ON 


INSERT INTO Orders
      (OrderID, CustomerID, Orderdate, CardType, CardNumber)

VALUES
   (751,  301, '04/05/2019','Visa', '4567-3345-4565-4566'),
   (752, 302, '04/06/2019', 'Master', '6756-2345-4675-6788'),
   (753, 303, '04/11/2019', 'Visa', '0773-2345-4005-3902'),
   (754, 304, '04/12/2019', 'Visa', ' 6443-9213-4448-3211'), 
   (755, 305, '04/23/2019', 'American Express', '3775-5455-3002-1004')

SET IDENTITY_INSERT Orders OFF



SET IDENTITY_INSERT OrderItems ON 


INSERT INTO OrderItems
      (ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity, TaxAmount)

VALUES
   (1, 751, 432, 1.05, 0.10,5, 0.375 ),
   (2, 752, 434, 4.75, 0.10,2,  0.375),
   (3,752, 433, 1.50, 0.10, 2, 0.549),
   (4, 751, 437, 1.10, 0.10, 5, 0.375),
   (5, 752, 435, 1.25, 0.10, 2, 0.549), 
   (6, 753, 433, 1.50, 0.20,20, 0.315),
   (7, 753, 437, 1.10, 0.20, 40, 0.315),
   (8, 753, 436, 1.75, 0.20, 40, 0.315)
    


SET IDENTITY_INSERT OrderItems OFF