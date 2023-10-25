-- ELIMINA LAS FUNCIONES --

DROP FUNCTION IF EXISTS tmp.getFirstName
DROP FUNCTION IF EXISTS tmp.getLastName
DROP FUNCTION IF EXISTS tmp.getCompanyName
DROP FUNCTION IF EXISTS tmp.getAddress1
DROP FUNCTION IF EXISTS tmp.getAddress2
DROP FUNCTION IF EXISTS tmp.getJobTitle
DROP FUNCTION IF EXISTS tmp.getCities
DROP FUNCTION IF EXISTS tmp.getCity
DROP FUNCTION IF EXISTS tmp.getCounty
DROP FUNCTION IF EXISTS tmp.getState
DROP FUNCTION IF EXISTS tmp.getStateId
DROP FUNCTION IF EXISTS tmp.getLetter
DROP FUNCTION IF EXISTS tmp.getDigit
DROP FUNCTION IF EXISTS tmp.getNumber
DROP FUNCTION IF EXISTS tmp.getFullName
DROP FUNCTION IF EXISTS tmp.getPhoneNumber
DROP FUNCTION IF EXISTS tmp.getRandomEmail
DROP FUNCTION IF EXISTS tmp.getRandomIP
DROP FUNCTION IF EXISTS tmp.getRandomString
DROP FUNCTION IF EXISTS tmp.getSSN
DROP FUNCTION IF EXISTS tmp.getZipCode
DROP FUNCTION IF EXISTS tmp.getRandomDate


-- ELIMINA LAS TABLAS TEMPORALES --

IF OBJECT_ID('tmp.FirstNames', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.FirstNames;
END;

IF OBJECT_ID('tmp.LastNames', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.LastNames;
END;

IF OBJECT_ID('tmp.Companies', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.Companies;
END;

IF OBJECT_ID('tmp.Cities', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.Cities;
END;

IF OBJECT_ID('tmp.Address1', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.Address1;
END;

IF OBJECT_ID('tmp.Address2', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.Address2;
END;

IF OBJECT_ID('tmp.JobTitles', 'U') IS NOT NULL
BEGIN
    DROP TABLE tmp.JobTitles;
END;

-- ELIMINA LA VISTA NEWID --

IF OBJECT_ID('tmp.GetNewID', 'V') IS NOT NULL
BEGIN
    DROP VIEW tmp.GetNewID;
END;

IF OBJECT_ID('tmp.getRand', 'V') IS NOT NULL
BEGIN
    DROP VIEW tmp.getRand;
END;

-- ELIMINA EL SCHEMA TEMPORAL --

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'tmp')
BEGIN
    DROP SCHEMA tmp;
END;

