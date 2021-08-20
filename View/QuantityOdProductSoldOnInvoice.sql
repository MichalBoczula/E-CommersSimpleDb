USE SimpleOrder;
Go

CREATE VIEW QuantityOdProductSoldOnInvoice
AS
SELECT  O.InvoiceId, SUM(O.Quantity) AS 'Quantity' FROM Orders O
GROUP BY O.InvoiceId;