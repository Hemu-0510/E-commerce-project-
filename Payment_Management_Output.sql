SQL> 
SQL> CREATE TABLE Payment (
  2  	 Payment_ID NUMBER PRIMARY KEY,
  3  	 Order_ID NUMBER,
  4  	 Payment_Mode VARCHAR2(20) NOT NULL,
  5  	 Payment_Date DATE NOT NULL,
  6  	 Payment_Amount NUMBER(10,2) NOT NULL,
  7  	 Payment_Status VARCHAR2(20) NOT NULL,
  8  	 FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
  9  );

Table created.

SQL> 
SQL> INSERT INTO Payment VALUES (601, 401, 'UPI', SYSDATE, 55000, 'Success');

1 row created.

SQL> 
SQL> INSERT INTO Payment VALUES (602, 402, 'Card', SYSDATE, 25000, 'Success');

1 row created.

SQL> 
SQL> INSERT INTO Payment VALUES (603, 403, 'UPI', SYSDATE, 1598, 'Failed');

1 row created.

SQL> 
SQL> INSERT INTO Payment VALUES (604, 404, 'Cash', SYSDATE, 2500, 'Success');

1 row created.

SQL> 
SQL> INSERT INTO Payment VALUES (605, 405, 'Net Banking', SYSDATE, 650, 'Failed');

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Payment;

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                                                                                      
---------- ---------- -------------------- --------- -------------- --------------------                                                                                                                
       601        401 UPI                  06-OCT-26          55000 Success                                                                                                                             
       602        402 Card                 06-OCT-26          25000 Success                                                                                                                             
       603        403 UPI                  06-OCT-26           1598 Failed                                                                                                                              
       604        404 Cash                 06-OCT-26           2500 Success                                                                                                                             
       605        405 Net Banking          06-OCT-26            650 Failed                                                                                                                              

5 rows selected.

SQL> 
SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status = 'Success';

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                                                                                      
---------- ---------- -------------------- --------- -------------- --------------------                                                                                                                
       601        401 UPI                  06-OCT-26          55000 Success                                                                                                                             
       602        402 Card                 06-OCT-26          25000 Success                                                                                                                             
       604        404 Cash                 06-OCT-26           2500 Success                                                                                                                             

3 rows selected.

SQL> 
SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status = 'Failed';

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                                                                                      
---------- ---------- -------------------- --------- -------------- --------------------                                                                                                                
       603        403 UPI                  06-OCT-26           1598 Failed                                                                                                                              
       605        405 Net Banking          06-OCT-26            650 Failed                                                                                                                              

2 rows selected.

SQL> 
SQL> UPDATE Payment
  2  SET Payment_Status = 'Success'
  3  WHERE Payment_ID = 603;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_ID = 603;

PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                                                                                      
---------- ---------- -------------------- --------- -------------- --------------------                                                                                                                
       603        403 UPI                  06-OCT-26           1598 Success                                                                                                                             

1 row selected.

SQL> 
SQL> SELECT
  2  	 Payment_Mode,
  3  	 COUNT(*) AS Total_Transactions
  4  FROM Payment
  5  GROUP BY Payment_Mode
  6  ORDER BY Payment_Mode;

PAYMENT_MODE         TOTAL_TRANSACTIONS                                                                                                                                                                 
-------------------- ------------------                                                                                                                                                                 
Card                                  1                                                                                                                                                                 
Cash                                  1                                                                                                                                                                 
Net Banking                           1                                                                                                                                                                 
UPI                                   2                                                                                                                                                                 

4 rows selected.

SQL> 
SQL> SELECT
  2  	 Payment_Mode,
  3  	 SUM(Payment_Amount) AS Total_Amount
  4  FROM Payment
  5  WHERE Payment_Status = 'Success'
  6  GROUP BY Payment_Mode
  7  ORDER BY Payment_Mode;

PAYMENT_MODE         TOTAL_AMOUNT                                                                                                                                                                       
-------------------- ------------                                                                                                                                                                       
Card                        25000                                                                                                                                                                       
Cash                         2500                                                                                                                                                                       
UPI                         56598                                                                                                                                                                       

3 rows selected.

SQL> 
SQL> SELECT
  2  	 p.Payment_ID,
  3  	 c.First_Name || ' ' || c.Last_Name AS Customer_Name,
  4  	 p.Order_ID,
  5  	 p.Payment_Mode,
  6  	 p.Payment_Date,
  7  	 p.Payment_Amount,
  8  	 p.Payment_Status
  9  FROM Payment p
 10  JOIN Orders o
 11  	 ON p.Order_ID = o.Order_ID
 12  JOIN Customer c
 13  	 ON o.Customer_ID = c.Customer_ID
 14  ORDER BY p.Payment_ID;

PAYMENT_ID CUSTOMER_NAME                                                                                           ORDER_ID PAYMENT_MODE         PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                
---------- ----------------------------------------------------------------------------------------------------- ---------- -------------------- --------- -------------- --------------------          
       601 Renu Srinivasan                                                                                              401 UPI                  06-OCT-26          55000 Success                       
       602 Arjun Kumar                                                                                                  402 Card                 06-OCT-26          25000 Success                       
       603 Priya Kumar                                                                                                  403 UPI                  06-OCT-26           1598 Success                       
       604 Rahul Sharma                                                                                                 404 Cash                 06-OCT-26           2500 Success                       
       605 Keerthana Mohan                                                                                              405 Net Banking          06-OCT-26            650 Failed                        

5 rows selected.

SQL> 
SQL> SELECT
  2  	 Payment_Status,
  3  	 COUNT(*) AS Total_Transactions,
  4  	 SUM(Payment_Amount) AS Total_Amount
  5  FROM Payment
  6  GROUP BY Payment_Status;

PAYMENT_STATUS       TOTAL_TRANSACTIONS TOTAL_AMOUNT                                                                                                                                                    
-------------------- ------------------ ------------                                                                                                                                                    
Success                               4        84098                                                                                                                                                    
Failed                                1          650                                                                                                                                                    

2 rows selected.

SQL> 
SQL> SELECT
  2  	 c.Customer_ID,
  3  	 c.First_Name || ' ' || c.Last_Name AS Customer_Name,
  4  	 p.Payment_ID,
  5  	 p.Order_ID,
  6  	 p.Payment_Mode,
  7  	 p.Payment_Amount,
  8  	 p.Payment_Status,
  9  	 p.Payment_Date
 10  FROM Customer c
 11  JOIN Orders o
 12  	 ON c.Customer_ID = o.Customer_ID
 13  JOIN Payment p
 14  	 ON o.Order_ID = p.Order_ID
 15  ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                                                                                         PAYMENT_ID   ORDER_ID PAYMENT_MODE         PAYMENT_AMOUNT PAYMENT_STATUS              
----------- ----------------------------------------------------------------------------------------------------- ---------- ---------- -------------------- -------------- --------------------        
PAYMENT_D                                                                                                                                                                                               
---------                                                                                                                                                                                               
          1 Renu Srinivasan                                                                                              601        401 UPI                           55000 Success                     
06-OCT-26                                                                                                                                                                                               
                                                                                                                                                                                                        
          2 Arjun Kumar                                                                                                  602        402 Card                          25000 Success                     
06-OCT-26                                                                                                                                                                                               
                                                                                                                                                                                                        
          3 Priya Kumar                                                                                                  603        403 UPI                            1598 Success                     
06-OCT-26                                                                                                                                                                                               
                                                                                                                                                                                                        
          4 Rahul Sharma                                                                                                 604        404 Cash                           2500 Success                     
06-OCT-26                                                                                                                                                                                               
                                                                                                                                                                                                        
          5 Keerthana Mohan                                                                                              605        405 Net Banking                     650 Failed                      
06-OCT-26                                                                                                                                                                                               
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SPOOL OFF
