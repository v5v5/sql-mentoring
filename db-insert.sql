USE FitnessClub;
GO

INSERT INTO Cities (Name, Population)
VALUES ('Moscow', 12330126);
INSERT INTO Cities (Name, Population)
VALUES ('Saint-Petersburgh', 5225690);
INSERT INTO Cities (Name, Population)
VALUES ('Novosibirsk', 1584138);
INSERT INTO Cities (Name, Population)
VALUES ('Ekaterinburgh', 1444439);
INSERT INTO Cities (Name, Population)
VALUES ('NigniyNovgorod', 1266871);

INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('Jonny', '111', 23, 'Jonny Killer');
INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('Billy', '123', 24, 'Billy Maniac');
INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('Garry', '222', 25, 'Garry Truman');
INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('Donald', '333', 70, 'Donald Trump');
INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('Ronald', '444', 80, 'Ronald Raigan');
INSERT INTO Users (Name, Password, Age, FullName)
VALUES ('William', '555', 80, 'William Champion');

INSERT INTO Roles (Name)
VALUES ('Instructor');
INSERT INTO Roles (Name)
VALUES ('Booker');
INSERT INTO Roles (Name)
VALUES ('Doctor');

INSERT INTO TicketTypes (Name)
VALUES ('Single');
INSERT INTO TicketTypes (Name)
VALUES ('OneMonth');
INSERT INTO TicketTypes (Name)
VALUES ('OneYear');

--creating customers with random parameters in the loop
DECLARE @i int = 0;
DECLARE @maxCustomers int = 10;
DECLARE @maxCities int = (SELECT COUNT(DISTINCT Name) FROM Cities);
DECLARE @maxUsers int = (SELECT COUNT(DISTINCT Name) FROM Users);

DECLARE @CityId int;
DECLARE @UsersId int;
DECLARE @Age int;
DECLARE @CustomerNameNumber int;
DECLARE @CustomerName nvarchar(128);

WHILE(@i<@MaxCustomers)
BEGIN
	SET @CityId = (SELECT FLOOR(RAND()*(@MaxCities-1+1))+1);
	SET @UsersId = (SELECT FLOOR(RAND()*(@MaxUsers-1+1))+1);
	SET @Age = (SELECT FLOOR(RAND()*(70-10+1))+10);
	SET @CustomerNameNumber = (SELECT FLOOR(RAND()*(1000-100+1))+100);
	SET @CustomerName = CONCAT('Customer ', @CustomerNameNumber);

	INSERT INTO Customers (Name, Age, CityId, UserId)
	VALUES (@CustomerName, @Age, @CityId, @UsersId)

	SET @i = @i + 1;
END

--creating customers with definite parameters
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 982', 20, 1, 1)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 239', 23, 2, 2)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 449', 24, 3, 3)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 148', 25, 3, 4)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 487', 26, 5, 5)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 680', 27, 1, 6)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 934', 29, 2, 1)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 204', 34, 5, 3)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 305', 38, 4, 4)
--INSERT INTO Customers (Name, Age, CityId, UserId)
--VALUES ('Customer 075', 38, 5, 3)


--creating tickets with random parameters in the loop
SET @i = 0;
DECLARE @TicketTypeId int;
DECLARE @MaxTicketType int = (SELECT COUNT(DISTINCT Name) FROM TicketTypes);
DECLARE @MaxTickets int = 20;

DECLARE @FromDate datetime = '2018-01-01'
DECLARE @ToDate datetime = '2019-12-31'
DECLARE @CreatedOn datetime;
DECLARE @AmountDays int;
DECLARE @CustomerId int;
DECLARE @UserId int;

WHILE(@i<@MaxTickets)
BEGIN
	SET @TicketTypeId = (SELECT FLOOR(RAND()*(@MaxTicketType-1+1))+1);
	SET @CreatedOn = (SELECT dateadd(day, 
               rand(checksum(newid()))*(1+datediff(day, @FromDate, @ToDate)), 
               @FromDate));

	IF @TicketTypeId = 1
		SET @AmountDays = (SELECT FLOOR(RAND()*(2-0))+0);
	ELSE IF @TicketTypeId = 2
		SET @AmountDays = (SELECT FLOOR(RAND()*(30-0))+0);
	ELSE
		SET @AmountDays = (SELECT FLOOR(RAND()*(365-0))+0);

	SET @CustomerId = (SELECT FLOOR(RAND()*(@MaxCustomers-1+1))+1);
	SET @UserId = (SELECT FLOOR(RAND()*(@MaxUsers-1+1))+1);

	INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
	VALUES (@TicketTypeId, @CreatedOn, @AmountDays, @CustomerId, @UserId)

	SET @i = @i + 1;
END

--creating tickets with definite parameters
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 10, 1)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180918', 15, 9, 2)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20181002', 232, 8, 3)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20181103', 20, 7, 4)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20181004', 185, 8, 5)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 3, 6)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180618', 27, 3, 1)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20180618', 298, 1, 2)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 1, 3)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180618', 11, 5, 4)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20180618', 73, 1, 5)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 1, 6)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180618', 5, 3, 1)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20180618', 301, 1, 3)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 1, 4)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180618', 12, 2, 1)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20180618', 147, 3, 3)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (1, '20180618', 1, 2, 1)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (2, '20180618', 20, 1, 2)
--INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
--VALUES (3, '20180618', 179, 2, 2)

INSERT INTO UsersRoles (UserId, RoleId)
VALUES (1, 1)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (1, 3)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (2, 2)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (3, 1)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (3, 3)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (4, 1)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (5, 2)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (6, 1)
INSERT INTO UsersRoles (UserId, RoleId)
VALUES (6, 3)

USE master;
GO

