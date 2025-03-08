USE BUDT702_Project_0504_05;

DROP VIEW IF EXISTS [DunkDiggers.Result_WinLoss_v];
DROP VIEW IF EXISTS [DunkDiggers.SeasonStatsAggregrate_v];
DROP VIEW IF EXISTS [DunkDiggers.PlayerStatsAggregrate_v];
DROP VIEW IF EXISTS [DunkDiggers.Player_v];

GO 
CREATE VIEW [DunkDiggers.Result_WinLoss_v] AS 
	SELECT gameID, CASE WHEN resultPoints>resultOpponentPoints THEN 'W' ELSE 'L' END as 'WinLoss'
	FROM [DunkDiggers.Result];

GO 
CREATE VIEW [DunkDiggers.SeasonStatsAggregrate_v] AS 
	SELECT s.seasonStatsYear,
		playerId,
		(s.seasonStatsOR + s.seasonStatsOR) as TotalRebounds,
		CASE WHEN s.seasonStatsGamesStarted = 0 THEN 0 ELSE FORMAT(s.seasonStatsPoints/s.seasonStatsGamesStarted,'#.#') END as AvgPointsPerGame,
		(100*((s.seasonStatsPoints * 0.35) + (s.seasonStatsAssists * 0.25) + (s.seasonStatsOR * 0.2) + ((s.seasonStatsSteals + s.seasonStatsBlocks) * 0.1) - (s.seasonStatsTurnovers * 0.15))/s.seasonStatsMinutesPlayed) as OffensiveRating,
		(100*((s.seasonStatsSteals * 0.3) + (s.seasonStatsBlocks * 0.3) + (s.seasonStatsDR * 0.2)- (s.seasonStatsPF * 0.2) - (s.seasonStatsTurnovers * 0.1))/s.seasonStatsMinutesPlayed) as DefensiveRating
	FROM [DunkDiggers.SeasonStats] s;

GO 
CREATE VIEW [DunkDiggers.PlayerStatsAggregrate_v] AS 
	SELECT playerId, gameId, (playerStatsOR + playerStatsDR) as TotalRebounds,
		CASE WHEN playerStatsFGA = 0 THEN 0 ELSE FORMAT(playerStatsFGM*100/playerStatsFGA,'#.##') END as FieldGoalPercentage,
		CASE WHEN playerStatsThreeFGA = 0 THEN 0 ELSE FORMAT(playerStatsThreeFGM*100/playerStatsThreeFGA,'#.##') END as ThreePointPercentage,
		CASE WHEN playerStatsFTA = 0 THEN 0 ELSE FORMAT(playerStatsFTM*100/playerStatsFTA,'#.##') END as FreeThrowPercent,
		CASE WHEN (playerStatsFGA + 0.475* playerStatsFTA + playerStatsTurnovers) = 0 then 0 else  playerStatsTurnovers/(playerStatsFGA + 0.475* playerStatsFTA + playerStatsTurnovers) END as TurnOverPercentage
	FROM [DunkDiggers.PlayerStats];

GO 
CREATE VIEW [DunkDiggers.Player_v] AS 
	SELECT playerId, playerNumber, CONCAT(p.playerLastName, ' ',p.playerFirstName) as PlayerName
	FROM [DunkDiggers.Player] p;



	