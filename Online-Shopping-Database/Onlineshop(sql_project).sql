CREATE DATABASE OnlineshopDB1;
USE OnlineshopDB1;

CREATE TABLE Products(Product_ID INT PRIMARY KEY,Name VARCHAR(255),Price INT,Stock INT,Category VARCHAR(255));
CREATE TABLE Customers(Customer_ID INT PRIMARY KEY,Name VARCHAR(255),Email VARCHAR(255),Phone_number VARCHAR(15));
CREATE TABLE Orders(Order_ID INT PRIMARY KEY,Customer_ID INT,FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),Order_date DATE DEFAULT(CURRENT_DATE),Total_amount INT);
CREATE TABLE Orderdetails(Orderdetail_ID INT PRIMARY KEY,Order_ID INT,FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID),Product_ID INT,FOREIGN KEY(Product_ID) REFERENCES Products(Product_ID),Quantity INT);

USE OnlineshopDB1;

INSERT INTO Products(Product_ID,Name,Price,Stock,Category) VALUES (1, 'Laptop', 55000, 20, 'Electronics'),
(2, 'Smartphone', 25000, 50, 'Electronics'),
(3, 'Headphones', 1500, 100, 'Accessories'),
(4, 'Office Chair', 4500, 30, 'Furniture'),
(5, 'Desk Lamp', 1200, 60, 'Furniture'),
(6, 'Running Shoes', 3200, 40, 'Footwear'),
(7, 'Backpack', 1800, 70, 'Bags'),
(8, 'Water Bottle', 500, 150, 'Kitchen'),
(9, 'Notebook', 200, 300, 'Stationery'),
(10, 'Wireless Mouse', 900, 80, 'Accessories');

INSERT INTO Customers(Customer_ID,Name,Email,Phone_number) VALUES (1, 'Amit Sharma', 'amit.sharma@gmail.com', '9876543210'),
(2, 'Priya Verma', 'priya.verma@gmail.com', '9123456789'),
(3, 'Rahul Mehta', 'rahul.mehta@gmail.com', '9988776655'),
(4, 'Neha Singh', 'neha.singh@gmail.com', '9012345678'),
(5, 'Arjun Patel', 'arjun.patel@gmail.com', '9090909090'),
(6, 'Sneha Iyer', 'sneha.iyer@gmail.com', '9345678123'),
(7, 'Vikram Rao', 'vikram.rao@gmail.com', '9567812345'),
(8, 'Kavya Nair', 'kavya.nair@gmail.com', '9786541230'),
(9, 'Rohit Gupta', 'rohit.gupta@gmail.com', '9654321870'),
(10, 'Ananya Das', 'ananya.das@gmail.com', '9876123456');

INSERT INTO Orders(Order_ID,Customer_ID,Order_date,Total_amount) VALUES (101, 1, '2024-01-05', 2500.00),
(102, 2, '2025-11-16', 1800.50),
(103, 3, '2025-11-17', 3200.75),
(104, 4, '2025-11-19', 1500.00),
(105, 5, '2025-11-25', 4100.25),
(106, 6, '2025-11-29', 2750.00),
(107, 7, '2025-12-01', 1999.99),
(108, 8, '2025-12-05', 3600.00),
(109, 9, '2025-12-07', 2250.50),
(110, 10, '2025-12-15', 4890.00);

INSERT INTO Orderdetails(Orderdetail_ID,Order_ID,Product_ID,Quantity) VALUES (1, 101, 1, 2),
(2, 101, 3, 1),
(3, 102, 2, 4),
(4, 103, 5, 2),
(5, 104, 4, 3),
(6, 105, 6, 1),
(7, 106, 7, 5),
(8, 107, 8, 2),
(9, 108, 9, 1),
(10, 110, 10, 3);

SELECT Order_ID,Customer_ID,Order_date,Total_amount FROM Orders WHERE Order_date>CURRENT_DATE-INTERVAL 30 DAY;

SELECT p.Product_ID,p.Name,od.Quantity FROM Products AS p JOIN Orderdetails AS od ON p.Product_ID=od.Product_ID ORDER BY Quantity DESC Limit 5;

SELECT SUM(Total_amount) AS Total_sales_revenue FROM Orders;