/*
Table: Employees
+-------------+------+
| Column Name | Type |
+-------------+------+
| emp_id      | int  |
| event_day   | date |
| in_time     | int  |
| out_time    | int  |
+-------------+------+
(emp_id, event_day, in_time) is the primary key of this table.
The table shows the employees' entries and exits in an office.
event_day is the day at which this event happened, in_time is the minute at which the employee entered the office, and out_time is the minute at which they left the office.
in_time and out_time are between 1 and 1440.
It is guaranteed that no two events on the same day intersect in time, and in_time < out_time.

Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once. 
The time spent in the office for a single entry is out_time - in_time.
Return the result table in any order.
*/

with CountTime as (
  SELECT event_day, emp_id, (out_time - in_time) countT
  FROM Employees
)

SELECT event_day day, emp_id, Sum(countT) total_time
FROM CountTime
GROUP BY event_day, emp_id
