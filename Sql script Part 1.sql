# Query 1

select *                       -- selects all the columns 
 from customers                -- from customers table
 where customer_id=1           -- filters the records using where condition and returns result for customer_id=1
 order by first_name;          -- sorts the result in ascending order based on first_name
 
 
# Query 2 
  
select last_name,first_name,points, points+10   -- Returns last_name,first_name,points and  
                                             -- an additional column points+10 which is extracted by adding 10 to points column
from customers;                               -- from customers table

# Task 1
# Query 1 - Using the Query 2 you created change the points to reads times by 10 and plus 100.
		   -- Record your results in your word document 

select last_name,first_name,points,       -- selects last_name,first_name,points and
  (points*10)+100                         -- an additional column created by multiplying points column with 10 and adding 100 to it																					
from customers;                            -- returns resultset from customer table

# Query 2 -Change the Query 2 code to create a discount factor so the table now shows a 
		  -- discount header and changing the (point + 10) *100

select last_name,first_name,points,       -- selects last_name,first_name,points and
  (points+10)*100 as discount_factor      -- an additional column discount_factor is created by using an alias based on adding 
										  -- 10 to points column and then multiplying it by 100
from customers;                            -- returns resultset from customer table

#Task 2 - Write a SQL query to return all the products in our database in the result set. I want you to show columns; 
		-- name, unit price, and new column called new price which is based on this expression, (unit price * 1.1 ).
     --  So what you are doing is increasing the product price of each by 10%. 
     -- So with the query we want all the products the original price and the new  price.  

select name,unit_price,             -- selects name,unit_price and
unit_price*1.1 as new_price         -- creates a new colunm new_price as alias based on unit_price by
									-- increasing the unit_price by 10% , i.e unitprice*1.1
from products;                      -- from products table

#Task 3 - In this task create a new query to find all the customers with a birth date of > '1990-01-01'

select * from customers             -- Selects all the customers from CUSTOMERS table
where birth_date>'1990-01-01'       -- where Date of birth is greater than 1990-01-01


# Task 4 - Write a query to find out the name of the product with most amount in stock.
USE sql_inventory;   -- selects sql_inventory database

select name,product_id,                           -- selects column names name,product_id
(quantity_in_stock*unit_price) as most_amt_in_stock  -- and creates an additional column most_amt_in_stock to find the most amount
                                                   -- related to stock by using alias based by multiplying quantity_in_stock and unit_price
from products                                      -- selects from products table
where unit_price=(select max(unit_price)        -- filtering the values based on maximum unit price using 
                                                -- where condition by writing subquery
from products);                                  -- from products table


# Task 5 - Write a query to find out the name of the most expensive product.

USE sql_inventory;

select  product_id, max(quantity_in_stock), name  -- selects product_id, quantity_in_stock, name columns and 
                                                  -- returns maximum of quantity_in_stock
from products                                      -- from products table 
group by product_id                                -- sorts and groups the results based on product_id
limit 1;                                           -- limits the number of columns to 1


# Task 6 - Write a query to find out the first name, last name, address and the birthdate of the oldest customer.

USE sql_store;

select first_name,last_name,address,birth_date  -- selects columns firstname,lastname,address and birthdate
from customers                                   -- from customers table
where birth_date=(select min(birth_date)         -- filters the results based on where condition using min() function on birth_date
                                                 -- to return the oldest customer birth_date
from customers);                                  -- from customers table