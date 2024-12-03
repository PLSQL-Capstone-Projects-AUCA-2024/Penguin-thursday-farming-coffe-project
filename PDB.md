# Penguin Thursday Coffee Project

## Overview
The Penguin Thursday Coffee Project is a Coffee Cooperative Management System designed to enhance operational efficiency for Rwandan coffee farming cooperatives. The system manages farmers, cooperatives, sales, and transactions through a scalable database.

## Table of Contents
- [Database Setup](#database-setup)
- [Table Structure](#table-structure)
- [Sample Data](#sample-data)
- [Query Examples](#query-examples)

## Database Setup

Connect to Oracle and set container:
```sql
sqlplus / as sysdba
ALTER SESSION SET CONTAINER=thur_penguin_farmingcoffeproject;
```

## Table Structure

### Farmers Table
```sql
CREATE TABLE farmers (
    Farmer_ID INT PRIMARY KEY,
    Farmer_Name VARCHAR2(100),
    District VARCHAR2(100),
    Sector VARCHAR2(100),
    Plot_Name VARCHAR2(100),
    Plot_ID INT
);
```

### Cooperatives Table
```sql
CREATE TABLE cooperatives (
    Cooperative_ID INT PRIMARY KEY,
    Cooperative_Name VARCHAR2(100),
    District VARCHAR2(100),
    Sector VARCHAR2(100),
    Number_of_Members INT,
    Manager_ID INT,
    Manager_Name VARCHAR2(100)
);
```

### Cooperative Managers Table
```sql
CREATE TABLE cooperative_managers (
    Manager_ID INT PRIMARY KEY,
    Manager_Name VARCHAR2(100),
    Cooperative_Name VARCHAR2(100),
    Plot_Name VARCHAR2(100),
    Plot_ID INT
);
```

### Farm Records Table
```sql
CREATE TABLE farm_records (
    Plot_ID INT PRIMARY KEY,
    Plot_Name VARCHAR2(100),
    District VARCHAR2(100),
    Sector VARCHAR2(100)
);
```

### Sales Records Table
```sql
CREATE TABLE sales_records (
    Transaction_ID INT PRIMARY KEY,
    Farmer_ID INT,
    Farmer_Name VARCHAR2(100),
    Plot_ID INT,
    Plot_Name VARCHAR2(100),
    Cooperative_ID INT,
    Cooperative_Name VARCHAR2(100),
    Kilograms_Sold INT,
    Sales_FRW INT
);
```

### Buyers Records Table
```sql
CREATE TABLE buyers_records (
    Buyer_ID INT PRIMARY KEY,
    Business_Name VARCHAR2(100),
    Owner_Name VARCHAR2(100),
    Date_Purchased DATE,
    Quantity_Purchased_KG INT,
    Amount_Spent_FRW INT
);
```

## Sample Data

### Insert Farmers
```sql
INSERT INTO farmers VALUES (1, 'John Doe', 'Kigali', 'Nyarugenge', 'Farm Plot A', 101);
INSERT INTO farmers VALUES (2, 'Jane Smith', 'Kigali', 'Gasabo', 'Farm Plot B', 102);
INSERT INTO farmers VALUES (3, 'Michael Johnson', 'Rwanda', 'Kigali', 'Farm Plot C', 103);
```

### Insert Cooperatives
```sql
INSERT INTO cooperatives VALUES (1, 'Kigali Farmers Coop', 'Kigali', 'Nyarugenge', 50, 1, 'Alice Cooper');
INSERT INTO cooperatives VALUES (2, 'Rwanda Coop', 'Kigali', 'Gasabo', 30, 2, 'Bob Green');
```

### Insert Sales Records
```sql
INSERT INTO sales_records VALUES (1, 1, 'John Doe', 101, 'Farm Plot A', 1, 'Kigali Farmers Coop', 200, 150000);
INSERT INTO sales_records VALUES (2, 2, 'Jane Smith', 102, 'Farm Plot B', 2, 'Rwanda Coop', 150, 120000);
```

### Insert Buyers Records
```sql
INSERT INTO buyers_records VALUES (1, 'Fresh Foods Ltd.', 'Peter Pan', TO_DATE('2024-11-25', 'YYYY-MM-DD'), 100, 80000);
INSERT INTO buyers_records VALUES (2, 'Farmers Market', 'Laura Green', TO_DATE('2024-11-26', 'YYYY-MM-DD'), 80, 64000);
```

## Query Examples

### Join Farmers and Sales Records
```sql
SELECT f.Farmer_Name, f.District, f.Sector, s.Transaction_ID, s.Kilograms_Sold, s.Sales_FRW
FROM farmers f
INNER JOIN sales_records s ON f.Farmer_ID = s.Farmer_ID;
```

### Join Cooperatives and Managers
```sql
SELECT c.Cooperative_Name, c.District, c.Sector, cm.Manager_Name
FROM cooperatives c
LEFT JOIN cooperative_managers cm ON c.Manager_ID = cm.Manager_ID;
```

### Join Farm Records and Farmers
```sql
SELECT f.Farmer_Name, fr.Plot_Name, fr.District, fr.Sector
FROM farm_records fr
RIGHT JOIN farmers f ON fr.Plot_ID = f.Plot_ID;
```
