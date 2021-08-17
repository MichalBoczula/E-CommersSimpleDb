USE SimpleOrder
GO

CREATE OR ALTER PROCEDURE ShowCustomerInvoiceDetails
(
	@CustomerId INT,
	@InvoiceId INT
)
AS
BEGIN 
	BEGIN TRY
		SELECT P.ProductName, P.Price, O.Quantity, 
			(P.Price * O.Quantity) AS SUM
			FROM Orders O
				JOIN Products P ON O.ProductId = P.Id
				JOIN Invoices I ON I.Id = O.InvoiceId
				JOIN Addresses A ON I.AddressId = A.Id
			WHERE O.CustomerId = @CustomerId AND
				O.InvoiceId = @InvoiceId;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN 
				ROLLBACK;
			END
	END CATCH
END 