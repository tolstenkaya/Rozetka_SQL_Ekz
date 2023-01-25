CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Names NVARCHAR(100) NOT NULL,
Surname NVARCHAR(100) NOT NULL,
DateBH DATE NOT NULL CHECK(DateBH!>GETDATE()),
Email NVARCHAR(100) NOT NULL UNIQUE,
Telephone NVARCHAR(10) NOT NULL UNIQUE,
Position NVARCHAR(20) NOT NULL,
Passwords NVARCHAR(20) NOT NULL
)

INSERT INTO Users
VALUES
('Alyona','Tut','07.07.2001','o.tutova.82@gmail.com','0989749809','client', '619709_Tut'),
('Yuriy','Uchiha','09.03.1998','kisss@gmail.com','0973768761','admin','Yu74394riy!'),
('Olya', 'Filippova','19.03.1982', 'tutovaolga@gmail.com','0961919506', 'admin', 'Ol_Tut_030719'),
('Roman', 'Tut', '06.08.1980', 'tutroma@gmail.com', '0964273245', 'client', 'Roman_Tut_76808')

SELECT * FROM Users

DROP TABLE Users

CREATE TABLE Administrator
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
UsersId INT NOT NULL REFERENCES Users(Id) ON DELETE CASCADE,
FullName NVARCHAR(MAX) NOT NULL,
Logins NVARCHAR(50) NOT NULL UNIQUE,
Passwords NVARCHAR(20) NOT NULL
)
DROP TABLE Administrator
SELECT * FROM Administrator

CREATE TABLE Clients
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
UsersId INT NOT NULL REFERENCES Users(Id) ON DELETE CASCADE,
FullName NVARCHAR(MAX) NOT NULL,
Logins NVARCHAR(50) NOT NULL UNIQUE,
Passwords NVARCHAR(20) NOT NULL
)

SELECT * FROM Clients

DROP TABLE Clients

CREATE TABLE GeneralCategory
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Names NVARCHAR(100) NOT NULL
)

INSERT INTO GeneralCategory
VALUES
('Laptops and computers'),
('Smartphones, TV and electronics'),
('Goods for gamers'),
('Appliances'),
('Household products'),
('Tools and auto products'),
('Plumbing and repair'),
('Cottage, garden and vegetable garden'),
('Sports and hobbies'),
('Clothes, shoes and jewelry'),
('Beauty and health'),
('Childrens products'),
('Pet supplies'),
('Office, school, books'),
('Alcoholic drinks and products'),
('To our defenders'),
('Light for shopping up to -50%')

SELECT * FROM GeneralCategory

CREATE TABLE LocalCategory
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
GeneralCategoryId INT NOT NULL REFERENCES GeneralCategory(Id) ON DELETE CASCADE,
Names NVARCHAR(100) NOT NULL
)

CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Names NVARCHAR(MAX) NOT NULL UNIQUE,
Price INT NOT NULL CHECK(Price!<0),
Amount INT CHECK(Amount!<0),
Manufacturer NVARCHAR(MAX) NOT NULL,
Characteristics NVARCHAR(MAX) NOT NULL UNIQUE,
Reviews NVARCHAR(MAX) NOT NULL,
Question NVARCHAR(MAX) NOT NULL,
IsExistDiscount BIT DEFAULT(0),
Discount INT CHECK(Discount!<0)
)


CREATE TRIGGER CheckPositionAndSeparateUsers
ON Users
FOR INSERT, UPDATE
AS
IF(SELECT Position FROM inserted)='admin'
BEGIN
INSERT INTO Administrator
SELECT Id,Names+' '+Surname, Email, Passwords FROM inserted WHERE inserted.Position='admin'
END
ELSE
BEGIN
IF(SELECT Position FROM inserted)='client'
BEGIN
INSERT INTO Clients
SELECT Id, Names+' '+Surname, Email, Passwords FROM inserted WHERE inserted.Position='client'
END
ELSE
BEGIN
RAISERROR('Entered position does not exist',0,1)
ROLLBACK TRANSACTION
END
END

DROP TRIGGER CheckPositionAndSeparateUsers