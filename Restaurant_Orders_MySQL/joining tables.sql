USE restaurant_db;

-- 1. Combine the menu_items and order_details tab tes into a single table.
SELECT *
FROM order_details a
LEFT OUTER JOIN menu_items b
ON a.item_id = b.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?
with combined_table as (SELECT *
FROM menu_items a
INNER JOIN order_details b
ON a.menu_item_id = b.item_id)

(SELECT category, item_id, COUNT(*) as count
FROM combined_table
GROUP BY category, item_id
ORDER BY count LIMIT 1)
UNION
(SELECT category, item_id, COUNT(*) as count
FROM combined_table
GROUP BY category, item_id
ORDER BY count DESC LIMIT 1);


-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) as total
FROM order_details a
LEFT OUTER JOIN menu_items b
ON a.item_id = b.menu_item_id
GROUP BY order_id 
ORDER BY total DESC 
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(*)
FROM order_details a
LEFT OUTER JOIN menu_items b
ON a.item_id = b.menu_item_id
WHERE a.order_id = 440
GROUP BY category;

-- 5. Vieu the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT category, COUNT(*)
FROM order_details a
LEFT OUTER JOIN menu_items b
ON a.item_id = b.menu_item_id
WHERE a.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category;

-- Among the highest spent orders, the italian food is order more among them.