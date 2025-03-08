# Write your MySQL query statement below
SELECT
(SELECT DISTINCT Salary 
FROM Employee ORDER BY salary DESC
LIMIT 1 offset 1) 
AS SecondHighestSalary
FROM dual;

/**

为什么只有子查询会导致 LeetCode 失败？

如果你直接运行：

(SELECT DISTINCT Salary 
 FROM Employee 
 ORDER BY Salary DESC
 LIMIT 1 OFFSET 1)

当表中没有第二高工资时（比如所有人工资相同，或者只有一个人），子查询 不返回任何结果。

LeetCode 期望你的查询至少返回一行，但这个查询在没有第二高工资的情况下 完全不返回任何东西，导致 LeetCode 认为答案格式错误。

为什么加了外层 SELECT 就可以通过？
SELECT
(SELECT DISTINCT Salary 
 FROM Employee 
 ORDER BY Salary DESC
 LIMIT 1 OFFSET 1) 
AS SecondHighestSalary;

当子查询返回 NULL 时，外层 SELECT 仍然返回一行，只是 SecondHighestSalary 这一列是 NULL。
这样即使 Employee 表里没有第二高的工资，查询结果仍然符合 LeetCode 期望的格式：

+-------------------+
| SecondHighestSalary |
+-------------------+
| NULL              |
+-------------------+
这与 子查询直接返回空结果集（完全无返回行）是不同的。
LeetCode 期望 SQL 在没有第二高工资时返回 NULL，而不是空结果集。
*/