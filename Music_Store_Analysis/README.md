# SQL Music Store Analysis

## Overview
This project involves analyzing a music store database using PostgreSQL. The database contains 11 tables, including information about artists, albums, tracks, genres, customers, invoices, and employees. Through this project, I aim to extract meaningful insights from the data to understand customer preferences, identify top-selling products, and evaluate sales performance.

We can answer many questions from the data such as 
1. Most popular music Genre for each country?
2. How much amount spent by each customer on artists?
3. What is the best genre and artist with most songs in that genre?
4. How much money customers are spending on music?
5. Which country spends the most amount on music?
   

![Database Schema](https://github.com/arunnandam/SQL/blob/main/Music_Store_Analysis/images/MusicDatabaseSchema.png)) 

## Database Schema
Here is the detailed information about each table.

![Data](https://github.com/arunnandam/SQL/blob/main/Music_Store_Analysis/images/data_info.png)

## Project Structure
- `sql_scripts/`: Contains all SQL queries used in the analysis.
- `data/`: Contains data of all tables.
- `images/`: Contains images like the database schema.

## Key Insights:
1. Top customers are spending an average of $85 on music whereas the Czech Republic is spending more on music with $144 and Denmark customers are spending less at $37
2. The best-selling genre in all countries is Rock except Argentina. It sells more Alternative and Punk genres.
3. Customers are spending more on Artist Queen
4. Rock is the best genre and Led Zeppelin is the artist with the most number of Rock songs.
5. The USA has the most number of sales.

## Recommendations
1. Spending Patterns
   - Implementing target campaigns in Denmark and other countries with fewer sales. Also offering promotions and discounts on the music can help to improve sales.
2. Artistic Dominance
   - Enhancing the visibility of the best music like Rock with the artist by creating concerts, and offering combined discounts on multiple genres will improve sales. 

   
## How to Use
1. Clone the repository.
2. Run the SQL scripts in `sql_scripts/` in a PostgreSQL environment.
3. Review the output in the `reports/` directory.

## Contact for collaboration and modifications
- [Email](mailto:naarku30@gmail.com)
- [LinkedIn](https://linkedin.com/in/arunkumar-nandam)
