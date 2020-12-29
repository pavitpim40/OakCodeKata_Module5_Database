-- 1-5
SELECT * FROM orders WHERE salesman_id = (select salesman_id FROM salesman WHERE name='Paul Adam');
SELECT * FROM orders WHERE salesman_id = (SELECT salesman_id FROM salesman WHERE city='London');
SELECT * FROM orders WHERE salesman_id = (SELECT DISTINCT salesman_id FROM orders WHERE customer_id =3007);
SELECT * FROM orders WHERE purch_amt > (select AVG(purch_amt) FROM orders where ord_date ='10/10/2012');
SELECT * FROM orders WHERE salesman_id IN (select salesman_id FROM salesman WHERE city ='New York');

-- 6-10
SELECT commission FROM salesman WHERE salesman_id IN (select salesman_id FROM customer WHERE city = 'Paris');
SELECT * FROM customer WHERE customer_id = (select salesman_id -2001 FROM salesman WHERE name = 'Mc Lyon');
SELECT grade, COUNT (*) FROM customer Group by grade HAVING grade > (select AVG(grade) FROM customer WHERE city = 'New York');
SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE salesman_id IN(SELECT salesman_id FROM salesman WHERE commission = (SELECT MAX(commission) FROM salesman));
SELECT b.*, a.cust_name FROM orders b, customer a WHERE a.customer_id=b.customer_id AND b.ord_date='2012-08-17';

-- 11-15
SELECT salesman_id,name FROM salesman a WHERE 1 < (SELECT COUNT(*) FROM customer WHERE salesman_id=a.salesman_id);
SELECT * FROM orders a WHERE purch_amt > (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);
SELECT * FROM orders a WHERE purch_amt >= (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);
SELECT ord_date, SUM (purch_amt) FROM orders a GROUP BY ord_date HAVING SUM (purch_amt) > (SELECT 1000.00 + MAX(purch_amt) FROM orders b WHERE a.ord_date = b.ord_date);
SELECT customer_id,cust_name, city FROM customer WHERE EXISTS
(SELECT * FROM customer WHERE city='London');

-- 16-20
SELECT * FROM salesman WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a WHERE EXISTS (SELECT * FROM customer b WHERE b.salesman_id=a.salesman_id AND b.cust_name<>a.cust_name));
SELECT * FROM salesman WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a WHERE NOT EXISTS (SELECT * FROM customer b WHERE a.salesman_id=b.salesman_id AND a.cust_name<>b.cust_name));
SELECT * FROM salesman a WHERE EXISTS (SELECT * FROM customer b WHERE a.salesman_id=b.salesman_id AND 1< (SELECT COUNT (*) FROM orders WHERE orders.customer_id = b.customer_id));
SELECT * FROM salesman WHERE city=ANY (SELECT city FROM customer);
SELECT * FROM salesman WHERE city IN (SELECT city FROM customer);

-- 21-25
SELECT * FROM salesman a WHERE EXISTS (SELECT * FROM CUSTOMER b WHERE  a.name  < b.cust_name);
SELECT * FROM customer WHERE grade > ANY (SELECT grade FROM CUSTOMER WHERE  city < 'New York');
SELECT * FROM Orders WHERE purch_amt > ANY (SELECT purch_amt FROM orders WHERE  ord_date='2012/09/10');
SELECT * FROM orders WHERE purch_amt < ANY (SELECT purch_amt FROM orders a, customer b WHERE  a.customer_id=b.customer_id AND b.city='London');
SELECT * FROM orders WHERE purch_amt < (SELECT MAX (purch_amt) FROM orders a, customer b WHERE  a.customer_id=b.customer_id AND b.city='London');

--26-30
SELECT * FROM customer WHERE grade > ALL (SELECT grade FROM customer WHERE city='New York');
SELECT salesman.name, salesman.city, subquery1.total_amt FROM 
salesman, (SELECT salesman_id, SUM(orders.purch_amt) AS total_amt 
FROM orders GROUP BY salesman_id) subquery1 WHERE subquery1.salesman_id = salesman.salesman_id AND
salesman.city IN (SELECT DISTINCT city FROM customer);
SELECT * FROM customer WHERE grade<> ANY (SELECT grade FROM customer WHERE city='London');
SELECT * FROM customer WHERE grade NOT IN (SELECT grade FROM customer WHERE city='Paris');
SELECT * FROM customer WHERE NOT grade = ANY(SELECT grade FROM customerWHERE city='Dallas');

-- 31-35
SELECT AVG(pro_price) AS "Average Price", company_mast.com_name As "Company" FROM item_mast, company_mast WHERE item_mast.pro_com= company_mast.com_id GROUP BY company_mast.com_name;
SELECT AVG(pro_price) AS "Average Price", company_mast.com_name AS "Company" FROM item_mast, company_mast
WHERE item_mast.pro_com= company_mast.com_id GROUP BY company_mast.com_name HAVING AVG(pro_price) >= 350;
SELECT P.pro_name AS "Product Name", 
       P.pro_price AS "Price", 
       C.com_name AS "Company"
   FROM item_mast P, company_mast C
   WHERE P.pro_com = C.com_id
     AND P.pro_price =
     (
       SELECT MAX(P.pro_price)
         FROM item_mast P
         WHERE P.pro_com = C.com_id
     );
SELECT * 
  FROM emp_details
   WHERE emp_lname IN ('Gabriel' , 'Dosio');
SELECT * 
  FROM emp_details
  WHERE emp_dept IN (89,63);

-- 36-39
SELECT emp_fname, emp_lname 
 FROM emp_details
  WHERE emp_dept IN
  (SELECT dpt_code 
     FROM emp_department 
       WHERE dpt_allotment > 50000);
SELECT *
  FROM emp_department
  WHERE dpt_allotment >
  (
    SELECT AVG(dpt_allotment)
    FROM emp_department
  );
SELECT dpt_name FROM emp_department
  WHERE dpt_code IN
  (
    SELECT emp_dept
      FROM emp_details
      GROUP BY emp_dept
      HAVING COUNT(*) >2
  );
SELECT emp_fname, emp_lname 
FROM emp_details 
WHERE emp_dept IN (
  SELECT dpt_code
  FROM emp_department 
  WHERE dpt_allotment= (
    SELECT MIN(dpt_allotment)
    FROM emp_department 
    WHERE dpt_allotment >
 (SELECT MIN(dpt_allotment) 
      FROM emp_department )));