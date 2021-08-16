BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Adam',  
		@LastName		= 'Kowalski',
		@SalutationId	= 1;
COMMIT
BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Tomasz',  
		@LastName		= 'Nowak',
		@SalutationId	= 1;
COMMIT
BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Ilona',  
		@LastName		= 'Kowal',
		@SalutationId	= 2;
COMMIT
BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Martyna',  
		@LastName		= 'Nowakowska',
		@SalutationId	= 2;
COMMIT