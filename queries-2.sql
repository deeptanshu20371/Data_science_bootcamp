
-- create
CREATE TABLE CUSTOMERS (
    Customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    Address VARCHAR(255)
);
CREATE TABLE ITEMS (
    Item_id INT PRIMARY KEY,
    Item_name VARCHAR(100),
    price DECIMAL(10, 2),
    department VARCHAR(50)
);
CREATE TABLE SALES (
    Date DATE,
    Order_id INT,
    Item_id INT,
    Customer_id INT,
    Quantity INT,
    Revenue DECIMAL(10, 2),
    PRIMARY KEY (Order_id, Item_id),
    FOREIGN KEY (Item_id) REFERENCES ITEMS(Item_id),
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id)
);

-- insert
INSERT INTO CUSTOMERS (Customer_id, first_name, last_name, Address) VALUES
(1, 'John', 'Doe', '123 Main St, New York, NY'),
(2, 'Alice', 'Smith', '456 Maple Ave, Los Angeles, CA'),
(3, 'Bob', 'Johnson', '789 Oak St, Chicago, IL'),
(4, 'Jane', 'Doe', '321 Pine St, Miami, FL'),
(5, 'Charlie', 'Brown', '654 Cedar St, Boston, MA');

INSERT INTO ITEMS (Item_id, Item_name, price, department) VALUES
(101, 'Laptop', 1000.00, 'Electronics'),
(102, 'Headphones', 200.00, 'Electronics'),
(103, 'Coffee Maker', 80.00, 'Home Appliances'),
(104, 'Book', 15.00, 'Books'),
(105, 'T-shirt', 20.00, 'Apparel'),
(106, 'Smartphone', 800.00, 'Electronics'),
(107, 'Blender', 120.00, 'Home Appliances');

INSERT INTO SALES (Date, Order_id, Item_id, Customer_id, Quantity, Revenue) VALUES
('2023-03-18', 1001, 101, 1, 1, 1000.00),   -- Order by John Doe on March 18, 2023
('2023-03-18', 1002, 102, 1, 2, 400.00),    -- Another item by John Doe on the same date
('2023-01-15', 1003, 103, 2, 1, 80.00),     -- Order by Alice Smith in January
('2023-01-20', 1004, 104, 3, 3, 45.00),     -- Order by Bob Johnson in January
('2022-11-10', 1005, 105, 4, 5, 100.00),    -- Order in 2022, Apparel
('2022-12-25', 1006, 106, 5, 1, 800.00),    -- Order in 2022, Electronics
('2022-12-31', 1007, 107, 4, 1, 120.00),    -- Order in 2022, Home Appliances
('2023-02-05', 1008, 101, 2, 2, 2000.00);   -- Large order in February for revenue testing


-- fetch 
SELECT COUNT(DISTINCT SALES.Order_id) AS Orders_Completed_By_John_Doe
FROM SALES JOIN CUSTOMERS ON SALES.Customer_id = CUSTOMERS.Customer_id WHERE SALES.Date = '2023-03-18'
  AND CUSTOMERS.first_name = 'John'
  AND CUSTOMERS.last_name = 'Doe';