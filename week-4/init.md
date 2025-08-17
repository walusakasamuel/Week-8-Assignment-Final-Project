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
