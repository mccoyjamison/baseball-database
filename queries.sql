UPDATE teams SET abbreviation = 'WAS' WHERE abbreviation = 'WSH';

SELECT startTime, homeScore, awayScore FROM games WHERE startTime >= '2019-06-06 00:00:00' AND startTime <= '2019-06-06 17:00:00';

SELECT * FROM teams WHERE league = 'NL';


SELECT concat (firstName, ' ', lastName) AS 'Full Name', Position, Hits, Throws, abbreviation

FROM players 
	JOIN teams
		ON players.currentTeamid = teams.id
WHERE teams.mascot = 'Red Sox';

SELECT concat (firstName, ' ', lastName) AS 'Full Name', position, abbreviation, hittingStats.homeRuns
FROM players
	JOIN teams
		ON players.currentTeamId = teams.id
    JOIN hittingStats
		ON players.id = hittingStats.playerId
    JOIN games
		ON hittingStats.gameId = games.id
		WHERE startTime > '2019-06-06'
	ORDER BY hittingStats.homeRuns DESC
    LIMIT 5;
    
    
SELECT concat (firstName, ' ', lastName) AS 'Full Name', abbreviation, pitchingStats.earnedRuns

FROM players
	JOIN teams
		ON players.currentTeamId = teams.id
	JOIN pitchingStats
		ON players.id = pitchingStats.playerId 
	JOIN games
		ON pitchingStats.gameId = games.id
	
WHERE startTime > '2019-06-06' AND inningsPitched > 3.9
ORDER BY earnedRuns DESC
LIMIT 5;

SELECT concat (firstName, ' ', lastName) AS 'Full Name', Position, 
	   abbreviation AS 'Team Abrbreviation', hittingStats.doubles, 
       games.startTime, games.homeTeamId AS 'Home Team', 
       games.awayTeamId AS 'Away Team'
       
	FROM players
		JOIN teams
			ON players.currentTeamId = teams.id
		JOIN hittingStats
			ON players.id = hittingStats.playerId
		JOIN games
			ON hittingStats.gameId = games.id
			WHERE startTime > '2019-06-06'
            ORDER BY doubles DESC
			LIMIT 5;
            
            
