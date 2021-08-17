USE SimpleOrder
GO

CREATE PROCEDURE CleanUpShoppingCartForCustomer
(
	@CustomerId INT
)
AS
BEGIN
	BEGIN TRY

		DELETE FROM ShoppingCarts WHERE CustomerId = @CustomerId;

	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK
			END
	END CATCH
END