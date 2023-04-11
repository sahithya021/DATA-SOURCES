-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-10 13:32:11.975

-- tables
-- Table: Athletes
CREATE TABLE Athletes (
    AthleteID int  NOT NULL,
    FullName varchar(30)  NOT NULL,
    DateofBirth date  NOT NULL,
    Gender varchar(10)  NOT NULL,
    EmailAddress varchar(30)  NOT NULL,
    PhoneNumber int  NOT NULL,
    TeamID int  NOT NULL,
    CONSTRAINT Athletes_pk PRIMARY KEY (AthleteID)
);

-- Table: Coaches
CREATE TABLE Coaches (
    CoachID int  NOT NULL,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    EmailAddress varchar(30)  NOT NULL,
    PhoneNumber int  NOT NULL,
    TeamID int  NOT NULL,
    CONSTRAINT Coaches_pk PRIMARY KEY (CoachID)
);

-- Table: Facilities
CREATE TABLE Facilities (
    FacilityID int  NOT NULL,
    FacilityName varchar(30)  NOT NULL,
    FacilityAddress varchar(30)  NOT NULL,
    FacilityCity varchar(30)  NOT NULL,
    FacilityState varchar(30)  NOT NULL,
    FacilityCountry varchar(30)  NOT NULL,
    FacilityType varchar(30)  NOT NULL,
    CONSTRAINT Facilities_pk PRIMARY KEY (FacilityID)
);

-- Table: Games
CREATE TABLE Games (
    GameID int  NOT NULL,
    GameDate date  NOT NULL,
    GameTime varchar(20)  NOT NULL,
    GameLocation varchar(20)  NOT NULL,
    HomeTeamID int  NOT NULL,
    AwayTeamID int  NOT NULL,
    FacilityID int  NOT NULL,
    CONSTRAINT Games_pk PRIMARY KEY (GameID)
);

-- Table: Injuries
CREATE TABLE Injuries (
    InjuryID int  NOT NULL,
    InjuryDate date  NOT NULL,
    RecoveryTime varchar(20)  NOT NULL,
    AthleteID int  NOT NULL,
    CONSTRAINT Injuries_pk PRIMARY KEY (InjuryID)
);

-- Table: Statistics
CREATE TABLE Statistics (
    StatisticsID int  NOT NULL,
    PointsScored int  NOT NULL,
    Assists int  NOT NULL,
    GameID int  NOT NULL,
    AthleteID int  NOT NULL,
    CONSTRAINT Statistics_pk PRIMARY KEY (StatisticsID)
);

-- Table: Teams
CREATE TABLE Teams (
    TeamID int  NOT NULL,
    TeamName varchar(30)  NOT NULL,
    HomeCity varchar(30)  NOT NULL,
    HomeState varchar(30)  NOT NULL,
    HomeCountry varchar(30)  NOT NULL,
    CONSTRAINT Teams_pk PRIMARY KEY (TeamID)
);

-- Table: Workouts
CREATE TABLE Workouts (
    WorkoutID int  NOT NULL,
    WorkoutDate date  NOT NULL,
    WorkoutTime varchar(30)  NOT NULL,
    ExerciseType varchar(30)  NOT NULL,
    Weight varchar(30)  NOT NULL,
    AthleteID int  NOT NULL,
    CONSTRAINT Workouts_pk PRIMARY KEY (WorkoutID)
);

-- foreign keys
-- Reference: Athletes_Teams (table: Athletes)
ALTER TABLE Athletes ADD CONSTRAINT Athletes_Teams FOREIGN KEY Athletes_Teams (TeamID)
    REFERENCES Teams (TeamID);

-- Reference: Away_Team_Games (table: Games)
ALTER TABLE Games ADD CONSTRAINT Away_Team_Games FOREIGN KEY Away_Team_Games (AwayTeamID)
    REFERENCES Teams (TeamID);

-- Reference: Coaches_Teams (table: Coaches)
ALTER TABLE Coaches ADD CONSTRAINT Coaches_Teams FOREIGN KEY Coaches_Teams (TeamID)
    REFERENCES Teams (TeamID);

-- Reference: Games_Facilities (table: Games)
ALTER TABLE Games ADD CONSTRAINT Games_Facilities FOREIGN KEY Games_Facilities (FacilityID)
    REFERENCES Facilities (FacilityID);

-- Reference: Home_Team_Games (table: Games)
ALTER TABLE Games ADD CONSTRAINT Home_Team_Games FOREIGN KEY Home_Team_Games (HomeTeamID)
    REFERENCES Teams (TeamID);

-- Reference: Injuries_Athletes (table: Injuries)
ALTER TABLE Injuries ADD CONSTRAINT Injuries_Athletes FOREIGN KEY Injuries_Athletes (AthleteID)
    REFERENCES Athletes (AthleteID);

-- Reference: Statistics_Athletes (table: Statistics)
ALTER TABLE Statistics ADD CONSTRAINT Statistics_Athletes FOREIGN KEY Statistics_Athletes (AthleteID)
    REFERENCES Athletes (AthleteID);

-- Reference: Statistics_Games (table: Statistics)
ALTER TABLE Statistics ADD CONSTRAINT Statistics_Games FOREIGN KEY Statistics_Games (GameID)
    REFERENCES Games (GameID);

-- Reference: Workouts_Athletes (table: Workouts)
ALTER TABLE Workouts ADD CONSTRAINT Workouts_Athletes FOREIGN KEY Workouts_Athletes (AthleteID)
    REFERENCES Athletes (AthleteID);

-- End of file.

