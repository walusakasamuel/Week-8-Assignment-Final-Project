## 🎯 Hands-on Class Activity: Let’s Build a Database Together
_Today’s mission: Create and explore a database using both Terminal and MySQL Workbench._

### 🖥️ Part 1: Using MySQL Workbench (a.k.a. Click & Code Mode 🖱️)

 🌀 **Step 1: Open Workbench & Connect:**
   - Open MySQL Workbench
   - Connect to your local database server

🧱 **Step 2: Create Your Database:**
  - Go to the SQL Editor
  - Paste this SQL command:
     
```sql
CREATE DATABASE <provide_a_database_name>;
```

Creating database using Terminal

### log to your terminal
```bash
mysql -uroot -p
```
ii. Create a database
```sql
CREATE DATABASE <provide_a_database_name>;
```
iii. Confirm database exists
```sql
SHOW DATABASES;
```
iv. How to tell the engine which database to work with
```sql
USE <the_name_of_your_database>;
```
