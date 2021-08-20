CREATE OR ALTER VIEW ShowCustomersInvoiceDetails
AS
SELECT P.ProductName, P.Price, O.Quantity, 
			(P.Price * O.Quantity) AS SUM
			FROM Orders O
				JOIN Products P ON O.ProductId = P.Id
				JOIN Invoices I ON I.Id = O.InvoiceId
				JOIN Addresses A ON I.AddressId = A.Id
			WHERE O.CustomerId = 1;