USE SimpleOrder;
GO

CREATE PROCEDURE AddProduct
(
	@ProductName	VARCHAR(100),
	@Price			DECIMAL
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (
			SELECT 1 FROM Products AS P
				WHERE P.ProductName = @ProductName AND
					P.Price = @Price)
			BEGIN
				BEGIN TRANSACTION
					INSERT INTO Products(ProductName, Price)
						VALUES(@ProductName, @Price);
				COMMIT
			END
		ELSE
			BEGIN
				PRINT(CONCAT('Record: ',  @ProductName, ' with price: ', @Price, ' exists in db.'));
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END

COMMIT;