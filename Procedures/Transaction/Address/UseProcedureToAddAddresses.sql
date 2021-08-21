USE SimpleOrder;
GO

BEGIN TRANSACTION
	EXECUTE AddAddress
		@PostalCode		= '50-000',
		@City			= 'Wroclaw',
		@Street			= 'Dluga',
		@HouseNumber	= '1',
		@FlatNumber		= '1';
COMMIT

BEGIN TRANSACTION
	EXECUTE AddAddress
		@PostalCode		= '50-001',
		@City			= 'Wroclaw',
		@Street			= 'Krotka',
		@HouseNumber	= '2',
		@FlatNumber		= '2';
COMMIT

BEGIN TRANSACTION
	EXECUTE AddAddress
		@PostalCode		= '50-003',
		@City			= 'Wroclaw',
		@Street			= 'Krzywa',
		@HouseNumber	= '3',
		@FlatNumber		= '3';
COMMIT

BEGIN TRANSACTION
	EXECUTE AddAddress
		@PostalCode		= '50-004',
		@City			= 'Wroclaw',
		@Street			= 'Prosta',
		@HouseNumber	= '4',
		@FlatNumber		= '4';
COMMIT


BEGIN TRANSACTION
	EXECUTE AddAddress
		@PostalCode		= '50-004',
		@City			= 'Wroclaw',
		@Street			= 'Nowa',
		@HouseNumber	= '5',
		@FlatNumber		= '5';
COMMIT