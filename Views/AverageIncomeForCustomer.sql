Use SimpleOrder
GO

CREATE OR ALTER PROCEDURE CreateOrAlterAverageIncomeForCustomerProcedure
AS
	EXECUTE ('CREATE OR ALTER VIEW View_AverageIncomeForCustomer
	AS
	SELECT 
		CONCAT(C.FirstName, '' '', C.LastName) AS ''FullName'',
		SubQuery.AverageIncome
	FROM Customers C
	JOIN (
		SELECT O.CustomerId, FORMAT(ROUND(AVG(O.Total), 2), ''c'') AS ''AverageIncome'' FROM Invoices O
		GROUP BY O.CustomerId
	) AS SubQuery ON C.Id = SubQuery.CustomerId');