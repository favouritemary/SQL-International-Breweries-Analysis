--1. Write an SQL query to fetch “SALES_REP” from breweries table using the alias name as WORKER_NAME.--
SELECT sales_rep as Worker_Name 
FROM breweries;

--2. Write an SQL query to fetch “BRANDS” from breweries table in upper case.--
SELECT UPPER(brands) AS Brands
FROM breweries;

--3. Write an SQL query to print all details from the breweries table; sort the QUANTITY column in Ascending order and the COSTS column in Descending order--
SELECT *
FROM breweries
ORDER BY quantity ASC, costs DESC;

--4. Write an SQL query to print the profit made from two BRANDS, “trophy” and “eagle” in the first quarter of 2019--
SELECT brands, SUM(profit) as Total_profit
FROM breweries
WHERE brands IN ('trophy', 'eagle lager') 
AND Years=2019 
AND months IN ('January','February','March')
GROUP BY brands;

--5. Write a query that reduces the cost of the trophy brand by 2%--
SELECT SUM(costs-(costs*2/100)) as New_trophy_cost
FROM breweries
WHERE brands = 'trophy'
Group by brands;

--6. Which sales rep made the highest profit in Ghana in the year 2017?--
SELECT sales_rep, SUM(Profit)
FROM breweries
WHERE countries = 'Ghana' AND years = 2017
GROUP BY Sales_rep
ORDER BY SUM(Profit) DESC
LIMIT 1;
--Jardine made the highest profit in Ghana in 2017--

--7. What region recorded the lowest quantity of goods in the last quarter of every year?--
SELECT region, SUM(quantity) AS Quantity
FROM breweries
WHERE months IN ('October', 'November', 'December') AND Years in (2017, 2018,2019)
GROUP BY 1
ORDER BY 2 asc
LIMIT 1
--Northcentral records the lowest quantity of goods in the last quarter of every year--

--8. The Breweries company has a yearly tradition of promoting the sales_rep who makes the highest profit in the year. Who deserves this promotion in 2019?--
SELECT sales_rep, SUM(Profit)
FROM breweries
WHERE countries = 'Ghana' AND years = 2019
GROUP BY sales_rep
ORDER BY SUM(Profit) DESC
LIMIT 1;
--Jones deserves this promotion in 2019--

--9. Regions with quantities of trophy which are less than 60000, need to be restocked. What regions do we restock with the trophy brand?--
SELECT region, sum(quantity)
FROM breweries
WHERE brands = 'trophy' AND quantity < 60000
GROUP BY region
-- All the regions have less than 60,000 trophy and need to be restocked--