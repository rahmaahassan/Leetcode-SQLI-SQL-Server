/*
Table: Orders
+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key for this table.
This table contains information about the order ID and the customer ID.

Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
The test cases are generated so that exactly one customer will have placed more orders than any other customer.
*/

WITH maxOrders as (
 SELECT COUNT(order_number) orders, customer_number
          FROM orders
          GROUP BY customer_number
)

SELECT TOP(1) customer_number
FROM maxOrders
order by orders desc
