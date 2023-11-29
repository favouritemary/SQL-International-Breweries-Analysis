--Session A: PROFIT ANALYSIS--

/*1. Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/
SELECT SUM(Profit) AS ProfitS
FROM breweries
--The profit worth of the breweries within the space of 3 years is $105,587,420--

/*2. Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020.*/
SELECT
    CASE WHEN countries IN ('Nigeria', 'Ghana') THEN 'ANGLOPHONE'
    ELSE 'FRANCOPHONE' 
    END AS country_language,
    SUM(Profit) AS ProfitS
FROM breweries
GROUP BY 1
ORDER BY 2 DESC;
--Francophone countries made more profits than the Anglophone countries,

--3.  Country that generated the highest profit in 2019--
SELECT Countries, SUM(Profit) AS Profits
FROM breweries
WHERE years=2019
GROUP BY 1
ORDER BY 2 DESC;
--Ghana generated the highest profit of $7,144,070 in 2019--

--4. Help him find the year with the highest profit.--
SELECT years, SUM(Profit) AS Profits
FROM breweries
GROUP BY 1
ORDER BY 2 DESC;
--2017 is the year with the highest profit of $38,503,320--

--5. Which month in the three years was the least profit generated?--
SELECT months, SUM(Profit) AS Profits
FROM breweries
GROUP BY 1
ORDER BY 2 ASC;
--April has the lowest profits of $8,573,830 generated--

--6. What was the minimum profit in the month of December 2018?--
SELECT months, years, min(profit) AS min_profit
FROM breweries
WHERE months = 'December' AND years = 2018
GROUP BY 1,2
--The minimum profit in the month of December in 2018 is $38,150--

--7. Compare the profit in percentage for each of the month in 2019
SELECT months, SUM(Profit) AS Profits_month,
    ROUND((SUM(profit)*100/SUM(SUM(profit)) OVER ()),2) AS Profit_in_percentage             
FROM breweries
WHERE years = 2019
GROUP BY 1
ORDER BY 2 DESC;

--8.  Which particular brand generated the highest profit in Senegal?--
SELECT Brands, SUM(Profit) AS Profits
FROM breweries
WHERE countries LIKE 'Senegal'
GROUP BY 1
ORDER BY 2 DESC;
--Castle lite generated the highest profit of $7,012,980 in Senegal--

--Session B: BRAND ANALYSIS--

/*1. Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/
SELECT Brands,  sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries IN ('Benin', 'Senegal', 'Togo') 
    AND years IN (2018,2019)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;
--The top three brands consumed in the francophone countries are Trophy, Hero and Eagle lager.--

--2. Find out the top two choice of consumer brands in Ghana--
SELECT Brands, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Ghana' 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;
--Eagle Lager AND Castle lite are the top two choice of consumer brands in Ghana--

/*3. Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.*/
SELECT Brands,  sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria'
    AND years IN (2017,2018,2019)
    AND brands NOT LIKE '%malt'
GROUP BY 1
ORDER BY 2 DESC;


--4. Favorite malt brand in Anglophone region between 2018 and 2019--
SELECT Brands, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries IN ('Nigeria', 'Ghana')
    AND years IN (2018,2019)
    AND Brands LIKE '%malt'
GROUP BY 1
ORDER BY 2 DESC;
--The favourite malt brand in Anglophone between 2018 and 2019 is grand malt with a quantity of 33,221 consumed.--

-- 5. Which brands sold the highest in 2019 in Nigeria?--
SELECT Brands, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria'
    AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;
--Hero sold the highest in Nigeria in 2019

--6. Favorites brand in South_South region in Nigeria--
SELECT Brands, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria'
    AND region = 'southsouth'
GROUP BY 1,2
ORDER BY 2 DESC;
-- Eagle lager is the favourite brand in Nigeria--

--7. Bear consumption in Nigeria--
SELECT Brands, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria' 
AND Brands NOT LIKE '%malt'
GROUP BY 1;

--8. Level of consumption of Budweiser in the regions in Nigeria
SELECT region, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria' 
AND Brands = 'budweiser'
GROUP BY 1
ORDER BY 2 DESC;

--9. Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)--
SELECT region, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Nigeria' 
AND Brands = 'budweiser'
AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;

--Session C: COUNTRIES ANALYSIS--

--1. Country with the highest consumption of beer.--
SELECT countries, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE Brands NOT LIKE '%malt'
GROUP BY 1
ORDER BY 2 DESC;
--Senegal is the country with the highest consumption of beer--

--2. Highest sales personnel of Budweiser in Senegal--
SELECT sales_rep, sum(quantity) AS Quantity_consumed
FROM breweries
WHERE countries = 'Senegal'
AND Brands = 'budweiser'
GROUP BY 1
ORDER BY 2 DESC;
--Jones is the highest sales personnel of Budweiser in Senegal

--3. Country with the highest profit in the fourth quarter in 2019--

SELECT countries, sum(profit) AS profit_made
FROM breweries
WHERE years = 2019 
AND months IN ('October', 'November', 'December')
GROUP BY 1
ORDER BY 2 DESC;
--Ghana is the country with the highest profit in the fourth quarter in 2019--

