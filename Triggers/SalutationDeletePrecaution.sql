USE SimpleOrder;
GO

CREATE OR ALTER TRIGGER SalutationDeletePrecaution
ON Salutation
INSTEAD OF DELETE
AS
BEGIN
	ROLLBACK;
	RAISERROR('Remove action on this table is forbidden', 1, 1);
END
