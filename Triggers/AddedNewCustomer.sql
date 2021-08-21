USE SimpleOrder
GO

CREATE OR ALTER TRIGGER AddedNewCustomer
ON Customers
AFTER INSERT
AS
BEGIN
	PRINT('Added new customer');
END