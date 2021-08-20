USE SimpleOrder
GO

CREATE VIEW CustomersWithIncomeSum
AS
SELECT 
	CONCAT(C.FirstName, ' ', C.LastName) AS 'Name',  
	CASE 
		WHEN  SubQuery.TotalIncome IS NULL THEN '0'
	ELSE SubQuery.TotalIncome
	END AS 'TotalIncome'
FROM  Customers C
LEFT JOIN (
	SELECT O.CustomerId, FORMAT(ROUND(SUM(O.Total), 2), 'c') AS 'TotalIncome' 
	FROM Invoices O
	GROUP BY O.CustomerId ) AS SubQuery 
ON C.Id = SubQuery.CustomerId;