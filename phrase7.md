



# Coffee Cooperative Management System
## Database Implementation Project

### Project Overview
A comprehensive database management system designed for coffee cooperatives in Rwanda, implementing advanced PL/SQL features for automated transaction processing, data integrity maintenance, and security management. The system utilizes triggers, cursors, functions, and packages to streamline cooperative operations and ensure data accuracy.

### Key Technical Features
- Automated transaction logging using database triggers
- Real-time data validation and error handling
- Role-based access control implementation
- Comprehensive audit trail system
- Modular PL/SQL packages for business logic
- Custom reporting functionalities using cursors

### Business Value
- Improved data accuracy and consistency
- Enhanced operational efficiency
- Reduced manual intervention in data processing
- Better compliance with regulatory requirements
- Real-time monitoring of cooperative performance
- Secure and traceable transaction history

### Technical Implementation
The system employs Oracle Database's advanced features including:
- Multi-level triggers for complex business rules
- Stored procedures for standardized operations
- Package-based organization of database components
- Custom functions for business calculations
- Automated audit logging mechanisms


This description effectively outlines your project's scope, features, and business value. Would you like any adjustments to better match your project's focus?


```sql

CREATE TABLE audit_logs (
    log_id NUMBER PRIMARY KEY,
    action VARCHAR2(50),
    user_name VARCHAR2(50),
    timestamp DATE,
    details VARCHAR2(200)
);

-- Validation Trigger
CREATE OR REPLACE TRIGGER validate_sales
BEFORE INSERT ON sales_records
FOR EACH ROW
BEGIN
    IF :NEW.kilograms_sold <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Kilograms sold must be positive.');
    END IF;
END;
/

-- Update Consistency Trigger
CREATE OR REPLACE TRIGGER update_consistency
FOR INSERT OR UPDATE ON farm_records
COMPOUND TRIGGER
    BEFORE EACH ROW IS
    BEGIN
        -- Validate farm record updates
        IF :NEW.farmer_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20002, 'Farmer ID cannot be null');
        END IF;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Log the transaction
        INSERT INTO audit_logs(action, user_name, timestamp, details)
        VALUES('FARM_UPDATE', USER, SYSDATE, 'Farm records updated');
    END AFTER STATEMENT;
END;
/

-- Cooperative Management Package
CREATE OR REPLACE PACKAGE coop_management_pkg IS
    -- Calculate total sales for a cooperative
    FUNCTION calculate_total_sales(p_coop_id NUMBER) RETURN NUMBER;
    
    -- Log system activity
    PROCEDURE log_activity(p_action VARCHAR2, p_user VARCHAR2);
    
    -- Generate sales report
    PROCEDURE generate_sales_report(p_start_date DATE, p_end_date DATE);
END coop_management_pkg;
/

CREATE OR REPLACE PACKAGE BODY coop_management_pkg IS
    FUNCTION calculate_total_sales(p_coop_id NUMBER) RETURN NUMBER IS
        v_total_sales NUMBER;
    BEGIN
        SELECT NVL(SUM(sales_frw), 0)
        INTO v_total_sales
        FROM sales_records
        WHERE cooperative_id = p_coop_id;
        RETURN v_total_sales;
    END calculate_total_sales;

    PROCEDURE log_activity(p_action VARCHAR2, p_user VARCHAR2) IS
    BEGIN
        INSERT INTO audit_logs (action, user_name, timestamp)
        VALUES (p_action, p_user, SYSDATE);
        COMMIT;
    END log_activity;

    PROCEDURE generate_sales_report(p_start_date DATE, p_end_date DATE) IS
        CURSOR sales_cursor IS
            SELECT c.name, SUM(s.sales_frw) total_sales, COUNT(*) transaction_count
            FROM cooperatives c
            JOIN sales_records s ON c.cooperative_id = s.cooperative_id
            WHERE s.sale_date BETWEEN p_start_date AND p_end_date
            GROUP BY c.name;
    BEGIN
        FOR sales_rec IN sales_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('Cooperative: ' || sales_rec.name ||
                               ' Total Sales: ' || sales_rec.total_sales ||
                               ' Transactions: ' || sales_rec.transaction_count);
        END LOOP;
    END generate_sales_report;
END coop_management_pkg;
/

-- Audit Trigger for Sales Updates
CREATE OR REPLACE TRIGGER audit_sales_update
AFTER UPDATE ON sales_records
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (action, user_name, timestamp, details)
    VALUES ('UPDATE', USER, SYSDATE, 
            'Sales Record Updated - ID: ' || :NEW.transaction_id ||
            ' Old Amount: ' || :OLD.sales_frw ||
            ' New Amount: ' || :NEW.sales_frw);
END;
/

```

Key features implemented:

1. Base tables for cooperatives, farmers, sales records, and audit logs
2. Data validation triggers
3. Compound trigger for update consistency
4. Package with sales calculation and reporting functions
5. Audit logging system

