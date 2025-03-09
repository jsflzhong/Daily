# Write your MySQL query statement below
SELECT 
DISTINCT a.num as 'ConsecutiveNums'
FROM
Logs a 
INNER JOIN Logs b ON a.id = b.id + 1
INNER JOIN logs c ON a.id = c.id + 2
WHERE
a.num = b.num AND a.num = c.num
