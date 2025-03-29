create table OfficesDIM
(officeCode varchar(10) NOT NULL,
city varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) NULL,
state varchar(50) NULL,
country varchar(50) NOT NULL,
postalCode varchar(15) NOT NULL,
territory varchar(10) NOT NULL,
primary key (officeCode))

create table EmployeesDIM 
(employeeNumber integer NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo integer NULL,
jobTitle varchar(50) NOT NULL,
primary key (employeeNumber))

create table CustomersDIM
(customerNumber integer NOT NULL,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone varchar(50) NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) NULL,
city varchar(50) NOT NULL,
state varchar(50) NOT NULL,
postalCode varchar(15) NOT NULL,
country varchar(50) NOT NULL,
salesRepEmployeeNumber varchar(4) NOT NULL,
creditLimit double precision NOT NULL,
primary key (customerNumber))

--create table Payments
--(customerNumber integer NOT NULL,
--checkNumber varchar(50) NOT NULL,
--paymentDate datetime NOT NULL,
--amount double precision NOT NULL,
--primary key(customerNumber, checkNumber),
--foreign key(customerNumber) references Customers(customerNumber))

create table OrdersDIM 
(orderNumber integer NOT NULL,
orderDate datetime NOT NULL,
requiredDate datetime NOT NULL,
shippedDate datetime NULL,
status varchar(15) NOT NULL,
comments text NULL,
customerNumber integer NOT NULL,
primary key(orderNumber))

create table ProductLinesDIM 
(productLine varchar(50) NOT NULL,
textDescription text NOT NULL,
primary key(productLine))
/* foreign key(productLine) references Products(productCode)) */

create table ProductsDIM
(productCode varchar(15) NOT NULL,
productName varchar(70) NOT NULL,
productLine varchar(50) NOT NULL,
productScale varchar(10) NOT NULL,
productVendor varchar(50) NOT NULL,
productDescription varchar(1000) NOT NULL,
quantityInStock integer NOT NULL,
buyPrice double precision NOT NULL,
MSRP double precision NOT NULL,
primary key(productCode),
foreign key (productLine) references ProductLinesDIM(ProductLine))


--create table OrderDetails 
--(orderNumber integer NOT NULL,
--productCode varchar(15) NOT NULL,
--quantityOrdered integer NOT NULL,
--priceEach double precision NOT NULL,
--orderLineNumber smallint NOT NULL,
--primary key(orderNumber, productCode),
--foreign key(productCode) references Products(productCode),
--foreign key(orderNumber) references Orders(orderNumber))





