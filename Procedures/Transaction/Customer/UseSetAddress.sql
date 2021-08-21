BEGIN TRANSACTION
	EXECUTE SetAddress
		@CustomerId = 1,
		@AddressId = 1;
COMMIT

BEGIN TRANSACTION
	EXECUTE SetAddress
		@CustomerId = 4,
		@AddressId = 2;
COMMIT

BEGIN TRANSACTION
	EXECUTE SetAddress
		@CustomerId = 5,
		@AddressId = 3;
COMMIT

BEGIN TRANSACTION
	EXECUTE SetAddress
		@CustomerId = 6,
		@AddressId = 4;
COMMIT


BEGIN TRANSACTION
	EXECUTE SetAddress
		@CustomerId = 9,
		@AddressId = 5;
COMMIT