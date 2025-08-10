## 🎯 Hands-on Class Activity

To Mark the beginning of a transaction
```sql
START TRANSACTION
```
Apply the changes of a transaction to the database.
```sql
COMMIT
```
Undo the changes of a transaction by reverting the database to the state before the transaction starts.
```sql
ROLLBACK
```
To instruct MySQL to not start a transaction implicitly and commit the changes automatically
```sql
SET autocommit = OFF;
```
### Transactions example
```sql
CREATE DATABASE stadium;
USE stadium;
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);
```
### COMMIT Example
```sql
START TRANSACTION;

INSERT INTO users (id, username) 
VALUES (1, 'peter');

UPDATE users 
SET email = 'peter@mail.com' 
WHERE id = 1;
COMMIT;
```
Select data from the users table
```sql
SELECT * FROM users;
```
### ROLLBACK Example
```sql
START TRANSACTION;
INSERT INTO users (id, username) 
VALUES (2, 'sharon');

UPDATE users 
SET email = 'sharon@mail.com' 
WHERE id = 2;
ROLLBACK;
```
Select data from the users table
```sql
SELECT * FROM users;
```
### Aggregate Functions
**AVG() function** calculates the average value of a set of values
```sql
SELECT 
    AVG(buyPrice) avg_buy_price
FROM 
    products;
```
**COUNT() function** function returns the number of the values in a set.
```sql
SELECT 
    COUNT(*) AS total
FROM 
    products;
```
**SUM() function** returns the sum of values in a set.
```sql
SELECT 
    productCode, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderDetails
GROUP BY productCode
ORDER BY total DESC;
```
