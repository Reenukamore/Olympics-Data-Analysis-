--A dedicated Oracle database user was created to store and manage the Olympics dataset, 
--ensuring proper access control and organized data handling.

CREATE TABLE olympics (
    city        VARCHAR2(50),
    year        NUMBER,
    sport       VARCHAR2(50),
    discipline  VARCHAR2(50),
    event       VARCHAR2(100),
    athlete     VARCHAR2(100),
    gender      VARCHAR2(10),
    country     VARCHAR2(50),
    medal       VARCHAR2(10)
);
select * from OLYMPICS;

------------------------------------------
--1.country with most medals

Select country, COUNT(*) AS total_medals
From olympics
GROUP BY country
ORDER BY total_medals Desc;
--This query counts the total number of medals won by each country, 
--groups the data country-wise, and displays the countries in descending 
--order so that the country with the highest medal count appears first.
--------------------------------------------
--2.medals by year
SELECT year, COUNT(*) AS total_medals
FROM olympics
GROUP BY year
ORDER BY year;

--This query calculates the total number of medals awarded in each 
--Olympic year, groups the data year-wise, and 
--displays the results in chronological order to show the trend over time.
-------------------------------------------------
--3 top 10 athletes
SELECT *
FROM (
    SELECT athlete, COUNT(*) AS medal_count
    FROM olympics
    GROUP BY athlete
    order by medal_count DESC
)
WHERE rownum <= 10;
--This query calculates the total number of medals won by each athlete, 
--sorts them in descending order based 
--on medal count, and displays only the top 10 medal-winning athletes.
----------------------------------------------------
--Q4 gender wise medals
SELECT gender, COUNT(*) AS total_medals
FROM olympics
GROUP BY gender;
--This query calculates the total number of medals won by each gender by grouping the data 
--gender-wise, helping to analyze gender participation in the Olympics.
-----------------------------------
--5: Sports with most medals
SELECT sport, count(*) AS total_medals
FROM olympics
Group BY sport
ORDER BY total_medals DESC;
--This query counts the total number of medals won in each sport,
--groups the data sport-wise, and displays the sports in descending 
--order based on medal count to identify the most successful sports.
---------------------------------------
--6: Medal type distribution
SELECT medal, COUNT(*) AS count
From olympics
GROUP By medal;
--This query calculates the total count of Gold, Silver, and Bronze medals by grouping
--the data medal-wise, showing the overall distribution of medal types.
---------------------------------------------------------------------------------------------------------------------------------------
--7 Which countries won the most Gold medals?
SELECT country, COUNT(*) AS gold_medals
FROM olympics
WHERE medal = 'Gold'
GROUP BY country
ORDER BY gold_medals DESC;
--This query counts only Gold medals country-wise and displays countries in descending order to find the top Gold medal winners.
-----------------------------------------------------------------------------------------------
--8: Medals won by each country in each year
SELECT year, country, COUNT(*) AS total_medals
FROM olympics
GROUP BY year, country
ORDER BY year, total_medals DESC;

--This query calculates year-wise and country-wise medal counts to analyze performance trends over time.
-----------------------------------------------------------------------------------------------
--9: Top 5 sports by Gold medals
SELECT *
FROM (
    SELECT sport, COUNT(*) AS gold_medals
    FROM olympics
    WHERE medal = 'Gold'
    GROUP BY sport
    ORDER BY gold_medals DESC
)
WHERE ROWNUM <= 5;
--This query identifies the top 5 sports with the highest number of Gold medals.
-----------------------------------------------------------------------------------------------
-- Medal count by athlete and gender
SELECT athlete, gender, COUNT(*) AS total_medals
FROM olympics
GROUP BY athlete, gender;

--This query analyzes medal counts based on athlete and gender to compare male and female performances.
-----------------------------------------------------------------------------------------------
--11: Countries with highest Olympic participation
SELECT country, COUNT(DISTINCT year) AS participation_years
FROM olympics
GROUP BY country
ORDER BY participation_years DESC;

--This query counts how many Olympic years each country participated in.
-----------------------------------------------------------------------------------------------
--12: Medal count by discipline
SELECT discipline, COUNT(*) AS total_medals
FROM olympics
GROUP BY discipline
ORDER BY total_medals DESC;

--This query calculates the total number of medals awarded in each discipline.
-----------------------------------------------------------------------------------------------
--13: Athletes who won more than 5 medals
SELECT athlete, COUNT(*) AS medal_count
FROM olympics
GROUP BY athlete
HAVING COUNT(*) > 5
ORDER BY medal_count DESC;

--This query identifies athletes who have won more than five medals in total.
-----------------------------------------------------------------------------------------------
--14: Olympic year with the highest number of medals
SELECT *
FROM (
    SELECT year, COUNT(*) AS total_medals
    FROM olympics
    GROUP BY year
    ORDER BY total_medals DESC
)
WHERE ROWNUM = 1;

--This query finds the Olympic year in which the maximum number of medals were awarded.
-----------------------------------------------------------------------
---15-Medal distribution by country and medal type
SELECT country, medal, COUNT(*) AS medal_count
FROM olympics
GROUP BY country, medal
ORDER BY country;

--This query shows how many Gold, Silver, and Bronze medals each country has won.
-----------------------------------------------------------------------------------------------
--16: Sports with medals for both genders
SELECT sport
FROM olympics
GROUP BY sport
HAVING COUNT(DISTINCT gender) = 2;

--This query identifies sports where medals were awarded to both male and female athletes.
------------------------------------------------------------------------------