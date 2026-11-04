SQL> 
SQL> SELECT c.ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_ID, o.ORDER_DATE,
  3  	    o.TOTAL_AMOUNT, o.ORDER_STATUS
  4  FROM Customer c
  5  INNER JOIN Orders o
  6  ON c.ID = o.CUSTOMER_ID
  7  ORDER BY o.ORDER_ID;

        ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                
---------- ------------------------------ ---------- --------- ------------ ------------------------------                                                                                              
         1 Ramesh                                401 20-OCT-26        55000 Shipped                                                                                                                     
         2 Khilan                                402 21-OCT-26        25000 Placed                                                                                                                      
         3 Kaushik                               403 22-OCT-26         1598 Delivered                                                                                                                   
         4 Chaitali                              404 23-OCT-26         2500 Shipped                                                                                                                     
         5 Hardik                                405 24-OCT-26          650 Placed                                                                                                                      

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT o.ORDER_ID, o.ORDER_DATE,
  2  	    o.TOTAL_AMOUNT, o.ORDER_STATUS,
  3  	    p.PAYMENT_ID, p.PAYMENT_MODE,
  4  	    p.PAYMENT_DATE, p.PAYMENT_AMOUNT,
  5  	    p.PAYMENT_STATUS
  6  FROM Orders o
  7  INNER JOIN Payment p
  8  ON o.ORDER_ID = p.ORDER_ID
  9  ORDER BY o.ORDER_ID;

  ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                   PAYMENT_ID PAYMENT_MODE                   PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                      
---------- --------- ------------ ------------------------------ ---------- ------------------------------ --------- -------------- ------------------------------                                      
       401 20-OCT-26        55000 Shipped                               601 UPI                            20-OCT-26          55000 Completed                                                           
       402 21-OCT-26        25000 Placed                                602 Card                           21-OCT-26          25000 Completed                                                           
       403 22-OCT-26         1598 Delivered                             603 Cash                           22-OCT-26           1598 Completed                                                           
       404 23-OCT-26         2500 Shipped                               604 Net Banking                    23-OCT-26           2500 Completed                                                           
       405 24-OCT-26          650 Placed                                605 UPI                            24-OCT-26            650 Pending                                                             

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT p.PRODUCT_ID, p.PRODUCT_NAME,
  2  	    p.PRICE, od.ORDER_ID,
  3  	    od.QUANTITY, od.UNIT_PRICE,
  4  	    od.QUANTITY * od.UNIT_PRICE AS ITEM_TOTAL
  5  FROM Product p
  6  INNER JOIN Order_Details od
  7  ON p.PRODUCT_ID = od.PRODUCT_ID
  8  ORDER BY od.ORDER_ID;

PRODUCT_ID PRODUCT_NAME                                                                                              PRICE   ORDER_ID   QUANTITY UNIT_PRICE ITEM_TOTAL                                  
---------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ---------- ---------- ----------                                  
       101 Laptop                                                                                                    55000        401          1      55000      55000                                  
       102 Smartphone                                                                                                25000        402          1      25000      25000                                  
       103 T-Shirt                                                                                                     799        403          2        799       1598                                  
       104 Mixer Grinder                                                                                              2500        404          1       2500       2500                                  
       105 Python Programming Book                                                                                     650        405          1        650        650                                  

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT c.ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_ID, o.ORDER_DATE,
  3  	    o.TOTAL_AMOUNT, o.ORDER_STATUS
  4  FROM Customer c
  5  LEFT JOIN Orders o
  6  ON c.ID = o.CUSTOMER_ID
  7  ORDER BY c.ID;

        ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                
---------- ------------------------------ ---------- --------- ------------ ------------------------------                                                                                              
         1 Ramesh                                401 20-OCT-26        55000 Shipped                                                                                                                     
         2 Khilan                                402 21-OCT-26        25000 Placed                                                                                                                      
         3 Kaushik                               403 22-OCT-26         1598 Delivered                                                                                                                   
         4 Chaitali                              404 23-OCT-26         2500 Shipped                                                                                                                     
         5 Hardik                                405 24-OCT-26          650 Placed                                                                                                                      

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT o.ORDER_ID, o.ORDER_DATE,
  2  	    o.TOTAL_AMOUNT, o.ORDER_STATUS,
  3  	    c.ID AS CUSTOMER_ID,
  4  	    c.NAME AS CUSTOMER_NAME,
  5  	    c.AGE, c.ADDRESS
  6  FROM Orders o
  7  LEFT JOIN Customer c
  8  ON o.CUSTOMER_ID = c.ID
  9  ORDER BY o.ORDER_ID;

  ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                   CUSTOMER_ID CUSTOMER_NAME                         AGE ADDRESS                                                                          
---------- --------- ------------ ------------------------------ ----------- ------------------------------ ---------- ------------------------------                                                   
       401 20-OCT-26        55000 Shipped                                  1 Ramesh                                 32 Ahmedabad                                                                        
       402 21-OCT-26        25000 Placed                                   2 Khilan                                 25 Delhi                                                                            
       403 22-OCT-26         1598 Delivered                                3 Kaushik                                23 Kota                                                                             
       404 23-OCT-26         2500 Shipped                                  4 Chaitali                               25 Mumbai                                                                           
       405 24-OCT-26          650 Placed                                   5 Hardik                                 27 Bhopal                                                                           

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT o.ORDER_ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_DATE, p.PRODUCT_NAME,
  3  	    od.QUANTITY, od.UNIT_PRICE,
  4  	    od.QUANTITY * od.UNIT_PRICE AS ITEM_TOTAL,
  5  	    o.TOTAL_AMOUNT, o.ORDER_STATUS
  6  FROM Orders o
  7  JOIN Customer c
  8  ON o.CUSTOMER_ID = c.ID
  9  JOIN Order_Details od
 10  ON o.ORDER_ID = od.ORDER_ID
 11  JOIN Product p
 12  ON od.PRODUCT_ID = p.PRODUCT_ID
 13  ORDER BY o.ORDER_ID;

  ORDER_ID CUSTOMER_NAME                  ORDER_DAT PRODUCT_NAME                                                                                           QUANTITY UNIT_PRICE ITEM_TOTAL TOTAL_AMOUNT  
---------- ------------------------------ --------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ---------- ------------  
ORDER_STATUS                                                                                                                                                                                            
------------------------------                                                                                                                                                                          
       401 Ramesh                         20-OCT-26 Laptop                                                                                                        1      55000      55000        55000  
Shipped                                                                                                                                                                                                 
                                                                                                                                                                                                        
       402 Khilan                         21-OCT-26 Smartphone                                                                                                    1      25000      25000        25000  
Placed                                                                                                                                                                                                  
                                                                                                                                                                                                        
       403 Kaushik                        22-OCT-26 T-Shirt                                                                                                       2        799       1598         1598  
Delivered                                                                                                                                                                                               
                                                                                                                                                                                                        
       404 Chaitali                       23-OCT-26 Mixer Grinder                                                                                                 1       2500       2500         2500  
Shipped                                                                                                                                                                                                 
                                                                                                                                                                                                        
       405 Hardik                         24-OCT-26 Python Programming Book                                                                                       1        650        650          650  
Placed                                                                                                                                                                                                  
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT c.ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_ID, o.ORDER_DATE,
  3  	    o.TOTAL_AMOUNT, o.ORDER_STATUS
  4  FROM Customer c
  5  INNER JOIN Orders o
  6  ON c.ID = o.CUSTOMER_ID
  7  ORDER BY c.ID, o.ORDER_DATE;

        ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                                                                                                                
---------- ------------------------------ ---------- --------- ------------ ------------------------------                                                                                              
         1 Ramesh                                401 20-OCT-26        55000 Shipped                                                                                                                     
         2 Khilan                                402 21-OCT-26        25000 Placed                                                                                                                      
         3 Kaushik                               403 22-OCT-26         1598 Delivered                                                                                                                   
         4 Chaitali                              404 23-OCT-26         2500 Shipped                                                                                                                     
         5 Hardik                                405 24-OCT-26          650 Placed                                                                                                                      

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT c.ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_ID, o.ORDER_DATE,
  3  	    o.TOTAL_AMOUNT, o.ORDER_STATUS,
  4  	    p.PAYMENT_ID, p.PAYMENT_MODE,
  5  	    p.PAYMENT_AMOUNT, p.PAYMENT_STATUS
  6  FROM Customer c
  7  JOIN Orders o
  8  ON c.ID = o.CUSTOMER_ID
  9  LEFT JOIN Payment p
 10  ON o.ORDER_ID = p.ORDER_ID
 11  ORDER BY c.ID, o.ORDER_DATE;

        ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                   PAYMENT_ID PAYMENT_MODE                   PAYMENT_AMOUNT PAYMENT_STATUS                      
---------- ------------------------------ ---------- --------- ------------ ------------------------------ ---------- ------------------------------ -------------- ------------------------------      
         1 Ramesh                                401 20-OCT-26        55000 Shipped                               601 UPI                                     55000 Completed                           
         2 Khilan                                402 21-OCT-26        25000 Placed                                602 Card                                    25000 Completed                           
         3 Kaushik                               403 22-OCT-26         1598 Delivered                             603 Cash                                     1598 Completed                           
         4 Chaitali                              404 23-OCT-26         2500 Shipped                               604 Net Banking                              2500 Completed                           
         5 Hardik                                405 24-OCT-26          650 Placed                                605 UPI                                       650 Pending                             

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT c.ID, c.NAME AS CUSTOMER_NAME,
  2  	    o.ORDER_ID, o.ORDER_DATE,
  3  	    p.PRODUCT_NAME, od.QUANTITY,
  4  	    od.UNIT_PRICE,
  5  	    od.QUANTITY * od.UNIT_PRICE AS ITEM_TOTAL,
  6  	    o.TOTAL_AMOUNT, o.ORDER_STATUS
  7  FROM Customer c
  8  JOIN Orders o
  9  ON c.ID = o.CUSTOMER_ID
 10  JOIN Order_Details od
 11  ON o.ORDER_ID = od.ORDER_ID
 12  JOIN Product p
 13  ON od.PRODUCT_ID = p.PRODUCT_ID
 14  ORDER BY o.ORDER_ID;

        ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT PRODUCT_NAME                                                                                           QUANTITY UNIT_PRICE ITEM_TOTAL    
---------- ------------------------------ ---------- --------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ----------    
TOTAL_AMOUNT ORDER_STATUS                                                                                                                                                                               
------------ ------------------------------                                                                                                                                                             
         1 Ramesh                                401 20-OCT-26 Laptop                                                                                                        1      55000      55000    
       55000 Shipped                                                                                                                                                                                    
                                                                                                                                                                                                        
         2 Khilan                                402 21-OCT-26 Smartphone                                                                                                    1      25000      25000    
       25000 Placed                                                                                                                                                                                     
                                                                                                                                                                                                        
         3 Kaushik                               403 22-OCT-26 T-Shirt                                                                                                       2        799       1598    
        1598 Delivered                                                                                                                                                                                  
                                                                                                                                                                                                        
         4 Chaitali                              404 23-OCT-26 Mixer Grinder                                                                                                 1       2500       2500    
        2500 Shipped                                                                                                                                                                                    
                                                                                                                                                                                                        
         5 Hardik                                405 24-OCT-26 Python Programming Book                                                                                       1        650        650    
         650 Placed                                                                                                                                                                                     
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT o.ORDER_ID, o.ORDER_DATE,
  2  	    o.TOTAL_AMOUNT, o.ORDER_STATUS,
  3  	    p.PAYMENT_ID, p.PAYMENT_MODE,
  4  	    p.PAYMENT_DATE, p.PAYMENT_AMOUNT,
  5  	    p.PAYMENT_STATUS
  6  FROM Orders o
  7  INNER JOIN Payment p
  8  ON o.ORDER_ID = p.ORDER_ID
  9  ORDER BY o.ORDER_ID;

  ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS                   PAYMENT_ID PAYMENT_MODE                   PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS                                                      
---------- --------- ------------ ------------------------------ ---------- ------------------------------ --------- -------------- ------------------------------                                      
       401 20-OCT-26        55000 Shipped                               601 UPI                            20-OCT-26          55000 Completed                                                           
       402 21-OCT-26        25000 Placed                                602 Card                           21-OCT-26          25000 Completed                                                           
       403 22-OCT-26         1598 Delivered                             603 Cash                           22-OCT-26           1598 Completed                                                           
       404 23-OCT-26         2500 Shipped                               604 Net Banking                    23-OCT-26           2500 Completed                                                           
       405 24-OCT-26          650 Placed                                605 UPI                            24-OCT-26            650 Pending                                                             

5 rows selected.

SQL> 
SQL> 
SQL> SPOOL OFF
