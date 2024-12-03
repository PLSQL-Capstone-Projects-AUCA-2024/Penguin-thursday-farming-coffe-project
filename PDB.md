# Penguin Farming Coffee Project - Database Implementation

## Project Overview
a
The **Penguin Farming Coffee Project** is a system designed to manage the operations of a coffee farming cooperative. This project involves the creation of a relational database to handle data related to farmers, cooperatives, farm records, sales transactions, and buyer details. The database is implemented in **Oracle** and includes tables to manage and query coffee farming-related data.

## Version

- **Database Version**: Oracle 21c Express Edition
- **SQL*Plus Version**: 21.0.0.0.0
- **Database Container Name**: `thur_penguin_farmingcoffeproject`

## Database Structure

The database schema includes the following tables:

### 1. Farmers Table
Stores information about farmers:
```sql
CREATE TABLE farmers (
  Farmer_ID INT PRIMARY KEY,
  Farmer_Name VARCHAR2(100),
  District VARCHAR2(100),
  Sector VARCHAR2(100),
  Plot_Name VARCHAR2(100),
  Plot_ID INT
);



# Penguin Farming Coffee Project - Database Implementation

## Project Overview

The **Penguin Farming Coffee Project** is a system designed to manage the operations of a coffee farming cooperative. This project involves the creation of a relational database to handle data related to farmers, cooperatives, farm records, sales transactions, and buyer details. The database is implemented in **Oracle** and includes tables to manage and query coffee farming-related data.

## Version

- **Database Version**: Oracle 21c Express Edition
- **SQL*Plus Version**: 21.0.0.0.0
- **Database Container Name**: `thur_penguin_farmingcoffeproject`

## Database Structure

The database schema includes the following tables:

### 1. Farmers Table
Stores information about farmers:
```sql
CREATE TABLE farmers (
  Farmer_ID INT PRIMARY KEY,
  Farmer_Name VARCHAR2(100),
  District VARCHAR2(100),
  Sector VARCHAR2(100),
  Plot_Name VARCHAR2(100),
  Plot_ID INT
);
 ### 2. Cooperatives Table
Stores details about the cooperatives:
CREATE TABLE cooperatives (
  Cooperative_ID INT PRIMARY KEY,
  Cooperative_Name VARCHAR2(100),
  District VARCHAR2(100),
  Sector VARCHAR2(100),
  Number_of_Members INT,
  Manager_ID INT,
  Manager_Name VARCHAR2(100)
);
3. Cooperative Managers Table
Stores information about the managers:
CREATE TABLE cooperative_managers (
  Manager_ID INT PRIMARY KEY,
  Manager_Name VARCHAR2(100),
  Cooperative_Name VARCHAR2(100),
  Plot_Name VARCHAR2(100),
  Plot_ID INT
);
4. Farm Records Table
Contains farm plot records:
CREATE TABLE farm_records (
  Plot_ID INT PRIMARY KEY,
  Plot_Name VARCHAR2(100),
  District VARCHAR2(100),
  Sector VARCHAR2(100)
);
5. Sales Records Table
Tracks sales made by farmers:
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
6. Buyers Records Table
Contains data about buyers:
CREATE TABLE buyers_records (
  Buyer_ID INT PRIMARY KEY,
  Business_Name VARCHAR2(100),
  Owner_Name VARCHAR2(100),
  Date_Purchased DATE,
  Quantity_Purchased_KG INT,
  Amount_Spent_FRW INT
);






