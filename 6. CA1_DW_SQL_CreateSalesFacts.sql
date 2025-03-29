create table SalesFacts
(OrderDate_Key integer NOT NULL,
OrderNumber_Key integer NOT NULL,
Customer_Key integer NOT NULL,
Product_Key varchar(15) NOT NULL,
Office_Key varchar(10) NOT NULL,
Employee_Key integer NOT NULL,
Quantity integer NOT NULL,
UnitPrice double precision NULL
primary key(OrderDate_Key, OrderNumber_Key, Customer_Key, Product_Key, Office_Key, Employee_Key)
foreign key(OrderDate_Key) references TimeDIM(timeKey),
foreign key(OrderNumber_Key) references OrdersDim(orderNumber),
foreign key(Customer_Key) references CustomersDIM(customerNumber),
foreign key(Product_Key) references ProductsDIM(productCode),
foreign key(Office_Key) references OfficesDIM(officeCode),
foreign key(Employee_Key) references EmployeesDIM(employeeNumber))

 select * from salesFacts