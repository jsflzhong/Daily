# Write your MySQL query statement below
SELECT 
    score, 
    (SELECT count(*) 
        FROM (SELECT DISTINCT score tempS FROM Scores) as TEMP 
        WHERE tempS >= score) 'rank'
FROM Scores s
ORDER BY score desc