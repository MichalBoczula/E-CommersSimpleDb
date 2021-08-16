USE SimpleOrder;
GO

BEGIN TRANSACTION
	CREATE TABLE Customers
	(
		Id INT IDENTITY(1,1) NOT NULL,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		CONSTRAINT Customer_Pk PRIMARY KEY (Id)
	);
COMMIT

BEGIN TRANSACTION
	CREATE TABLE Addresses
	(
		Id INT IDENTITY(1,1) NOT NULL,
		PostalCode VARCHAR(50) NOT NULL,
		City VARCHAR(50) NOT NULL,
		Street VARCHAR(50) NOT NULL,
		HouseNumber VARCHAR(50) NOT NULL,
		FlatNumber VARCHAR(50),
		CONSTRAINT Address_Pk PRIMARY KEY (Id)
	);
COMMIT

BEGIN TRANSACTION
	CREATE TABLE Salutation
	(
		Id TINYINT IDENTITY(1,1),
		SalutationName VARCHAR(3) NOT NULL,
		CONSTRAINT Salutation_Pk PRIMARY KEY (Id)
	);
COMMIT

BEGIN TRANSACTION
CREATE TABLE Products
(
	Id INT IDENTITY(1,1),
	ProductName VARCHAR(100) NOT NULL,
	Price DECIMAL NOT NULL,
	CONSTRAINT Product_Pk PRIMARY KEY (Id)
);
COMMIT

BEGIN TRANSACTION
	CREATE TABLE ShoppingCarts
	(
		Id INT IDENTITY(1,1),
		CustomerId INT NOT NULL,
		ProductId INT NOT NULL,
		Quantity INT NOT NULL,
		CONSTRAINT ShoppingCart_Pk PRIMARY KEY (Id)
	);
COMMIT

BEGIN TRANSACTION
	CREATE TABLE Invoices
	(
		Id INT IDENTITY(1,1),
		AddressId INT NOT NULL,
		CustomerId INT NOT NULL,
		OrderDate DATETIMEOFFSET NOT NULL,
		Total DECIMAL NOT NULL,
		CONSTRAINT Invoice_Pk PRIMARY KEY (Id)
	);
COMMIT;

BEGIN TRANSACTION
	CREATE TABLE Orders
	(
		Id INT IDENTITY(1,1),
		CustomerId INT NOT NULL,
		ProductId INT NOT NULL,
		InvoiceId INT,
		Quantity INT NOT NULL,
		CONSTRAINT Order_Pk PRIMARY KEY (Id)
	);
COMMIT;