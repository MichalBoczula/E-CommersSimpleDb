USE SimpleOrder
GO 

CREATE VIEW QuantityOfSoldProducts
AS
SELECT P.ProductName, COUNT(P.ProductName) AS 'Quantity' FROM Orders O
JOIN Products P ON P.Id = O.ProductId
GROUP BY P.ProductName;