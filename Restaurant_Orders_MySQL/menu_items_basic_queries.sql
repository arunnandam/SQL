USE restaurant_db;

-- 1. View the menu_items table?
SELECT * FROM menu_items;

-- 2. Find the number of items on menu?
SELECT COUNT(*) FROM menu_items;

-- 3. What are the least and most expensive items on menu?
(SELECT * FROM menu_items
ORDER BY PRICE LIMIT 1)
UNION
(SELECT * FROM menu_items
ORDER BY PRICE DESC LIMIT 1);

-- 4. How many Italin dishes are there?
SELECT COUNT(*) FROM menu_items 
WHERE category = "Italian";

-- 5. How many dishes in each category;
SELECT category, count(*) as count 
FROM menu_items
GROUP BY category;

-- 6. Average price of items in each category
SELECT category, AVG(price) as Average_Price
FROM menu_items
GROUP BY category;