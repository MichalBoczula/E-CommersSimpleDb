USE SimpleOrder
GO

CREATE OR ALTER PROCEDURE CreateOrAlterQuantityOfSoldProductsProcedure
AS
	EXECUTE('
		CREATE OR ALTER VIEW View_QuantityOfSoldProducts
		AS
		SELECT P.ProductName, COUNT(P.ProductName) AS ''Quantity'' FROM Orders O
		JOIN Products P ON P.Id = O.ProductId
		GROUP BY P.ProductName');
