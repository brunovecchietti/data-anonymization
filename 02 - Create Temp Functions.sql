-- CREATE VIEWS ---------------------------------------------------------------------------

CREATE VIEW tmp.GetNewID
AS
SELECT NewId() AS [NewID]

GO

-------------------------------------------------------------------------------------------

CREATE VIEW tmp.GetRand
AS
SELECT Rand() AS [Rand]

GO

-- CREATE FUNCTIONS -----------------------------------------------------------------------

CREATE FUNCTION tmp.getFirstName()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 119 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = firstName 
	FROM tmp.FirstNames 
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-----------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getLastName()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 99 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = lastName 
	FROM tmp.LastNames 
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getLetter()
RETURNS CHAR(1) 
AS
BEGIN
    DECLARE @Resultado CHAR(1);
	DECLARE @Rand FLOAT;

	SET @Rand = (SELECT [Rand] FROM tmp.GetRand)
	SET @Resultado = (SELECT CHAR(FLOOR(@Rand * 26) + 65))

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getDigit()
RETURNS CHAR(1) 
AS
BEGIN
    DECLARE @Resultado CHAR(1);
	DECLARE @Rand FLOAT;

	SET @Rand = (SELECT [Rand] FROM tmp.GetRand)
	SET @Resultado = (SELECT CHAR(FLOOR(@Rand * 10) + 48))

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getCompanyName()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 5000 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = CompanyName 
	FROM tmp.Companies 
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getAddress1()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 10 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = address1 
	FROM tmp.Address1 
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getAddress2()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 10 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = address2
	FROM tmp.Address2
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getJobTitle()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 25 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = job_title
	FROM tmp.JobTitles
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

-- CREATE FUNCTION tmp.getCities()
-- RETURNS TABLE
-- AS
-- RETURN
-- (
-- 	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
-- 	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 50 + 1)

--     SELECT TOP(1) state_name, state_id, county_name, city_name
--     FROM tmp.Cities
--     WHERE Id = @Id

--     -- SELECT TOP(1) state_name, state_id, county_name, city_name
--     -- FROM tmp.Cities
--     -- ORDER BY (SELECT [NewId] FROM tmp.GetNewID)
-- );

-- GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getCity()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 50 + 1)
    DECLARE @Resultado VARCHAR(50);

	SELECT @Resultado = city_name
	FROM tmp.Cities
	WHERE Id = @Id

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getCounty(@city VARCHAR(50))
RETURNS VARCHAR(50) 
AS
BEGIN	
    DECLARE @Resultado VARCHAR(50);

    IF @city IS NULL
    BEGIN
        DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
        DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 50 + 1)

        SELECT TOP(1) @Resultado = county_name
        FROM tmp.Cities 
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        SELECT TOP(1) @Resultado = county_name
        FROM tmp.Cities 
        WHERE city_name = @city
    END

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getState(@city VARCHAR(50))
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50);

    IF @city IS NULL
    BEGIN
        DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
        DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 50 + 1)
        
        SELECT TOP(1) @Resultado = state_name
        FROM tmp.Cities 
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        SELECT TOP(1) @Resultado = state_name
        FROM tmp.Cities 
        WHERE city_name = @city
    END

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getStateId(@city VARCHAR(50))
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50);

    IF @city IS NULL
    BEGIN
        DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
        DECLARE	@Id INT = (SELECT ABS(CHECKSUM(@NewId)) % 50 + 1)
        
        SELECT TOP(1) @Resultado = state_id
        FROM tmp.Cities 
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        SELECT TOP(1) @Resultado = state_id
        FROM tmp.Cities 
        WHERE city_name = @city
    END

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

-- CREATE FUNCTION tmp.getNumber(@len INT)
-- RETURNS VARCHAR(MAX) 
-- AS
-- BEGIN
--     DECLARE @Resultado VARCHAR(MAX) = '';
-- 	DECLARE @Digit CHAR = '0';

-- 	WHILE @Digit = '0'
-- 	BEGIN
-- 		SET @Digit = (SELECT tmp.getDigit())
-- 	END

-- 	SET @Resultado = CONCAT(@Resultado,@Digit)
	
-- 	WHILE LEN(@Resultado) < @len
-- 	BEGIN
-- 		SET @Digit = (SELECT tmp.getDigit())

-- 		SET @Resultado = CONCAT(@Resultado,@Digit)

-- 	END 

--     RETURN @Resultado;
-- END;

-- GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getNumber(@len INT)
RETURNS VARCHAR(MAX) 
AS
BEGIN
    
	DECLARE @NewId1 VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID);
	DECLARE @NewId2 VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID);
	DECLARE @Resultado VARCHAR(MAX) = (SELECT LEFT(CAST(ABS(CHECKSUM(@NewId1)) AS VARCHAR(20)) + CAST(ABS(CHECKSUM(@NewId2)) AS VARCHAR(20)),@len)) 
	
    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getRandomString()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
    DECLARE @Resultado VARCHAR(50) = LEFT(REPLACE(@NewId,'-',''),10) + ': Lorem ipsum'

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getRandomIP()
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @NEWID1 VARCHAR(50) = (SELECT TOP(1) [NewId] FROM tmp.GetNewID ORDER BY 1)
	DECLARE @NEWID2 VARCHAR(50) = (SELECT TOP(1) [NewId] FROM tmp.GetNewID ORDER BY 1)
	DECLARE @NEWID3 VARCHAR(50) = (SELECT TOP(1) [NewId] FROM tmp.GetNewID ORDER BY 1)
	DECLARE @NEWID4 VARCHAR(50) = (SELECT TOP(1) [NewId] FROM tmp.GetNewID ORDER BY 1)

    DECLARE @Resultado VARCHAR(50) = CONVERT(VARCHAR(255), ABS(CHECKSUM(@NEWID1)) % 255 + 1) + '.' + CONVERT(VARCHAR(255), ABS(CHECKSUM(@NEWID2)) % 255 + 1) + '.' + CONVERT(VARCHAR(255), ABS(CHECKSUM(@NEWID3)) % 255 + 1) + '.' + CONVERT(VARCHAR(255), ABS(CHECKSUM(@NEWID4)) % 255 + 1)

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getRandomEmail()
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50) = LOWER(tmp.getFirstName() + '.' + tmp.getLastName() + tmp.getNumber(4) + '@testmail.com');

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getFullName()
RETURNS VARCHAR(50) 
AS
BEGIN

    DECLARE @NewId VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
    DECLARE	@Id1 INT = (SELECT ABS(CHECKSUM(@NewId)) % 119 + 1)
    DECLARE	@Id2 INT = (SELECT ABS(CHECKSUM(@NewId)) % 99 + 1)
    DECLARE @FirstName VARCHAR(50);
    DECLARE @LastName VARCHAR(50);
    DECLARE @Resultado VARCHAR(50) = '';

    SELECT @FirstName = firstName 
    FROM tmp.FirstNames 
    WHERE Id = @Id1

    SELECT @LastName = lastName 
    FROM tmp.LastNames 
    WHERE Id = @Id2

    SET @Resultado = @FirstName + ' ' + @LastName

    RETURN @Resultado;
    
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getZipCode()
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50) = tmp.getNumber(5);

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getPhoneNumber()
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50) = '(' + tmp.getNumber(3) + ') ' + tmp.getNumber(3) + '-' + tmp.getNumber(4);

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getSSN()
RETURNS VARCHAR(50) 
AS
BEGIN
    DECLARE @Resultado VARCHAR(50) = tmp.getNumber(3) + '-' + tmp.getNumber(2) + '-' + tmp.getNumber(3);

    RETURN @Resultado;
END;

GO

-------------------------------------------------------------------------------------------

CREATE FUNCTION tmp.getRandomDate(@date_from VARCHAR(50), @date_until VARCHAR(50), @format VARCHAR(50))
RETURNS VARCHAR(50) 
AS
BEGIN
    
	DECLARE @NEWID AS VARCHAR(50) = (SELECT [NewId] FROM tmp.GetNewID)
	DECLARE @START_DATE AS DATETIME = (SELECT CAST(@date_from AS DATETIME))
	DECLARE @END_DATE AS DATETIME = (SELECT CAST(@date_until AS DATETIME))
	DECLARE @DATEDIFF AS INTEGER = (SELECT DATEDIFF(day, @START_DATE, @END_DATE))
	DECLARE @RAND AS INTEGER = (SELECT ABS(CHECKSUM(@NEWID)) % @DATEDIFF + 1)

	DECLARE @NEW_DATE AS VARCHAR(50) = (SELECT FORMAT(DATEADD(day, @RAND, @START_DATE), @format))
	
    RETURN @NEW_DATE;
END;

GO