CREATE DATABASE retail_store;
USE retail_store;

-- Table 1: Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Table 2: Inventory
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    quantity_in_stock INT,
    last_updated DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table 3: Sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    store_location VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


select * from inventory;
select * from products;
select * from sales;

-- Total Sales by Category
Select p.category, SUM(p.price * s.quantity_sold) As total_sales_amount
from sales as s
left join products as p
on p.product_id = s.product_id
GROUP BY p.category
ORDER BY total_sales_amount DESC;


-- Top 5 Selling Products
SELECT p.product_name,
SUM(s.quantity_sold) As Total_sold,
SUM(p.price * s.quantity_sold) As total_sales_amount
from products as p
LEFT JOIN sales as s
on s.product_id = p.product_id 
GROUP BY p.product_name
order by Total_sold DESC
LIMIT 5;


-- Sales Trend by Date
SELECT s.sale_date, SUM(s.quantity_sold * p.price) As Trend
from sales as s
LEFT JOIN products as p
ON p.product_id = s.product_id
GROUP BY s.sale_date
ORDER BY s.sale_date;


-- Daily Units Sold Summary
SELECT sale_date,
SUM(quantity_sold) AS total_units_sold
FROM sales
GROUP BY sale_date
ORDER BY sale_date;


-- Low Stock Products (Stock < 35)
SELECT p.product_name, i.quantity_in_stock
FROM inventory as i
JOIN products as p 
ON i.product_id = p.product_id
WHERE i.quantity_in_stock < 35
ORDER BY i.quantity_in_stock ASC;


-- Total Revenue and Units Sold
SELECT 
    SUM(s.quantity_sold * p.price) AS total_revenue,
    SUM(s.quantity_sold) AS total_units_sold
FROM sales as s
JOIN products p 
ON s.product_id = p.product_id;


-- Top 3 Locations by Revenue
SELECT s.store_location as location,
SUM(s.quantity_sold * p.price) AS location_revenue
FROM sales as s
JOIN products as p 
ON s.product_id = p.product_id
GROUP BY store_location
ORDER BY location_revenue DESC
limit 3;


-- Most Sold Category
SELECT p.category,
SUM(s.quantity_sold) AS total_sold
FROM sales as s
JOIN products as p 
ON s.product_id = p.product_id
GROUP BY category
ORDER BY total_sold DESC
LIMIT 1;


-- Latest Inventory Update
SELECT MAX(last_updated) AS last_inventory_update
FROM inventory;


-- Running Total of Revenue by Date
SELECT sale_date,
SUM(s.quantity_sold * p.price) AS daily_revenue,
SUM(SUM(s.quantity_sold * p.price)) OVER (ORDER BY sale_date) AS running_total
FROM sales as s
JOIN products as p 
ON s.product_id = p.product_id
GROUP BY sale_date
ORDER BY sale_date;


-- Rank Products by Sales within Each Category
SELECT p.category, p.product_name,
SUM(s.quantity_sold) AS total_units_sold,
RANK() OVER (PARTITION BY p.category ORDER BY SUM(s.quantity_sold) DESC) AS category_rank
FROM sales as s
JOIN products as p 
ON s.product_id = p.product_id
GROUP BY p.category, p.product_name;


-- Average Sale Value per Transaction
SELECT 
AVG(s.quantity_sold * p.price) AS avg_order_value
FROM sales s
JOIN products p 
ON s.product_id = p.product_id;


-- Store Location Revenue Percent Share
SELECT 
store_location,
ROUND(SUM(s.quantity_sold * p.price), 2) AS location_revenue,
ROUND(SUM(s.quantity_sold * p.price) * 100 / SUM(SUM(s.quantity_sold * p.price)) OVER (), 2) AS percent_share
FROM sales as s
JOIN products p 
ON s.product_id = p.product_id
GROUP BY store_location
ORDER BY percent_share DESC;










