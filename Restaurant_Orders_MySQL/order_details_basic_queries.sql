USE restaurant_db;

-- 1. View the order_details table
SELECT * FROM order_details;

-- 2. No of records in order_details
SELECT COUNT(*) FROM order_details;

-- 3. What is the date range of the table?
select MIN(order_date) as min_date, MAX(order_date) as max_date FROM order_details;

-- 4.How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) FROM order_details;

-- 5. How many items were ordered within this date range?
SELECT COUNT(*) FROM order_details;

-- 6. Which orders had the most number of items?
SELECT order_id, count(item_id) AS count
FROM order_details
GROUP BY order_id
ORDER BY count DESC;

-- How many orders had more than 12 items?
SELECT count(*) FROM (SELECT order_id, count(item_id) AS count
FROM order_details
GROUP BY order_id 
HAVING(count)>12) AS num_orders;