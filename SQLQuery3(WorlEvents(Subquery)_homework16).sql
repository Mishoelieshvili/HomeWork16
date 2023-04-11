---Subquery
--WorldEvents

--1

SELECT COUNT(*) AS NumEventsInEurope
FROM [dbo].[Event]
WHERE CountryID IN (
    SELECT CountryID
    FROM [dbo].[Country]
    WHERE ContinentID = (
        SELECT ContinentID
        FROM [dbo].[Continent]
        WHERE ContinentName = 'Europe'
    )
)

--2

SELECT MIN(EventDate) AS EarliestEventInAfrica
FROM [dbo].[Event]
WHERE CountryID IN (
    SELECT CountryID
    FROM [dbo].[Country]
    WHERE ContinentID = (
        SELECT ContinentID
        FROM [dbo].[Continent]
        WHERE ContinentName = 'Africa'
    )
)

--3

SELECT COUNT(*) AS NumCountries
FROM [dbo].[Country]
WHERE ContinentID IN (
    SELECT ContinentID
    FROM [dbo].[Continent]
    WHERE ContinentName IN ('North America', 'South America')
)

--4

SELECT COUNT(*) AS NumEconomicEventsNewYear
FROM [dbo].[Event]
WHERE YEAR(EventDate) = YEAR(GETDATE()) AND MONTH(EventDate) = 1 AND DAY(EventDate) = 1 AND CategoryID = (
    SELECT CategoryID
    FROM [dbo].[Category]
    WHERE CategoryName = 'Economic'
)

--5

SELECT MAX(EventDate) AS LatestSportsEventInEurope
FROM [dbo].[Event]
WHERE CategoryID = (
    SELECT CategoryID
    FROM [dbo].[Category]
    WHERE CategoryName = 'Sports'
) AND CountryID IN (
    SELECT CountryID
    FROM [dbo].[Country]
    WHERE ContinentID = (
        SELECT ContinentID
        FROM [dbo].[Continent]
        WHERE ContinentName = 'Europe'
    )
)

