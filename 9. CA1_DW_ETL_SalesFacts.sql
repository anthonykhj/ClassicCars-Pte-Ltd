USE BI_CA1_DW

--ETL SalesFacts
delete from SalesFacts
INSERT INTO [BI_CA1_DW].[dbo].SalesFacts
(OrderDate_Key, OrderNumber_Key, Customer_Key, Product_Key, Office_Key, Employee_Key, Quantity, UnitPrice)
SELECT
	replace(CONVERT(DATE, o.orderdate, 112), '-', ''),
	o.orderNumber,
	c.CustomerNumber,
	p.ProductCode,
	myoffice.officeCode,
	myoffice.employeeNumber,
	od.quantityOrdered,
	od.priceEach

FROM
BI_CA1_OLTP..[orderDetails] od
INNER JOIN BI_CA1_OLTP..[orders] o
ON od.orderNumber = o.orderNumber

INNER JOIN BI_CA1_DW..CustomersDIM c
ON o.customerNumber = c.CustomerNumber

INNER JOIN BI_CA1_DW..ProductsDIM p
ON od.productCode = p.productCode

INNER JOIN
(select oc.CustomerNumber, oe.employeeNumber, oo.officeCode
from BI_CA1_OLTP..[customers] oc
inner join BI_CA1_OLTP..[employees] oe
on oc.salesRepEmployeeNumber = oe.employeeNumber
inner join BI_CA1_OLTP..[offices] oo
on oe.officeCode = oo.officeCode
) myoffice

ON c.customerNumber = myoffice.customerNumber


select customername, sum(sf.quantity*sf.unitprice) as sales
from salesFacts sf
inner join
customersdim c
on sf.customer_key = c.customernumber
group by customername
order by sales desc
