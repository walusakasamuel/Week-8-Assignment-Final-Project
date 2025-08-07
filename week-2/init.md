
## 🎯 Hands-on Class Activity: Let’s Build a Database Together
_Today’s mission: Create and explore a database, perform CRUD operations using both Terminal and MySQL Workbench._

#### CREATE TABLE statement example
```bash
CREATE TABLE tasks (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE
);
```
**another example.....**
```bash
CREATE TABLE contacts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(320) NOT NULL
);
```
**insert data**
```bash
INSERT INTO contacts(name, email)
VALUES('Jonte', 'john@mail.com');
```
**Fetch Data**

```bash
SELECT * FROM contacts;
```
### Defining a structured customer table with various data types.
```bash
CREATE TABLE customers (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    date_of_birth DATE,
    signup_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
#### Viewing Table Structure
🔍 **Step 2: Inspect What You Created**

Let’s peek under the hood and see the table structure.
```bash
DESCRIBE customers;
```
**This helps you confirm all columns were created properly**
```bash
SHOW COLUMNS FROM customers;
```
**Inserting data**

Time to bring your table to life. Let’s add some sample customers, feel free to come up with your own names if you're feeling creative.

```bash
INSERT INTO customers (name, email, phone, address, date_of_birth)
VALUES
('Alice', 'alice.kimani@example.com', '+254723478', 'Nairobi', '1995-08-10');

INSERT INTO customers (name, email, phone, address, date_of_birth)
VALUES
('Brian', 'brian.otieno@example.com', '+2548765432', 'Kisumu', '1990-02-25');

INSERT INTO customers (name, email, phone, address, date_of_birth)
VALUES
('Carol', 'carol.wanjiku@example.com', '+25434567', 'Mombasa', '1988-12-15');

```
### 📦 Bonus: Check Your Data
```bash
SELECT * FROM customers;
```

> 💬 Challenge: Try inserting your own data with your name. Change the values be creative.


### Altering Tables
Modifying table after creation.

**Adding Columns**

Use the ALTER TABLE statement to add a new column to an existing table.
```bash
ALTER TABLE customers
ADD COLUMN paid BOOLEAN DEFAULT FALSE;
```
**Dropping Columns**

You can remove a column from a table using the ALTER TABLE statement.
```bash
ALTER TABLE customers
DROP COLUMN paid;
```
### 🧪 Load a Sample Database
If you’ve downloaded a [sample SQL](https://drive.google.com/file/d/1ClfnXsCfg5OnB7aLsS3zjaPSBo66YApM/view?usp=sharing) file (e.g. salesDB.sql), here’s how to load it:
1. Make sure you know where the file is saved on your computer.
2. In your terminal, run:
```bash
mysql -u root -p < salesDB.sql
```
3. Then open MySQL and run:
```bash
USE salesDB;
SHOW TABLES;
```
_🔍 Voilà! You should see the tables loaded from the file._
