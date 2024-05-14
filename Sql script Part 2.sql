#Task 1 - Using count, get the number of cities in the USA

select count(name) as no_of_cities,countrycode from city  -- using count() function on name to find the count of number of cities
                                                           -- and providing an alias to it as no_of_cities and selecting column countrycode
														    -- from city table
where countrycode="USA";                                    -- filtering the resultset using where condtion 
                                                            -- by giving country country as USA
	
# Task2 - Find out what the population and average life expectancy for people in Argentina (ARG) is.
select sum(population) as ARG_population, avg(population) as life_expectancy  -- selects population column and uses aggregate 
								 -- function sum() and avg() to it to find sum and average of population and creating an aliases for them
 from city                              -- from city table
where countrycode="ARG";                -- using where condition to filter records based on country code Argentina

    
# Task3 - Using ORDER BY, LIMIT, what country has the highest life expectancy
select countrycode, population from city  -- selects countrycode and population columns from city
order by population desc                   -- using order by to sort the result by population in the descending order 
limit 1;                                    -- limits the no.of rows to 1

#Task4 - Select 25 cities around the world that start with the letter 'F' in a single SQL query.
select name, countrycode        -- selects name and country code 
 from city                       -- from city table
 where name like 'F%'             -- filters the result using where condition by name that starts with letter F
limit 25;                         -- limits the no.of rows to 25

#Task5 - Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
select ID, Name,population  -- selects columns ID, name, population
from city                   -- from city table
limit 10;                   -- limits the number of rows to 10

#Task6 - Create a SQL statement to find only those cities from city table whose population is larger than 2000000
select name,population      -- selects column names name and population
from city                   -- from city table
where population>2000000;    -- filter records based on where condition whose population is greater than 2000000

#Task7 - Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
Select * from city          -- selects all columns from city table
where name like 'Be%';       -- filters records based on where condition whose city name begins with 'Be'

#Task8 - Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
select name, population                       -- selects name and population columns
from city                                     -- from city table
where population between 500000 and 1000000;   -- using where condtion to filter records based on population
                                               --  by using between operation to find values in the range 500000 to 1000000
                                               
#Task9 - Create a SQL statement to find a city with the lowest population in the city table
select * from city                             -- selects all columns from city table						
where population=(select min(population)         -- filters the records using where condition and writing a subquery 
                                                 -- to find lowest population using min() function  
from city);                                   -- from customers table

#Task10 - Create a SQL statement to display all cities from the 'city' table sorted by Name in ascending order.
select * from city         -- selects all the columns from city table
order by name asc;         -- order by sorts the results in ascending order of city name as we have 
						   -- mentioned asc to sort the results in ascending order
                           
#Task 11 - Create a SQL statement to find a country with the largest population in the country table.
select name, population                  -- selects name and population column
from country                               -- from country table
where population=(select max(population)   -- using where condition to filter records based on max() function by writing 
                                           -- a subquery on population column to find maximum population
from country);                             -- from country table

