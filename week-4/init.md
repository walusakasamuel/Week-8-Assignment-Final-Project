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
Apply to all databases in a MySQL Server:
```sql
GRANT ALL ON *.* TO jontefresh@localhost;
```
To show the privileges assigned to jontefresh
```sql
SHOW GRANTS FOR jontefresh@localhost;
```
