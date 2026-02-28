CREATE DATABASE cricket_analysis;
USE cricket_analysis;

CREATE TABLE matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    year INT,
    venue VARCHAR(100),
    tournament VARCHAR(100),
    india_runs int,
    pak_runs int,
    toss_winner VARCHAR(50),
    bat_first VARCHAR(50),
    india_wickets int,
    pak_wickets int,
	winner VARCHAR(50),
    pitch_condition VARCHAR(100),
    total_runs int,
    india_margin int,
    winner_is_india INT
);

select * from matches limit 5;

Select 
  round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
  from matches;
  
Select
tournament,
count(tournament) as total_matches,
SUM(winner_is_india) AS india_wins,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
  from matches
  group by tournament
  order by win_percentage desc;
  
Select
 year,
 count(*) as total_matches,
 SUM(winner_is_india) AS india_wins,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
 from matches
 group by year
 order by year asc;
 
 select venue, count(*) as total_matches,
SUM(winner_is_india) AS india_wins,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
 from matches
 group by venue
 having win_percentage > 50
 order by win_percentage desc;
 
 select count(*) as total_matches,
 sum(case when toss_winner = winner then 1 else 0 end) as matches_won_after_toss,
 ROUND(SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS toss_win_advantage
 from matches;
 
 select tournament,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
 from matches
 group by tournament
 order by win_percentage desc limit 1;
 
 select venue,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage,
 rank() over(order by round(sum(winner_is_india)*100.0/count(*),2)desc) as rank_
 from matches
 group by venue;
 
 select year,
 round(sum(winner_is_india)*100.0/count(*),2) as win_percentage
 from matches
 group by year
 having win_percentage > 60
 order by win_percentage desc limit 3;
 
 CREATE TABLE india_summary AS
SELECT 
    year,
    tournament,
    COUNT(*) AS total_matches,
    SUM(winner_is_india) AS india_wins,
    ROUND(SUM(winner_is_india) * 100.0 / COUNT(*), 2) AS win_percentage
FROM matches
GROUP BY year, tournament;
 
with yearly as(
 select year,
	ROUND(SUM(winner_is_india) * 100.0 / COUNT(*), 2) AS win_percentage
    from matches
    group by year
    )
select * from yearly
where win_percentage =(select max(win_percentage) from yearly);