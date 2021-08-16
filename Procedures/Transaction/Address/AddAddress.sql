USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE AddAddress
(
	@PostalCode		varchar(50),
	@City			varchar(50),
	@Street			varchar(50),
	@HouseNumber	varchar(50),
	@FlatNumber		varchar(50)
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(
			Select 1 from Addresses AS A
				WHERE A.PostalCode = @PostalCode AND
					A.City = @City AND
					A.Street = @Street AND
					A.HouseNumber = @HouseNumber AND
					A.FlatNumber = @FlatNumber)
			BEGIN
				BEGIN TRANSACTION
					INSERT INTO Addresses(PostalCode, City, Street, HouseNumber, FlatNumber)
						VALUES(@PostalCode, @City, @Street, @HouseNumber, @FlatNumber);
				COMMIT TRANSACTION
			END
		ELSE
			BEGIN
				PRINT(CONCAT('Record with values: ', @PostalCode, ' ', @City, ' ',  @Street, ' ',  @HouseNumber, ' ',  @FlatNumber, ' exists in db.'));
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK;
	END CATCH
END

COMMIT