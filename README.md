# Coffee Cooperative Management System

> *"Transforming Coffee Cooperatives Through Digital Innovation"*

## 📝 Project Overview

The Coffee Cooperative Management System is a comprehensive database solution designed to streamline the operations of Rwandan coffee farming cooperatives. This system addresses the challenges in organizing and managing data related to farming activities, cooperative members, resource usage, financial transactions, and buyer relationships.

## 🎯 Problem Statement

Rwandan coffee farming cooperatives face substantial challenges in:
- Organizing and managing farming data
- Tracking cooperative member contributions
- Maintaining accurate farm records
- Coordinating cooperative management
- Processing financial transactions
- Managing buyer relationships

## 🎁 Features
# Phase 2: Business Process Modeling for Coffee Cooperative Management System

## 1. Project Scope

This project aims to develop a centralized, structured database system designed to address the specific operational needs of Rwandan coffee cooperatives. The system will:

- Create a comprehensive database to record and manage critical data
- Track farmers, cooperatives, cooperative managers, farm plots, sales transactions, and buyers
- Streamline daily operations
- Enhance data accuracy
- Support decision-making processes

## 2. Objectives of the Database

### Primary Objectives:

1. **Efficient Tracking of Farmers and Farm Activities**
   - Store comprehensive farmer and farm plot information
   - Support clear production activity tracking
   - Enable tailored farmer support based on profiles and locations

2. **Enhanced Financial Transparency**
   - Record all coffee sales transactions
   - Provide clear visibility into cash flow
   - Ensure financial oversight for cooperative members and stakeholders

3. **Streamlined Buyer and Market Interaction**
   - Maintain buyer relationship records
   - Track market demand and preferences
   - Foster long-term buyer partnerships

4. **Real-Time Reporting and Data-Driven Decision-Making**
   - Generate real-time reports
   - Empower cooperative leaders with actionable insights
   - Improve productivity, coffee quality, and profitability

## 3. Key Entities

### Farmers
- **Role**: Primary coffee producers
- **Data Tracked**:
  - Farmer_ID
  - Farmer_Name
  - District
  - Sector
  - Plot_Name
  - Cooperative_Name

### Cooperatives
- **Role**: Organizational structure managing farmer groups
- **Data Tracked**:
  - Cooperative_ID
  - Cooperative_Name
  - District
  - Sector
  - Number_of_Members
  - Manager_ID

### Cooperative Managers
- **Role**: Oversee day-to-day cooperative activities
- **Data Tracked**:
  - Manager_ID
  - Manager_Name
  - Cooperative_Name
  - Plot_Name
  - Plot_ID

### Farm Records
- **Role**: Document specific farm plot details
- **Data Tracked**:
  - Plot_ID
  - Plot_Name
  - District
  - Sector

### Sales Records
- **Role**: Track coffee transactions
- **Data Tracked**:
  - Transaction_ID
  - Farmer_ID
  - Farmer_Name
  - Plot_ID
  - Plot_Name
  - Cooperative_ID
  - Cooperative_Name
  - Kilograms_Sold
  - Sales_FRW

### Buyers Records
- **Role**: Maintain information about coffee purchasers
- **Data Tracked**:
  - Buyer_ID
  - Business_Name
  - Owner_Name
  - Date_Purchased
  - Quantity_Purchased_KG
  - Amount_Spent_FRW


## 4. Project Benefits

- Centralized data management
- Improved operational efficiency
- Enhanced financial transparency
- Better resource allocation
- Real-time reporting capabilities

## 5.BPMN DIAGRAM 
![Screenshot 2024-12-05 093431](https://github.com/user-attachments/assets/9cf2c3e8-c70a-444c-ac4d-cb84cb07496a)


## 6.BPMN Diagram Explanation

Our business process model is designed to comprehensively manage and integrate critical information within a coffee cooperative ecosystem. The model captures the intricate relationships between key entities to facilitate efficient operations.
The business model is structured to manage and integrate critical information within a coffee cooperative. Key entities include Farmers, who provide production data; Cooperatives, which organize and manage groups of farmers; and Cooperative Managers, who oversee daily activities and resource distribution within each cooperative. Farm Records store details about specific farm plots, while Sales Records document all coffee sales transactions, linking each sale to the relevant farmer, plot, and cooperative. Finally, Buyers Records track information about market clients purchasing coffee, helping to maintain buyer relationships and support sales strategies.
This model incorporates primary and foreign keys to enforce data integrity and ensure accurate relationships across entities, allowing the cooperative to track production, sales, and buyer interactions effectively. Through this centralized data structure, cooperatives can make data-driven decisions, maintain financial transparency, and efficiently allocate resources to improve overall operations.

## 7.These diagrams show:
1.	Class Diagram:
○	All major classes with attributes and methods
○	Relationships between classes
○	Multiplicity of relationships
![Screenshot 2024-11-14 124259](https://github.com/user-attachments/assets/f015d986-b5dc-4fda-b341-e9e8515c72d4)
## 8.Activity Diagram:
○	Complete workflow from data recording to strategy planning
○	Decision points and alternative flows
○	Important notes for key activities
![Screenshot 2024-11-14 124316](https://github.com/user-attachments/assets/ffcd6a33-fa3f-4e5c-846a-1539627affb7)
## 9.Sequence Diagram:
○	Temporal flow of interactions between system components
○	Message exchange between different actors
○	Activity timing and dependencies
![Screenshot 2024-11-14 124333](https://github.com/user-attachments/assets/d4c1b372-9424-4955-945e-1374d857b591)

## The diagrams together provide a comprehensive view of:
●	System structure (Class Diagram)
●	Process flow (Activity Diagram)
●	Component interactions (Sequence Diagram)

## 10.LOGIC MODEL DESIGN
![image](https://github.com/user-attachments/assets/cf1b0cf2-a0f3-444c-a4d0-b29c2616fc27)



⌨️ with ❤️ by Penguin Group 🚀
