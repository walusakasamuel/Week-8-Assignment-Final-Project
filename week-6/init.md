## 🎯 Hands-on Class Activity


### Database Normalization With Real-World Examples

```sql
CREATE TABLE PizzaOrders (
    OrderID INT,
    CustomerName VARCHAR(50),
    CustomerPhone VARCHAR(20),
    PizzaType VARCHAR(50),
    Toppings VARCHAR(100),
    DeliveryAddress VARCHAR(100)
);

INSERT INTO PizzaOrders VALUES
(1, 'Alice', '0711111111', 'Margherita', 'Cheese, Tomato', 'Nairobi'),
(2, 'Bob', '0722222222', 'Pepperoni', 'Pepperoni, Cheese, Tomato', 'Mombasa'),
(3, 'Alice', '0711111111', 'Hawaiian', 'Pineapple, Ham, Cheese', 'Nairobi');
```

**First Normal Form (1NF)**

This normalization level ensures that each column in your data contains only atomic values.
##### Unnormalized Table
```sql
CREATE TABLE Student (
    Student_id INT PRIMARY KEY,
    Student_Email VARCHAR(100),
    Courses_Completed VARCHAR(255)
);

INSERT INTO Student (Student_id, Student_Email, Courses_Completed) VALUES
(235, 'jim@gmail.com', 'Introduction to Python, Intermediate Python'),
(455, 'kelly@yahoo.com', 'Cleaning Data in R'),
(767, 'amy@hotmail.com', 'Machine Learning Toolbox, Deep Learning in Python');

```

**Second Normal Form (2NF)**

Eliminates partial dependencies by ensuring that non-key attributes depend only on the primary key. What this means, in essence, is that there should be a direct relationship between each column and the primary key, and not between other columns.

**Third Normal Form (3NF)**

Removes transitive dependencies by ensuring that non-key attributes depend only on the primary key. This level of normalization builds on 2NF.
