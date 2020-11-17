-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT  ProductName,
        CategoryName 
FROM    Products 
JOIN    Categories 
ON Products.CategoryID = Categories.CategoryID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT  OrderID, 
        ShipperName,
        OrderDate
FROM    Orders
JOIN    Shippers 
ON Shippers.ShipperID = Orders.ShipperID
WHERE Orders.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT  ProductName,
        Quantity
FROM    OrderDetails
JOIN    Products
ON OrderDetails.ProductID = Products.ProductID
WHERE OrderID = 10251;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT  OrderID,
        CustomerName,
        LastName AS "Employee Last Name"
FROM    Orders 
JOIN    Customers, Employees
ON      Orders.CustomerID = Customers.CustomerID
AND     Orders.EmployeeID = Employees.EmployeeID

--STRETCH--

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.

SELECT  Categories.CategoryName AS "Category",
        COUNT(*) AS "Number of products" 
FROM    Products
JOIN    Categories
ON      Products.CategoryID = Categories.CategoryID
GROUP BY    Products.CategoryID

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT  DISTINCT OrderID,
        SUM(Quantity)
FROM    OrderDetails
GROUP BY OrderID

