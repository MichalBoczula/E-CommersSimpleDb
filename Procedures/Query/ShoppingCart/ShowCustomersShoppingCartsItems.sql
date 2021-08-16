USE SimpleOrder;
Go

CREATE OR ALTER PROCEDURE ShowCustomersShoppingCartsItems
(
	@CustomerId INT
)
AS
BEGIN
	BEGIN TRY
		IF EXISTS(
			SELECT 1 FROM ShoppingCarts SC
				WHERE SC.CustomerId = @CustomerId)
			BEGIN
				SELECT P.ProductName, P.Price, SC.Quantity, (P.Price * SC.Quantity) AS PriceSum 
					FROM ShoppingCarts SC
					JOIN Products P ON SC.ProductId = P.Id
					WHERE SC.CustomerId = @CustomerId
				COMMIT;
			END
		ELSE
			BEGIN
				PRINT(CONCAT('User with Id: ', @CustomerId, ' Does not have orders'));
			END
		END TRY
	BEGIN CATCH
		
	END CATCH
END