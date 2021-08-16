CREATE OR ALTER  PROCEDURE AddSalutation
(
	@SalutationName  VARCHAR(3)
)
AS
BEGIN
	BEGIN TRY

		IF NOT EXISTS (
			SELECT 1 FROM Salutation AS s
				WHERE s.SalutationName = @SalutationName)
			BEGIN 
			
				BEGIN TRANSACTION
					INSERT INTO Salutation(SalutationName)
						VALUES (@SalutationName)
				COMMIT;
			END
		ELSE
			BEGIN
				PRINT(CONCAT('Value "', @SalutationName, '" exists in db'));
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END;
	END CATCH
END;