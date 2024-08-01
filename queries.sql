1.Retrieve the names of all customer sorted in descending order of loyalty points recived:

SELECT CFirst_Name 
FROM customer 
ORDER BY Loyalty_Points DESC;

2.Retrieve the number of employees in the "SALES ASSOCIATES" department:

SELECT COUNT(*) 
FROM employee 
WHERE Employee_Position = 'SALES ASSOCIATES';

3.Retrieve the names of all employees who work in the "CASHIERS" department:

SELECT EFIRST_NAME
FROM employee
WHERE Employee_Position = 'CASHIERS';

4.Display the names of all customers where loyalty points are greater than 50
customers and the customer name should start from letter A.

SELECT Cfirst_name
FROM customer
WHERE  Loyalty_Points > 50 AND Cfirst_name LIKE 'A%'

5.display the employee name and customer name whose transaction price is more than 500?

SELECT total_price
FROM transactions
group by total_price
HAVING transactions.total_price>500;

6.Find the total amount spent by each customer in transactions made by employees who work at a specific branch:

SELECT CUSTOMER.CFIRST_NAME,customer.clast_name, SUM(transactions.total_price) AS TOTAL_AMOUNT_SPENT
FROM CUSTOMER,TRANSACTIONS,EMPLOYEE,STORE_BRANCH
WHERE customer.customer_id=transactions.customer_id 
  AND employee.employee_id=transactions.employee_id
  AND store_branch.branch_id=employee.branch_id 
  AND STORE_BRANCH.Branch_ID=1
  GROUP BY CFirst_Name,CLast_Name;

7.List all the products in a specific category and the total number of units supplied by each supplier:

SELECT PRODUCTS.Product_Name ,supplier.supplier_id, supplier.sfirst_name, supplier.slast_name, 
SUM(supplies.supplied_units)
FROM PRODUCTS,SUPPLIER,SUPPLIES,CATEGORIES
WHERE products.categories_id=categories.categories_id
      AND products.orders_id=supplies.orders_id
      AND supplies.supplier_id= supplier.supplier_id
      AND categories.categories_name='EATABLES'
GROUP BY PRODUCTS.Product_Name ,supplier.supplier_id, supplier.sfirst_name, supplier.slast_name;

8.Find the name and phone number of the manager of the branch where an employee with a specific ID works:

SELECT store_branch.Branch_Manager, store_branch.BPhone_No
FROM EMPLOYEE,store_branch
where employee.Branch_ID = store_branch.Branch_ID and  employee.Employee_ID = 613;

9.List all the transactions made by a specific customer and the name of the employee who processed
each transaction:

SELECT transactions.Transaction_ID, transactions.Transaction_Date, transactions.Total_Price, 
employee.EFirst_Name, employee.ELast_Name
FROM TRANSACTIONS,employee
where transactions.Employee_ID = employee.Employee_ID and transactions.Customer_ID = 505;

10.Find the name and address of the supplier who supplied the most units of a specific product:

SELECT supplier.sfirst_name , supplier.supplier_address
FROM SUPPLIER,supplies,products,orders
WHERE supplier.supplier_id = supplies.supplier_id
    AND supplies.orders_id = orders.orders_id
    AND orders.orders_id = products.orders_id
    AND products.PRODUCT_NAME = 'CONTAINERS'
GROUP BY supplier.sfirst_name, supplier.supplier_address
ORDER BY SUM(supplies.supplied_units) DESC;

11.Retrieve the first and last name of all customers who made transactions on a certain date.

SELECT CFirst_Name, CLast_Name 
FROM CUSTOMER 
WHERE Customer_ID IN (
    SELECT Customer_ID 
    FROM TRANSACTIONS 
    WHERE Transaction_Date = '2023-02-04'
);

12.Retrieve the first name and phone number of the supplier who have supplied more 
than 10 units of a certain product.

SELECT SFirst_Name, SPhone_No 
FROM SUPPLIER 
WHERE Supplier_ID IN (
    SELECT Supplier_ID 
    FROM SUPPLIES 
    WHERE Supplied_units > 5 AND Orders_ID IN (
        SELECT Orders_ID 
        FROM PRODUCTS 
        WHERE Product_Name = 'BATTERIES'
    )
);

13.Retrieve the total price of all transactions made by a customer with a certain phone number.

SELECT SUM(Total_Price) 
FROM TRANSACTIONS 
WHERE Customer_ID = (
    SELECT Customer_ID 
    FROM CUSTOMER 
    WHERE CPhone_No = 79816
);

14.Retrieve the product names and prices for all products in the "Kitchen Accessories" category that were
not ordered on a certain date.

SELECT Product_Name, Product_Price 
FROM PRODUCTS 
INNER JOIN CATEGORIES ON PRODUCTS.Categories_ID = CATEGORIES.Categories_ID 
WHERE CATEGORIES.Categories_Name = 'KITCHEN ACCESSORIES' AND Product_ID NOT IN (
    SELECT Product_ID 
    FROM PRODUCTS 
    INNER JOIN ORDERS ON PRODUCTS.Orders_ID = ORDERS.Orders_ID 
    WHERE Orders_Date = '2023-03-10'
);

15.Retrieve the first name and phone number of all customers 
who made transactions with an employee whose phone number starts with "555".

SELECT CFirst_Name, CPhone_No 
FROM CUSTOMER 
WHERE Customer_ID IN (
    SELECT Customer_ID 
    FROM TRANSACTIONS 
    WHERE Employee_ID IN (
        SELECT Employee_ID 
        FROM EMPLOYEE 
        WHERE EPhone_No LIKE '555%'
    )
);

16.Query to select the orders that were made by customers with loyalty points more than 50?

SELECT *
FROM ORDERS
WHERE Transaction_ID IN (
    SELECT Transaction_ID
    FROM TRANSACTIONS
    WHERE Customer_ID IN (
        SELECT Customer_ID
        FROM CUSTOMER
        WHERE Loyalty_Points > 30
    )
);

Query to select the suppliers who were paid via "Check" and supplied more than 100 units of products:

SELECT *
FROM SUPPLIER
WHERE Payment_Mode = 'Check'
AND Supplier_ID IN (
    SELECT Supplier_ID
    FROM SUPPLIES
    WHERE Supplied_units > 10
);






