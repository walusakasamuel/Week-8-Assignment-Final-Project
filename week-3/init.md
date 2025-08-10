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
