1. Who is the senior most employee based on job title?

SELECT *, AGE(CURRENT_DATE, hire_date) as experience FROM employee
ORDER BY experience desc LIMIT 1;

' This can be solved by HireDate and levels column. But hire date gives the exact information'

2. Which countries have the most Invoices?

SELECT billing_country, count(*) as count FROM invoice
GROUP BY billing_country
ORDER BY count desc;

'USA has the most number of invoices'

3. What are top 3 values of total invoice? 

SELECT DISTINCT total FROM invoice
ORDER BY total DESC LIMIT 3;

4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that  has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

SELECT billing_city, ROUND(sum(total)::NUMERIC, 2) as totals FROM invoice
GROUP BY billing_city
ORDER BY 2 desc;

5. Who is the best customer? The customer who has spent the most money will be  declared the best customer. 
Write a query that returns the person who has spent the most money

SELECT b.customer_id, CONCAT(TRIM(b.first_name), ' ',TRIM(b.last_name)) as name, sum(total) as money_spent FROM invoice a
INNER JOIN customer b
ON a.customer_id = b.customer_id
GROUP BY b.customer_id
ORDER BY money_spent desc LIMIT 1;

'R Madhav has spent the most money'

6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A.

'We can do it by complete joins or we can use subquery'

SELECT distinct e.first_name, e.last_name, e.email
FROM Track a 
INNER JOIN Genre b ON (a.genre_id = b.genre_id)
INNER JOIN invoice_line c ON (a.track_id = c.track_id)
INNER JOIN invoice d ON (c.invoice_id = d.invoice_id)
INNER JOIN customer e ON (d.customer_id = e.customer_id)
WHERE b.name = 'Rock'
ORDER BY e.email;

'We can say every customer listens to the Rock music'

7. Getting the artists who have written the most rock music in our dataset.

SELECT a.artist_id, a.name, count(c.track_id) as tracks FROM track c
INNER JOIN genre d ON c.genre_id = d.genre_id
INNER JOIN Album b ON c.album_id = b.album_id
INNER JOIN Artist a ON b.artist_id = a.artist_id
WHERE d.name LIKE 'Rock'
GROUP BY a.name, a.artist_id
ORDER BY tracks desc
LIMIT 10;

'Led Zeppelin is the artist with most number of Rock songs'

8. Return all the track names that have a song length longer than the average song length. 

SELECT * FROM track;

SELECT name, milliseconds 
FROM track
WHERE milliseconds > (SELECT avg(milliseconds) FROM track)
ORDER BY milliseconds desc;

'There are 494 tracks that are longer than the average song length'

9. Find how much amount spent by each customer on artists?

SELECT a.customer_id, a.first_name, a.last_name, f.name, sum(c.unit_price*c.quantity) as total_spending
FROM customer a
INNER JOIN Invoice b ON a.customer_id = b.customer_id
INNER JOIN invoice_line c ON b.invoice_id = c.invoice_id
INNER JOIN Track d on c.track_id = d.track_id
INNER JOIN Album e ON d.album_id = e.album_id
INNER JOIN Artist f ON e.artist_id = f.artist_id
GROUP BY 1,2,3,4
ORDER BY total_spending desc;

'Based on further analysis, it seems visible that customers are spending more on Artist Queen'

10. We want to find out the most popular music Genre for each country.

with total_purchases as (SELECT b.billing_country, d.name, count(*) as genre,
	ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY COUNT(*) DESC) AS rn
FROM invoice_line a
INNER JOIN invoice b ON a.invoice_id = b.invoice_id
INNER JOIN Track c ON a.track_id = c.track_id
INNER JOIN Genre d ON c.genre_id = d.genre_id
GROUP BY b.billing_country, d.name
ORDER BY 3 desc)

SELECT * FROM total_purchases where rn=1;

'Based on the analysis, we can conclude the best selling genre in all countires is Rock expect Argentina. Its selling more of Alternative and Punk'

11. Write a query that determines the customer that has spent the most on music for each 
country. Write a query that returns the country along with the top customer and how 
much they spent. For countries where the top amount spent is shared, provide all 
customers who spent this amount 

With top_customers as (SELECT a.first_name, a.last_name, a.country, sum(b.total) as money_spent,
	ROW_NUMBER() OVER(PARTITION BY a.country ORDER BY sum(b.total) desc) as rn
FROM customer a
INNER JOIN invoice b ON a.customer_id = b.customer_id
GROUP BY 1,2,3)

select * from top_customers where rn=1;

'Top customers are spending on an average of $85 in music where as Czech republic is spending more in music with $144 and denmark customers are spending less with $37'