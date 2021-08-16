USE SimpleOrder;
GO

BEGIN TRANSACTION
	EXECUTE AddSalutation
		@SalutationName = 'Mr.';
COMMIT

BEGIN TRANSACTION
	EXECUTE AddSalutation
		@SalutationName = 'Ms.';
COMMIT

IF(@@TRANCOUNT > 0)
BEGIN
	ROLLBACK;
END

