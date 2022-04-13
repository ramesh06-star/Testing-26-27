CREATE TABLE SALESMAN( SALESMAN_ID INT PRIMARY KEY, 
						SALESMAN_NAME VARCHAR(20), 
						SALESMAN_CITY VARCHAR(20), 
						COMMISSION FLOAT)

SELECT * FROM SALESMAN
INSERT INTO SALESMAN VALUES( 5001, 'James Hoog','New York',0.15)
INSERT INTO SALESMAN VALUES( 5002,'Nail Knite','Paris', 0.13)
INSERT INTO SALESMAN VALUES(5005,'Pit Alex' ,'London', 0.11) 
INSERT INTO SALESMAN VALUES( 5006,'Mc Lyon','Paris', 0.14)
INSERT INTO SALESMAN VALUES( 5007,'Paul Adam','Rome', 0.13)
INSERT INTO SALESMAN VALUES( 5003,'Lauson Hen','San Jos',0.12)

 CREATE TABLE CUSTOMER(CUSTOMER_ID INT PRIMARY KEY, 
						CUST_NAME VARCHAR(20),
						CITY VARCHAR(20),GRADE INT, 
						SALESMAN_ID INT FOREIGN KEY REFERENCES SALESMAN(SALESMAN_ID))  
 SELECT * FROM CUSTOMER
 INSERT INTO CUSTOMER VALUES( 3002,'Nick Rimando','New York',100, 5001)
 INSERT INTO CUSTOMER VALUES(3007,'Brad Davis','New York',200,5001)
 INSERT INTO CUSTOMER VALUES(3005,'Graham Zusi','California',200, 5002)
 INSERT INTO CUSTOMER VALUES(3008,'Julian Green','London',300,5002)
 INSERT INTO CUSTOMER VALUES(3004,'Fabian Johnson','Paris',300, 5006)
 INSERT INTO CUSTOMER VALUES(3009,'Geoff Cameron','Berlin',100,5003)
 INSERT INTO CUSTOMER VALUES(3003,'Jozy Altidor','Moscow',200,5007)
 INSERT INTO CUSTOMER VALUES(3001,'Brad Guzan ','London',300,5005)

 CREATE TABLE ORDERS(ORD_NO INT PRIMARY KEY,
						PURCH_AMT FLOAT,   
						ORD_DATE DATE,   
						CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMER(CUSTOMER_ID), 
						SALESMAN_ID INT FOREIGN KEY REFERENCES SALESMAN(SALESMAN_ID))
SELECT * FROM ORDERS
INSERT INTO ORDERS VALUES(70001,150.5,'2012-10-05',3005,5002)
INSERT INTO ORDERS VALUES(70009,270.65,'2012-09-10', 3001, 5005)
INSERT INTO ORDERS VALUES(70002,65.26,'2012-10-05', 3002,5001)
INSERT INTO ORDERS VALUES(70004,110.5,'2012-08-17', 3009,5003)
INSERT INTO ORDERS VALUES(70007,948.5 ,'2012-09-10',3005, 5002)
INSERT INTO ORDERS VALUES(70005,2400.6,'2012-07-27', 3007,5001)
INSERT INTO ORDERS VALUES(70008,5760,'2012-09-10', 3002, 5001)
INSERT INTO ORDERS VALUES(70010,1983.43,'2012-10-10',3004, 5006)
INSERT INTO ORDERS VALUES(70003,2480.4,'2012-10-10',3009,5003)
INSERT INTO ORDERS VALUES(70012,250.45,'2012-06-27',3008,5002)
INSERT INTO ORDERS VALUES(70011,75.29,'2012-08-17',3003,5007)
INSERT INTO ORDERS VALUES(70013,3045.6,'2012-04-25',3002, 5001)

SELECT * FROM SALESMAN
SELECT * FROM CUSTOMER
SELECT * FROM ORDERS

CREATE TABLE TARGET_ORDER_SUMMARY( CUSTOMER_ID INT, 
							CUST_NAME VARCHAR(30), 
							CITY VARCHAR(30), 
							SALESMAN_NAME VARCHAR(30), 
							ORD_NO INT,
							PURCH_AMT FLOAT)
SELECT * FROM SALESMAN
SELECT * FROM CUSTOMER


--1. From the following tables write a SQL query to find the salesperson and customer who belongs to same city. 
--Return Salesman, cust_name and city
SELECT S.SALESMAN_NAME AS SALESMAN, C.CUST_NAME,C.CITY FROM SALESMAN S,CUSTOMER C 
WHERE S.SALESMAN_CITY = C.CITY 

--2. From the following tables write a SQL query to find those orders where order 
--amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT C.CUST_NAME, C.CITY, O.ORD_NO,O.PURCH_AMT FROM CUSTOMER C,ORDERS O WHERE O.CUSTOMER_ID = C.CUSTOMER_ID 
AND O.PURCH_AMT BETWEEN 500 AND 2000

--3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he handle. 
--Return Customer Name, city, Salesman, commission
SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY, S.SALESMAN_NAME AS SALES_NAME, S.COMMISSION FROM CUSTOMER C INNER JOIN SALESMAN S 
ON C.SALESMAN_ID=S.SALESMAN_ID 

--4. From the following tables write a SQL query to find those salespersons who 
--received a commission from the company more than 12%. 
--Return Customer Name, customer city, Salesman, commission.  
SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY, S.SALESMAN_NAME AS SALES_MAN, S.COMMISSION FROM CUSTOMER C JOIN SALESMAN S
ON C.SALESMAN_ID = S.SALESMAN_ID WHERE S.COMMISSION > 0.12

SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY, S.SALESMAN_NAME AS SALES_MAN, S.COMMISSION FROM CUSTOMER C,SALESMAN S
WHERE  C.SALESMAN_ID = S.SALESMAN_ID AND S.COMMISSION > 0.12

SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY, S.SALESMAN_NAME AS SALES_MAN, S.COMMISSION FROM CUSTOMER C INNER JOIN SALESMAN S
ON   C.SALESMAN_ID = S.SALESMAN_ID WHERE S.COMMISSION > 0.12



--5. From the following tables write a SQL query to find those 
--salespersons do not live in the same city where their customers live and received a commission from the company more than 12%. 
--Return Customer Name, customer city, Salesman, salesman city, commission. 
SELECT C.CUST_NAME AS CUSTOMER_NAME, C.CITY, S.SALESMAN_NAME AS SALES_NAME, S.SALESMAN_CITY, S.COMMISSION 
FROM CUSTOMER C JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID  
WHERE C.CITY != S.SALESMAN_CITY AND S.COMMISSION > 0.12

--6. From the following tables write a SQL query to find the details of an order. 
--Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, C.CUST_NAME AS CUSTOMER_NAME, C.GRADE, S.SALESMAN_NAME AS SALES_NAME, S.COMMISSION
FROM ORDERS O INNER JOIN CUSTOMER C ON O.CUSTOMER_ID=C.CUSTOMER_ID INNER JOIN SALESMAN S ON O.SALESMAN_ID=S.SALESMAN_ID

--7 Write a SQL statement to make a join on the tables salesman, customer and orders 
--in such a form that the same column of each table 
--will appear once and only the relational rows will come

SELECT * FROM ORDERS O INNER JOIN CUSTOMER C 
ON O.CUSTOMER_ID = C.CUSTOMER_ID 
INNER JOIN SALESMAN S 
ON O.SALESMAN_ID=S.SALESMAN_ID

--8. From the following tables write a SQL query to display the cust_name, customer city, grade, Salesman, salesman city. 
--The result should be ordered by ascending on customer_id.
SELECT C.CUST_NAME, C.CITY, C.GRADE, S.SALESMAN_NAME, S.SALESMAN_CITY FROM CUSTOMER C 
INNER JOIN SALESMAN S ON C.SALESMAN_ID=S.SALESMAN_ID ORDER BY C.CUSTOMER_ID ASC

--9. From the following tables write a SQL query to find those customers whose grade less than 300. 
--Return cust_name, customer city, grade, Salesman, saleman city. 
--The result should be ordered by ascending customer_id
SELECT C.CUST_NAME, C.CITY, C.GRADE, S.SALESMAN_NAME, S.SALESMAN_CITY FROM CUSTOMER C, SALESMAN S 
WHERE C.SALESMAN_ID=S.SALESMAN_ID AND C.GRADE < 300

--10 Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name 
--and commission to find that either any of the existing customers have placed no order or placed one or more orders by 
--their salesman or by own.
SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, S.SALESMAN_NAME, S.COMMISSION FROM ORDERS O INNER JOIN CUSTOMER C
ON O.CUSTOMER_ID=C.CUSTOMER_ID INNER JOIN SALESMAN S ON O.SALESMAN_ID=S.SALESMAN_ID 

SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
c.SALESMAN_name,c.commission 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id=b.salesman_id;

--12. Write a SQL statement to make a list in ascending order for the salesmen who works either for
--one or more customer or not yet join under any of the customers
SELECT S.SALESMAN_NAME, S.SALESMAN_CITY, C.CUST_NAME, C.CITY FROM CUSTOMER C LEFT OUTER JOIN SALESMAN S 
ON S.SALESMAN_ID=C.SALESMAN_ID ORDER BY S.SALESMAN_ID ASC

--13 From the following tables write a SQL query to list all salespersons along with customer name, 
--city, grade, order number, date, and amount.
SELECT C.CUST_NAME, C.CITY, C.GRADE, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT, S.SALESMAN_NAME FROM CUSTOMER C INNER JOIN ORDERS O 
ON O.CUSTOMER_ID=C.CUSTOMER_ID INNER JOIN SALESMAN S ON O.SALESMAN_ID=S.SALESMAN_ID ORDER BY O.PURCH_AMT ASC

-- 14 Write a SQL statement to make a list for the salesmen who either work for one or more customers or
--yet to join any of the customer. The customer may have placed, either one or more orders on or above 
--order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT C.CUST_NAME, C.GRADE, S.SALESMAN_NAME,S.SALESMAN_ID, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT FROM CUSTOMER C
RIGHT OUTER JOIN SALESMAN S ON S.SALESMAN_ID=C.SALESMAN_ID LEFT OUTER JOIN ORDERS O ON O.CUSTOMER_ID=C.CUSTOMER_ID
WHERE O.PURCH_AMT > 2000 AND C.GRADE IS NOT NULL

--15 Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount
--for those customers from the existing list who placed one or more orders or which order(s) have been 
--placed by the customer who is not on the list
SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT FROM CUSTOMER C FULL OUTER JOIN ORDERS O 
ON O.CUSTOMER_ID=C.CUSTOMER_ID

--16 Write a SQL statement to make a report with customer name, city, order no. order date, 
--purchase amount for only those customers on the list who must have a grade and placed one
--or more orders or which order(s) have been placed by the customer who is neither in the list nor have a grade.
SELECT C.CUST_NAME, C.CITY, O.ORD_NO, O.ORD_DATE, O.PURCH_AMT FROM CUSTOMER C FULL OUTER JOIN ORDERS O 
ON C.CUSTOMER_ID=O.CUSTOMER_ID WHERE C.GRADE IS NOT NULL 

--17. Write a SQL query to combine each row of salesman table with each row of customer table.
SELECT * FROM CUSTOMER C CROSS JOIN SALESMAN S

--18 Write a SQL statement to make a cartesian product between salesman and customer i.e. 
--each salesman will appear for all customer and vice versa for that salesman who belongs to a city. 
SELECT * FROM SALESMAN S CROSS JOIN CUSTOMER C WHERE S.SALESMAN_CITY IS NOT NULL

--19. Write a SQL statement to make a cartesian product between salesman and customer i.e. 
--each salesman will appear for all customer and vice versa for those salesmen who belongs to
--a city and the customers who must have a grade.
SELECT * FROM SALESMAN S CROSS JOIN CUSTOMER C WHERE S.SALESMAN_CITY IS NOT NULL AND C.GRADE IS NOT NULL 

--20 Write a SQL statement to make a cartesian product between salesman and customer i.e. 
--each salesman will appear for all customer and vice versa for those salesmen who must belong 
--a city which is not the same as his customer and the customers should have an own grade. 
SELECT * FROM SALESMAN S CROSS JOIN CUSTOMER C WHERE S.SALESMAN_CITY != C.CITY AND C.GRADE IS NOT NULL 

SELECT * FROM COMPANY_MAST
SELECT * FROM ITEM_MAST

--21. From the following tables write a SQL query to select all rows from both participating 
--tables as long as there is a match between pro_com and com_id
SELECT * FROM COMPANY_MAST C INNER JOIN ITEM_MAST I ON C.COMP_ID = I.PRO_COM

--22 Write a SQL query to display the item name, price, and company name of all the products.
SELECT P.PRO_NAME, P.PRO_PRICE, C.COMP_NAME FROM ITEM_MAST P INNER JOIN COMPANY_MAST C ON P.PRO_COM = C.COMP_ID

--23. From the following tables write a SQL query to calculate the average price of items of each company. 
--Return average value and company name.
SELECT AVG(PRO_PRICE), C.COMP_NAME FROM ITEM_MAST P INNER JOIN COMPANY_MAST C
ON C.COMP_ID=P.PRO_COM GROUP BY C.COMP_NAME

--From the following tables write a SQL query to calculate and find the average price of items of 
--each company higher than or equal to Rs. 350. Return average value and company name.
SELECT AVG(PRO_PRICE), C.COMP_NAME FROM ITEM_MAST P INNER JOIN COMPANY_MAST C 
ON C.COMP_ID = P.PRO_COM GROUP BY C.COMP_NAME HAVING AVG(PRO_PRICE)>=350  

--25. From the following tables write a SQL query to find the most expensive product of each company. 
--Return pro_name, pro_price and com_name.
SELECT P.PRO_PRICE, P.PRO_NAME,C.COMP_NAME FROM ITEM_MAST P INNER JOIN COMPANY_MAST C
ON P.PRO_COM = C.COMP_ID AND P.PRO_PRICE= ( SELECT MAX(P.PRO_PRICE) FROM ITEM_MAST P WHERE P.PRO_COM=C.COMP_ID)

--26. From the following tables write a SQL query to display all the data of employees including their department.

CREATE TABLE EMP_DEPARTMENT(DPT_CODE INT, DPT_NAME VARCHAR(30), DPT_ALLOTMENT INT)
INSERT INTO EMP_DEPARTMENT VALUES( 57, 'IT',65000)
INSERT INTO EMP_DEPARTMENT VALUES( 63, 'Finance',15000)
INSERT INTO EMP_DEPARTMENT VALUES( 47, 'HR', 240000)
INSERT INTO EMP_DEPARTMENT VALUES( 27, 'RD',55000)
INSERT INTO EMP_DEPARTMENT VALUES( 89, 'QC', 75000)
SELECT * FROM EMP_DEPARTMENT

CREATE TABLE EMP_DETAILS( EMP_IDNO INT, EMP_FNAME VARCHAR(30), EMP_LNAME VARCHAR(30), EMP_DEPT INT)
INSERT INTO EMP_DETAILS VALUES(127323, 'Michale','Robbin', 57)
INSERT INTO EMP_DETAILS VALUES( 526689 , 'Carlos' , 'Snares', 63)
INSERT INTO EMP_DETAILS VALUES(  843795, 'Enric', 'Dosio', 57)
INSERT INTO EMP_DETAILS VALUES( 328717, 'Jhon','Snares',63)
INSERT INTO EMP_DETAILS VALUES( 444527, 'Joseph',' Dosni', 47)
INSERT INTO EMP_DETAILS VALUES( 659831, 'Zanifer',' Emily', 47)
INSERT INTO EMP_DETAILS VALUES(  847674, 'Kuleswar','Sitaraman',57)
INSERT INTO EMP_DETAILS VALUES( 748681, 'Henrey','Gabriel', 47)
INSERT INTO EMP_DETAILS VALUES( 555935, 'Alex','Manuel', 57)
INSERT INTO EMP_DETAILS VALUES( 539569, 'George','Mardy', 27)
INSERT INTO EMP_DETAILS VALUES(733843, 'Mario','Saule', 63)
INSERT INTO EMP_DETAILS VALUES( 631548, 'Alan','Snappy',27)
INSERT INTO EMP_DETAILS VALUES( 839139, 'Maria', 'Foster', 57)

SELECT * FROM EMP_DEPARTMENT
SELECT * FROM EMP_DETAILS

--26. From the following tables write a SQL query to display all the data of employees including their department.
SELECT E.DPT_NAME,E.DPT_ALLOTMENT, CONCAT(ED.EMP_FNAME, ' ', ED.EMP_LNAME)AS EMP_NAME FROM EMP_DEPARTMENT E  JOIN EMP_DETAILS ED
ON E.DPT_CODE=ED.EMP_DEPT

--27. From the following tables write a SQL to display the first name and last name of each employee, 
--along with the name and sanction amount for their department.
SELECT CONCAT(E.EMP_FNAME, ' ', E.EMP_LNAME) AS EMP_NAME, D.DPT_NAME, D.DPT_ALLOTMENT FROM EMP_DETAILS E
INNER JOIN EMP_DEPARTMENT D ON E.EMP_DEPT = D.DPT_CODE

--28. From the following tables write a SQL query to find the departments with a budget more than 
--Rs. 50000 and display the first name and last name of employees.
SELECT UPPER(CONCAT(E.EMP_FNAME, ' ', E.EMP_LNAME)) AS EMP_NAME,D.DPT_ALLOTMENT FROM EMP_DETAILS E JOIN EMP_DEPARTMENT D 
ON E.EMP_DEPT = D.DPT_CODE WHERE D.DPT_ALLOTMENT > 50000

--29. From the following tables write a SQL query to find the names of departments where more than 
--two employees are working. Return dpt_name.
SELECT D.DPT_NAME FROM EMP_DEPARTMENT D, EMP_DETAILS E WHERE D.DPT_CODE = E.EMP_DEPT
GROUP BY D.DPT_NAME HAVING COUNT(D.DPT_NAME)>2