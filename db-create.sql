USE master;
GO

DECLARE @dbname nvarchar(128)
SET @dbname = N'FitnessClub'

IF DB_ID(@dbname) IS NULL
BEGIN
	PRINT 'database "' + @dbname + '" is creating...'
	EXEC('CREATE DATABASE '+ @dbname)
	PRINT 'database "' + @dbname + '" is created.'
END
ELSE
BEGIN
	PRINT 'database "' + @dbname + '" exists.'
END
GO

--EXEC('USE ' + @dbname);
USE FitnessClub;
GO

DECLARE @table nvarchar(128)

SET @table = N'Cities'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'Name varchar(255) NOT NULL,' +
		'Population int' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'Users'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'Name varchar(255) NOT NULL,' +
		'Password varchar(255) NOT NULL,' +
		'Age int,' +
		'FullName varchar(255)' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'Roles'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'Name varchar(255) NOT NULL,' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'TicketTypes'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'Name varchar(255) NOT NULL,' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'Customers'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'Name varchar(255) NOT NULL,' +
		'Age int,' +
		'CityId int FOREIGN KEY REFERENCES Cities(Id),' +
		'UserId int FOREIGN KEY REFERENCES Users(Id)' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'Tickets'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'Id int IDENTITY(1,1) PRIMARY KEY,' +
		'TicketTypeId int FOREIGN KEY REFERENCES TicketTypes(Id),' +
		'CreatedOn date NOT NULL,' +
		'AmountDays int NOT NULL,' +
		'CustomerId int FOREIGN KEY REFERENCES Customers(Id),' +
		'UserId int FOREIGN KEY REFERENCES Users(Id)' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END

SET @table = N'UsersRoles'
IF OBJECT_ID('dbo.' + @table, 'U') IS NULL
BEGIN
	PRINT 'table "' + @table + '" is creating...'
	EXEC('CREATE TABLE '+ @table + '(' +
		'UserId int NOT NULL FOREIGN KEY REFERENCES Users(Id),' +
		'RoleId int NOT NULL FOREIGN KEY REFERENCES Roles(Id)' +
	')')
	PRINT 'table "' + @table + '" is created.'
END
ELSE
BEGIN
	PRINT 'table "' + @table + '" exists.'
END
