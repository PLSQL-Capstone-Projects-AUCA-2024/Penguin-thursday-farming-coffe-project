Microsoft Windows [Version 10.0.19045.5131]
(c) Microsoft Corporation. All rights reserved.

C:\Users\User>sqlplus /as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Use SQL*Plus to execute SQL, PL/SQL and SQL*Plus statements.

Usage 1: sqlplus -H | -V

    -H             Displays the SQL*Plus version and the
                   usage help.
    -V             Displays the SQL*Plus version.

Usage 2: sqlplus [ [<option>] [{logon | /nolog}] [<start>] ]

  <option> is: [-C <version>] [-F] [-L] [-M "<options>"] [-NOLOGINTIME]
               [-R <level>] [-S]

    -C <version>   Sets the compatibility of affected commands to the
                   version specified by <version>.  The version has
                   the form "x.y[.z]".  For example, -C 10.2.0
    -F             This option improves performance in general. It changes
                   the default values settings.
                   See SQL*Plus User's Guide for the detailed settings.
    -L             Attempts to log on just once, instead of
                   reprompting on error.
    -M "<options>" Sets automatic HTML or CSV markup of output.  The options
                   have the form:
                   {HTML html_options|CSV csv_options}
                   See SQL*Plus User's Guide for detailed HTML and CSV options.
    -NOLOGINTIME   Don't display Last Successful Login Time.
    -R <level>     Sets restricted mode to disable SQL*Plus commands
                   that interact with the file system.  The level can
                   be 1, 2 or 3.  The most restrictive is -R 3 which
                   disables all user commands interacting with the
                   file system.
    -S             Sets silent mode which suppresses the display of
                   the SQL*Plus banner, prompts, and echoing of
                   commands.

  <logon> is: {<username>[/<password>][@<connect_identifier>] | / }
              [AS {SYSDBA | SYSOPER | SYSASM | SYSBACKUP | SYSDG
              | SYSKM | SYSRAC}] [EDITION=value]

    Specifies the database account username, password and connect
    identifier for the database connection.  Without a connect
    identifier, SQL*Plus connects to the default database.

    The AS SYSDBA, AS SYSOPER, AS SYSASM, AS SYSBACKUP, AS SYSDG,
    AS SYSKM and AS SYSRAC options are database administration privileges.

    <connect_identifier> can be in the form of Net Service Name
    or Easy Connect.

      @[<net_service_name> | [[//]Host[:Port]/<service_name>] |
        [[[protocol:]//]host1{,host12}[:port1]{,host2:port2}[/service_name]
         [:server][/instance_name][?[parameter_name=value]
         {&parameter_name=value}]]]

        <net_service_name> is a simple name for a service that resolves
        to a connect descriptor.

        Example: Connect to database using Net Service Name and the
                 database net service name is ORCL.

           sqlplus myusername/mypassword@ORCL

        Host specifies the host name or IP address of the database
        server computer.

        Port specifies the listening port on the database server.

        <service_name> specifies the service name of the database you
        want to access.

        Example: Connect to database using Easy Connect and the
                 Service name is ORCL.

           sqlplus myusername/mypassword@Host/ORCL

    The /NOLOG option starts SQL*Plus without connecting to a
    database.

    The EDITION specifies the value for Session Edition.


  <start> is: @<URL>|<filename>[.<ext>] [<parameter> ...]

    Runs the specified SQL*Plus script from a web server (URL) or the
    local file system (filename.ext) with specified parameters that
    will be assigned to substitution variables in the script.

When SQL*Plus starts, and after CONNECT commands, the site profile
(e.g. $ORACLE_HOME/sqlplus/admin/glogin.sql) and the user profile
(e.g. login.sql in the working directory) are run.  The files may
contain SQL*Plus commands.

Refer to the SQL*Plus User's Guide and Reference for more information.

C:\Users\User>sqlplus / as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Tue Nov 26 18:37:11 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.


Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> SHOW CON_NAME;

CON_NAME
------------------------------
CDB$ROOT
SQL> ALTER SESSION SET CONTAINER=thur_penguin_farmingcoffeproject;

Session altered.

SQL> CREATE TABLE farmers (
  2      Farmer_ID INT PRIMARY KEY,
  3      Farmer_Name VARCHAR2(100),
  4      District VARCHAR2(100),
  5      Sector VARCHAR2(100),
  6      Plot_Name VARCHAR2(100),
  7      Plot_ID INT
  8  );

Table created.

SQL> CREATE TABLE Cooperatives (    Cooperative_ID NUMBER PRIMARY KEY,    Cooperative_Name VARCHAR2(100) NOT NULL,    District VARCHAR2(50) NOT NULL,    Sector VARCHAR2(50) NOT NULL,    Number_of_Members NUMBER NOT NULL,    Manager_ID NUMBER,    Manager_Name VARCHAR2(100),    FOREIGN KEY (Manager_ID) REFERENCES Cooperative_Managers(Manager_ID));
CREATE TABLE Cooperatives (    Cooperative_ID NUMBER PRIMARY KEY,    Cooperative_Name VARCHAR2(100) NOT NULL,    District VARCHAR2(50) NOT NULL,    Sector VARCHAR2(50) NOT NULL,    Number_of_Members NUMBER NOT NULL,    Manager_ID NUMBER,
         Manager_Name VARCHAR2(100),    FOREIGN KEY (Manager_ID) REFERENCES Cooperative_Managers(Manager_ID))
                                                                                                                                                                                                                                                                                                                    *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> CREATE TABLE cooperatives (
  2      Cooperative_ID INT PRIMARY KEY,
  3      Cooperative_Name VARCHAR2(100),
  4      District VARCHAR2(100),
  5      Sector VARCHAR2(100),
  6      Number_of_Members INT,
  7      Manager_ID INT,
  8      Manager_Name VARCHAR2(100)
  9  );

Table created.

SQL> CREATE TABLE cooperative_managers (
  2      Manager_ID INT PRIMARY KEY,
  3      Manager_Name VARCHAR2(100),
  4      Cooperative_Name VARCHAR2(100),
  5      Plot_Name VARCHAR2(100),
  6      Plot_ID INT
  7  );

Table created.

SQL> CREATE TABLE farm_records (
  2      Plot_ID INT PRIMARY KEY,
  3      Plot_Name VARCHAR2(100),
  4      District VARCHAR2(100),
  5      Sector VARCHAR2(100)
  6  );

Table created.

SQL> CREATE TABLE sales_records (
  2      Transaction_ID INT PRIMARY KEY,
  3      Farmer_ID INT,
  4      Farmer_Name VARCHAR2(100),
  5      Plot_ID INT,
  6      Plot_Name VARCHAR2(100),
  7      Cooperative_ID INT,
  8      Cooperative_Name VARCHAR2(100),
  9      Kilograms_Sold INT,
 10      Sales_FRW INT
 11  );

Table created.

SQL> CREATE TABLE buyers_records (
  2      Buyer_ID INT PRIMARY KEY,
  3      Business_Name VARCHAR2(100),
  4      Owner_Name VARCHAR2(100),
  5      Date_Purchased DATE,
  6      Quantity_Purchased_KG INT,
  7      Amount_Spent_FRW INT
  8  );

Table created.

SQL> INSERT INTO farmers (Farmer_ID, Farmer_Name, District, Sector, Plot_Name, Plot_ID)
  2  VALUES (1, 'John Doe', 'Kigali', 'Nyarugenge', 'Farm Plot A', 101);

1 row created.

SQL>
SQL> INSERT INTO farmers (Farmer_ID, Farmer_Name, District, Sector, Plot_Name, Plot_ID)
  2  VALUES (2, 'Jane Smith', 'Kigali', 'Gasabo', 'Farm Plot B', 102);

1 row created.

SQL>
SQL> INSERT INTO farmers (Farmer_ID, Farmer_Name, District, Sector, Plot_Name, Plot_ID)
  2  VALUES (3, 'Michael Johnson', 'Rwanda', 'Kigali', 'Farm Plot C', 103);

1 row created.

SQL> INSERT INTO cooperatives (Cooperative_ID, Cooperative_Name, District, Sector, Number_of_Members, Manager_ID, Manager_Name)
  2  VALUES (1, 'Kigali Farmers Coop', 'Kigali', 'Nyarugenge', 50, 1, 'Alice Cooper');

1 row created.

SQL>
SQL> INSERT INTO cooperatives (Cooperative_ID, Cooperative_Name, District, Sector, Number_of_Members, Manager_ID, Manager_Name)
  2  VALUES (2, 'Rwanda Coop', 'Kigali', 'Gasabo', 30, 2, 'Bob Green');

1 row created.

SQL> INSERT INTO farm_records (Plot_ID, Plot_Name, District, Sector)
  2  VALUES (101, 'Farm Plot A', 'Kigali', 'Nyarugenge');

1 row created.

SQL>
SQL> INSERT INTO farm_records (Plot_ID, Plot_Name, District, Sector)
  2  VALUES (102, 'Farm Plot B', 'Kigali', 'Gasabo');

1 row created.

SQL>
SQL> INSERT INTO farm_records (Plot_ID, Plot_Name, District, Sector)
  2  VALUES (103, 'Farm Plot C', 'Rwanda', 'Kigali');

1 row created.

SQL> INSERT INTO sales_records (Transaction_ID, Farmer_ID, Farmer_Name, Plot_ID, Plot_Name, Cooperative_ID, Cooperative_Name, Kilograms_Sold, Sales_FRW)
  2  VALUES (1, 1, 'John Doe', 101, 'Farm Plot A', 1, 'Kigali Farmers Coop', 200, 150000);

1 row created.

SQL>
SQL> INSERT INTO sales_records (Transaction_ID, Farmer_ID, Farmer_Name, Plot_ID, Plot_Name, Cooperative_ID, Cooperative_Name, Kilograms_Sold, Sales_FRW)
  2  VALUES (2, 2, 'Jane Smith', 102, 'Farm Plot B', 2, 'Rwanda Coop', 150, 120000);

1 row created.

SQL> INSERT INTO buyers_records (Buyer_ID, Business_Name, Owner_Name, Date_Purchased, Quantity_Purchased_KG, Amount_Spent_FRW)
  2  VALUES (1, 'Fresh Foods Ltd.', 'Peter Pan', TO_DATE('2024-11-25', 'YYYY-MM-DD'), 100, 80000);

1 row created.

SQL>
SQL> INSERT INTO buyers_records (Buyer_ID, Business_Name, Owner_Name, Date_Purchased, Quantity_Purchased_KG, Amount_Spent_FRW)
  2  VALUES (2, 'Farmers Market', 'Laura Green', TO_DATE('2024-11-26', 'YYYY-MM-DD'), 80, 64000);

1 row created.

SQL> SELECT f.Farmer_Name, f.District, f.Sector, s.Transaction_ID, s.Kilograms_Sold, s.Sales_FRW
  2  FROM farmers f
  3  INNER JOIN sales_records s ON f.Farmer_ID = s.Farmer_ID;

FARMER_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
TRANSACTION_ID KILOGRAMS_SOLD  SALES_FRW
-------------- -------------- ----------
John Doe
Kigali
Nyarugenge
             1            200     150000


FARMER_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
TRANSACTION_ID KILOGRAMS_SOLD  SALES_FRW
-------------- -------------- ----------
Jane Smith
Kigali
Gasabo
             2            150     120000


SQL> SELECT c.Cooperative_Name, c.District, c.Sector, cm.Manager_Name
  2  FROM cooperatives c
  3  LEFT JOIN cooperative_managers cm ON c.Manager_ID = cm.Manager_ID;

COOPERATIVE_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
MANAGER_NAME
--------------------------------------------------------------------------------
Kigali Farmers Coop
Kigali
Nyarugenge



COOPERATIVE_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
MANAGER_NAME
--------------------------------------------------------------------------------
Rwanda Coop
Kigali
Gasabo



SQL> SELECT f.Farmer_Name, fr.Plot_Name, fr.District, fr.Sector
  2  FROM farm_records fr
  3  RIGHT JOIN farmers f ON fr.Plot_ID = f.Plot_ID;

FARMER_NAME
--------------------------------------------------------------------------------
PLOT_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
John Doe
Farm Plot A
Kigali
Nyarugenge


FARMER_NAME
--------------------------------------------------------------------------------
PLOT_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
Jane Smith
Farm Plot B
Kigali
Gasabo


FARMER_NAME
--------------------------------------------------------------------------------
PLOT_NAME
--------------------------------------------------------------------------------
DISTRICT
--------------------------------------------------------------------------------
SECTOR
--------------------------------------------------------------------------------
Michael Johnson
Farm Plot C
Rwanda
Kigali


SQL>