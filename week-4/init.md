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
### MySQL REVOKE statement
The **REVOKE** statement revokes one or more privileges from a user account.
```sql
REVOKE ALL, GRANT OPTION FROM jontefresh@localhost;
```
```sql
-- create a new user 
CREATE USER tamara@localhost IDENTIFIED BY '1234';
-- grant privilege
GRANT SELECT, UPDATE, INSERT ON salesdb.* TO tamara@localhost;
-- revoke privilege
REVOKE INSERT, UPDATE ON salesdb.* FROM  tamara@localhost;
```
