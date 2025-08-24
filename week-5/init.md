## 🎯 Hands-on Class Activity
### 🚀 Joins and Relationships

**INNER JOIN clause**

The **INNER JOIN** matches each row in one table with every row in other tables and allows you to query rows that contain columns from both tables.
```sql
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products 
INNER JOIN productlines  
    USING(productline);
```
```sql
SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders 
INNER JOIN orderdetails 
    USING(orderNumber)
GROUP BY orderNumber;
```
**LEFT JOIN clause**
returns all rows from the left table, irrespective of whether a matching row from the right table exists or not.
```sql
SELECT
	customerNumber,
	customerName,
	orderNumber,
	status
FROM
	customers
LEFT JOIN orders USING (customerNumber);
```
