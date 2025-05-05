Question 1
-- Create normalized table
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(100)
);

-- Insert normalized rows
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

Question 2
-- Step 1: Create Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Step 2: Insert unique orders
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 3: Create OrderItems table
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert product details
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
