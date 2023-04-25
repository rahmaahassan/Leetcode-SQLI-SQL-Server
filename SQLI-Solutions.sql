--
1) 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+
name is the primary key column for this table.
Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.
A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).

Write an SQL query to report the name, population, and area of the big countries.
Return the result table in any order.
--

SELECT name, population, area
FROM world
WHERE area >= 3000000 or population >= 25000000
ORDER BY name

--
2)
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key for this table.
low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.

Write an SQL query to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
--

SELECT product_id
FROM Products
WHERE low_fats = 'Y' and recyclable = 'Y'
ORDER BY product_id

--
3)
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
--

SELECT name
FROM Customer
WHERE referee_id <> 2 or referee_id is null

--
4)
Table: Customers
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.

Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key column for this table.
customerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

Write an SQL query to report all customers who never order anything.
Return the result table in any order.
--

SELECT name Customers
FROM customers
WHERE id not in (
    SELECT customerID
    FROM orders
)

--
5)
Table: Employees
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the employee ID, employee name, and salary.

Write an SQL query to calculate the bonus of each employee. 
The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. 
The bonus of an employee is 0 otherwise.
Return the result table ordered by employee_id.
--

select employee_id, 
case when employee_id%2 <>0 and name not like 'M%' then salary 
else 0 end as bonus
from employees
order by employee_id

--
6)
Table: Salary
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |
+-------------+----------+
id is the primary key for this table.
The sex column is ENUM value of type ('m', 'f').
The table contains information about an employee.
 
Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
with a single update statement and no intermediate temporary tables.
Note that you must write a single update statement, do not write any select statement for this problem.
--

update salary
set sex = case when sex = 'm' then 'f'
           else 'm' end 

--
7)
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
Note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table.
The final order of the Person table does not matter.
--

delete A from Person A, Person B 
where A.id > B.id and A.email=B.email

--
8)
Table: Users
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 
Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
Return the result table ordered by user_id.
--

SELECT user_id, Upper(left(name, 1)) + lower(Substring(name, 2, len(name) -1)) name
FROM users
ORDER BY user_id

--
9)
Table Activities:
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key for this table, it may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 
Write an SQL query to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by sell_date.
--

SELECT sell_date, count(product) num_sold,
       string_agg(product, ',') products
FROM (SELECT DISTINCT * from Activities) tabel1
GROUP BY sell_date
ORDER BY sell_date

--
10)
Table: Patients
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.
 
Write an SQL query to report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. 
Type I Diabetes always starts with DIAB1 prefix.
Return the result table in any order.
--

SELECT *
FROM Patients
WHERE conditions like '% DIAB1%' or conditions like 'DIAB1%'

--
11)
Table: Employees
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.
 
Table: Salaries
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
 
Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:
The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.
--

SELECT employee_id
FROM employees
WHERE employee_id not in (
    SELECT employee_id
    FROM Salaries
)
union
SELECT employee_id
from salaries
WHERE employee_id not in (
    SELECT employee_id
    from employees
)

--
12)
Table: Products
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store1      | int     |
| store2      | int     |
| store3      | int     |
+-------------+---------+
product_id is the primary key for this table.
Each row in this table indicates the product's price in 3 different stores: store1, store2, and store3.
If the product is not available in a store, the price will be null in that store's column.
 
Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
Return the result table in any order.
--

SELECT product_id, store, price
FROM products
UNPIVOT (
    price for store in (store1, store2, store3)
) unpivoting

--
13) 
Table: Tree
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| p_id        | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the id of a node and the id of its parent node in a tree.
The given structure is always a valid tree.
 
Each node in the tree can be one of three types:
"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.
Write an SQL query to report the type of each node in the tree.
Return the result table in any order.
--

SELECT id,Case 
       when p_id is null then 'Root'
       when id in (select p_id from tree) and 
       p_id in (select id from tree) then 'Inner'
       else 'Leaf' end as type
FROM Tree
