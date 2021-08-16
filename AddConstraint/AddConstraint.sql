ALTER TABLE Customers 
	ADD AdderssId INT,
		CONSTRAINT Address_Fk FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
		SalutationId TINYINT,
		CONSTRAINT Salutatino_Fk FOREIGN KEY (SalutationId) REFERENCES Salutation (Id);
COMMIT;


ALTER TABLE ShoppingCarts
	ADD CONSTRAINT Customer_Fk FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
		CONSTRAINT Product_Fk FOREIGN KEY (ProductId) REFERENCES Products (Id);
COMMIT;

ALTER TABLE Invoices
	ADD CONSTRAINT ShippingAddress_Fk FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
		CONSTRAINT CustomerOrder_Fk FOREIGN KEY (CustomerId) REFERENCES Customers (Id);
COMMIT;

ALTER TABLE Orders
	ADD CONSTRAINT CustomersOrders_Fk FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
		CONSTRAINT InvoiceOrder_Fk FOREIGN KEY (InvoiceId) REFERENCES Invoices (Id)
		ON UPDATE CASCADE,
		CONSTRAINT ProductOrder_Fk FOREIGN KEY (ProductId) REFERENCES Products (Id);
COMMIT;