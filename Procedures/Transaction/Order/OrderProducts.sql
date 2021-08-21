USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE OrderProducts
(
	@CustomerId INT
)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON
		DECLARE @InvoiceIdOut INT;

		EXECUTE CreateInvoice
		@CustomerId = @CustomerId,
		@InvoiceId = @InvoiceIdOut OUTPUT;

		EXECUTE CreateOrder
		@CustomerId = @CustomerId,
		@InvoiceId = @InvoiceIdOut;

		EXECUTE CleanUpShoppingCartForCustomer
		@CustomerId = @CustomerId;

		COMMIT;
		SET NOCOUNT OFF
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END