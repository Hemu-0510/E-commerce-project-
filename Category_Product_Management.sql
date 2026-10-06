SQL> 
SQL> 
SQL> 
SQL> DROP TABLE Product CASCADE CONSTRAINTS;

Table dropped.

SQL> DROP TABLE Category CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> 
SQL> CREATE TABLE Category (
  2  	 Category_ID NUMBER PRIMARY KEY,
  3  	 Category_Name VARCHAR2(50) UNIQUE NOT NULL,
  4  	 Description VARCHAR2(100)
  5  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> INSERT INTO Category VALUES
  2  (1, 'Electronics', 'Electronic products');

1 row created.

SQL> 
SQL> INSERT INTO Category VALUES
  2  (2, 'Fashion', 'Clothing and fashion products');

1 row created.

SQL> 
SQL> INSERT INTO Category VALUES
  2  (3, 'Home Appliances', 'Appliances for home');

1 row created.

SQL> 
SQL> INSERT INTO Category VALUES
  2  (4, 'Books', 'Books and educational materials');

1 row created.

SQL> 
SQL> INSERT INTO Category VALUES
  2  (5, 'Beauty', 'Beauty and personal care products');

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM Category;

CATEGORY_ID CATEGORY_NAME                                      DESCRIPTION                                                                                                                              
----------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------                                     
          1 Electronics                                        Electronic products                                                                                                                      
          2 Fashion                                            Clothing and fashion products                                                                                                            
          3 Home Appliances                                    Appliances for home                                                                                                                      
          4 Books                                              Books and educational materials                                                                                                          
          5 Beauty                                             Beauty and personal care products                                                                                                        

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> CREATE TABLE Product (
  2  	 Product_ID NUMBER PRIMARY KEY,
  3  	 Product_Name VARCHAR2(100) NOT NULL,
  4  	 Category_ID NUMBER,
  5  	 Price NUMBER(10,2),
  6  	 Stock NUMBER,
  7  	 Seller_ID NUMBER,
  8  	 FOREIGN KEY (Category_ID)
  9  	     REFERENCES Category(Category_ID)
 10  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> INSERT INTO Product VALUES
  2  (101, 'Laptop', 1, 55000, 20, 201);

1 row created.

SQL> 
SQL> INSERT INTO Product VALUES
  2  (102, 'Smartphone', 1, 25000, 30, 202);

1 row created.

SQL> 
SQL> INSERT INTO Product VALUES
  2  (103, 'T-Shirt', 2, 799, 50, 203);

1 row created.

SQL> 
SQL> INSERT INTO Product VALUES
  2  (104, 'Mixer Grinder', 3, 2500, 15, 201);

1 row created.

SQL> 
SQL> INSERT INTO Product VALUES
  2  (105, 'Python Programming Book', 4, 650, 0, 204);

1 row created.

SQL> 
SQL> INSERT INTO Product VALUES
  2  (106, 'Face Wash', 5, 350, 40, 205);

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM Product;

PRODUCT_ID PRODUCT_NAME                                                                                         CATEGORY_ID      PRICE      STOCK  SELLER_ID                                            
---------- ---------------------------------------------------------------------------------------------------- ----------- ---------- ---------- ----------                                            
       101 Laptop                                                                                                         1      55000         20        201                                            
       102 Smartphone                                                                                                     1      25000         30        202                                            
       103 T-Shirt                                                                                                        2        799         50        203                                            
       104 Mixer Grinder                                                                                                  3       2500         15        201                                            
       105 Python Programming Book                                                                                        4        650          0        204                                            
       106 Face Wash                                                                                                      5        350         40        205                                            

6 rows selected.

SQL> 
SQL> 
SQL> 
SQL> UPDATE Product
  2  SET Price = 56000
  3  WHERE Product_ID = 101;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Product
  3  WHERE Product_ID = 101;

PRODUCT_ID PRODUCT_NAME                                                                                         CATEGORY_ID      PRICE      STOCK  SELLER_ID                                            
---------- ---------------------------------------------------------------------------------------------------- ----------- ---------- ---------- ----------                                            
       101 Laptop                                                                                                         1      56000         20        201                                            

1 row selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> UPDATE Product
  2  SET Stock = 25
  3  WHERE Product_ID = 101;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT *
  2  FROM Product
  3  WHERE Product_ID = 101;

PRODUCT_ID PRODUCT_NAME                                                                                         CATEGORY_ID      PRICE      STOCK  SELLER_ID                                            
---------- ---------------------------------------------------------------------------------------------------- ----------- ---------- ---------- ----------                                            
       101 Laptop                                                                                                         1      56000         25        201                                            

1 row selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> DELETE FROM Product
  2  WHERE Product_ID = 106;

1 row deleted.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM Product;

PRODUCT_ID PRODUCT_NAME                                                                                         CATEGORY_ID      PRICE      STOCK  SELLER_ID                                            
---------- ---------------------------------------------------------------------------------------------------- ----------- ---------- ---------- ----------                                            
       101 Laptop                                                                                                         1      56000         25        201                                            
       102 Smartphone                                                                                                     1      25000         30        202                                            
       103 T-Shirt                                                                                                        2        799         50        203                                            
       104 Mixer Grinder                                                                                                  3       2500         15        201                                            
       105 Python Programming Book                                                                                        4        650          0        204                                            

5 rows selected.

SQL> 
SQL> 
SQL> SELECT
  2  	 c.Category_ID,
  3  	 c.Category_Name,
  4  	 p.Product_ID,
  5  	 p.Product_Name,
  6  	 p.Price,
  7  	 p.Stock,
  8  	 p.Seller_ID
  9  FROM Category c
 10  JOIN Product p
 11  	 ON c.Category_ID = p.Category_ID
 12  ORDER BY c.Category_ID, p.Product_ID;

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID PRODUCT_NAME                                                                                              PRICE      STOCK    
----------- -------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------- ----------    
 SELLER_ID                                                                                                                                                                                              
----------                                                                                                                                                                                              
          1 Electronics                                               101 Laptop                                                                                                    56000         25    
       201                                                                                                                                                                                              
                                                                                                                                                                                                        
          1 Electronics                                               102 Smartphone                                                                                                25000         30    
       202                                                                                                                                                                                              
                                                                                                                                                                                                        
          2 Fashion                                                   103 T-Shirt                                                                                                     799         50    
       203                                                                                                                                                                                              
                                                                                                                                                                                                        
          3 Home Appliances                                           104 Mixer Grinder                                                                                              2500         15    
       201                                                                                                                                                                                              
                                                                                                                                                                                                        
          4 Books                                                     105 Python Programming Book                                                                                     650          0    
       204                                                                                                                                                                                              
                                                                                                                                                                                                        

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT
  2  	 p.Product_ID,
  3  	 p.Product_Name,
  4  	 p.Price,
  5  	 p.Stock,
  6  	 p.Seller_ID
  7  FROM Product p
  8  JOIN Category c
  9  	 ON p.Category_ID = c.Category_ID
 10  WHERE c.Category_Name = 'Electronics'
 11  ORDER BY p.Product_ID;

PRODUCT_ID PRODUCT_NAME                                                                                              PRICE      STOCK  SELLER_ID                                                        
---------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ----------                                                        
       101 Laptop                                                                                                    56000         25        201                                                        
       102 Smartphone                                                                                                25000         30        202                                                        

2 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT
  2  	 c.Category_ID,
  3  	 c.Category_Name,
  4  	 COUNT(p.Product_ID) AS Product_Count
  5  FROM Category c
  6  LEFT JOIN Product p
  7  	 ON c.Category_ID = p.Category_ID
  8  GROUP BY
  9  	 c.Category_ID,
 10  	 c.Category_Name
 11  ORDER BY c.Category_ID;

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_COUNT                                                                                                                            
----------- -------------------------------------------------- -------------                                                                                                                            
          1 Electronics                                                    2                                                                                                                            
          2 Fashion                                                        1                                                                                                                            
          3 Home Appliances                                                1                                                                                                                            
          4 Books                                                          1                                                                                                                            
          5 Beauty                                                         0                                                                                                                            

5 rows selected.

SQL> 
SQL> 
SQL> 
SQL> SELECT
  2  	 p.Product_ID,
  3  	 p.Product_Name,
  4  	 c.Category_Name,
  5  	 p.Price,
  6  	 p.Stock,
  7  	 p.Seller_ID
  8  FROM Product p
  9  JOIN Category c
 10  	 ON p.Category_ID = c.Category_ID
 11  ORDER BY p.Product_ID;

PRODUCT_ID PRODUCT_NAME                                                                                         CATEGORY_NAME                                           PRICE      STOCK  SELLER_ID     
---------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ---------- ---------- ----------     
       101 Laptop                                                                                               Electronics                                             56000         25        201     
       102 Smartphone                                                                                           Electronics                                             25000         30        202     
       103 T-Shirt                                                                                              Fashion                                                   799         50        203     
       104 Mixer Grinder                                                                                        Home Appliances                                          2500         15        201     
       105 Python Programming Book                                                                              Books                                                     650          0        204     

5 rows selected.

SQL> 
SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SPOOL OFF
