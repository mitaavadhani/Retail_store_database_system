create table CUSTOMER
(
    Customer_ID number(10) constraint CUSTOMER_PK primary key,
    CFirst_Name varchar(30),
    CLast_Name varchar(30),
    CPhone_No number(10),
    Loyalty_Points number(10)
);

select *
from customer;

create table STORE_BRANCH
(
    Branch_ID number(10) constraint STORE_BRANCH_PK primary key,
    Branch_Manager varchar(30),
    BPhone_No number(10),
    Branch_Address varchar(10)
);

select *
from STORE_BRANCH;

create table EMPLOYEE
(
    Employee_ID number(10) constraint EMPLOYEE_PK primary key,
    EFirst_Name varchar(30),
    ELast_Name varchar(30),
    Employee_Address varchar(30),
    Employee_Position varchar(30),
    EPhone_No number(10),
    Branch_ID number(10) constraint EMPLOYEE_Branch_ID_FK references STORE_BRANCH(Branch_ID)
);

SELECT *
FROM EMPLOYEE;

create table TRANSACTIONS
(
    Transaction_ID number(10) constraint TRANSACTIONS_PK primary key,
    Customer_ID number(10) constraint TRANSACTIONS_Customer_ID_FK references CUSTOMER(Customer_ID),
    Employee_ID number(10) constraint TRANSACTIONS_Employee_ID_FK references EMPLOYEE(Employee_ID),
    Transaction_Date varchar(30),
    Total_Price number(10)
);

SELECT *
FROM TRANSACTIONS;

create table ORDERS
(
    Orders_ID number(10) constraint ORDERS_PK primary key,
    Orders_Date varchar(30),
    Orders_Price number(10)
);

SELECT *
FROM ORDERS;

create table SUPPLIER
(
    Supplier_ID number(10) constraint SUPPLIER_PK primary key,
    SFirst_Name varchar(30),
    SLast_Name varchar(30),
    Supplier_Address varchar(30),
    SPhone_No number(10),
    Payment_Mode varchar(30)
);

SELECT *
FROM SUPPLIER;

create table CATEGORIES
(
    Categories_ID number(10) constraint CATEGORIES_PK primary key,
    Categories_Name varchar(30)
);

SELECT *
FROM CATEGORIES;

create table PRODUCTS
(
    Product_ID number(10) constraint PRODUCTS_PK primary key,
    Product_Name varchar(30),
    Product_Price number(10),
    Categories_ID number(10) constraint PRODUCTS_Categories_ID_FK references CATEGORIES(Categories_ID),
    Orders_ID number(10) constraint PRODUCTS_Orders_ID_FK references ORDERS(Orders_ID),
    Transaction_ID number(10) constraint PRODUCTS_Transaction_ID_FK references TRANSACTIONS(Transaction_ID)
);

SELECT *
FROM PRODUCTS;


create table SUPPLIES
(
    Orders_ID number(10) constraint SUPPLIES_Orders_ID_FK references ORDERS(Orders_ID),
    Supplier_ID number(10) constraint SUPPLIES_Supplier_ID_FK references SUPPLIER(Supplier_ID),
    Supplied_units number(10)
);

SELECT *
FROM SUPPLIES;

