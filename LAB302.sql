# EXERCISE 1

CREATE SCHEMA blog;
USE blog;

CREATE TABLE post (
	post_code VARCHAR(255),
    word_count SMALLINT,
    views SMALLINT,
    PRIMARY KEY (post_code)
);

CREATE TABLE authors (
	id SMALLINT NOT NULL AUTO_INCREMENT, 
    author_name VARCHAR(255),
    author_post VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (author_post) REFERENCES post (post_code)
);


INSERT INTO post VALUES
('Best-Pain-Colors', 814, 14),
('Small-Space-Decorating-Tips', 1146, 221),
('Hot-Accesories', 986, 105),
('Mixing-Textures', 765, 22),
('Kitchen-Refresh', 1242, 307),
('Homemade-Art-Hacks', 1002, 193),
('Refenishing-Wood-Floors', 1571, 7542);


INSERT INTO authors (author_name, author_post) VALUES
('Maria Charlotte', 'Best-Pain-Colors'),
('Juan Perez', 'Small-Space-Decorating-Tips'),
('Maria Charlotte', 'Hot-Accesories'),
('Maria Charlotte', 'Mixing-Textures'),
('Juan Perez', 'Kitchen-Refresh'),
('Maria Charlotte', 'Homemade-Art-Hacks'),
('Gema Alcocer', 'Refenishing-Wood-Floors');

# EXERCISE 2

CREATE SCHEMA airline;
USE airline;


CREATE TABLE aircrafts (
	aircraft_name VARCHAR(255),
    total_seats SMALLINT,
    PRIMARY KEY (aircraft_name)
);

CREATE TABLE customers (
	id SMALLINT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255),
    customer_status VARCHAR(255),
    customer_total_mileage INT,
    PRIMARY KEY (id)
);

CREATE TABLE fligths (
	flight_number VARCHAR(5),
    aircraft_name VARCHAR(255),
    flight_mileage SMALLINT,
    PRIMARY KEY (flight_number),
    FOREIGN KEY(aircraft_name) REFERENCES aircrafts(aircraft_name)
);

CREATE TABLE airline (
	id SMALLINT NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(5),
    customer_id SMALLINT,
    PRIMARY KEY (id),
    FOREIGN KEY (flight_number) REFERENCES fligths(flight_number),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO aircrafts VALUES
	('Boeing-747', 400),
	('Boeing-777', 264),
	('Airbus-A330', 236);

INSERT INTO customers (customer_name, customer_status, customer_total_mileage)  VALUES 
	('Agustine Riviera', 'Silver', 115235),
	('Alaina Sepulvida', 'None', 6008),
	('Tom Jones', 'Gold', 205767),
	('Sam Rio', 'None', 2653),
	('Jessica James', 'Silver', 127656),
	('Ana Janco', 'Silver', 136773),
	('Jennifer Cortez', 'Gold', 300582),
	('Christian Janco', 'Silver', 14642);
    
INSERT INTO fligths VALUES
	('DL143', 'Boeing-747', 135),
	('DL122', 'Airbus-A330', 4370),
	('DL53', 'Boeing-777', 2078),
	('DL222', 'Boeing-777', 1765),
	('DL37', 'Boeing-747', 531);
    
INSERT INTO airline (flight_number, customer_id) VALUES 
	('DL143', 1),
	('DL122', 1),
	('DL122', 2),
	('DL122', 3),
	('DL53', 3),
	('DL143', 4),
	('DL222', 3),
	('DL143', 5),
	('DL222', 6),
	('DL222', 7),
	('DL122', 5),
	('DL37', 4),
	('DL222', 8);

# EXERCISE 3: 

SELECT count(*) AS total_flights 
FROM fligths;

# EXERCISE 4:

SELECT AVG(flight_mileage) AS average_mileage 
FROM fligths;

# EXERCISE 5:

SELECT AVG(total_seats) AS average_total_seats 
FROM aircrafts;

# EXERCISE 6: 

SELECT customer_status, 
AVG(customer_total_mileage) 
FROM customers 
GROUP BY customer_status;

# EXERCISE 7: 

SELECT customer_status, 
MAX(customer_total_mileage) 
FROM customers 
GROUP BY customer_status;

# EXERCISE 8: 

SELECT aircraft_name 
FROM aircrafts 
WHERE aircraft_name LIKE 'Boeing%';

# EXERCISE 9: 

SELECT flight_number, flight_mileage 
FROM fligths 
WHERE flight_mileage BETWEEN 300 AND 2000;

# EXERCISE 10: 

SELECT  AVG (flight_mileage) 
FROM Flights E
JOIN Customers D
ON E.flights_number = D.id
GROUP BY customer_status;

# EXERCISE 11:


SELECT aircraft_name
FROM Aircrafts E
JOIN Customers D
ON E.aircraft_name = D.id 
WHERE customer_status='Gold' 
GROUP BY aircraft_name;