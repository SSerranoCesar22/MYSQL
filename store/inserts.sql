use `store`;
-- create tables
CREATE TABLE salesman (
    Salesman_id numeric(5) not null ,
    neim varchar(30) not null,
    city varchar(15) not null,
    comission decimal(5,2) not null,
    primary key (Salesman_id)
);
CREATE TABLE Customer (
    Customer_id numeric(5) not null PRIMARY KEY,
    Cust_name varchar(30) not null,
    City varchar(15) not null,
    Grade numeric(3) not null
);

CREATE TABLE Orders (
Order_no numeric(5) not null,
Purch_amt decimal(8,2) not null,
Ord date not null,
FK_Salesman_id_salesman  numeric NOT NULL,
FK_Customer_id_Orders numeric NOT NULL,
PRIMARY KEY (Order_no, FK_Salesman_id_salesman, FK_Customer_id_Orders),
FOREIGN KEY (FK_Salesman_id_salesman) REFERENCES salesman(Salesman_id),
FOREIGN KEY  (FK_Customer_id_Orders) REFERENCES Customer(Customer_id)

);

