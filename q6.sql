-- Creating a database mydatabase
CREATE DATABASE IF NOT EXISTS mydatabase;

-- Create the inventory table
CREATE TABLE IF NOT EXISTS mydatabase.inventory (
    product_id INT,
    warehouse_id INT,
    date_ DATE,
    quantity INT
);

-- Insert 20 sample records into the inventory table
INSERT INTO mydatabase.inventory (product_id, warehouse_id, date_, quantity)
VALUES
    (1, 1, '2023-08-01', 100),
    (1, 1, '2023-08-02', 150),
    (1, 2, '2023-08-01', 75),
    (1, 2, '2023-08-03', 120),
    (2, 1, '2023-08-01', 200),
    (2, 1, '2023-08-02', 180),
    (2, 2, '2023-08-01', 90),
    (2, 2, '2023-08-03', 80),
    (3, 1, '2023-08-02', 50),
    (3, 2, '2023-08-01', 30),
    (3, 2, '2023-08-02', 40),
    (4, 1, '2023-08-01', 220),
    (4, 1, '2023-08-03', 250),
    (4, 2, '2023-08-01', 130),
    (4, 2, '2023-08-03', 140),
    (5, 1, '2023-08-01', 70),
    (5, 1, '2023-08-02', 85),
    (5, 2, '2023-08-02', 60),
    (5, 2, '2023-08-03', 75);

-- To find the total quantity of each product in each warehouse for the latest available date
SELECT
    product_id,
    warehouse_id,
    MAX(date_) AS latest_date,
    SUM(quantity) AS total_quantity
FROM
    mydatabase.inventory
GROUP BY
    product_id, warehouse_id;
