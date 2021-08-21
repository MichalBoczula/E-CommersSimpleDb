DECLARE @CONTEXT_INFO  VARBINARY(128);

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


BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'NewOne',  
		@LastName		= 'ForTrigger',
		@SalutationId	= 1;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Kamil',  
		@LastName		= 'Trigger',
		@SalutationId	= 1;
COMMIT

BEGIN TRANSACTION
	EXECUTE AddCustomer
		@FirstName		= 'Average',  
		@LastName		= 'Joe',
		@SalutationId	= 1;
COMMIT