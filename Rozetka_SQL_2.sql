USE Rozetka

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
('To our defenders')

SELECT * FROM GeneralCategory

DROP TABLE GeneralCategory

CREATE TABLE LocalCategory
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
GeneralCategoryId INT NOT NULL REFERENCES GeneralCategory(Id) ON DELETE CASCADE,
Names NVARCHAR(100) NOT NULL
)

INSERT INTO LocalCategory
VALUES
(1,'Laptops'),
(1,'Computers'),
(1,'Monitors'),
(1,'Gaming'),
(1,'Tablets'),
(1,'Cables and adapters'),
(1,'Computer parts'),
(1,'Network hardware'),
(1,'Headphones and accessories'),
(1,'Keyboards and mice'),
(1,'Electronics accessories'),
(1,'Office equipment'),
(1,'Acustic systems'),
(1,'Software'),
(1,'Graphic tablets'),
(1,'Microphones'),
(1,'Server equipment'),
(1,'Interactive equipment'),
(2,'Mobile phones'),
(2,'TVs'),
(2,'Tablets'),
(2,'Power banks and charging stations'),
(2,'Headphones and accessories'),
(2,'Wearable gadgets'),
(2,'Audio'),
(2,'Photo and video'),
(2,'Mobile phone accessories'),
(2,'TV accessories'),
(2,'Portable electronics'),
(2,'Projection equipment'),
(3,'Gaming consoles'),
(3,'Gaming laptops'),
(3,'Gaming computers'),
(3,'Gaming monitors'),
(3,'Chairs for gamers'),
(3,'Gaming tables'),
(3,'Gaming routers'),
(3,'Attributes and souvenirs'),
(3,'Games'),
(3,'Accessories for gamers'),
(3,'Gaming peripherals'),
(3,'Virtual reality glasses and helmets'),
(4,'Large home appliances'),
(4,'Embedded appliances'),
(4,'Kitchen Appliances'),
(4,'Home and clothing care'),
(4,'Beauty and health'),
(4,'Air conditioning equipment'),
(4,'Water filters'),
(4,'Instrumentation'),
(4,'Services for household appliances'),
(4,'Specialized Chemistry'),
(5,'Home textiles'),
(5,'Dishes'),
(5,'Household chemicals'),
(5,'Furniture'),
(5,'Childrens room'),
(5,'Fireplaces, stoves, saunas'),
(5,'Home decor'),
(5,'Smart home and security'),
(5,'Lighting'),
(5,'Gyms and fitness'),
(5,'Equipment for home and office'),
(5,'Household goods'),
(5,'Door fittings and shutters'),
(5,'Electrical installation equipment'),
(5,'Plumbing and bathroom products'),
(5,'Clock'),
(5,'Storage and organization of space'),
(5,'Pet supplies'),
(5,'Carpet products'),
(5,'Hobbies, needlework and creativity'),
(5,'Souvenir products'),
(5,'Alternative energy sources'),
(6,'Autoelectronics'),
(6,'Auto parts'),
(6,'Technical assistance'),
(6,'Automotive oils'),
(6,'Autochemistry'),
(6,'Car audio'),
(6,'Car interior'),
(6,'Car exterior'),
(6,'Service station equipment'),
(6,'Car care'),
(6,'Tires and wheels'),
(6,'Motorcycle products'),
(6,'Power tool'),
(6,'Hand tool'),
(6,'Equipment'),
(6,'Consumables for tools and accessories'),
(6,'Electrical installation equipment'),
(6,'Instruments'),
(6,'Measuring and marking tool'),
(6,'Tool kit'),
(6,'Spare parts for electric and petrol tools'),
(6,'Cleaning equipment'),
(6,'Overalls'),
(6,'Mounting foams, sealants and adhesives'),
(7,'Plumbing'),
(7,'Lighting'),
(7,'Construction Materials'),
(8,'Garden equipment'),
(8,'Garden tools'),
(8,'Irrigation systems'),
(8,'Plants and their care'),
(8,'Pools and equipment'),
(8,'Garden furniture and decor'),
(8,'Street lighting'),
(8,'Pet supplies'),
(8,'Pet care'),
(8,'Household inventory'),
(8,'Fireplaces, stoves, saunas'),
(8,'Landscaping'),
(9,'Bicycles and accessories'),
(9,'Electric transport'),
(9,'Simulators'),
(9,'Fitness and aerobics'),
(9,'Boxing and martial arts'),
(9,'Supplements and sports nutrition'),
(9,'Team sports'),
(9,'Water sports'),
(9,'Inflatable furniture and accessories'),
(9,'Active recreation and tourism'),
(9,'Camping'),
(9,'Fishing'),
(9,'Radio controlled models'),
(9,'Travel bags and suitcases'),
(9,'Musical instruments and equipment'),
(9,'Optical devices'),
(10,'Clothes for women'),
(10,'Clothing for men'),
(10,'Baby clothes'),
(10,'Thermal underwear'),
(10,'Clothing for hunters and fishermen'),
(10,'Decorations'),
(11,'Dermatocosmetics'),
(11,'Perfumery'),
(11,'Decorative cosmetics'),
(11,'Gift sets of cosmetics'),
(11,'Facial care'),
(11,'Hair care'),
(11,'Cosmetics for children'),
(11,'Body care'),
(11,'Oral care'),
(11,'Shaving products'),
(11,'Products for adults'),
(11,'Hair coloring and permanent waving'),
(11,'Personal protective equipment against COVID-19'),
(11,'Personal hygiene'),
(11,'Feminine hygiene'),
(11,'Everything for manicure and pedicure'),
(11,'Accessories'),
(11,'Pharmacy'),
(12,'Toys'),
(12,'LEGO constructors'),
(12,'Development and creativity'),
(12,'Books'),
(12,'Diapers and swaddling'),
(12,'Nutrition and feeding'),
(12,'Strollers and car seats'),
(12,'Walks and outdoor activities'),
(12,'Holiday Items'),
(12,'Bathing and hygiene'),
(12,'Childrens play complexes'),
(12,'Childrens electric and velomobiles'),
(12,'Game sets'),
(12,'Soft toys, figurines, dolls'),
(12,'Hero figurines'),
(12,'Cars, vehicle models and weapons'),
(12,'Toys for kids, development, entertainment'),
(12,'Goods for mothers'),
(12,'Goods for school'),
(12,'Optical devices'),
(12,'Radio-controlled toys'),
(12,'For the little ones'),
(12,'Childrens room'),
(12,'Childrens clothing, shoes and accessories'),
(13,'Cats'),
(13,'Dogs'),
(13,'Birds'),
(13,'Rodents'),
(13,'Fish'),
(13,'Reptiles'),
(13,'Pond'),
(13,'Ferrets'),
(13,'Remedies for parasites'),
(13,'Cleaning products for animals'),
(13,'Animal husbandry'),
(13,'Ants'),
(14,'School backpacks, knapsacks, bags and pencil cases'),
(14,'School supplies and creativity'),
(14,'Everything for study'),
(14,'Goods for childrens creativity'),
(14,'Paper products'),
(14,'Office equipment and consumables'),
(14,'Office tools'),
(14,'Archiving and office work'),
(14,'Folders, registrars'),
(14,'Painting and graphics'),
(14,'Books'),
(14,'Stamp products'),
(14,'Baby clothes'),
(14,'Retail store equipment'),
(14,'Water coolers'),
(14,'Cleaning equipment'),
(14,'Furniture'),
(14,'Household inventory'),
(15,'Strong alcohol'),
(15,'Wine'),
(15,'Beer and cider'),
(15,'Confectionery'),
(15,'Hot drinks'),
(15,'Tobacco products'),
(15,'Cold drinks'),
(15,'Grocery'),
(15,'Sauces and vegetable oil'),
(15,'Snacks'),
(15,'Children food'),
(15,'Proper nutrition'),
(15,'Dairy products'),
(15,'Tobacco heating systems'),
(15,'Sports nutrition'),
(15,'Cocktails'),
(15,'Accessories for alcohol and tobacco'),
(15,'Electronic cigarettes and accessories'),
(16,'Tactical gear'),
(16,'Tactical and military clothing'),
(16,'Tactical shoes'),
(16,'Optics for surveillance and weapons'),
(16,'Walkie-talkies and accessories'),
(16,'Knives and multi-tools'),
(16,'Sharpeners and accessories'),
(16,'Weapon care products')

SELECT * FROM LocalCategory

CREATE TABLE Laptops
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES GeneralCategory(Id) ON DELETE CASCADE,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
Brand NVARCHAR(100) NOT NULL,
CPU NVARCHAR(50) NOT NULL,
DiagonalScreen FLOAT NOT NULL CHECK(DiagonalScreen!<0),
RAMSize INT NOT NULL CHECK(RAMSize!<0),
DiscreteGraphicsSeries NVARCHAR(50) NOT NULL,
SSDSize INT CHECK(SSDSize!<0),
OperatingSystem NVARCHAR(100),
VideoCardMemory INT NOT NULL CHECK(VideoCardMemory!<0),
NumberOfProcessorCores INT NOT NULL CHECK(NumberOfProcessorCores!<1),
DriveType NVARCHAR(30) NOT NULL,
RAMType NVARCHAR(30) NOT NULL,
HDDSize INT CHECK(HDDSize!<0),
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO Laptops
VALUES
(1,'ASUS TUF Gaming F15 FX506HM-HN017 (90NR0753-M01170)',48999,'Rozetka','Asus','Intel Core i5-11400H',15.6,
16,'NVIDIA GeForce RTX 3060',512,'WITHOUT OS',6,6,'SSD M2','DDR4','-',1)

SELECT * FROM Laptops

DROP TABLE Laptops

CREATE TABLE Computers
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
ComputerType NVARCHAR(50) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
Brand NVARCHAR(100) NOT NULL,
VideoCard NVARCHAR(50) NOT NULL,
CPU NVARCHAR(50) NOT NULL,
ProcessorCores INT NOT NULL CHECK(ProcessorCores!<2),
RAMType NVARCHAR(50) NOT NULL,
RAMSize INT NOT NULL CHECK(RAMSize!<0),
OperatingSystem NVARCHAR(50) NOT NULL,
DriveType NVARCHAR(50) NOT NULL,
SSDSize INT CHECK(SSDSize!<0),
HDDSize INT CHECK(HDDSize!<0),
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO Computers
VALUES
(2,'Monoblock','HP ProOne 440 G6 AiO/i5-10500T (36T64ES)',61055,'Rozetka','Asus',
'AMD Radeon 630','Intel Core i5',6,'DDR4',8,'without os', 'SSD+HDD',256,1000,1)

SELECT * FROM Computers

CREATE TABLE Monitors
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
DisplayDiagonal FLOAT NOT NULL CHECK(DisplayDiagonal!<13),
UpdateFrequency INT NOT NULL,
MaximumDisplayResolution NVARCHAR(20) NOT NULL,
MatrixType NVARCHAR(30) NOT NULL,
Color NVARCHAR(50) NOT NULL,
SideToSide NVARCHAR(20) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO Monitors
VALUES
(3,'Asus','Asus ProArt PA32UCG-K 32" (4711081016458)',314177,'Rozetka',32,5,'1920x1080','IPS','Dark Grey','16:9',1)

SELECT * FROM Monitors

CREATE TABLE MobilePhones
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
DisplayDiagonal FLOAT NOT NULL CHECK(DisplayDiagonal!<4.59),
BuiltInMemory INT NOT NULL CHECK(BuiltInMemory!<2),
BatteryÑapacity NVARCHAR(50) NOT NULL,
OperatingSystem NVARCHAR(50) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO MobilePhones
VALUES
(19,'iPhone','iPhone 14 Pro',77499,'Rozetka',6.1,1000,2999,'ios',1)

SELECT * FROM MobilePhones

CREATE TABLE GamingConsoles
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
Platforms NVARCHAR(50) NOT NULL,
StorageCapacity INT NOT NULL CHECK(StorageCapacity!<2),
Ñontrols NVARCHAR(100) NOT NULL,
GamingConsoles NVARCHAR(100) NOT NULL,
Types NVARCHAR(100) NOT NULL,
RAMSize INT NOT NULL CHECK(RAMSize!<0),
Color NVARCHAR(100) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO GamingConsoles
VALUES
(31,'Sony','Sony PlayStation 5',39377,'Rozetka','Playstation',875,'gamepad','PlayStation','stationary',16,'white',1)

SELECT * FROM GamingConsoles

CREATE TABLE EmbeddedAppliances
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO EmbeddedAppliances
VALUES
(44,'Bosch','BOSCH HBF534EB0Q',13399,'Rozetka',0)

SELECT * FROM EmbeddedAppliances

CREATE TABLE SmartHome
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
TypeConnection NVARCHAR(50),
WirelessStandart NVARCHAR(50),
Compatibility NVARCHAR(100),
TypeInstalation NVARCHAR(100),
Managment NVARCHAR(100),
ÑompatibleOSVersion NVARCHAR(50),
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO SmartHome
VALUES
(60,'Seven lock','Seven lock SL-7709',156610,'Aktezor','wireless','bluetooth/wi-fi','Google Home','Mortise','Telephone Connection(GSM)','Android 4.4 and upper',1)

SELECT * FROM SmartHome

CREATE TABLE Autoelectronics
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO Autoelectronics
VALUES
(75,'Garmin','Garmin ECHOMAP UHD 92sv',105154,'SVM',1)

SELECT * FROM  Autoelectronics

CREATE TABLE Plumbing
(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LocalCategoryId INT NOT NULL REFERENCES LocalCategory(Id) ON DELETE CASCADE,
Brand NVARCHAR(100) NOT NULL,
Names NVARCHAR(100) NOT NULL UNIQUE,
Price MONEY NOT NULL CHECK(Price!<0),
Seller NVARCHAR(50) NOT NULL,
PalletDepth NVARCHAR(50) NOT NULL,
ColorProfile NVARCHAR(50) NOT NULL,
ColorDoor NVARCHAR(50) NOT NULL,
Lengths INT NOT NULL CHECK(Lengths!<80),
Widths INT NOT NULL CHECK(Widths!<71),
Heigths INT NOT NULL CHECK(Heigths!<100),
Forms NVARCHAR(50) NOT NULL,
IsReadyToShip BIT DEFAULT(0)
)

INSERT INTO Plumbing
VALUES
(99,'AQUASTREAM', 'AQUASTREAM Comfort 130 HB', 55650, 'Rozetka', 'deep','grey','black',130,130,217,'angular',1)

SELECT * FROM Plumbing

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