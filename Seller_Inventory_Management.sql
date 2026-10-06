SQL> 
SQL> CREATE TABLE Seller (
  2  	 Seller_ID NUMBER PRIMARY KEY,
  3  	 Seller_Name VARCHAR2(100) NOT NULL,
  4  	 Store_Name VARCHAR2(100) NOT NULL,
  5  	 Email VARCHAR2(100),
  6  	 Phone_No VARCHAR2(15)
  7  );

Table created.

SQL> 
SQL> INSERT INTO Seller VALUES
  2  (201, 'Arun Kumar', 'Arun Electronics', 'arun@gmail.com', '9876543210');

1 row created.

SQL> 
SQL> INSERT INTO Seller VALUES
  2  (202, 'Priya Sharma', 'Priya Fashion', 'priya@gmail.com', '9876543211');

1 row created.

SQL> 
SQL> INSERT INTO Seller VALUES
  2  (203, 'Kavin Raj', 'Kavin Stores', 'kavin@gmail.com', '9876543212');

1 row created.

SQL> 
SQL> INSERT INTO Seller VALUES
  2  (204, 'Divya S', 'Divya Books', 'divya@gmail.com', '9876543213');

1 row created.

SQL> 
SQL> INSERT INTO Seller VALUES
  2  (205, 'Rahul Kumar', 'Rahul Beauty', 'rahul@gmail.com', '9876543214');

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Seller;

 SELLER_ID SELLER_NAME                                                                                                                                                                                  
---------- ----------------------------------------------------------------------------------------------------                                                                                         
STORE_NAME                                                                                                                                                                                              
----------------------------------------------------------------------------------------------------                                                                                                    
EMAIL                                                                                                PHONE_NO                                                                                           
---------------------------------------------------------------------------------------------------- ---------------                                                                                    
       201 Arun Kumar                                                                                                                                                                                   
Arun Electronics                                                                                                                                                                                        
arun@gmail.com                                                                                       9876543210                                                                                         
                                                                                                                                                                                                        
       202 Priya Sharma                                                                                                                                                                                 
Priya Fashion                                                                                                                                                                                           
priya@gmail.com                                                                                      9876543211                                                                                         
                                                                                                                                                                                                        
       203 Kavin Raj                                                                                                                                                                                    
Kavin Stores                                                                                                                                                                                            
kavin@gmail.com                                                                                      9876543212                                                                                         
                                                                                                                                                                                                        
       204 Divya S                                                                                                                                                                                      
Divya Books                                                                                                                                                                                             
divya@gmail.com                                                                                      9876543213                                                                                         
                                                                                                                                                                                                        
       205 Rahul Kumar                                                                                                                                                                                  
Rahul Beauty                                                                                                                                                                                            
rahul@gmail.com                                                                                      9876543214                                                                                         
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> CREATE TABLE Inventory (
  2  	 Inventory_ID NUMBER PRIMARY KEY,
  3  	 Product_ID NUMBER,
  4  	 Seller_ID NUMBER,
  5  	 Stock_Quantity NUMBER,
  6  	 Stock_Status VARCHAR2(30),
  7  	 Last_Updated DATE,
  8  	 FOREIGN KEY (Product_ID)
  9  	     REFERENCES Product(Product_ID),
 10  	 FOREIGN KEY (Seller_ID)
 11  	     REFERENCES Seller(Seller_ID)
 12  );

Table created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (301, 101, 201, 20, 'Available', TO_DATE('17-SEP-2026','DD-MON-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (302, 102, 202, 30, 'Available', TO_DATE('17-SEP-2026','DD-MON-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (303, 103, 203, 50, 'Available', TO_DATE('17-SEP-2026','DD-MON-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (304, 104, 201, 15, 'Available', TO_DATE('17-SEP-2026','DD-MON-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (305, 105, 204, 0, 'Unavailable', TO_DATE('17-SEP-2026','DD-MON-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO Inventory VALUES
  2  (306, 106, 205, 40, 'Available', TO_DATE('17-SEP-2026','DD-MON-YYYY'));
INSERT INTO Inventory VALUES
*
ERROR at line 1:
ORA-02291: integrity constraint (SYSTEM.SYS_C008516) violated - parent key not found 


SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Inventory;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS                   LAST_UPDA                                                                                                              
------------ ---------- ---------- -------------- ------------------------------ ---------                                                                                                              
         301        101        201             20 Available                      17-SEP-26                                                                                                              
         302        102        202             30 Available                      17-SEP-26                                                                                                              
         303        103        203             50 Available                      17-SEP-26                                                                                                              
         304        104        201             15 Available                      17-SEP-26                                                                                                              
         305        105        204              0 Unavailable                    17-SEP-26                                                                                                              

5 rows selected.

SQL> 
SQL> UPDATE Inventory
  2  SET Stock_Quantity = 25,
  3  	 Stock_Status = 'Available',
  4  	 Last_Updated = SYSDATE
  5  WHERE Inventory_ID = 301;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Inventory
  3  WHERE Inventory_ID = 301;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS                   LAST_UPDA                                                                                                              
------------ ---------- ---------- -------------- ------------------------------ ---------                                                                                                              
         301        101        201             25 Available                      06-OCT-26                                                                                                              

1 row selected.

SQL> 
SQL> SELECT
  2  	 i.Inventory_ID,
  3  	 i.Product_ID,
  4  	 p.Product_Name,
  5  	 i.Seller_ID,
  6  	 i.Stock_Quantity,
  7  	 i.Stock_Status
  8  FROM Inventory i
  9  JOIN Product p
 10  	 ON i.Product_ID = p.Product_ID
 11  WHERE i.Stock_Status = 'Available'
 12  ORDER BY i.Inventory_ID;

INVENTORY_ID PRODUCT_ID PRODUCT_NAME                                                                                          SELLER_ID STOCK_QUANTITY STOCK_STATUS                                     
------------ ---------- ---------------------------------------------------------------------------------------------------- ---------- -------------- ------------------------------                   
         301        101 Laptop                                                                                                      201             25 Available                                        
         302        102 Smartphone                                                                                                  202             30 Available                                        
         303        103 T-Shirt                                                                                                     203             50 Available                                        
         304        104 Mixer Grinder                                                                                               201             15 Available                                        

4 rows selected.

SQL> 
SQL> SELECT
  2  	 i.Inventory_ID,
  3  	 i.Product_ID,
  4  	 p.Product_Name,
  5  	 i.Seller_ID,
  6  	 i.Stock_Quantity,
  7  	 i.Stock_Status
  8  FROM Inventory i
  9  JOIN Product p
 10  	 ON i.Product_ID = p.Product_ID
 11  WHERE i.Stock_Status = 'Unavailable'
 12  ORDER BY i.Inventory_ID;

INVENTORY_ID PRODUCT_ID PRODUCT_NAME                                                                                          SELLER_ID STOCK_QUANTITY STOCK_STATUS                                     
------------ ---------- ---------------------------------------------------------------------------------------------------- ---------- -------------- ------------------------------                   
         305        105 Python Programming Book                                                                                     204              0 Unavailable                                      

1 row selected.

SQL> 
SQL> SELECT
  2  	 Stock_Status,
  3  	 COUNT(*) AS Product_Count
  4  FROM Inventory
  5  GROUP BY Stock_Status
  6  ORDER BY Stock_Status;

STOCK_STATUS                   PRODUCT_COUNT                                                                                                                                                            
------------------------------ -------------                                                                                                                                                            
Available                                  4                                                                                                                                                            
Unavailable                                1                                                                                                                                                            

2 rows selected.

SQL> 
SQL> SELECT
  2  	 s.Seller_ID,
  3  	 s.Seller_Name,
  4  	 s.Store_Name,
  5  	 SUM(i.Stock_Quantity) AS Total_Stock
  6  FROM Seller s
  7  JOIN Inventory i
  8  	 ON s.Seller_ID = i.Seller_ID
  9  GROUP BY
 10  	 s.Seller_ID,
 11  	 s.Seller_Name,
 12  	 s.Store_Name
 13  ORDER BY s.Seller_ID;

 SELLER_ID SELLER_NAME                                                                                                                                                                                  
---------- ----------------------------------------------------------------------------------------------------                                                                                         
STORE_NAME                                                                                           TOTAL_STOCK                                                                                        
---------------------------------------------------------------------------------------------------- -----------                                                                                        
       201 Arun Kumar                                                                                                                                                                                   
Arun Electronics                                                                                              40                                                                                        
                                                                                                                                                                                                        
       202 Priya Sharma                                                                                                                                                                                 
Priya Fashion                                                                                                 30                                                                                        
                                                                                                                                                                                                        
       203 Kavin Raj                                                                                                                                                                                    
Kavin Stores                                                                                                  50                                                                                        
                                                                                                                                                                                                        
       204 Divya S                                                                                                                                                                                      
Divya Books                                                                                                    0                                                                                        
                                                                                                                                                                                                        

4 rows selected.

SQL> 
SQL> SELECT
  2  	 i.Inventory_ID,
  3  	 i.Product_ID,
  4  	 p.Product_Name,
  5  	 i.Seller_ID,
  6  	 s.Seller_Name,
  7  	 s.Store_Name,
  8  	 i.Stock_Quantity,
  9  	 i.Stock_Status,
 10  	 i.Last_Updated
 11  FROM Inventory i
 12  JOIN Product p
 13  	 ON i.Product_ID = p.Product_ID
 14  JOIN Seller s
 15  	 ON i.Seller_ID = s.Seller_ID
 16  ORDER BY i.Inventory_ID;

INVENTORY_ID PRODUCT_ID PRODUCT_NAME                                                                                          SELLER_ID                                                                 
------------ ---------- ---------------------------------------------------------------------------------------------------- ----------                                                                 
SELLER_NAME                                                                                                                                                                                             
----------------------------------------------------------------------------------------------------                                                                                                    
STORE_NAME                                                                                           STOCK_QUANTITY STOCK_STATUS                   LAST_UPDA                                            
---------------------------------------------------------------------------------------------------- -------------- ------------------------------ ---------                                            
         301        101 Laptop                                                                                                      201                                                                 
Arun Kumar                                                                                                                                                                                              
Arun Electronics                                                                                                 25 Available                      06-OCT-26                                            
                                                                                                                                                                                                        
         302        102 Smartphone                                                                                                  202                                                                 
Priya Sharma                                                                                                                                                                                            
Priya Fashion                                                                                                    30 Available                      17-SEP-26                                            
                                                                                                                                                                                                        
         303        103 T-Shirt                                                                                                     203                                                                 
Kavin Raj                                                                                                                                                                                               
Kavin Stores                                                                                                     50 Available                      17-SEP-26                                            
                                                                                                                                                                                                        
         304        104 Mixer Grinder                                                                                               201                                                                 
Arun Kumar                                                                                                                                                                                              
Arun Electronics                                                                                                 15 Available                      17-SEP-26                                            
                                                                                                                                                                                                        
         305        105 Python Programming Book                                                                                     204                                                                 
Divya S                                                                                                                                                                                                 
Divya Books                                                                                                       0 Unavailable                    17-SEP-26                                            
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> SELECT
  2  	 i.Inventory_ID,
  3  	 i.Product_ID,
  4  	 p.Product_Name,
  5  	 i.Seller_ID,
  6  	 s.Seller_Name,
  7  	 i.Stock_Quantity,
  8  	 i.Stock_Status
  9  FROM Inventory i
 10  JOIN Product p
 11  	 ON i.Product_ID = p.Product_ID
 12  JOIN Seller s
 13  	 ON i.Seller_ID = s.Seller_ID
 14  WHERE i.Stock_Quantity = 0
 15  ORDER BY i.Inventory_ID;

INVENTORY_ID PRODUCT_ID PRODUCT_NAME                                                                                          SELLER_ID                                                                 
------------ ---------- ---------------------------------------------------------------------------------------------------- ----------                                                                 
SELLER_NAME                                                                                          STOCK_QUANTITY STOCK_STATUS                                                                        
---------------------------------------------------------------------------------------------------- -------------- ------------------------------                                                      
         305        105 Python Programming Book                                                                                     204                                                                 
Divya S                                                                                                           0 Unavailable                                                                         
                                                                                                                                                                                                        

1 row selected.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SPOOL OFF
