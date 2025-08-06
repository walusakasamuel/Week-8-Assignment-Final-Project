
## 🎯 Hands-on Class Activity: Let’s Build a Database Together
_Today’s mission: Create and explore a database, perform CRUD operations using both Terminal and MySQL Workbench._

### 🧪 Load a Sample Database
If you’ve downloaded a sample SQL file (e.g. salesDB.sql), here’s how to load it:
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
