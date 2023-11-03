use `mycountry`;
-- create table
Create table adress (
adress_id SMALLINT not null primary key,
adress VARCHAR(50) not null,
adress2 VARCHAR(50) ,
district VARCHAR(20) not null,
city_id SMALLINT not null,
postal_code VARCHAR(10),
phone VARCHAR(20) not null,
location VARCHAR(20) not null,
last_update timestamp not null
);

Create table city (
city_id SMALLINT not null primary key,
city VARCHAR(50) not null,
country_id SMALLINT not null,
last_update timestamp not null
);
Create table country (
country_id SMALLINT not null primary key,
country VARCHAR(50) not null,
last_update timestamp not null
);
-- add fk
alter table adress
add constraint city_id
FOREIGN KEY (city_id) REFERENCES city(city_id);

alter table city
add constraint country_id
FOREIGN KEY (country_id) REFERENCES country(country_id);

-- inserts 
insert into country(`country_id`,`country`,`last_update`)
values 
(1, 'España', '2023-10-31'),
(2, 'Italia', '2023-10-31'),
(3, 'Francia', '2023-10-31'),
(4, 'Alemania', '2023-10-31'),
(5, 'Reino Unido', '2023-10-31'),
(6, 'Portugal', '2023-10-31'),
(7, 'Países Bajos', '2023-10-31'),
(8, 'Suiza', '2023-10-31'),
(9, 'Austria', '2023-10-31'),
(10, 'Bélgica', '2023-10-31'),
(11, 'Grecia', '2023-10-31'),
(12, 'Suecia', '2023-10-31'),
(13, 'Noruega', '2023-10-31'),
(14, 'Dinamarca', '2023-10-31'),
(15, 'Finlandia', '2023-10-31'),
(16, 'Irlanda', '2023-10-31'),
(17, 'Polonia', '2023-10-31'),
(18, 'Rumanía', '2023-10-31'),
(19, 'Hungría', '2023-10-31'),
(20, 'República Checa', '2023-10-31');
insert into city(`city_id`,`city`,`country_id`,`last_update`)
values
(1,'Barcelona',1,'2023-10-31'),
(2,'Roma',2,'2023-10-31'),
(3,'París',3,'2023-10-31'),
(4,'Berlín',4,'2023-10-31'),
(5,'Londres',5,'2023-10-31'),
(6,'Lisboa',6,'2023-10-31'),
(7,'Ámsterdam',7,'2023-10-31'),
(8,'Zúrich',8,'2023-10-31'),
(9,'Viena',9,'2023-10-31'),
(10,'Bruselas',10,'2023-10-31'),
(11,'Atenas',11,'2023-10-31'),
(12,'Estocolmo',12,'2023-10-31'),
(13,'Oslo',13,'2023-10-31'),
(14,'Copenhague',14,'2023-10-31'),
(15,'Helsinki',15,'2023-10-31'),
(16,'Dublín',16,'2023-10-31'),
(17,'Varsovia',17,'2023-10-31'),
(18,'Bucarest',18,'2023-10-31'),
(19,'Budapest',19,'2023-10-31'),
(20,'Praga',20,'2023-10-31');
insert into adress (`adress_id`,`adress`,`adress2`,`district`,`city_id`,`postal_code`,`phone`,`location`,`last_update`)
values
(1,'calle america','','Barcelona',1,'','933-655-899','Barcelona','2023-10-31'),
(2, 'calle barcelona', '', 'Barcelona', 1, '', '933-655-123', 'Barcelona', '2023-10-31'),
(3, 'calle porto', '', 'Porto', 6, '', '211-123-456', 'Porto', '2023-10-31'),
(4, 'calle roma', '', 'Roma', 2, '', '06-1234-5678', 'Roma', '2023-10-31'),
(5, 'calle parís', '', 'París', 3, '', '01-2345-6789', 'París', '2023-10-31'),
(6, 'calle berlín', '', 'Berlín', 4, '', '030-1234-5678', 'Berlín', '2023-10-31'),
(7, 'calle londres', '', 'Londres', 4, '', '020-1234-5678', 'Londres', '2023-10-31'),
(8, 'calle lisboa', '', 'Lisboa', 6, '', '211-123-456', 'Lisboa', '2023-10-31'),
(9, 'calle ámsterdam', '', 'Ámsterdam', 7, '', '020-123-4567', 'Ámsterdam', '2023-10-31'),
(10, 'calle zúrich', '', 'Zúrich', 8, '', '044-123-4567', 'Zúrich', '2023-10-31'),
(11, 'calle viena', '', 'Viena', 9, '', '01-234-5678', 'Viena', '2023-10-31'),
(12, 'calle bruselas', '', 'Bruselas', 10, '', '02-123-4567', 'Bruselas', '2023-10-31'),
(13, 'calle atenas', '', 'Atenas', 11, '', '210-123-4567', 'Atenas', '2023-10-31'),
(14, 'calle estocolmo', '', 'Estocolmo', 12, '', '08-123-4567', 'Estocolmo', '2023-10-31'),
(15, 'calle oslo', '', 'Oslo', 13, '', '22-123-4567', 'Oslo', '2023-10-31'),
(16, 'calle copenhague', '', 'Copenhague', 14, '', '45-123-4567', 'Copenhague', '2023-10-31'),
(17, 'calle helsinki', '', 'Helsinki', 15, '', '09-123-4567', 'Helsinki', '2023-10-31'),
(18, 'calle dublín', '', 'Dublín', 16, '', '01-123-4567', 'Dublín', '2023-10-31'),
(19, 'calle varsovia', '', 'Varsovia', 17, '', '22-123-4567', 'Varsovia', '2023-10-31'),
(20, 'calle bucarest', '', 'Bucarest', 18, '', '021-123-4567', 'Bucarest', '2023-10-31');

SELECT * 
	FROM adress a
    INNER JOIN city ci on   a.city_id = ci.city_id
    INNER JOIN country co on ci.country_id = co.country_id;