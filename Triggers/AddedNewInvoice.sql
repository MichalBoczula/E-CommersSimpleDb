USE SimpleOrder
GO

CREATE OR ALTER TRIGGER AddedNewInvoice
ON Invoices
AFTER INSERT
AS
BEGIN
	PRINT('Added new invoice');
END