USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE AddCustomer
(
	@FirstName		VARCHAR(50),
	@LastName		VARCHAR(50),
	@SalutationId	TINYINT
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (
			SELECT 1 FROM Customers AS C
				WHERE C.FirstName = @FirstName AND
					C.LastName = @LastName AND
					C.SalutationId = @SalutationId)
			BEGIN
				BEGIN TRANSACTION
					INSERT INTO Customers( FirstName, LastName, SalutationId)
						VAlUES(@FirstName, @LastName, @SalutationId);
				COMMIT;
			END;
		ELSE
			BEGIN
				PRINT(CONCAT('Record with values:" ', @SalutationId, ' ', @FirstName, ' ', @LastName, '" exists in db'));
			END;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK;
		END
	END CATCH
END

COMMIT