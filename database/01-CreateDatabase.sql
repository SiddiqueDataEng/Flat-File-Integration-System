/*
 * Flat File Integration System
 * Project #83 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'FlatFileETL')
BEGIN
    ALTER DATABASE FlatFileETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FlatFileETL;
END
GO

CREATE DATABASE FlatFileETL
ON PRIMARY
(
    NAME = 'FlatFileETL_Data',
    FILENAME = 'C:\SQLData\FlatFileETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'FlatFileETL_Log',
    FILENAME = 'C:\SQLData\FlatFileETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE FlatFileETL SET RECOVERY SIMPLE;
ALTER DATABASE FlatFileETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE FlatFileETL;
GO

PRINT 'Database FlatFileETL created successfully';
PRINT 'Project: Flat File Integration System';
PRINT 'Description: Vendor flat file integration';
GO
