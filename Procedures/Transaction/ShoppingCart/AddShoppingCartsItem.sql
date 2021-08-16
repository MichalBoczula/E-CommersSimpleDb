USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE AddShoppingCartsItem
(
	@ProductId		INT,
	@CustomerId		INT,
	@Quantity		INT
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (
			SELECT 1 FROM ShoppingCarts AS O
				WHERE O.ProductId = @ProductId AND
					O.CustomerId = @CustomerId)
			BEGIN
				BEGIN TRANSACTION
					INSERT INTO ShoppingCarts (ProductId, CustomerId, Quantity)
						VALUES (@ProductId, @CustomerId, @Quantity);
				COMMIT
			END
		ELSE
			BEGIN
				DECLARE @CurrentQuantity INT;
				SET @CurrentQuantity = (
					SELECT O.Quantity FROM ShoppingCarts AS O
						WHERE O.ProductId = @ProductId AND
							O.CustomerId = @CustomerId);
				COMMIT
				BEGIN TRANSACTION
					UPDATE ShoppingCarts
						SET Quantity = @CurrentQuantity + @Quantity
						WHERE CustomerId = @CustomerId AND
							ProductId = @ProductId;
				COMMIT
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END