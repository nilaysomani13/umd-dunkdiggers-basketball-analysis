USE BUDT702_Project_0504_05;

-- ALTER TABLE DROP CONSTRAINT QUERY

ALTER TABLE [DunkDiggers.Player]
DROP CONSTRAINT IF EXISTS fk_Player_teamId;

-- DROP TABLES for DunkDiggers

DROP TABLE IF EXISTS [DunkDiggers.Staff];
DROP TABLE IF EXISTS [DunkDiggers.Team];
DROP TABLE IF EXISTS [DunkDiggers.SeasonStats];
DROP TABLE IF EXISTS [DunkDiggers.PlayerStats];
DROP TABLE IF EXISTS [DunkDiggers.Player];
DROP TABLE IF EXISTS [DunkDiggers.Result];
DROP TABLE IF EXISTS [DunkDiggers.GameReferee];
DROP TABLE IF EXISTS [DunkDiggers.Game];

-- CREATE TABLES for DunkDiggers

CREATE TABLE [DunkDiggers.Game](
	gameId CHAR(5) NOT NULL,
	gameDate DATE,
	gameTime TIME,
	gameAttendance INTEGER,
	gameStadium VARCHAR (50),
	CONSTRAINT pk_Game_gameId PRIMARY KEY (gameId) );

CREATE TABLE [DunkDiggers.GameReferee] (
	gameId CHAR(5) NOT NULL,
	gameReferee VARCHAR(20) NOT NULL
	CONSTRAINT pk_GameReferee_gameId_gameReferee PRIMARY KEY (gameId, gameReferee),
	CONSTRAINT fk_GameReferee_gameId FOREIGN KEY (gameId)
		REFERENCES [DunkDiggers.Game] (gameId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [DunkDiggers.Result] (
	gameId CHAR(5) NOT NULL,
	resultOpponentName VARCHAR(20) NOT NULL,
	resultPoints INTEGER,
	resultOpponentPoints INTEGER,
	CONSTRAINT pk_Result_gameId_resultOpponentName PRIMARY KEY (gameId, resultOpponentName),
	CONSTRAINT fk_Result_gameId FOREIGN KEY (gameId)
		REFERENCES [DunkDiggers.Game] (gameId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [DunkDiggers.Player] (
	playerId CHAR(9) NOT NULL,
	playerNumber CHAR(3),
	playerFirstName VARCHAR(20),
	playerLastName VARCHAR(20),
	playerHeight CHAR(4),
	playerWeight NUMERIC,
	playerClass VARCHAR(20),
	playerMajor VARCHAR(20),
	playerHometown VARCHAR(20),
	playerHighSchool VARCHAR(20),
	playerPreviousSchool VARCHAR(20),
	teamId CHAR(3) NOT NULL,
	CONSTRAINT pk_Player_playerId PRIMARY KEY (playerId));
		
CREATE TABLE [DunkDiggers.PlayerStats] (
	playerStatsId CHAR(6) NOT NULL,
	playerStatsMinutesPlayed INTEGER,
	playerStatsFGM INTEGER,
	playerStatsFGA INTEGER,
	playerStatsThreeFGM INTEGER,
	playerStatsThreeFGA INTEGER,
	playerStatsFTM INTEGER,
	playerStatsFTA INTEGER,
	playerStatsOR INTEGER,
	playerStatsDR INTEGER,
	playerStatsPF INTEGER,
	playerStatsAssists INTEGER,
	playerStatsTurnovers INTEGER,
	playerStatsBlocks INTEGER,
	playerStatsSteals INTEGER,
	playerStatsPoints INTEGER,
	playerId CHAR(9) NOT NULL,
	gameId CHAR(5) NOT NULL,
	CONSTRAINT pk_PlayerStats_playerStatsId PRIMARY KEY (playerStatsId),
	CONSTRAINT fk_PlayerStats_playerId FOREIGN KEY (playerId)
		REFERENCES [DunkDiggers.Player] (playerId)
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_PlayerStats_gameId FOREIGN KEY (gameId)
		REFERENCES [DunkDiggers.Game] (gameId)
		ON DELETE NO ACTION ON UPDATE NO ACTION );

CREATE Table [DunkDiggers.SeasonStats] (
	playerId CHAR(9) NOT NULL,
	seasonStatsYear CHAR(7) NOT NULL,
	seasonStatsGamesStarted INTEGER,
	seasonStatsMinutesPlayed INTEGER,
	seasonStatsFGM INTEGER,
	seasonStatsFGA INTEGER,
	seasonStatsThreeFGM INTEGER,
	seasonStatsThreeFGA INTEGER,
	seasonStatsFTM INTEGER,
	seasonStatsFTA INTEGER,
	seasonStatsOR INTEGER,
	seasonStatsDR INTEGER,
	seasonStatsPF INTEGER,
	seasonStatsAssists INTEGER,
	seasonStatsTurnovers INTEGER,
	seasonStatsBlocks INTEGER,
	seasonStatsSteals INTEGER,
	seasonStatsPoints INTEGER,
	CONSTRAINT pk_SeasonStats_playerId_seasonStatsYear PRIMARY KEY (playerId, seasonStatsYear),
	CONSTRAINT fk_SeasonStats_playerId FOREIGN KEY (playerId)
		REFERENCES [DunkDiggers.Player] (playerId)
		ON DELETE CASCADE ON UPDATE CASCADE ); 

CREATE TABLE [DunkDiggers.Team] (
	teamId CHAR(3) NOT NULL,
	teamName VARCHAR(30),
	CONSTRAINT pk_Team_teamId PRIMARY KEY (teamId) );

CREATE TABLE [DunkDiggers.Staff] (
	staffId CHAR(5) NOT NULL,
	staffFirstName VARCHAR(20),
	staffLastName VARCHAR(20),
	staffPosition VARCHAR(30),
	teamId CHAR(3),
	CONSTRAINT pk_Staff_staffId PRIMARY KEY (staffId),
	CONSTRAINT fk_Staff_teamId FOREIGN KEY (teamId)
		REFERENCES [DunkDiggers.Team] (teamId)
		ON DELETE SET NULL ON UPDATE CASCADE );
	
-- INSERT QUERIES for DunkDiggers

INSERT INTO [DunkDiggers.Game] VALUES
	('G0001', '02/14/2024', '18:30:00', '12031', 'Xfinity Center'),
	('G0002', '02/17/2024', '15:30:00', '17950', 'Xfinity Center')

INSERT INTO [DunkDiggers.GameReferee] VALUES
	('G0001', 'Doug Sirmons'),
	('G0002', 'Tim Comer')

INSERT INTO [DunkDiggers.Result] VALUES
	('G0001', 'Iowa', '78', '66'),
	('G0002', 'Illonois', '80', '85')

INSERT INTO [DunkDiggers.Player] VALUES
	('P0001', '1', 'Jahmir', 'Young', '6-1', '185', 'Fifth Year', 'Sociology', 'Upper Marlboro, MD', 'DeMatha Catholic', 'Charlotte', 'T01'),
	('P0002', '10', 'Julian', 'Reese', '6-9', '230', 'Junior', 'Human Development', 'Baltimore, MD', 'St. Frances Academy',	NULL, 'T01')

INSERT INTO [DunkDiggers.PlayerStats] VALUES
	('PS0001', '23', '8', '11', '0', '0', '2', '7', '3', '5', '4', '0', '4', '2', '0', '18', 'P0002', 'G0001'),
	('PS0002', '33', '4', '11', '0', '3', '4', '4', '0', '5', '1', '4', '4', '2', '3', '12', 'P0001', 'G0001')

INSERT INTO [DunkDiggers.SeasonStats] VALUES
	('P0001', '2023-24', '29', '1002', '175', '435', '53', '145', '182', '201', '31', '104', '38', '118', '78', '9', '36', '585'),
	('P0002', '2023-24', '29', '925', '143', '265', '0', '0', '118', '209', '91', '190', '86', '33', '68', '56', '29', '404')

INSERT INTO [DunkDiggers.Team] VALUES
	('T01', 'Mens Basketball Team'),
	('T02', 'Womens Basketball Team')

INSERT INTO [DunkDiggers.Staff] VALUES
	('S0001', 'Kevin', 'Willard', 'Coach', 'T01'),
	('S0002', 'David', 'Cox', 'Associate Head Coach', 'T01')

-- ALTER ADD CONSTRAINT QUERY

ALTER TABLE [DunkDiggers.Player] 
	ADD CONSTRAINT fk_Player_teamId FOREIGN KEY (teamId)
	REFERENCES [DunkDiggers.Team] (teamId)
	ON DELETE NO ACTION ON UPDATE CASCADE;
	