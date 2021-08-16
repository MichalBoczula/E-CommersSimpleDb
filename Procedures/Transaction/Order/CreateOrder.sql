USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE CreateOrder
(
	@CustomerId INT,
	@InvoiceId INT
)
AS
BEGIN
	BEGIN TRY
		SELECT CustomerId, ProductId, Quantity INTO #TEMP FROM ShoppingCarts WHERE CustomerId = 1;
		
		SELECT * from #TEMP;

		ALTER TABLE #TEMP
			ADD InvoiceId INT;
	
		UPDATE #TEMP
			SET InvoiceId = @InvoiceId;

		BEGIN TRANSACTION AddRecordsToOrders
		
			INSERT INTO Orders(CustomerId, ProductId, Quantity, InvoiceId)
					SELECT CustomerId, ProductId, Quantity, InvoiceId FROM #TEMP WHERE CustomerId = @CustomerId;
		
		COMMIT TRANSACTION AddRecordsToOrders;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END
