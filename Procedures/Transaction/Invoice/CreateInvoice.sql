USE SimpleOrder;
GO

CREATE OR ALTER PROCEDURE CreateInvoice
(
	@CustomerId INT,
	@InvoiceId INT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Invoices(AddressId, OrderDate, CustomerId, Total)
			VALUES((Select AddressId from Customers where Id = @CustomerId),
				SYSDATETIMEOFFSET(),
				@CustomerId,  
				(select SUM(SC.Quantity * P.Price) AS Total from ShoppingCarts SC 
					join Products P on SC.ProductId = P.Id
					where CustomerId = @CustomerId));
		COMMIT
		SELECT @InvoiceId = SCOPE_IDENTITY();
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK;
			END
	END CATCH
END