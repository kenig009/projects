/* AWS6_03_Export_Results.sql */

-- Test the query locally if you wish - should be 34 rows
SELECT Player.PlayerName, Player.Hits / Player.AtBats AS BatAvg, Team.Stadium
FROM Player INNER JOIN Team ON Player.TeamID = Team.TeamID
WHERE Team.League = 'American' AND Player.Hits > 150 
ORDER BY BatAvg DESC;

-- Grant SELECT INTO privilege to admin 
GRANT SELECT INTO S3 ON *.* TO 'admin'@'%';

-- Execute the SELECT INTO statement - adjust bucket name and folder
SELECT Player.PlayerName, Player.Hits / Player.AtBats AS BatAvg, Team.Stadium
INTO OUTFILE 's3://idsc-3103-bucket-vlelas/baseball/Assign4_Results.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Player INNER JOIN Team ON Player.TeamID = Team.TeamID
WHERE Team.League = 'American' AND Player.Hits > 150 
ORDER BY BatAvg DESC;