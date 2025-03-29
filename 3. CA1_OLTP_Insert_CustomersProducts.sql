-- populating customers table into OLTP
BULK INSERT Customers
FROM 'C:\Users\p1715259\Documents\AY1819_S1\ST2132 BUSINESS INTELLIGENCE\CA1\Customers(2).txt'
WITH (fieldterminator='\t', rowterminator='\n')

 -- populating products table into OLTP

Declare @Products varchar(max)

SELECT @Products = 

BulkColumn

FROM OPENROWSET(BULK 'C:\Users\p1715259\Documents\AY1819_S1\ST2132 BUSINESS INTELLIGENCE\CA1\getProducts.php',SINGLE_BLOB) JSON



INSERT INTO Products

SELECT * 

FROM OPENJSON(@Products, '$')

WITH(

  productCode varchar(15)		'$.productCode',

  productName varchar(70)		'$.productName',

  productLine varchar(50)		'$.productLine',

  productScale varchar(10)		'$.productScale',

  productVendor varchar(50)		'$.productVendor',

  productDescription varchar(1000) '$.productDescription',

  quantityInStock int '$.quantityInStock',

  buyPrice	Decimal(20,2) '$.buyPrice',

  MSRP Decimal(20,2) '$.MSRP'
  )