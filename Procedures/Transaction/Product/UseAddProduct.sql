BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'Keyboard',
		@Price = 40;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'Computer Mouse',
		@Price = 20;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'Pendrive',
		@Price = 15;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'SSD',
		@Price = 60;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'HDD',
		@Price = 50;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddProduct
		@ProductName = 'Cooler Station',
		@Price = 100;
COMMIT