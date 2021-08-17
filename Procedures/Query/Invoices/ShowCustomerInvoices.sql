USE SimpleOrder
GO

CREATE OR ALTER PROCEDURE ShowCustomerInvoices
(
	@CustomerId INT
)
AS
BEGIN 
	BEGIN TRY
		SELECT I.Id, I.OrderDate, A.PostalCode, A.City, 
			A.HouseNumber, A.Street, A.FlatNumber, I.Total
			FROM Invoices I 
				JOIN Addresses A ON I.AddressId = A.Id
			WHERE CustomerId = 1;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN 
				ROLLBACK;
			END
	END CATCH
END