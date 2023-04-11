
•-- Two insert statements
Insert into Athletes values (5, 'John Smith', '1997-01-01', 'Male', 'johnsmith@gmail.com', 555124567, 1);

Insert into Coaches values (4, 'Mark', 'Jones', 'markjones@gmail.com', 552345678, 2);


-- Two update statements
UPDATE Facilities
SET FacilityName = 'LA Stadium'
WHERE FacilityID = 1;

UPDATE Teams
SET HomeState = 'California'
WHERE TeamID = 1;

-- Delete statement
DELETE FROM Coaches
WHERE TeamID = 1;

-- Simple select statement
SELECT FullName, EmailAddress
FROM Athletes
WHERE AthleteID = 1;


-- 2 join statements
SELECT * FROM Athletes JOIN Teams ON Athletes.TeamID = Teams.TeamID;

SELECT * FROM Games JOIN Facilities ON Games.FacilityID = Facilities.FacilityID;
	
	
-- Two that use summary statements
SELECT TeamName, SUM(PointsScored) 
FROM Teams JOIN Athletes ON Teams.TeamID = Athletes.TeamID
JOIN Statistics ON Athletes.AthleteID = Statistics.AthleteID
GROUP BY TeamName;

SELECT ExerciseType, SUM(Weight) 
FROM Workouts
GROUP BY ExerciseType;

-- Multi-table query
SELECT FullName, PointsScored, Assists, GameLocation
FROM Athletes JOIN Teams ON Athletes.TeamID = Teams.TeamID
JOIN Statistics ON Athletes.AthleteID = Statistics.AthleteID
JOIN Games ON Statistics.GameID = Games.GameID
WHERE TeamName = 'Golden State Warriors';

-- The query of your choice.
SELECT FullName, InjuryDate, RecoveryTime
FROM Athletes JOIN Injuries ON Athletes.AthleteID = Injuries.AthleteID
WHERE Gender = 'Male'
ORDER BY InjuryDate DESC;