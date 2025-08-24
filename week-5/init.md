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
