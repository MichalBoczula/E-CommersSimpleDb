Use SimpleOrder
GO

CREATE OR ALTER PROCEDURE CreateOrAlterQuantityOfProductSoldOnInvoiceProcedure
AS
	EXECUTE ('
		CREATE OR ALTER VIEW View_QuantityOfProductSoldOnInvoice
		AS
		SELECT  O.InvoiceId, SUM(O.Quantity) AS ''Quantity'' FROM Orders O
		GROUP BY O.InvoiceId');
