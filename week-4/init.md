## 🎯 Hands-on Class Activity

### MySQL CREATE USER statement
To create a new user in the MySQL database, you use the **CREATE USER** statement.
```sql
CREATE USER jontefresh@localhost IDENTIFIED BY '1234';
```
To show the users on the current MySQL Server:
```sql
SELECT user 
FROM mysql.user;
```
### MySQL GRANT statement
You use the **GRANT** statement to assign one or more privileges to a user account.
**Global Privileges**
To grant all privileges in all databases in the current database server
```sql
GRANT ALL ON *.* TO jontefresh@localhost;
```
To show the privileges assigned to jontefresh
```sql
SHOW GRANTS FOR jontefresh@localhost;
```
### MySQL roles
MySQL database server may have multiple users with the same set of privileges.
A **role** is essentially a named collection of privileges.
**roles example**
```sql
CREATE DATABASE coffeehouse;
USE coffeehouse;
CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255)
);
INSERT INTO customers(first_name,last_name,phone,email)
VALUES('James','brown','123456','james@mail.com'),
      ('Michael','white','123789','white@mail.com');
SELECT * FROM customers;
```
**create new roles**
```sql
CREATE ROLE dev, accounts, barista;
```
**Granting privileges to roles**
The following statement grants all privileges to dev role:
```sql
GRANT ALL ON coffehouse.* TO dev;
```
The following statement grants **INSERT**, **UPDATE**, and **DELETE** privileges to accounts role
```sql
GRANT INSERT, UPDATE, DELETE ON coffeehouse.* TO accounts;
```
The following statement grants **SELECT** privilege to barista role
```sql
GRANT SELECT ON cofeehouse.* TO barista;
```
### Assigning roles to user accounts
```sql
-- developer user 
CREATE USER jontefresh@localhost IDENTIFIED BY 'pass';

-- read access user
CREATE USER wayne@localhost IDENTIFIED BY 'pass';    

-- read/write users
CREATE USER brenda@localhost IDENTIFIED BY '1234';   
CREATE USER ann@localhost IDENTIFIED BY '1234';
```
### MySQL REVOKE statement
The **REVOKE** statement revokes one or more privileges from a user account.
```sql
REVOKE ALL, GRANT OPTION FROM jontefresh@localhost;
```
#### revoke privileges from a user
```sql
-- create a new user 
CREATE USER tamara@localhost IDENTIFIED BY '1234';
-- grant privilege
GRANT SELECT, UPDATE, INSERT ON salesdb.* TO tamara@localhost;
-- display the granted privileges
SHOW GRANTS FOR tamara@localhost;
-- revoke privilege
REVOKE INSERT, UPDATE ON salesdb.* FROM  tamara@localhost;
```
