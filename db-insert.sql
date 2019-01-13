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

INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 982', 20, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 239', 23, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 449', 24, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 148', 25, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 487', 26, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 680', 27, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 934', 29, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 204', 34, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 305', 38, 1, 1)
INSERT INTO Customers (Name, Age, CityId, UserId)
VALUES ('Customer 075', 38, 1, 1)

INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180918', 15, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20181002', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20181103', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20181004', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 3, 3)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 2, 1)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 1, 2)
INSERT INTO Tickets (TicketTypeId, CreatedOn, AmountDays, CustomerId, UserId)
VALUES (1, '20180618', 20, 2, 2)

INSERT INTO UsersRoles (UserId, RoleId)
VALUES (1, 1)

