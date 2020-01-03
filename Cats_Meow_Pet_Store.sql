/* -------------------------------------- */
/* Create The Cats Meow Pet Store databse */
/* -------------------------------------- */

CREATE DATABASE cats_meow_pet_store;

/* Switch to The Cats Meow Pet Store context */
USE cats_meow_pet_store;

/* -------------------------------------- */
/*      Create Tables for Database        */
/* -------------------------------------- */

/* Creates the customer table, defines basic customer information */
CREATE TABLE customer(
    CustomerID INT AUTO_INCREMENT,
    FirstName VARCHAR(256) NOT NULL,
    LastName VARCHAR(256) NOT NULL,
    PostalCode VARCHAR(6),
    PRIMARY KEY (CustomerID)
);

/* Creates items table, defines item types by what animal it is for */
CREATE TABLE items(
    ItemType INT AUTO_INCREMENT,
    AnimalType VARCHAR(256) NOT NULL,
    PRIMARY KEY (ItemType)
);

/* Creates sale table, defines where the sale takes place (ie. In store, Online, etc.) */
CREATE TABLE sale(
    SaleID INT AUTO_INCREMENT,
    Description VARCHAR(256) NOT NULL,
    PRIMARY KEY (SaleID)
);

/* Creates order_state table, defines the current status of an order (ie. Delivered, Traveling, Cancelled, etc.)*/
CREATE TABLE order_state(
    OrderStatus INT AUTO_INCREMENT,
    Description VARCHAR(256) NOT NULL,
    PRIMARY KEY (OrderStatus)
);

/* Creates inventory_items table, defines items currenty being sold by the store */
CREATE TABLE inventory_items(
    ItemID INT AUTO_INCREMENT,
    ItemType INT,
    Quantity INT NOT NULL,
    Price VARCHAR(256) NOT NULL,
    PRIMARY KEY (ItemID),
    FOREIGN KEY (ItemType) REFERENCES items(ItemType)
);

/* Creates orders table, defines current and past orders made by a given customer */
CREATE TABLE orders(
    OrderID INT AUTO_INCREMENT,
    CustomerID INT,
    OrderStatus INT,
    OrderDate TIMESTAMP NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY (OrderStatus) REFERENCES order_state(OrderStatus)
);

/* Creates sale_content table, defines the items within an order */
CREATE TABLE sale_content(
    OrderID INT,
    ItemID INT,
    SaleID INT,
    Quantity INT NOT NULL,
    Price VARCHAR(256) NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES inventory_items(ItemID),
    FOREIGN KEY (SaleID) REFERENCES sale(SaleID)
);

/* Creates customer_phone table, defines phone number for a given customer */
CREATE TABLE customer_phone(
    CustomerID INT,
    PhoneNumber VARCHAR(32) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

/* Creates customer_address table, defines address of a given customer*/
CREATE TABLE customer_address(
    CustomerID INT,
    Province VARCHAR(2) NOT NULL,
    City VARCHAR(128) NOT NULL,
    StreetName VARCHAR(128) NOT NULL,
    StreetNumber VARCHAR(32) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

/* Creates customer_email table, defines email address for a given customer*/
CREATE TABLE customer_email(
    CustomerID INT,
    Email VARCHAR(256) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

/* -------------------------------------- */
/*  Create inital seed data for Database  */
/* -------------------------------------- */

/* Current Customers */
insert into customer (FirstName, LastName, PostalCode) values ('Debi', 'Kidby', null);
insert into customer (FirstName, LastName, PostalCode) values ('Humbert', 'Wyborn', '802-0044');
insert into customer (FirstName, LastName, PostalCode) values ('Alley', 'Defont', null);
insert into customer (FirstName, LastName, PostalCode) values ('Tymon', 'Lillecrop', null);
insert into customer (FirstName, LastName, PostalCode) values ('Arabel', 'Micallef', null);
insert into customer (FirstName, LastName, PostalCode) values ('Rey', 'Petronis', null);
insert into customer (FirstName, LastName, PostalCode) values ('Tomas', 'Kenshole', '32-043');
insert into customer (FirstName, LastName, PostalCode) values ('Kerstin', 'Djokovic', null);
insert into customer (FirstName, LastName, PostalCode) values ('Travis', 'Fowles', null);
insert into customer (FirstName, LastName, PostalCode) values ('Helyn', 'Tilley', null);
insert into customer (FirstName, LastName, PostalCode) values ('Hally', 'Gerok', '14-210');
insert into customer (FirstName, LastName, PostalCode) values ('Korney', 'Eggleson', null);
insert into customer (FirstName, LastName, PostalCode) values ('Alic', 'Skurm', '332 24');
insert into customer (FirstName, LastName, PostalCode) values ('Kata', 'Papez', '62-560');
insert into customer (FirstName, LastName, PostalCode) values ('Alisander', 'Kondratenko', null);
insert into customer (FirstName, LastName, PostalCode) values ('Daren', 'McGavin', null);
insert into customer (FirstName, LastName, PostalCode) values ('Flori', 'O'' Dornan', null);
insert into customer (FirstName, LastName, PostalCode) values ('Howie', 'Boddice', null);
insert into customer (FirstName, LastName, PostalCode) values ('Ingrim', 'Gwioneth', 'T4L');
insert into customer (FirstName, LastName, PostalCode) values ('Steffen', 'Dodds', null);
insert into customer (FirstName, LastName, PostalCode) values ('Wendie', 'Weddeburn', '6529');
insert into customer (FirstName, LastName, PostalCode) values ('Harley', 'Craig', null);
insert into customer (FirstName, LastName, PostalCode) values ('Alexandre', 'Ridwood', null);
insert into customer (FirstName, LastName, PostalCode) values ('Janel', 'Sahnow', null);
insert into customer (FirstName, LastName, PostalCode) values ('Solomon', 'Niles', null);
insert into customer (FirstName, LastName, PostalCode) values ('Eddy', 'Danslow', '331 51');
insert into customer (FirstName, LastName, PostalCode) values ('Willis', 'Klicher', '5615');
insert into customer (FirstName, LastName, PostalCode) values ('Wilbur', 'Bendson', '3950');
insert into customer (FirstName, LastName, PostalCode) values ('Kathrine', 'Laverty', '144 30');
insert into customer (FirstName, LastName, PostalCode) values ('Thatcher', 'Haquard', null);
insert into customer (FirstName, LastName, PostalCode) values ('Kacy', 'Bovis', null);
insert into customer (FirstName, LastName, PostalCode) values ('Randee', 'Rutigliano', null);
insert into customer (FirstName, LastName, PostalCode) values ('Bryon', 'Hulks', '352552');
insert into customer (FirstName, LastName, PostalCode) values ('Mattie', 'Vye', '368586');
insert into customer (FirstName, LastName, PostalCode) values ('Wilmar', 'Castiglio', '831 76');
insert into customer (FirstName, LastName, PostalCode) values ('Gwynne', 'Bostock', '69460-000');
insert into customer (FirstName, LastName, PostalCode) values ('Guss', 'Glasper', '547079');
insert into customer (FirstName, LastName, PostalCode) values ('Goldarina', 'Windaybank', '73494 CEDEX');
insert into customer (FirstName, LastName, PostalCode) values ('Michele', 'Canto', '2430');
insert into customer (FirstName, LastName, PostalCode) values ('Dalston', 'Northidge', null);
insert into customer (FirstName, LastName, PostalCode) values ('Bondy', 'Sidnell', null);
insert into customer (FirstName, LastName, PostalCode) values ('Charissa', 'Spofforth', '66-602');
insert into customer (FirstName, LastName, PostalCode) values ('Redford', 'Bentley', '56000');
insert into customer (FirstName, LastName, PostalCode) values ('Stan', 'Lumsdale', null);
insert into customer (FirstName, LastName, PostalCode) values ('Romy', 'Klimushev', 'J2E');
insert into customer (FirstName, LastName, PostalCode) values ('David', 'Rosewarne', '91130');
insert into customer (FirstName, LastName, PostalCode) values ('Odelia', 'Petrolli', 'R35');
insert into customer (FirstName, LastName, PostalCode) values ('Cassie', 'Bertelmot', null);
insert into customer (FirstName, LastName, PostalCode) values ('Logan', 'Ratray', '51253');
insert into customer (FirstName, LastName, PostalCode) values ('Taite', 'Bolding', null);
insert into customer (FirstName, LastName, PostalCode) values ('Dasi', 'Petrolli', null);
insert into customer (FirstName, LastName, PostalCode) values ('Freedman', 'MacCague', null);
insert into customer (FirstName, LastName, PostalCode) values ('Melodie', 'Kulver', null);
insert into customer (FirstName, LastName, PostalCode) values ('Glenine', 'Fishleigh', null);
insert into customer (FirstName, LastName, PostalCode) values ('Zed', 'Twaits', '986-2344');
insert into customer (FirstName, LastName, PostalCode) values ('Rab', 'Kmiec', null);
insert into customer (FirstName, LastName, PostalCode) values ('Kacie', 'Brognot', '06500-000');
insert into customer (FirstName, LastName, PostalCode) values ('Jerrilyn', 'Quartly', '102192');
insert into customer (FirstName, LastName, PostalCode) values ('Felicity', 'Larwood', null);
insert into customer (FirstName, LastName, PostalCode) values ('Catherine', 'Cammell', '461173');
insert into customer (FirstName, LastName, PostalCode) values ('Demetria', 'Zaczek', null);
insert into customer (FirstName, LastName, PostalCode) values ('Norry', 'Havercroft', '153007');
insert into customer (FirstName, LastName, PostalCode) values ('Dosi', 'Heather', null);
insert into customer (FirstName, LastName, PostalCode) values ('Taffy', 'Aingell', null);
insert into customer (FirstName, LastName, PostalCode) values ('Madel', 'Chavey', null);
insert into customer (FirstName, LastName, PostalCode) values ('Marnia', 'Marshall', null);
insert into customer (FirstName, LastName, PostalCode) values ('Jordan', 'Broadfoot', null);
insert into customer (FirstName, LastName, PostalCode) values ('Dorey', 'Athersmith', null);
insert into customer (FirstName, LastName, PostalCode) values ('Garner', 'Guyver', '342 80');
insert into customer (FirstName, LastName, PostalCode) values ('Kendricks', 'Clymer', '057418');
insert into customer (FirstName, LastName, PostalCode) values ('Alvis', 'Fisby', null);
insert into customer (FirstName, LastName, PostalCode) values ('Wolfy', 'Raecroft', null);
insert into customer (FirstName, LastName, PostalCode) values ('Ali', 'Juste', '169 65');
insert into customer (FirstName, LastName, PostalCode) values ('Viviana', 'Nieass', null);
insert into customer (FirstName, LastName, PostalCode) values ('Herschel', 'Vise', '76177 CEDEX');
insert into customer (FirstName, LastName, PostalCode) values ('Etienne', 'Francescuccio', '422549');
insert into customer (FirstName, LastName, PostalCode) values ('Fan', 'Legion', '10141');
insert into customer (FirstName, LastName, PostalCode) values ('Garnette', 'Preble', null);
insert into customer (FirstName, LastName, PostalCode) values ('Rickard', 'Maryan', null);
insert into customer (FirstName, LastName, PostalCode) values ('Helsa', 'Wiffill', '9223');
insert into customer (FirstName, LastName, PostalCode) values ('Filippo', 'Cella', null);
insert into customer (FirstName, LastName, PostalCode) values ('Isador', 'Pickle', 'G3M');
insert into customer (FirstName, LastName, PostalCode) values ('Essie', 'Lynthal', null);
insert into customer (FirstName, LastName, PostalCode) values ('Edee', 'Jorat', null);
insert into customer (FirstName, LastName, PostalCode) values ('Raina', 'Anney', null);
insert into customer (FirstName, LastName, PostalCode) values ('Zaneta', 'Bruckner', '30104 CEDEX');
insert into customer (FirstName, LastName, PostalCode) values ('Vanda', 'Mulleary', null);
insert into customer (FirstName, LastName, PostalCode) values ('Gaylord', 'Grimmer', null);
insert into customer (FirstName, LastName, PostalCode) values ('Molli', 'Andrewartha', null);
insert into customer (FirstName, LastName, PostalCode) values ('Aksel', 'Hedlestone', '5869');
insert into customer (FirstName, LastName, PostalCode) values ('Lara', 'Wallage', '81140');
insert into customer (FirstName, LastName, PostalCode) values ('Brigham', 'Eiler', null);
insert into customer (FirstName, LastName, PostalCode) values ('Mikaela', 'Conaghy', '294 74');
insert into customer (FirstName, LastName, PostalCode) values ('Tiffany', 'Axston', '1312');
insert into customer (FirstName, LastName, PostalCode) values ('Sampson', 'Charrington', '346408');
insert into customer (FirstName, LastName, PostalCode) values ('Ringo', 'Roz', null);
insert into customer (FirstName, LastName, PostalCode) values ('Skelly', 'Barfford', '38601');
insert into customer (FirstName, LastName, PostalCode) values ('Sibelle', 'Daintier', '46-320');
insert into customer (FirstName, LastName, PostalCode) values ('Joelle', 'Brigstock', null);
insert into customer (FirstName, LastName, PostalCode) values ('Abbey', 'Spadari', null);

/* Item types */
INSERT INTO items(AnimalType) VALUES ('Cat');
INSERT INTO items(AnimalType) VALUES ('Dog');
INSERT INTO items(AnimalType) VALUES ('Bird');
INSERT INTO items(AnimalType) VALUES ('Rodent');
INSERT INTO items(AnimalType) VALUES ('Fish');

/* Sale types */
INSERT INTO sale(Description) VALUES ('Online');
INSERT INTO sale(Description) VALUES ('In Store');

/* Order status */
INSERT INTO order_state(Description) VALUES ('Delivered');
INSERT INTO order_state(Description) VALUES ('Not Delivered');
INSERT INTO order_state(Description) VALUES ('Cancelled');

/* Current Store Inventory */
insert into inventory_items (ItemType, Quantity, Price) values (4, 79, '$2.31');
insert into inventory_items (ItemType, Quantity, Price) values (5, 36, '$2.07');
insert into inventory_items (ItemType, Quantity, Price) values (5, 95, '$15.40');
insert into inventory_items (ItemType, Quantity, Price) values (4, 38, '$41.85');
insert into inventory_items (ItemType, Quantity, Price) values (5, 57, '$10.82');
insert into inventory_items (ItemType, Quantity, Price) values (3, 73, '$23.01');
insert into inventory_items (ItemType, Quantity, Price) values (2, 76, '$8.03');
insert into inventory_items (ItemType, Quantity, Price) values (4, 85, '$28.15');
insert into inventory_items (ItemType, Quantity, Price) values (4, 23, '$2.00');
insert into inventory_items (ItemType, Quantity, Price) values (1, 99, '$20.33');
insert into inventory_items (ItemType, Quantity, Price) values (5, 60, '$28.49');
insert into inventory_items (ItemType, Quantity, Price) values (1, 78, '$15.33');
insert into inventory_items (ItemType, Quantity, Price) values (5, 83, '$41.57');
insert into inventory_items (ItemType, Quantity, Price) values (4, 63, '$25.81');
insert into inventory_items (ItemType, Quantity, Price) values (5, 77, '$10.32');
insert into inventory_items (ItemType, Quantity, Price) values (1, 60, '$26.23');
insert into inventory_items (ItemType, Quantity, Price) values (3, 72, '$8.28');
insert into inventory_items (ItemType, Quantity, Price) values (3, 94, '$10.67');
insert into inventory_items (ItemType, Quantity, Price) values (5, 69, '$31.07');
insert into inventory_items (ItemType, Quantity, Price) values (5, 64, '$47.27');
insert into inventory_items (ItemType, Quantity, Price) values (2, 47, '$26.39');
insert into inventory_items (ItemType, Quantity, Price) values (4, 72, '$30.26');
insert into inventory_items (ItemType, Quantity, Price) values (1, 33, '$3.62');
insert into inventory_items (ItemType, Quantity, Price) values (5, 58, '$30.53');
insert into inventory_items (ItemType, Quantity, Price) values (4, 56, '$17.06');
insert into inventory_items (ItemType, Quantity, Price) values (1, 47, '$45.03');
insert into inventory_items (ItemType, Quantity, Price) values (1, 55, '$13.97');
insert into inventory_items (ItemType, Quantity, Price) values (2, 84, '$21.39');
insert into inventory_items (ItemType, Quantity, Price) values (5, 96, '$5.63');
insert into inventory_items (ItemType, Quantity, Price) values (1, 37, '$9.02');
insert into inventory_items (ItemType, Quantity, Price) values (2, 25, '$46.05');
insert into inventory_items (ItemType, Quantity, Price) values (4, 7, '$12.15');
insert into inventory_items (ItemType, Quantity, Price) values (3, 14, '$8.38');
insert into inventory_items (ItemType, Quantity, Price) values (5, 79, '$8.38');
insert into inventory_items (ItemType, Quantity, Price) values (3, 58, '$21.63');
insert into inventory_items (ItemType, Quantity, Price) values (4, 76, '$41.79');
insert into inventory_items (ItemType, Quantity, Price) values (5, 78, '$43.36');
insert into inventory_items (ItemType, Quantity, Price) values (2, 50, '$13.26');
insert into inventory_items (ItemType, Quantity, Price) values (3, 54, '$9.18');
insert into inventory_items (ItemType, Quantity, Price) values (4, 4, '$9.78');
insert into inventory_items (ItemType, Quantity, Price) values (3, 38, '$24.75');
insert into inventory_items (ItemType, Quantity, Price) values (3, 83, '$49.02');
insert into inventory_items (ItemType, Quantity, Price) values (4, 23, '$7.00');
insert into inventory_items (ItemType, Quantity, Price) values (5, 10, '$20.12');
insert into inventory_items (ItemType, Quantity, Price) values (5, 45, '$15.73');
insert into inventory_items (ItemType, Quantity, Price) values (3, 46, '$34.48');
insert into inventory_items (ItemType, Quantity, Price) values (2, 29, '$29.81');
insert into inventory_items (ItemType, Quantity, Price) values (4, 62, '$12.01');
insert into inventory_items (ItemType, Quantity, Price) values (2, 86, '$7.15');
insert into inventory_items (ItemType, Quantity, Price) values (4, 41, '$43.98');
insert into inventory_items (ItemType, Quantity, Price) values (4, 50, '$8.26');
insert into inventory_items (ItemType, Quantity, Price) values (2, 49, '$20.19');
insert into inventory_items (ItemType, Quantity, Price) values (5, 66, '$6.66');
insert into inventory_items (ItemType, Quantity, Price) values (4, 63, '$8.54');
insert into inventory_items (ItemType, Quantity, Price) values (3, 25, '$43.83');
insert into inventory_items (ItemType, Quantity, Price) values (4, 47, '$27.90');
insert into inventory_items (ItemType, Quantity, Price) values (5, 49, '$2.91');
insert into inventory_items (ItemType, Quantity, Price) values (4, 32, '$3.31');
insert into inventory_items (ItemType, Quantity, Price) values (1, 80, '$5.55');
insert into inventory_items (ItemType, Quantity, Price) values (4, 16, '$47.49');
insert into inventory_items (ItemType, Quantity, Price) values (4, 86, '$38.91');
insert into inventory_items (ItemType, Quantity, Price) values (5, 27, '$8.48');
insert into inventory_items (ItemType, Quantity, Price) values (4, 77, '$15.73');
insert into inventory_items (ItemType, Quantity, Price) values (5, 67, '$47.00');
insert into inventory_items (ItemType, Quantity, Price) values (5, 36, '$37.27');
insert into inventory_items (ItemType, Quantity, Price) values (5, 55, '$41.89');
insert into inventory_items (ItemType, Quantity, Price) values (4, 61, '$45.55');
insert into inventory_items (ItemType, Quantity, Price) values (1, 44, '$36.34');
insert into inventory_items (ItemType, Quantity, Price) values (2, 30, '$1.48');
insert into inventory_items (ItemType, Quantity, Price) values (5, 94, '$31.64');
insert into inventory_items (ItemType, Quantity, Price) values (3, 89, '$2.25');
insert into inventory_items (ItemType, Quantity, Price) values (5, 1, '$36.74');
insert into inventory_items (ItemType, Quantity, Price) values (5, 23, '$30.20');
insert into inventory_items (ItemType, Quantity, Price) values (5, 82, '$49.26');
insert into inventory_items (ItemType, Quantity, Price) values (1, 48, '$6.62');
insert into inventory_items (ItemType, Quantity, Price) values (2, 49, '$37.55');
insert into inventory_items (ItemType, Quantity, Price) values (5, 74, '$4.44');
insert into inventory_items (ItemType, Quantity, Price) values (4, 6, '$30.69');
insert into inventory_items (ItemType, Quantity, Price) values (5, 61, '$8.04');
insert into inventory_items (ItemType, Quantity, Price) values (4, 62, '$35.00');
insert into inventory_items (ItemType, Quantity, Price) values (2, 57, '$28.73');
insert into inventory_items (ItemType, Quantity, Price) values (2, 6, '$37.95');
insert into inventory_items (ItemType, Quantity, Price) values (3, 13, '$11.91');
insert into inventory_items (ItemType, Quantity, Price) values (4, 0, '$49.73');
insert into inventory_items (ItemType, Quantity, Price) values (2, 43, '$9.13');
insert into inventory_items (ItemType, Quantity, Price) values (2, 93, '$35.46');
insert into inventory_items (ItemType, Quantity, Price) values (5, 48, '$45.27');
insert into inventory_items (ItemType, Quantity, Price) values (4, 79, '$11.21');
insert into inventory_items (ItemType, Quantity, Price) values (1, 0, '$33.68');
insert into inventory_items (ItemType, Quantity, Price) values (3, 36, '$35.10');
insert into inventory_items (ItemType, Quantity, Price) values (1, 66, '$39.84');
insert into inventory_items (ItemType, Quantity, Price) values (2, 86, '$11.47');
insert into inventory_items (ItemType, Quantity, Price) values (4, 31, '$38.27');
insert into inventory_items (ItemType, Quantity, Price) values (3, 11, '$12.02');
insert into inventory_items (ItemType, Quantity, Price) values (1, 42, '$22.07');
insert into inventory_items (ItemType, Quantity, Price) values (1, 56, '$18.87');
insert into inventory_items (ItemType, Quantity, Price) values (5, 2, '$16.48');
insert into inventory_items (ItemType, Quantity, Price) values (1, 36, '$11.07');
insert into inventory_items (ItemType, Quantity, Price) values (1, 85, '$13.50');
insert into inventory_items (ItemType, Quantity, Price) values (2, 57, '$39.79');

/* Current Orders */
insert into orders (CustomerID, OrderStatus, OrderDate) values (65, 3, '2019/10/13');
insert into orders (CustomerID, OrderStatus, OrderDate) values (32, 3, '2019/09/09');
insert into orders (CustomerID, OrderStatus, OrderDate) values (11, 2, '2019/10/14');
insert into orders (CustomerID, OrderStatus, OrderDate) values (88, 3, '2019/09/05');
insert into orders (CustomerID, OrderStatus, OrderDate) values (34, 1, '2019/09/18');
insert into orders (CustomerID, OrderStatus, OrderDate) values (22, 1, '2019/09/14');
insert into orders (CustomerID, OrderStatus, OrderDate) values (80, 2, '2019/10/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (7, 1, '2019/10/25');
insert into orders (CustomerID, OrderStatus, OrderDate) values (5, 3, '2019/10/05');
insert into orders (CustomerID, OrderStatus, OrderDate) values (67, 2, '2019/09/27');
insert into orders (CustomerID, OrderStatus, OrderDate) values (31, 1, '2019/11/03');
insert into orders (CustomerID, OrderStatus, OrderDate) values (83, 1, '2019/10/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (5, 1, '2019/11/12');
insert into orders (CustomerID, OrderStatus, OrderDate) values (43, 2, '2019/11/14');
insert into orders (CustomerID, OrderStatus, OrderDate) values (3, 1, '2019/11/15');
insert into orders (CustomerID, OrderStatus, OrderDate) values (46, 3, '2019/10/27');
insert into orders (CustomerID, OrderStatus, OrderDate) values (4, 1, '2019/10/21');
insert into orders (CustomerID, OrderStatus, OrderDate) values (48, 2, '2019/11/04');
insert into orders (CustomerID, OrderStatus, OrderDate) values (86, 1, '2019/10/30');
insert into orders (CustomerID, OrderStatus, OrderDate) values (19, 1, '2019/10/23');
insert into orders (CustomerID, OrderStatus, OrderDate) values (11, 2, '2019/10/27');
insert into orders (CustomerID, OrderStatus, OrderDate) values (20, 1, '2019/10/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (30, 1, '2019/10/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (4, 3, '2019/11/05');
insert into orders (CustomerID, OrderStatus, OrderDate) values (24, 2, '2019/10/22');
insert into orders (CustomerID, OrderStatus, OrderDate) values (67, 1, '2019/10/11');
insert into orders (CustomerID, OrderStatus, OrderDate) values (41, 3, '2019/10/21');
insert into orders (CustomerID, OrderStatus, OrderDate) values (81, 2, '2019/10/30');
insert into orders (CustomerID, OrderStatus, OrderDate) values (58, 1, '2019/09/13');
insert into orders (CustomerID, OrderStatus, OrderDate) values (72, 1, '2019/09/06');
insert into orders (CustomerID, OrderStatus, OrderDate) values (65, 3, '2019/09/24');
insert into orders (CustomerID, OrderStatus, OrderDate) values (16, 2, '2019/09/11');
insert into orders (CustomerID, OrderStatus, OrderDate) values (85, 1, '2019/10/23');
insert into orders (CustomerID, OrderStatus, OrderDate) values (40, 2, '2019/10/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (24, 1, '2019/09/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (99, 2, '2019/10/22');
insert into orders (CustomerID, OrderStatus, OrderDate) values (17, 3, '2019/11/09');
insert into orders (CustomerID, OrderStatus, OrderDate) values (19, 2, '2019/09/19');
insert into orders (CustomerID, OrderStatus, OrderDate) values (18, 2, '2019/09/25');
insert into orders (CustomerID, OrderStatus, OrderDate) values (11, 3, '2019/10/08');
insert into orders (CustomerID, OrderStatus, OrderDate) values (50, 1, '2019/09/19');
insert into orders (CustomerID, OrderStatus, OrderDate) values (25, 3, '2019/10/27');
insert into orders (CustomerID, OrderStatus, OrderDate) values (41, 2, '2019/09/15');
insert into orders (CustomerID, OrderStatus, OrderDate) values (87, 1, '2019/11/08');
insert into orders (CustomerID, OrderStatus, OrderDate) values (83, 1, '2019/10/17');
insert into orders (CustomerID, OrderStatus, OrderDate) values (93, 3, '2019/10/09');
insert into orders (CustomerID, OrderStatus, OrderDate) values (87, 3, '2019/10/06');
insert into orders (CustomerID, OrderStatus, OrderDate) values (27, 3, '2019/11/12');
insert into orders (CustomerID, OrderStatus, OrderDate) values (38, 1, '2019/09/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (78, 2, '2019/10/22');
insert into orders (CustomerID, OrderStatus, OrderDate) values (24, 2, '2019/11/13');
insert into orders (CustomerID, OrderStatus, OrderDate) values (62, 3, '2019/09/27');
insert into orders (CustomerID, OrderStatus, OrderDate) values (80, 3, '2019/10/31');
insert into orders (CustomerID, OrderStatus, OrderDate) values (56, 2, '2019/11/11');
insert into orders (CustomerID, OrderStatus, OrderDate) values (75, 1, '2019/10/17');
insert into orders (CustomerID, OrderStatus, OrderDate) values (78, 3, '2019/10/07');
insert into orders (CustomerID, OrderStatus, OrderDate) values (55, 3, '2019/09/18');
insert into orders (CustomerID, OrderStatus, OrderDate) values (9, 1, '2019/10/11');
insert into orders (CustomerID, OrderStatus, OrderDate) values (9, 3, '2019/11/07');
insert into orders (CustomerID, OrderStatus, OrderDate) values (48, 3, '2019/09/24');
insert into orders (CustomerID, OrderStatus, OrderDate) values (88, 1, '2019/10/13');
insert into orders (CustomerID, OrderStatus, OrderDate) values (21, 2, '2019/11/01');
insert into orders (CustomerID, OrderStatus, OrderDate) values (100, 3, '2019/11/03');
insert into orders (CustomerID, OrderStatus, OrderDate) values (91, 3, '2019/09/21');
insert into orders (CustomerID, OrderStatus, OrderDate) values (32, 1, '2019/11/08');
insert into orders (CustomerID, OrderStatus, OrderDate) values (72, 1, '2019/10/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (44, 1, '2019/09/14');
insert into orders (CustomerID, OrderStatus, OrderDate) values (98, 2, '2019/10/16');
insert into orders (CustomerID, OrderStatus, OrderDate) values (55, 2, '2019/10/29');
insert into orders (CustomerID, OrderStatus, OrderDate) values (1, 3, '2019/09/30');
insert into orders (CustomerID, OrderStatus, OrderDate) values (82, 3, '2019/11/03');
insert into orders (CustomerID, OrderStatus, OrderDate) values (54, 2, '2019/09/20');
insert into orders (CustomerID, OrderStatus, OrderDate) values (32, 3, '2019/10/15');
insert into orders (CustomerID, OrderStatus, OrderDate) values (18, 2, '2019/10/02');
insert into orders (CustomerID, OrderStatus, OrderDate) values (28, 2, '2019/11/04');
insert into orders (CustomerID, OrderStatus, OrderDate) values (14, 3, '2019/10/12');
insert into orders (CustomerID, OrderStatus, OrderDate) values (83, 3, '2019/10/04');
insert into orders (CustomerID, OrderStatus, OrderDate) values (59, 1, '2019/09/02');
insert into orders (CustomerID, OrderStatus, OrderDate) values (10, 3, '2019/10/06');
insert into orders (CustomerID, OrderStatus, OrderDate) values (74, 2, '2019/09/05');
insert into orders (CustomerID, OrderStatus, OrderDate) values (55, 3, '2019/11/12');
insert into orders (CustomerID, OrderStatus, OrderDate) values (92, 2, '2019/09/09');
insert into orders (CustomerID, OrderStatus, OrderDate) values (9, 3, '2019/09/12');
insert into orders (CustomerID, OrderStatus, OrderDate) values (28, 3, '2019/10/23');
insert into orders (CustomerID, OrderStatus, OrderDate) values (55, 3, '2019/11/03');
insert into orders (CustomerID, OrderStatus, OrderDate) values (64, 2, '2019/09/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (85, 1, '2019/09/04');
insert into orders (CustomerID, OrderStatus, OrderDate) values (3, 3, '2019/10/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (84, 1, '2019/11/13');
insert into orders (CustomerID, OrderStatus, OrderDate) values (22, 2, '2019/10/10');
insert into orders (CustomerID, OrderStatus, OrderDate) values (71, 1, '2019/10/23');
insert into orders (CustomerID, OrderStatus, OrderDate) values (63, 1, '2019/10/25');
insert into orders (CustomerID, OrderStatus, OrderDate) values (69, 2, '2019/09/10');
insert into orders (CustomerID, OrderStatus, OrderDate) values (55, 1, '2019/10/21');
insert into orders (CustomerID, OrderStatus, OrderDate) values (24, 1, '2019/09/05');
insert into orders (CustomerID, OrderStatus, OrderDate) values (53, 1, '2019/10/19');
insert into orders (CustomerID, OrderStatus, OrderDate) values (35, 3, '2019/09/07');
insert into orders (CustomerID, OrderStatus, OrderDate) values (15, 3, '2019/10/19');
insert into orders (CustomerID, OrderStatus, OrderDate) values (14, 1, '2019/10/26');
insert into orders (CustomerID, OrderStatus, OrderDate) values (87, 2, '2019/10/31');

/* Current Orders Content */
insert into sale_content (ItemID, SaleID, Quantity, Price) values (15, 2, 10, '$10.14');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (88, 1, 27, '$40.70');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (10, 1, 23, '$42.31');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (69, 1, 19, '$8.10');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (99, 1, 6, '$7.21');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (61, 2, 12, '$14.01');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (30, 2, 19, '$5.13');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (32, 2, 30, '$41.36');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (25, 2, 7, '$12.14');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (52, 1, 14, '$35.33');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (69, 2, 4, '$44.26');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (78, 2, 1, '$46.78');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (14, 2, 5, '$35.17');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (83, 2, 28, '$32.40');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (28, 1, 22, '$2.17');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (62, 2, 7, '$25.93');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (6, 1, 29, '$1.13');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (44, 2, 16, '$47.11');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (58, 2, 25, '$32.67');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (39, 1, 15, '$39.67');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (66, 2, 25, '$28.12');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (83, 2, 23, '$22.51');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (40, 2, 0, '$5.50');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (14, 1, 22, '$27.96');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (95, 2, 5, '$45.10');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (44, 2, 29, '$7.99');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (15, 1, 18, '$49.64');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (96, 2, 2, '$8.68');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (21, 1, 12, '$5.51');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (51, 2, 9, '$33.81');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (37, 1, 19, '$26.12');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (84, 2, 29, '$9.11');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (57, 2, 13, '$31.23');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (87, 1, 20, '$41.93');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (95, 2, 16, '$7.20');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (96, 1, 13, '$5.00');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (92, 2, 24, '$3.28');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (70, 1, 25, '$8.30');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (18, 1, 30, '$11.15');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (71, 1, 10, '$30.49');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (96, 1, 14, '$11.19');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (66, 2, 7, '$19.29');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (7, 2, 5, '$41.94');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (31, 1, 20, '$10.32');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (26, 2, 22, '$15.94');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (38, 1, 17, '$12.36');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (56, 2, 27, '$17.05');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (76, 2, 0, '$12.84');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (18, 1, 15, '$26.84');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (79, 2, 30, '$28.04');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (47, 2, 22, '$19.61');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (9, 2, 22, '$4.66');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (68, 2, 24, '$20.60');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (70, 2, 19, '$7.11');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (14, 2, 5, '$39.83');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (46, 2, 22, '$24.36');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (88, 2, 16, '$40.03');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (81, 1, 2, '$7.56');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (19, 2, 21, '$8.85');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (86, 1, 10, '$10.58');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (59, 1, 22, '$35.57');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (24, 2, 13, '$42.84');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (43, 2, 18, '$30.93');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (27, 1, 17, '$10.02');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (9, 1, 3, '$15.83');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (90, 1, 17, '$29.69');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (65, 1, 1, '$14.14');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (69, 1, 6, '$32.72');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (60, 1, 8, '$48.91');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (74, 1, 16, '$30.59');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (8, 1, 2, '$35.51');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (70, 1, 14, '$49.44');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (2, 1, 25, '$11.30');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (65, 1, 17, '$47.11');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (70, 2, 10, '$2.18');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (69, 1, 28, '$34.22');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (9, 2, 29, '$30.18');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (1, 1, 9, '$27.30');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (41, 1, 27, '$20.98');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (5, 2, 15, '$17.80');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (31, 2, 7, '$31.65');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (55, 2, 8, '$28.91');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (28, 2, 17, '$19.91');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (75, 2, 17, '$12.68');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (21, 1, 13, '$28.35');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (24, 1, 19, '$4.71');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (60, 2, 27, '$26.88');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (19, 1, 16, '$39.39');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (26, 2, 14, '$47.54');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (11, 2, 28, '$4.16');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (38, 1, 12, '$39.15');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (61, 2, 12, '$22.62');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (91, 2, 24, '$19.23');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (59, 2, 10, '$32.98');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (49, 1, 5, '$9.85');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (6, 1, 22, '$16.41');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (1, 2, 29, '$11.08');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (24, 2, 7, '$32.56');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (16, 1, 4, '$24.38');
insert into sale_content (ItemID, SaleID, Quantity, Price) values (49, 1, 26, '$3.27');

/* Phone numbers associated with a customer(s) */
insert into customer_phone (CustomerID, PhoneNumber) values (97, '86(308)783-5374');
insert into customer_phone (CustomerID, PhoneNumber) values (31, '62(653)314-5724');
insert into customer_phone (CustomerID, PhoneNumber) values (41, '63(521)781-0791');
insert into customer_phone (CustomerID, PhoneNumber) values (20, '33(196)860-6540');
insert into customer_phone (CustomerID, PhoneNumber) values (11, '86(394)234-1781');
insert into customer_phone (CustomerID, PhoneNumber) values (11, '46(346)173-1643');
insert into customer_phone (CustomerID, PhoneNumber) values (28, '81(796)166-2762');
insert into customer_phone (CustomerID, PhoneNumber) values (95, '33(894)848-2944');
insert into customer_phone (CustomerID, PhoneNumber) values (64, '81(920)393-2888');
insert into customer_phone (CustomerID, PhoneNumber) values (50, '86(768)701-7588');
insert into customer_phone (CustomerID, PhoneNumber) values (72, '30(608)116-5934');
insert into customer_phone (CustomerID, PhoneNumber) values (64, '351(995)101-3000');
insert into customer_phone (CustomerID, PhoneNumber) values (84, '86(813)138-8149');
insert into customer_phone (CustomerID, PhoneNumber) values (3, '62(889)922-8920');
insert into customer_phone (CustomerID, PhoneNumber) values (51, '33(319)171-6928');
insert into customer_phone (CustomerID, PhoneNumber) values (45, '52(633)511-1877');
insert into customer_phone (CustomerID, PhoneNumber) values (71, '351(801)910-6705');
insert into customer_phone (CustomerID, PhoneNumber) values (32, '46(201)643-7760');
insert into customer_phone (CustomerID, PhoneNumber) values (36, '62(840)318-4790');
insert into customer_phone (CustomerID, PhoneNumber) values (58, '976(936)832-8070');
insert into customer_phone (CustomerID, PhoneNumber) values (63, '387(725)556-2487');
insert into customer_phone (CustomerID, PhoneNumber) values (69, '33(865)884-3813');
insert into customer_phone (CustomerID, PhoneNumber) values (55, '62(191)283-3959');
insert into customer_phone (CustomerID, PhoneNumber) values (1, '358(259)439-1817');
insert into customer_phone (CustomerID, PhoneNumber) values (15, '371(704)319-4604');
insert into customer_phone (CustomerID, PhoneNumber) values (6, '55(824)910-3495');
insert into customer_phone (CustomerID, PhoneNumber) values (10, '57(844)269-0314');
insert into customer_phone (CustomerID, PhoneNumber) values (3, '63(537)907-5970');
insert into customer_phone (CustomerID, PhoneNumber) values (5, '218(829)462-1135');
insert into customer_phone (CustomerID, PhoneNumber) values (17, '64(898)582-5676');
insert into customer_phone (CustomerID, PhoneNumber) values (8, '62(722)450-3711');
insert into customer_phone (CustomerID, PhoneNumber) values (60, '51(968)679-6373');
insert into customer_phone (CustomerID, PhoneNumber) values (62, '86(468)629-3230');
insert into customer_phone (CustomerID, PhoneNumber) values (8, '48(698)418-6178');
insert into customer_phone (CustomerID, PhoneNumber) values (63, '992(785)278-9467');
insert into customer_phone (CustomerID, PhoneNumber) values (61, '52(812)585-4776');
insert into customer_phone (CustomerID, PhoneNumber) values (75, '381(825)588-9559');
insert into customer_phone (CustomerID, PhoneNumber) values (44, '351(607)549-0513');
insert into customer_phone (CustomerID, PhoneNumber) values (66, '351(632)461-7830');
insert into customer_phone (CustomerID, PhoneNumber) values (48, '62(111)526-7754');
insert into customer_phone (CustomerID, PhoneNumber) values (53, '48(840)307-1427');
insert into customer_phone (CustomerID, PhoneNumber) values (32, '86(485)644-4858');
insert into customer_phone (CustomerID, PhoneNumber) values (28, '255(741)482-4591');
insert into customer_phone (CustomerID, PhoneNumber) values (63, '351(760)331-3822');
insert into customer_phone (CustomerID, PhoneNumber) values (30, '62(584)753-1626');
insert into customer_phone (CustomerID, PhoneNumber) values (69, '47(281)365-9327');
insert into customer_phone (CustomerID, PhoneNumber) values (72, '84(683)418-9915');
insert into customer_phone (CustomerID, PhoneNumber) values (69, '231(532)875-4666');
insert into customer_phone (CustomerID, PhoneNumber) values (70, '86(756)896-1727');
insert into customer_phone (CustomerID, PhoneNumber) values (15, '371(578)127-5219');
insert into customer_phone (CustomerID, PhoneNumber) values (19, '86(651)477-4702');
insert into customer_phone (CustomerID, PhoneNumber) values (13, '234(335)655-1154');
insert into customer_phone (CustomerID, PhoneNumber) values (26, '30(643)646-8394');
insert into customer_phone (CustomerID, PhoneNumber) values (85, '504(639)829-8565');
insert into customer_phone (CustomerID, PhoneNumber) values (6, '1(612)477-4814');
insert into customer_phone (CustomerID, PhoneNumber) values (99, '48(555)407-9236');
insert into customer_phone (CustomerID, PhoneNumber) values (74, '45(787)984-6844');
insert into customer_phone (CustomerID, PhoneNumber) values (35, '86(609)467-6903');
insert into customer_phone (CustomerID, PhoneNumber) values (46, '93(347)856-9776');
insert into customer_phone (CustomerID, PhoneNumber) values (88, '63(687)150-3960');
insert into customer_phone (CustomerID, PhoneNumber) values (71, '351(221)273-8946');
insert into customer_phone (CustomerID, PhoneNumber) values (42, '7(384)688-1065');
insert into customer_phone (CustomerID, PhoneNumber) values (58, '33(384)703-0411');
insert into customer_phone (CustomerID, PhoneNumber) values (74, '48(393)487-7619');
insert into customer_phone (CustomerID, PhoneNumber) values (18, '7(547)874-1039');
insert into customer_phone (CustomerID, PhoneNumber) values (69, '86(251)891-9894');
insert into customer_phone (CustomerID, PhoneNumber) values (34, '351(540)191-1637');
insert into customer_phone (CustomerID, PhoneNumber) values (71, '7(919)212-2803');
insert into customer_phone (CustomerID, PhoneNumber) values (35, '351(618)536-9872');
insert into customer_phone (CustomerID, PhoneNumber) values (89, '375(283)247-9399');
insert into customer_phone (CustomerID, PhoneNumber) values (60, '86(128)296-4080');
insert into customer_phone (CustomerID, PhoneNumber) values (87, '226(309)226-9493');
insert into customer_phone (CustomerID, PhoneNumber) values (4, '48(928)420-4147');
insert into customer_phone (CustomerID, PhoneNumber) values (15, '48(114)664-8047');
insert into customer_phone (CustomerID, PhoneNumber) values (14, '234(226)882-7639');
insert into customer_phone (CustomerID, PhoneNumber) values (9, '63(130)479-7699');
insert into customer_phone (CustomerID, PhoneNumber) values (85, '86(493)529-5910');
insert into customer_phone (CustomerID, PhoneNumber) values (76, '47(770)782-0009');
insert into customer_phone (CustomerID, PhoneNumber) values (78, '81(801)604-7052');
insert into customer_phone (CustomerID, PhoneNumber) values (90, '86(952)917-5242');
insert into customer_phone (CustomerID, PhoneNumber) values (94, '46(856)469-1868');
insert into customer_phone (CustomerID, PhoneNumber) values (69, '242(268)350-1483');
insert into customer_phone (CustomerID, PhoneNumber) values (27, '60(407)291-1833');
insert into customer_phone (CustomerID, PhoneNumber) values (34, '82(523)529-4534');
insert into customer_phone (CustomerID, PhoneNumber) values (5, '48(799)316-0129');
insert into customer_phone (CustomerID, PhoneNumber) values (24, '62(557)119-0999');
insert into customer_phone (CustomerID, PhoneNumber) values (55, '27(263)917-1013');
insert into customer_phone (CustomerID, PhoneNumber) values (22, '7(808)239-7873');
insert into customer_phone (CustomerID, PhoneNumber) values (55, '86(350)954-3662');
insert into customer_phone (CustomerID, PhoneNumber) values (60, '351(996)669-4979');
insert into customer_phone (CustomerID, PhoneNumber) values (34, '375(260)376-6681');
insert into customer_phone (CustomerID, PhoneNumber) values (40, '383(490)600-5241');
insert into customer_phone (CustomerID, PhoneNumber) values (2, '86(351)636-4016');
insert into customer_phone (CustomerID, PhoneNumber) values (45, '33(339)969-1916');
insert into customer_phone (CustomerID, PhoneNumber) values (2, '33(981)543-2541');
insert into customer_phone (CustomerID, PhoneNumber) values (51, '62(933)826-6713');
insert into customer_phone (CustomerID, PhoneNumber) values (12, '420(773)891-3402');
insert into customer_phone (CustomerID, PhoneNumber) values (12, '86(777)569-5424');
insert into customer_phone (CustomerID, PhoneNumber) values (32, '353(721)593-3239');
insert into customer_phone (CustomerID, PhoneNumber) values (25, '82(718)785-5649');

/* Addresses associated with a customer(s) */
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (13, 'NL', 'Esposende', 'Harbort', '5487');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (85, 'NU', 'Merik', 'Butternut', '27');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (72, 'NB', 'Naekan', 'Gina', '058');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (100, 'NT', 'Shiye', 'Buena Vista', '2596');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (55, 'NU', 'Begejci', 'Maple', '1862');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (63, 'MB', 'Xiongchi', 'Sunnyside', '99602');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (86, 'YT', 'Xiadu', 'Hollow Ridge', '3930');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (36, 'MB', 'Rozwadza', 'Russell', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (72, 'SK', 'Letsheng', 'Welch', '86189');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (5, 'NL', 'San Eduardo', 'Brentwood', '9604');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (95, 'AB', 'Malabang', 'Fairview', '01392');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (39, 'PE', 'Peimei', 'Di Loreto', '418');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (89, 'NU', 'Khandagayty', '8th', '812');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (51, 'MB', 'El Fasher', 'Independence', '38');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (17, 'QC', 'Cabean', 'Dayton', '0');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (81, 'PE', 'Jingdang', 'Service', '33916');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (13, 'NB', 'Khān Shaykhūn', '3rd', '3245');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (71, 'NS', 'Tangzi', 'Bowman', '13015');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (41, 'YT', 'Eirado', 'Gateway', '8206');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (63, 'YT', 'Solnechnogorsk', 'Redwing', '4181');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (6, 'NL', 'Cikomara', 'Sutteridge', '1001');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (21, 'BC', 'Pitogo', 'Center', '9907');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (93, 'QC', 'Pajapita', 'Scott', '71');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (87, 'PE', 'Marugame', 'Superior', '0');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (6, 'NB', 'Sevlievo', 'Cody', '0253');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (19, 'QC', 'Shuixi', 'Hauk', '08235');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (85, 'SK', 'Tanggung', 'Cordelia', '38');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (62, 'ON', 'Pýrgos', 'Welch', '24');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (17, 'BC', 'Извор', 'Logan', '93');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (98, 'AB', 'Nioro', 'Esch', '6');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (60, 'SK', 'Nangtang', 'Amoth', '22');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (1, 'QC', 'Nkoteng', 'Fordem', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (85, 'PE', 'Omaruru', 'Rieder', '36498');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (70, 'SK', 'Kendung Timur', 'Hovde', '12453');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (99, 'QC', 'Tokonou', '4th', '18');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (91, 'BC', 'Kalayemule', 'Northridge', '026');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (52, 'SK', 'Fushui', 'Thierer', '3');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (16, 'QC', 'Cisownica', 'Petterle', '5064');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (63, 'NU', 'Santa Teresa First', 'Warbler', '019');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (93, 'NS', 'Ibadan', 'Algoma', '16');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (59, 'PE', 'Ximafang', 'Golf View', '7485');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (45, 'ON', 'Maxu', 'Warbler', '65');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (70, 'NS', 'Sekartaji', 'Eagan', '953');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (43, 'PE', 'Jawl al Majma‘', 'Red Cloud', '10493');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (97, 'MB', 'Ladner', 'Harbort', '5');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (91, 'QC', 'Kolomyagi', 'Merry', '5');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (59, 'AB', 'Arwād', 'Vernon', '1');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (46, 'YT', 'Kubang', 'Corry', '1');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (61, 'NS', 'La Ravoire', 'Prairieview', '57');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (88, 'MB', 'Zongzhai', 'Kropf', '7736');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (98, 'NS', 'Flers', 'Rowland', '5588');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (1, 'BC', 'Al Jawf', 'Jenna', '4');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (92, 'AB', 'Skoura', 'Mccormick', '5');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (20, 'SK', 'Bagansiapiapi', 'Leroy', '91621');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (11, 'BC', 'Gorichevo', 'Autumn Leaf', '9014');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (36, 'SK', 'Marseille', 'Hoard', '4798');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (91, 'YT', 'Pilang', 'Sycamore', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (51, 'NB', 'Sinarbakti', 'Northwestern', '3');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (64, 'AB', 'Andongsari', 'David', '241');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (60, 'NB', 'Huohua', 'Sullivan', '5466');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (35, 'NB', 'Longquan', 'Lotheville', '045');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (82, 'SK', 'Xaysetha', 'Del Mar', '78');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (97, 'YT', 'Ostrów Lubelski', 'Schiller', '95');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (77, 'BC', 'Taungdwingyi', 'Derek', '8010');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (26, 'NL', 'Heqiao', 'Division', '3354');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (3, 'YT', 'Rumilly', 'Grim', '10');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (73, 'BC', 'Gading', 'Truax', '43');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (98, 'YT', 'Mačkovec', 'Westerfield', '086');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (82, 'NU', 'Kolpny', 'International', '1120');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (93, 'NL', 'Serrinha', 'Eastlawn', '66242');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (5, 'NT', 'Gaocheng', 'Fuller', '7');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (94, 'BC', 'Pavino', 'Continental', '485');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (60, 'NS', '‘Ābūd', 'Oriole', '4');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (77, 'NU', 'Soljani', 'Pierstorff', '2');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (34, 'ON', 'Gala', 'Ramsey', '572');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (51, 'SK', 'Maracaju', 'Dwight', '4');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (39, 'YT', 'Złota', 'Spenser', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (75, 'ON', 'Dongling', 'Holy Cross', '41850');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (2, 'MB', 'Tanabe', 'Sunbrook', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (26, 'NB', 'Sagrada Familia', 'Old Gate', '3317');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (11, 'PE', 'Varāmīn', 'Beilfuss', '7913');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (73, 'QC', 'Banjar Tegal Belodan', 'Portage', '8');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (4, 'SK', 'Picos', 'Packers', '23537');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (100, 'BC', 'Gaoping', 'Glacier Hill', '73');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (47, 'NU', 'Kapsabet', 'Kensington', '879');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (23, 'NU', 'Lalukoen Dua', 'Spohn', '20');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (100, 'NU', 'Dongfu', 'Schmedeman', '252');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (11, 'NS', 'Río Tercero', 'Crowley', '17392');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (40, 'NS', 'Farkhor', 'Summerview', '6496');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (97, 'AB', 'Pyskowice', '6th', '779');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (71, 'PE', 'Pandian', 'Union', '46373');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (9, 'AB', 'Leigongjian', 'Mayer', '3815');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (63, 'NB', 'Žihle', 'Stephen', '9048');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (90, 'NU', 'Xujiaqiao', 'Hudson', '634');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (8, 'NB', 'Paris 13', 'Del Mar', '6570');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (83, 'NS', 'Bromont', 'Prairie Rose', '0580');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (85, 'PE', 'Best', 'Sundown', '14');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (29, 'BC', 'Etten-Leur', 'Vahlen', '52');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (42, 'MB', 'Borovlyany', 'Forest Run', '1692');
insert into customer_address (CustomerID, Province, City, StreetName, StreetNumber) values (35, 'NU', 'Los Angeles', 'Bartillon', '4');

/* Email Adresses associated with a customer(s) */
insert into customer_email (CustomerID, email) values (1, 'hduffil0@patch.com');
insert into customer_email (CustomerID, email) values (4, 'mkimmins1@wordpress.org');
insert into customer_email (CustomerID, email) values (80, 'jikringill2@globo.com');
insert into customer_email (CustomerID, email) values (22, 'goppie3@macromedia.com');
insert into customer_email (CustomerID, email) values (24, 'gspratt4@spiegel.de');
insert into customer_email (CustomerID, email) values (76, 'bcalyton5@umich.edu');
insert into customer_email (CustomerID, email) values (79, 'bgulc6@vimeo.com');
insert into customer_email (CustomerID, email) values (79, 'alesor7@army.mil');
insert into customer_email (CustomerID, email) values (20, 'etoope8@paypal.com');
insert into customer_email (CustomerID, email) values (22, 'gcast9@privacy.gov.au');
insert into customer_email (CustomerID, email) values (90, 'rfowella@163.com');
insert into customer_email (CustomerID, email) values (3, 'aivanyushkinb@prnewswire.com');
insert into customer_email (CustomerID, email) values (45, 'bpaggittc@github.com');
insert into customer_email (CustomerID, email) values (37, 'nstickinsd@4shared.com');
insert into customer_email (CustomerID, email) values (89, 'dknowlese@deviantart.com');
insert into customer_email (CustomerID, email) values (78, 'cscarff@e-recht24.de');
insert into customer_email (CustomerID, email) values (40, 'smaceg@techcrunch.com');
insert into customer_email (CustomerID, email) values (55, 'rglastonburyh@constantcontact.com');
insert into customer_email (CustomerID, email) values (23, 'ncraneyi@ocn.ne.jp');
insert into customer_email (CustomerID, email) values (97, 'lbladgej@about.me');
insert into customer_email (CustomerID, email) values (41, 'lwylliek@redcross.org');
insert into customer_email (CustomerID, email) values (13, 'ayearbyl@free.fr');
insert into customer_email (CustomerID, email) values (63, 'cwallerm@dagondesign.com');
insert into customer_email (CustomerID, email) values (35, 'sliddardn@desdev.cn');
insert into customer_email (CustomerID, email) values (14, 'sclifto@europa.eu');
insert into customer_email (CustomerID, email) values (45, 'lconewp@bloglines.com');
insert into customer_email (CustomerID, email) values (100, 'rmullinq@telegraph.co.uk');
insert into customer_email (CustomerID, email) values (14, 'agoodinsonr@amazon.co.uk');
insert into customer_email (CustomerID, email) values (8, 'tcorners@china.com.cn');
insert into customer_email (CustomerID, email) values (37, 'bbellowst@shareasale.com');
insert into customer_email (CustomerID, email) values (76, 'jcornelsu@oakley.com');
insert into customer_email (CustomerID, email) values (72, 'jmenhciv@pagesperso-orange.fr');
insert into customer_email (CustomerID, email) values (52, 'sholliarw@indiegogo.com');
insert into customer_email (CustomerID, email) values (99, 'kwaliszewskix@bloglines.com');
insert into customer_email (CustomerID, email) values (50, 'nstotey@hugedomains.com');
insert into customer_email (CustomerID, email) values (66, 'nlafrentzz@statcounter.com');
insert into customer_email (CustomerID, email) values (39, 'bphair10@yelp.com');
insert into customer_email (CustomerID, email) values (15, 'vaitkenhead11@live.com');
insert into customer_email (CustomerID, email) values (68, 'cmchaffy12@e-recht24.de');
insert into customer_email (CustomerID, email) values (13, 'bburdus13@1688.com');
insert into customer_email (CustomerID, email) values (77, 'cpeace14@mit.edu');
insert into customer_email (CustomerID, email) values (9, 'dnaldrett15@hexun.com');
insert into customer_email (CustomerID, email) values (74, 'cpeddel16@gmpg.org');
insert into customer_email (CustomerID, email) values (41, 'kgillingwater17@ow.ly');
insert into customer_email (CustomerID, email) values (18, 'nmoakson18@vimeo.com');
insert into customer_email (CustomerID, email) values (23, 'zzannetti19@paginegialle.it');
insert into customer_email (CustomerID, email) values (70, 'aewan1a@so-net.ne.jp');
insert into customer_email (CustomerID, email) values (2, 'tjanos1b@weebly.com');
insert into customer_email (CustomerID, email) values (26, 'oheber1c@4shared.com');
insert into customer_email (CustomerID, email) values (12, 'wendrizzi1d@squarespace.com');
insert into customer_email (CustomerID, email) values (19, 'auttermare1e@feedburner.com');
insert into customer_email (CustomerID, email) values (26, 'smccorry1f@independent.co.uk');
insert into customer_email (CustomerID, email) values (74, 'zblasoni1g@walmart.com');
insert into customer_email (CustomerID, email) values (82, 'wvedekhov1h@odnoklassniki.ru');
insert into customer_email (CustomerID, email) values (55, 'ssthill1i@skype.com');
insert into customer_email (CustomerID, email) values (2, 'gyea1j@over-blog.com');
insert into customer_email (CustomerID, email) values (85, 'snorthill1k@patch.com');
insert into customer_email (CustomerID, email) values (87, 'acattlemull1l@cmu.edu');
insert into customer_email (CustomerID, email) values (80, 'cuphill1m@flickr.com');
insert into customer_email (CustomerID, email) values (71, 'cbernardoni1n@phpbb.com');
insert into customer_email (CustomerID, email) values (16, 'csheircliffe1o@upenn.edu');
insert into customer_email (CustomerID, email) values (84, 'bfitzroy1p@unicef.org');
insert into customer_email (CustomerID, email) values (82, 'skillby1q@va.gov');
insert into customer_email (CustomerID, email) values (2, 'jlearmont1r@angelfire.com');
insert into customer_email (CustomerID, email) values (71, 'cprinn1s@amazon.com');
insert into customer_email (CustomerID, email) values (39, 'kdemoreno1t@patch.com');
insert into customer_email (CustomerID, email) values (16, 'lcharman1u@angelfire.com');
insert into customer_email (CustomerID, email) values (2, 'hjuppe1v@sfgate.com');
insert into customer_email (CustomerID, email) values (29, 'mpapachristophorou1w@free.fr');
insert into customer_email (CustomerID, email) values (2, 'dhellier1x@mit.edu');
insert into customer_email (CustomerID, email) values (9, 'hbibb1y@exblog.jp');
insert into customer_email (CustomerID, email) values (31, 'drops1z@ftc.gov');
insert into customer_email (CustomerID, email) values (95, 'bbudgeon20@pinterest.com');
insert into customer_email (CustomerID, email) values (57, 'ublinckhorne21@icq.com');
insert into customer_email (CustomerID, email) values (51, 'ccorah22@ustream.tv');
insert into customer_email (CustomerID, email) values (94, 'kmachel23@sogou.com');
insert into customer_email (CustomerID, email) values (20, 'genrietto24@indiegogo.com');
insert into customer_email (CustomerID, email) values (6, 'lblissett25@digg.com');
insert into customer_email (CustomerID, email) values (45, 'qriggeard26@macromedia.com');
insert into customer_email (CustomerID, email) values (58, 'adeble27@gov.uk');
insert into customer_email (CustomerID, email) values (7, 'igeal28@dell.com');
insert into customer_email (CustomerID, email) values (50, 'dsemerad29@bigcartel.com');
insert into customer_email (CustomerID, email) values (92, 'gmakepeace2a@smugmug.com');
insert into customer_email (CustomerID, email) values (57, 'csweetnam2b@usnews.com');
insert into customer_email (CustomerID, email) values (31, 'jsynke2c@indiegogo.com');
insert into customer_email (CustomerID, email) values (9, 'acristofolo2d@uol.com.br');
insert into customer_email (CustomerID, email) values (52, 'lkleinschmidt2e@deliciousdays.com');
insert into customer_email (CustomerID, email) values (75, 'rkem2f@yellowbook.com');
insert into customer_email (CustomerID, email) values (50, 'ogristwood2g@sakura.ne.jp');
insert into customer_email (CustomerID, email) values (33, 'felms2h@hexun.com');
insert into customer_email (CustomerID, email) values (85, 'mdrayson2i@gnu.org');
insert into customer_email (CustomerID, email) values (98, 'lspratley2j@rediff.com');
insert into customer_email (CustomerID, email) values (76, 'rfitchen2k@guardian.co.uk');
insert into customer_email (CustomerID, email) values (87, 'pchessell2l@howstuffworks.com');
insert into customer_email (CustomerID, email) values (14, 'bshearsby2m@parallels.com');
insert into customer_email (CustomerID, email) values (51, 'cmapplebeck2n@admin.ch');
insert into customer_email (CustomerID, email) values (65, 'pseabert2o@taobao.com');
insert into customer_email (CustomerID, email) values (64, 'pvoce2p@biglobe.ne.jp');
insert into customer_email (CustomerID, email) values (55, 'mellinor2q@imdb.com');
insert into customer_email (CustomerID, email) values (75, 'mstangroom2r@123-reg.co.uk');

