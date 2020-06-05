--1

BEGIN
	SELECT empl.* , eph.Rate 
	FROM  [AdventureWorks2017].[HumanResources].[EmployeePayHistory] eph, [AdventureWorks2017].[HumanResources].[Employee] empl 
	WHERE empl.BusinessEntityID=eph.BusinessEntityID AND eph.Rate>(SELECT AVG(Rate) FROM  [AdventureWorks2017].[HumanResources].[EmployeePayHistory])
END;


--2

CREATE FUNCTION wysylka (@nr_zamowienia INT)
RETURNS datetime
AS
BEGIN
	DECLARE @wysylka datetime;
	SELECT @wysylka=ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] WHERE SalesOrderID=@nr_zamowienia;
	RETURN @wysylka
END;



--3

CREATE PROCEDURE p_details @Name nvarchar(50)
AS BEGIN
	SELECT prp.ProductID, prp.ProductNumber, pri.Quantity
	FROM [AdventureWorks2017].[Production].[Product] prp 
	JOIN [AdventureWorks2017].[Production].[ProductInventory] pri
	ON prp.ProductID=pri.ProductID
	WHERE prp.Name=@Name;
END;


--4
CREATE FUNCTION credit_card (@order INT)
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @card_no nvarchar(25)
	SELECT @card_no=cc.CardNumber FROM [AdventureWorks2017].[Sales].[CreditCard] cc
	JOIN [AdventureWorks2017].[Sales].[SalesOrderHeader] soh
	ON soh.CreditCardID=cc.CreditCardID
	WHERE soh.SalesOrderID=@order;
	RETURN @card_no
END;


--5

CREATE PROCEDURE d5 (@num1 int, @num2 int)
AS
BEGIN
	
	IF @num1 < @num2 
	BEGIN
		RAISERROR('Niew³aœciwie zdefiniowa³eœ dane wejœciowe',11,1);
		RETURN;
	END;
	ELSE
	BEGIN
		DECLARE @wynik float;
		SET @wynik = @num1/@num2;
		SELECT @wynik as wynik
		RETURN @wynik;
	END;	
END;
