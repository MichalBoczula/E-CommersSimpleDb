USE SimpleOrder
GO

CREATE OR ALTER TRIGGER AddedNewOrders
ON Orders
AFTER INSERT
AS
BEGIN
	PRINT('Added new orders');
END
