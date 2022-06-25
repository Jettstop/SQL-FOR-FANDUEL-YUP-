-- SQL FOR FANDUEL? YUP!
-- I uploaded the short late express games from fanduel
-- I added some of my favorite stats and had some fun!

-- Lets see what we are working with. Here is the position players available
SELECT 
*
FROM 
mlbfanduel.players;

-- here are the pitchers available

SELECT 
*
FROM 
mlbfanduel.pitchers;

-- lets see who the studs are. 

SELECT 
*
FROM 
mlbfanduel.players
WHERE cost > 3500
ORDER BY cost DESC;

-- lets see our mid range guys

SELECT 
*
FROM 
mlbfanduel.players
WHERE cost between 2900 and 3400
ORDER BY cost DESC;

-- lets find some value

SELECT 
*
FROM 
mlbfanduel.players
WHERE cost < 2900
ORDER BY cost DESC;

-- so far we know our player table, pitcher table, studs, mid level, and values

-- most of the time we want to stack. example; the 1st,2nd,3rd,4th hitter all in one lineup

SELECT 
first_name, last_name, batter,cost
FROM 
mlbfanduel.players 
WHERE batter between 1 and 4
ORDER BY batter DESC;

-- time to join the pitchers and players tables!
-- this should show every hitter against his opposing pitcher(AND IT DID! haha)

SELECT 
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game;

-- homeruns matter a ton. lets see what hitter has a high HR % and what pitcher has one too

SELECT 
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.hr_percentage, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
    mlbfanduel.players.cost,
    mlbfanduel.players.homerun_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
ORDER BY mlbfanduel.players.homerun_percentage DESC;

-- im going to put a where clause in that gives me pitchers who give up HRs

SELECT 
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.hr_percentage, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
    mlbfanduel.players.cost,
    mlbfanduel.players.homerun_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE mlbfanduel.pitchers.hr_percentage > 2
ORDER BY mlbfanduel.players.homerun_percentage DESC;

-- lets see what stacks look like. remember a stack is 2+ players from the same team
-- you want them to be near each other in the order. i want to see what 1-6 looks like here

SELECT 
	mlbfanduel.pitchers.game,
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.hr_percentage, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
	mlbfanduel.players.batter,
    mlbfanduel.players.cost,
    mlbfanduel.players.homerun_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE batter between 1 and 6
AND homerun_percentage > 4.5
AND hr_percentage > 2.5
ORDER BY batter;

-- time to find a handful of value players to plug in where we need them. 

SELECT 
	mlbfanduel.pitchers.game,
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.hr_percentage, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
	mlbfanduel.players.batter,
    mlbfanduel.players.cost,
    mlbfanduel.players.homerun_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE mlbfanduel.players.cost < 3000
AND homerun_percentage > 2.5
AND hr_percentage > 2.5
ORDER BY homerun_percentage desc;

-- we have our players. time to find a pitcher

SELECT 
	mlbfanduel.pitchers.game,
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.strikeout_percentage,
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
    mlbfanduel.players.strikeout_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE mlbfanduel.players.strikeout_percentage > 20
AND mlbfanduel.pitchers.strikeout_percentage > 20
ORDER BY mlbfanduel.pitchers.strikeout_percentage DESC;

-- Besides strikeouts wins are big too. 

SELECT 
	mlbfanduel.pitchers.game,
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.hr_percentage, 
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
	mlbfanduel.players.batter,
    mlbfanduel.players.cost,
    mlbfanduel.players.homerun_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE mlbfanduel.players.cost < 3000
AND homerun_percentage > 2.5
AND hr_percentage > 2.5
ORDER BY homerun_percentage desc;

-- we have our players. time to find a pitcher

SELECT 
	mlbfanduel.pitchers.game,
	mlbfanduel.pitchers.first_name,
    mlbfanduel.pitchers.last_name, 
    mlbfanduel.pitchers.cost, 
    mlbfanduel.pitchers.strikeout_percentage,
    mlbfanduel.pitchers.win_probability,
    mlbfanduel.players.first_name,
    mlbfanduel.players.last_name,
    mlbfanduel.players.strikeout_percentage
FROM 
	mlbfanduel.pitchers
    INNER JOIN mlbfanduel.players
		ON mlbfanduel.pitchers.game = mlbfanduel.players.game
WHERE mlbfanduel.players.strikeout_percentage > 20
AND mlbfanduel.pitchers.strikeout_percentage > 20
AND mlbfanduel.pitchers.win_probability > 0.5
ORDER BY mlbfanduel.pitchers.strikeout_percentage DESC;



    







