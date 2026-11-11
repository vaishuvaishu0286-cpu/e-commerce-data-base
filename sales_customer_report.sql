SQL>SELECT COUNT(*) AS TOTAL_ORDERS
      FROM ORDERS;

TOTAL_ORDERS
------------
          10

SQL> SELECT SUM(SUBTOTAL) AS TOTAL_SALES
    FROM ORDER_DETAILS;

TOTAL_SALES
-----------
       2360

SQL> SELECT AVG(SUBTOTAL) AS AVERAGE_SALES
    FROM ORDER_DETAILS;

AVERAGE_SALES
-------------
   262.222222

SQL> SELECT MIN(SUBTOTAL) AS MINIMUM_SALES
    FROM ORDER_DETAILS;

MINIMUM_SALES
-------------
          120

SQL> SELECT MAX(SUBTOTAL) AS MAXIMUM_SALES
    FROM ORDER_DETAILS;

MAXIMUM_SALES
-------------
          600

SQL> SELECT
  2      COUNT(DISTINCT O.ORDER_ID) AS TOTAL_ORDERS,
  3      SUM(OD.QUANTITY) AS TOTAL_QUANTITY,
  4      SUM(OD.SUBTOTAL) AS TOTAL_SALES
  5  FROM ORDERS O
  6  JOIN ORDER_DETAILS OD
  7  ON O.ORDER_ID = OD.ORDER_ID
  8  WHERE O.ORDER_STATUS = 'DELIVERED';

TOTAL_ORDERS TOTAL_QUANTITY TOTAL_SALES
------------ -------------- -----------
           5             40        2360

SQL> SELECT
  2      O.ORDER_ID,
  3      O.ORDER_DATE,
  4      C.NAME AS CUSTOMER_NAME,
  5      SUM(OD.SUBTOTAL) AS SALES_AMOUNT
  6  FROM CUSTOMER C
  7  JOIN ORDERS O
  8  ON C.CUSTOMER_ID = O.CUSTOMER_ID
  9  JOIN ORDER_DETAILS OD
 10  ON O.ORDER_ID = OD.ORDER_ID
 11  WHERE O.ORDER_STATUS = 'DELIVERED'
 12  GROUP BY O.ORDER_ID, O.ORDER_DATE, C.NAME
 13  ORDER BY O.ORDER_ID;

  ORDER_ID ORDER_DAT CUSTOMER_NAME                                      SALES_AMOUNT
---------- --------- -------------------------------------------------- ------------
       301 01-NOV-26 Arun                                                        270
       302 02-NOV-26 Priya                                                       440
       303 03-NOV-26 Kumar                                                       600
       304 04-NOV-26 Divya                                                       330
       305 05-NOV-26 Rahul                                                       720

SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.NAME AS CUSTOMER_NAME,
  4      SUM(OD.SUBTOTAL) AS TOTAL_PURCHASE
  5  FROM CUSTOMER C
  6  JOIN ORDERS O
  7  ON C.CUSTOMER_ID = O.CUSTOMER_ID
  8  JOIN ORDER_DETAILS OD
  9  ON O.ORDER_ID = OD.ORDER_ID
 10  WHERE O.ORDER_STATUS = 'DELIVERED'
 11  GROUP BY C.CUSTOMER_ID, C.NAME
 12  ORDER BY TOTAL_PURCHASE DESC;

CUSTOMER_ID CUSTOMER_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        105 Rahul                                                         720
        103 Kumar                                                         600
        102 Priya                                                         440
        104 Divya                                                         330
        101 Arun                                                          270

SQL> SELECT
  2      P.PRODUCT_ID,
  3      P.PRODUCT_NAME,
  4      SUM(OD.QUANTITY) AS TOTAL_QUANTITY_SOLD,
  5      SUM(OD.SUBTOTAL) AS TOTAL_REVENUE
  6  FROM PRODUCT P
  7  JOIN ORDER_DETAILS OD
  8  ON P.PRODUCT_ID = OD.PRODUCT_ID
  9  JOIN ORDERS O
 10  ON OD.ORDER_ID = O.ORDER_ID
 11  WHERE O.ORDER_STATUS = 'DELIVERED'
 12  GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
 13  ORDER BY TOTAL_QUANTITY_SOLD DESC;

PRODUCT_ID PRODUCT_NAME                                       TOTAL_QUANTITY_SOLD TOTAL_REVENUE
---------- -------------------------------------------------- ------------------- -------------
       205 Rice                                                                12           720
       201 Tomato                                                              10           300
       203 Apple                                                                7           840
       204 Banana                                                               4           200
       206 Milk                                                                 4           180
       202 Potato                                                               3           120


SQL> SELECT
  2      CAT.CATEGORY_ID,
  3      CAT.CATEGORY_NAME,
  4      SUM(OD.QUANTITY) AS TOTAL_QUANTITY,
  5      SUM(OD.SUBTOTAL) AS TOTAL_SALES
  6  FROM CATEGORY CAT
  7  JOIN PRODUCT P
  8  ON CAT.CATEGORY_ID = P.CATEGORY_ID
  9  JOIN ORDER_DETAILS OD
 10  ON P.PRODUCT_ID = OD.PRODUCT_ID
 11  JOIN ORDERS O
 12  ON OD.ORDER_ID = O.ORDER_ID
 13  WHERE O.ORDER_STATUS = 'DELIVERED'
 14  GROUP BY CAT.CATEGORY_ID, CAT.CATEGORY_NAME
 15  ORDER BY TOTAL_SALES DESC;

CATEGORY_ID CATEGORY_NAME                                      TOTAL_QUANTITY TOTAL_SALES
----------- -------------------------------------------------- -------------- -----------
          2 Fruits                                                         11        1040
          3 Grains                                                         12         720
          1 Vegetables                                                     13         420
          4 Dairy Products                                                  4         180
