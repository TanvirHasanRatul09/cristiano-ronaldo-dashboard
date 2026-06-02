CREATE DATABASE RonaldoStats;
GO

USE RonaldoStats;
GO
drop table RonaldoSeasonStats
CREATE TABLE RonaldoSeasonStats (
    Season NVARCHAR(10),
    Club NVARCHAR(50),
    Matches INT,
    Goals_League INT,
    Total_Goals INT,
    Assists INT,
    Minutes_Played INT,
    Dribbles_Completed VARCHAR(50),
);
GO

INSERT INTO RonaldoSeasonStats
(
    Season,
    Club,
    Matches,
    Goals_League,
    Total_Goals,
    Assists,
    Minutes_Played,
    Dribbles_Completed
)
SELECT
    Season,
    Club,
    Matches,
    Goals_League,
    Total_Goals_All_Competitions,
    Assists,
    Minutes_Played,
    Dribbles_Completed
FROM [Ronaldo-SeasonStats];
GO

SELECT TOP 5 *
FROM [Ronaldo-SeasonStats];

SELECT * 
FROM RonaldoSeasonStats;

SELECT
    SUM(Matches) AS Total_Matches,
    SUM(Goals_League) AS Total_League_Goals,
    SUM(Total_Goals) AS Total_Goals,
    SUM(Assists) AS Total_Assists
FROM RonaldoSeasonStats;

SELECT TOP 1
    Season,
    Club,
    Total_Goals
FROM RonaldoSeasonStats
ORDER BY Total_Goals DESC;

SELECT
    Club,
    SUM(Total_Goals) AS Goals
FROM RonaldoSeasonStats
GROUP BY Club
ORDER BY Goals DESC;

SELECT
    Club,
    SUM(Assists) AS Assists
FROM RonaldoSeasonStats
GROUP BY Club
ORDER BY Assists DESC;

SELECT
    Season,
    Club,
    ROUND(
        CAST(Total_Goals AS FLOAT) / Matches,
        2
    ) AS Goals_Per_Match
FROM RonaldoSeasonStats
ORDER BY Goals_Per_Match DESC;

