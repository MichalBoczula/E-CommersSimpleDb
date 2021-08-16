USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE OrderProducts
(
	@CustomerId INT,
	@InvoiceId INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		DECLARE @InvoiceIdOut INT;

		EXECUTE CreateInvoice
		@CustomerId = @CustomerId,
		@InvoiceId = @InvoiceIdOut OUTPUT;

		EXECUTE CreateOrder
		@CustomerId = @CustomerId,
		@InvoiceId = @InvoiceIdOut;

		SELECT @InvoiceId = @InvoiceIdOut;
		COMMIT;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END