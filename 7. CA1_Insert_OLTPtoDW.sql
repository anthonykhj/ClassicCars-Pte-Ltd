--ETL Customer 
delete from BI_CA1_DW..CustomersDIM
INSERT INTO BI_CA1_DW..CustomersDIM
([customerNumber], [customerName], [contactLastName], [contactFirstName], [addressLine1], addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
SELECT customerNumber, customerName, contactLastName, contactFirstName, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit
FROM BI_CA1_OLTP..Customers

--ETL ProductLine
delete from BI_CA1_DW..ProductLinesDIM
INSERT INTO BI_CA1_DW..ProductLinesDIM
(productLine, textDescription)
SELECT *
FROM BI_CA1_OLTP..ProductLines

--ETL Product
delete from BI_CA1_DW..ProductsDIM
INSERT INTO BI_CA1_DW..ProductsDIM
(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
SELECT p.productCode, p.productName, p.productLine, p.productScale, p.productVendor, p.productDescription, p.quantityInStock, p.buyPrice, p.MSRP
FROM BI_CA1_OLTP..Products p
INNER JOIN BI_CA1_OLTP..ProductLines pl
ON p.productLine = pl.productLine

--ETL Offices
delete from BI_CA1_DW..OfficesDIM
INSERT INTO BI_CA1_DW..OfficesDIM
(OfficeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
SELECT OfficeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory
FROM BI_CA1_OLTP..Offices

--ETL Employees
delete from BI_CA1_DW..EmployeesDIM
INSERT INTO BI_CA1_DW..EmployeesDIM
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
SELECT employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle
FROM BI_CA1_OLTP..Employees

--ETL Orders
delete from BI_CA1_DW..OrdersDIM
INSERT INTO BI_CA1_DW..OrdersDIM
(orderNumber, orderDate, requiredDate, shippedDate, status, comments, CustomerNumber)
SELECT orderNumber, orderDate, requiredDate, shippedDate, status, comments, CustomerNumber
FROM BI_CA1_OLTP..Orders

select * from officesdim
select * from customersdim
select * from productlinesdim
select * from productsdim
select * from ordersdim
select * from employeesdim