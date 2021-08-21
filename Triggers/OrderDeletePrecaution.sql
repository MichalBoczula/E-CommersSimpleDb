USE SimpleOrder;
GO

CREATE OR ALTER TRIGGER OrderDeletePrecaution
ON Orders
INSTEAD OF DELETE
AS
BEGIN
	ROLLBACK;
	RAISERROR('Remove action on this table is forbidden', 1, 1);
END
