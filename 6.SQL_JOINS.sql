-- 1-5
SELECT salesman.name AS "Salesman", customer.cust_name, customer.city FROM salesman,customer WHERE salesman.city=customer.city;
SELECT a.ord_no,a.purch_amt, b.cust_name,b.city FROM orders a,customer b WHERE a.customer_id=b.customer_id AND a.purch_amt BETWEEN 500 AND 2000;
SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id;
SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE b.commission>.12;
SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.city,b.commission FROM customer a INNER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE b.commission>.12 AND a.city<>b.city;

-- 6-10
SELECT a.ord_no,a.ord_date,a.purch_amt, b.cust_name AS "Customer Name", b.grade, c.name AS "Salesman", c.commission FROM orders a INNER JOIN customer b ON a.customer_id=b.customer_id INNER JOIN salesman c ON a.salesman_id=c.salesman_id;
SELECT * FROM orders NATURAL JOIN customer NATURAL JOIN salesman;
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman",b.city FROM customer a LEFT JOIN salesman b ON a.salesman_id=b.salesman_id order by a.customer_id;
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", b.city FROM customer a LEFT OUTER JOIN salesman b ON a.salesman_id=b.salesman_id WHERE a.grade<300 ORDER BY a.customer_id;
SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount" FROM customer a LEFT OUTER JOIN orders b ON a.customer_id=b.customer_id order by b.ord_date;

-- 11-15
SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount", c.name,c.commission FROM customer a LEFT OUTER JOIN orders b ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c ON c.salesman_id=b.salesman_id;
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", b.city FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id ORDER BY b.salesman_id;
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.ord_no, c.ord_date, c.purch_amt FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id RIGHT OUTER JOIN orders c ON c.customer_id=a.customer_id;
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.ord_no, c.ord_date, c.purch_amt FROM customer a RIGHT OUTER JOIN salesman b ON b.salesman_id=a.salesman_id LEFT OUTER JOIN orders c ON c.customer_id=a.customer_id WHERE c.purch_amt>=2000 AND a.grade IS NOT NULL;
SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount" FROM customer a FULL OUTER JOIN orders b ON a.customer_id=b.customer_id;

-- 16-20
SELECT a.cust_name,a.city, b.ord_no, b.ord_date,b.purch_amt AS "Order Amount" FROM customer a FULL OUTER JOIN orders b ON a.customer_id=b.customer_id WHERE a.grade IS NOT NULL;
SELECT * FROM salesman a CROSS JOIN customer b;
SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL;
SELECT * FROM salesman a CROSS JOIN  customer b WHERE a.city IS NOT NULL AND b.grade IS NOT NULL;
SELECT * FROM salesman a CROSS JOIN customer b WHERE a.city IS NOT NULL AND b.grade IS NOT NULL AND  a.city<>b.city;

-- 21-25
SELECT * FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id;
SELECT item_mast.pro_name, pro_price, company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com = company_mast.com_id;
SELECT AVG(pro_price), company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id GROUP BY company_mast.com_name;
SELECT AVG(pro_price), company_mast.com_name FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id GROUP BY company_mast.com_name HAVING AVG(pro_price) >= 350;
SELECT A.pro_name, A.pro_price, F.com_name FROM item_mast A INNER JOIN company_mast F ON A.pro_com = F.com_id AND A.pro_price = ( SELECT MAX(A.pro_price) FROM item_mast A WHERE A.pro_com = F.com_id );

-- 26-29
SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name", B.dpt_name AS "Department", emp_dept, dpt_code, dpt_allotment FROM emp_details A INNER JOIN emp_department B ON A.emp_dept = B.dpt_code;
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", emp_department.dpt_name AS "Department", dpt_allotment AS "Amount Allotted" FROM emp_details INNER JOIN emp_department ON emp_details.emp_dept = emp_department.dpt_code;
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name" FROM emp_details INNER JOIN emp_department ON emp_details.emp_dept = emp_department.dpt_code
    AND emp_department.dpt_allotment > 50000;
SELECT emp_department.dpt_name FROM emp_details INNER JOIN emp_department ON emp_dept =dpt_code GROUP BY emp_department.dpt_name HAVING COUNT(*) > 2;