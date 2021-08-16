USE SimpleOrder
GO

CREATE OR ALTER PROCEDURE SetAddress
(
	@CustomerId INT,
	@AddressId INT
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (
			SELECT 1 FROM Customers AS C
				WHERE C.AddressId = @AddressId)
			BEGIN
				BEGIN TRANSACTION
					UPDATE Customers
						SET AddressId = @AddressId
						WHERE Id = @CustomerId;
				COMMIT
			END
		ELSE
			BEGIN
				PRINT(CONCAT('Customer with Id: ', @CustomerId, ' Has already set addressId on: ', @AddressId));
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK;
		END
	END CATCH
END

COMMIT