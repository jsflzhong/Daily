/**
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
Seen this question in a real interview before?
1/5
Yes
No
Accepted
462.5K
Submissions
857.6K
Acceptance Rate
53.9%
*/
# Write your MySQL query statement below
SELECT dep.name as Department , emp.name as Employee , emp.salary as Salary 
FROM Employee emp
INNER JOIN Department dep
ON emp.departmentId = dep.id
WHERE (emp.departmentId, emp.salary) 
IN(
    SELECT departmentId, MAX(salary) 
    FROM Employee 
    GROUP BY departmentId
)


# After optimization
SELECT dep.name as Department, emp.name as Employee, emp.salary as Salary
FROM Employee emp
INNER JOIN (
    SELECT departmentId, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY departmentId
) subquery
ON emp.departmentId = subquery.departmentId AND emp.salary = subquery.max_salary
INNER JOIN Department dep
ON emp.departmentId = dep.id;