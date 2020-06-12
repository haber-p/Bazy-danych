--1
CREATE FUNCTION Fibonacci (@n int)
RETURNS INT
AS
BEGIN
	DECLARE @f0 int;
	DECLARE @f1 int;
	DECLARE @fn int;
	DECLARE @i int;
	SET @f0 = 0;
	SET @f1 = 1;
	SET @i = 2;
	IF (@n = 0)
	BEGIN
		RETURN @f0;
	END;
	ELSE IF (@n = 1)
	BEGIN
		RETURN @f1;
	END;
	ELSE WHILE (@i<=@n)
	BEGIN
		SET @fn = @f0 + @f1;
		SET @f0 = @f1;
		SET @f1 = @fn;
		SET @i = @i + 1;
	END;
	RETURN @fn;
END;


CREATE PROCEDURE ciag @n int

AS BEGIN
	DECLARE @i int;
	SET @i = 0;
	WHILE (@i <= @n)
	BEGIN 
		SELECT dbo.Fibonacci (@i);
		SET @i = @i +1;
	END
END

wywo³anie: EXEC dbo.ciag @n = 10

--2
CREATE TRIGGER nazwiska
ON AdventureWorks2017.Person.Person
AFTER INSERT, UPDATE
AS
UPDATE Person.Person SET LastName = UPPER(LastName)

--3

CREATE TRIGGER taxRateMonitoring
ON AdventureWorks2017.Sales.SalesTaxRate
AFTER UPDATE 
AS BEGIN
	--SET NOCOUNT ON;
	DECLARE @przed FLOAT;
	DECLARE @po FLOAT;
	DECLARE @zmiana FLOAT;
	SELECT @przed = TaxRate FROM inserted;
	SELECT @po = TaxRate FROM deleted;
	IF (@przed > @po)
	BEGIN
		SET @zmiana =1-(@po/@przed);
	END
	IF (@przed < @po)
	BEGIN
		SET @zmiana = (@po/@przed)-1;
	END
	IF (@zmiana> 0.3)
	BEGIN
     RAISERROR('Zbyt du¿a zmiana',11,1);
     ROLLBACK;
     RETURN;
	END;
 END;