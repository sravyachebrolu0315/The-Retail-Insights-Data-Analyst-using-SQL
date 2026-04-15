-- SCHEMA CREATION
-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    stock_count INT,
    expiry_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Sales Transactions Table
CREATE TABLE SalesTransactions (
    transaction_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- INSERTING DATA INTO THE TABLES
-- Categories
INSERT INTO Categories VALUES
(1, 'Dairy'),
(2, 'Snacks'),
(3, 'Beverages');

-- Products
INSERT INTO Products VALUES
(101, 'Milk', 1, 80, CURRENT_DATE + INTERVAL 5 DAY, 50.00),
(102, 'Cheese', 1, 30, CURRENT_DATE + INTERVAL 15 DAY, 120.00),
(103, 'Chips', 2, 100, CURRENT_DATE + INTERVAL 90 DAY, 20.00),
(104, 'Biscuits', 2, 60, CURRENT_DATE + INTERVAL 6 DAY, 25.00),
(105, 'Juice', 3, 40, CURRENT_DATE + INTERVAL 10 DAY, 60.00),
(106, 'Soda', 3, 70, CURRENT_DATE + INTERVAL 200 DAY, 40.00);

-- Sales Transactions
INSERT INTO SalesTransactions VALUES
(1, 101, 10, CURRENT_DATE - INTERVAL 3 DAY),
(2, 103, 20, CURRENT_DATE - INTERVAL 10 DAY),
(3, 104, 15, CURRENT_DATE - INTERVAL 40 DAY),
(4, 105, 5, CURRENT_DATE - INTERVAL 20 DAY);

-- Expiring Soon Report
SELECT 
    product_id,
    product_name,
    stock_count,
    expiry_date
FROM Products
WHERE expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL 7 DAY
AND stock_count > 50;

-- Dead Stock Analysis
SELECT p.product_id, p.product_name
FROM Products p
WHERE p.product_id NOT IN (
    SELECT DISTINCT product_id
    FROM SalesTransactions
    WHERE sale_date >= CURRENT_DATE - INTERVAL 60 DAY
);

-- Revenue Contribution by Category (Last Month)
SELECT 
    c.category_name,
    SUM(s.quantity * p.price) AS total_revenue
FROM SalesTransactions s
JOIN Products p ON s.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
WHERE s.sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
GROUP BY c.category_name
ORDER BY total_revenue DESC;
