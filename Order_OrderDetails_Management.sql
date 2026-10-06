SQL> 
SQL> DROP TABLE Order_Details CASCADE CONSTRAINTS;

Table dropped.

SQL> DROP TABLE Orders CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> CREATE TABLE Orders (
  2  	 Order_ID NUMBER PRIMARY KEY,
  3  	 Customer_ID NUMBER,
  4  	 Order_Date DATE,
  5  	 Total_Amount NUMBER(10,2),
  6  	 Order_Status VARCHAR2(30),
  7  	 FOREIGN KEY (Customer_ID)
  8  	     REFERENCES Customer(Customer_ID)
  9  );

Table created.

SQL> 
SQL> INSERT INTO Orders VALUES
  2  (401, 1, TO_DATE('15-SEP-2026','DD-MON-YYYY'), 55000, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO Orders VALUES
  2  (402, 2, TO_DATE('16-SEP-2026','DD-MON-YYYY'), 25000, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO Orders VALUES
  2  (403, 3, TO_DATE('17-SEP-2026','DD-MON-YYYY'), 1598, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO Orders VALUES
  2  (404, 4, TO_DATE('18-SEP-2026','DD-MON-YYYY'), 2500, 'Delivered');

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Orders;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                                              
---------- ----------- --------- ------------ ------------------------------                                                                                                                            
       401           1 15-SEP-26        55000 Processing                                                                                                                                                
       402           2 16-SEP-26        25000 Shipped                                                                                                                                                   
       403           3 17-SEP-26         1598 Processing                                                                                                                                                
       404           4 18-SEP-26         2500 Delivered                                                                                                                                                 

4 rows selected.

SQL> 
SQL> CREATE TABLE Order_Details (
  2  	 OrderDetail_ID NUMBER PRIMARY KEY,
  3  	 Order_ID NUMBER,
  4  	 Product_ID NUMBER,
  5  	 Quantity NUMBER,
  6  	 Unit_Price NUMBER(10,2),
  7  	 FOREIGN KEY (Order_ID)
  8  	     REFERENCES Orders(Order_ID),
  9  	 FOREIGN KEY (Product_ID)
 10  	     REFERENCES Product(Product_ID)
 11  );

Table created.

SQL> 
SQL> INSERT INTO Order_Details VALUES
  2  (501, 401, 101, 1, 55000);

1 row created.

SQL> 
SQL> INSERT INTO Order_Details VALUES
  2  (502, 402, 102, 1, 25000);

1 row created.

SQL> 
SQL> INSERT INTO Order_Details VALUES
  2  (503, 403, 103, 2, 799);

1 row created.

SQL> 
SQL> INSERT INTO Order_Details VALUES
  2  (504, 404, 104, 1, 2500);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Order_Details;

ORDERDETAIL_ID   ORDER_ID PRODUCT_ID   QUANTITY UNIT_PRICE                                                                                                                                              
-------------- ---------- ---------- ---------- ----------                                                                                                                                              
           501        401        101          1      55000                                                                                                                                              
           502        402        102          1      25000                                                                                                                                              
           503        403        103          2        799                                                                                                                                              
           504        404        104          1       2500                                                                                                                                              

4 rows selected.

SQL> 
SQL> UPDATE Orders
  2  SET Order_Status = 'Shipped'
  3  WHERE Order_ID = 401;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Orders
  3  WHERE Order_ID = 401;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                                              
---------- ----------- --------- ------------ ------------------------------                                                                                                                            
       401           1 15-SEP-26        55000 Shipped                                                                                                                                                   

1 row selected.

SQL> 
SQL> UPDATE Orders
  2  SET Total_Amount = 1598
  3  WHERE Order_ID = 403;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Orders
  3  WHERE Order_ID = 403;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                                              
---------- ----------- --------- ------------ ------------------------------                                                                                                                            
       403           3 17-SEP-26         1598 Processing                                                                                                                                                

1 row selected.

SQL> 
SQL> UPDATE Order_Details
  2  SET Quantity = 2,
  3  	 Unit_Price = 799
  4  WHERE OrderDetail_ID = 503;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Order_Details
  3  WHERE OrderDetail_ID = 503;

ORDERDETAIL_ID   ORDER_ID PRODUCT_ID   QUANTITY UNIT_PRICE                                                                                                                                              
-------------- ---------- ---------- ---------- ----------                                                                                                                                              
           503        403        103          2        799                                                                                                                                              

1 row selected.

SQL> 
SQL> SELECT
  2  	 o.Order_ID,
  3  	 o.Customer_ID,
  4  	 o.Order_Date,
  5  	 o.Total_Amount,
  6  	 o.Order_Status
  7  FROM Orders o
  8  ORDER BY o.Customer_ID, o.Order_Date;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                                              
---------- ----------- --------- ------------ ------------------------------                                                                                                                            
       401           1 15-SEP-26        55000 Shipped                                                                                                                                                   
       402           2 16-SEP-26        25000 Shipped                                                                                                                                                   
       403           3 17-SEP-26         1598 Processing                                                                                                                                                
       404           4 18-SEP-26         2500 Delivered                                                                                                                                                 

4 rows selected.

SQL> 
SQL> SELECT
  2  	 o.Customer_ID,
  3  	 o.Order_ID,
  4  	 o.Order_Date,
  5  	 o.Total_Amount,
  6  	 o.Order_Status
  7  FROM Orders o
  8  ORDER BY o.Customer_ID, o.Order_Date;

CUSTOMER_ID   ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                                              
----------- ---------- --------- ------------ ------------------------------                                                                                                                            
          1        401 15-SEP-26        55000 Shipped                                                                                                                                                   
          2        402 16-SEP-26        25000 Shipped                                                                                                                                                   
          3        403 17-SEP-26         1598 Processing                                                                                                                                                
          4        404 18-SEP-26         2500 Delivered                                                                                                                                                 

4 rows selected.

SQL> 
SQL> SELECT
  2  	 Customer_ID,
  3  	 COUNT(Order_ID) AS Total_Orders,
  4  	 SUM(Total_Amount) AS Total_Order_Amount,
  5  	 AVG(Total_Amount) AS Average_Order_Amount
  6  FROM Orders
  7  GROUP BY Customer_ID
  8  ORDER BY Customer_ID;

CUSTOMER_ID TOTAL_ORDERS TOTAL_ORDER_AMOUNT AVERAGE_ORDER_AMOUNT                                                                                                                                        
----------- ------------ ------------------ --------------------                                                                                                                                        
          1            1              55000                55000                                                                                                                                        
          2            1              25000                25000                                                                                                                                        
          3            1               1598                 1598                                                                                                                                        
          4            1               2500                 2500                                                                                                                                        

4 rows selected.

SQL> 
SQL> SELECT
  2  	 o.Order_ID,
  3  	 o.Customer_ID,
  4  	 o.Order_Date,
  5  	 o.Total_Amount,
  6  	 o.Order_Status,
  7  	 od.Product_ID,
  8  	 od.Quantity,
  9  	 od.Unit_Price,
 10  	 (od.Quantity * od.Unit_Price) AS Sub_Total
 11  FROM Orders o
 12  JOIN Order_Details od
 13  	 ON o.Order_ID = od.Order_ID
 14  ORDER BY o.Order_ID;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                   PRODUCT_ID   QUANTITY UNIT_PRICE  SUB_TOTAL                                                                                
---------- ----------- --------- ------------ ------------------------------ ---------- ---------- ---------- ----------                                                                                
       401           1 15-SEP-26        55000 Shipped                               101          1      55000      55000                                                                                
       402           2 16-SEP-26        25000 Shipped                               102          1      25000      25000                                                                                
       403           3 17-SEP-26         1598 Processing                            103          2        799       1598                                                                                
       404           4 18-SEP-26         2500 Delivered                             104          1       2500       2500                                                                                

4 rows selected.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SPOOL OFF
