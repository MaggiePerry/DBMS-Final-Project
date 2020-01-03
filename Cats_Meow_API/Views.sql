/* Selects cats_meow_pet_store database */
USE cats_meow_pet_store;

/* Creates user with access to the database */
CREATE USER 'phpApp'@'localhost' IDENTIFIED BY 'pwd123';
GRANT SELECT ON * . * TO 'phpApp'@'localhost';

/* View that gathers an orders ID, dilivery status, and data of order */
CREATE VIEW Order_Status_and_Date
AS 
SELECT OrderID AS ID, Description AS Status, OrderDate as Date
  FROM orders o
  JOIN order_state s ON o.OrderStatus = s.OrderStatus
ORDER BY o.OrderID;

/* View that gathers customer ID, first name, and last name */
CREATE VIEW Customer_Names
AS 
SELECT CustomerID AS ID, FirstName, LastName
  FROM customer c
ORDER BY c.CustomerID;