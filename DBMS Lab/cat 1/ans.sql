CREATE DATABASE db;
USE db;

CREATE TABLE customer (
	customer_id INT NOT NULL,
	age INT,
	name VARCHAR(24),
	address VARCHAR(64),
	
	PRIMARY KEY(customer_id)
);

CREATE TABLE owner (
	owner_id VARCHAR(24) NOT NULL,
	animal_id VARCHAR(24) NOT NULL,
	customer_id INT,
	date_of_vaccination DATE,
	
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	PRIMARY KEY (animal_id)
);

CREATE TABLE animal (
	animal_id VARCHAR(24) NOT NULL,
	name VARCHAR(24),
	category VARCHAR(24),
	breed VARCHAR(24),
	dob DATE,
	color VARCHAR(24),
	
	PRIMARY KEY (animal_id),
	FOREIGN KEY (animal_id) REFERENCES owner(animal_id)
);


DESC customer;
DESC owner;
DESC animal;

DROP TABLE customer;
DROP TABLE animal;
DROP TABLE owner;

INSERT INTO customer
VALUES
	(1, 17, 'Abraham', '4045A, Random Street, CBE, IN'),
	(5, 18, 'Satheesh', '89/35E, Laughing Street, NOIDA, IN'),
	(7, 18, 'Suresh', '03, Sector - 42, CHENNAI, IN'),
	(8, 20, 'Pradeep', '3455, Race Course, CBE, IN'),
	(9, 22, 'Revi', '900A, Iyengar Street, ERODE, IN'),
	(12, 21, 'Sowmya', '76/34, Kumutham Nagar, CBE, IN');
	
INSERT INTO owner
VALUES
	('w01', 'dog01', 01, '2012-07-01'),
	('w02', 'cat01', 08, '2012-08-05'),
	('w03', 'dog02', 05, '2012-12-05'),
	('w04', 'cow01', 01, '2012-01-02'),
	('w05', 'bird01', 05, '2011-08-07'),
	('w06', 'cow02', 09, '2011-08-05'),
	('w07', 'bird02', 07, '2012-03-05'),
	('w08', 'dog03', 08, '2011-12-05'),
	('w09', 'dog04', 08, '2012-01-05');

INSERT INTO animal
VALUES
    ('dog01', 'rudolf', 'dog', 'dobermann', '2007-01-01', 'brown'),
    ('dog02', 'mullar', 'dog', 'dalmation', '2007-01-05', 'brown'),
    ('cat01', 'becky', 'cat', 'pekinese', '2006-06-05', ' black'),
    ('dog03', 'betty', 'dog', 'dalmation', '2007-06-05', 'brown'),
    ('cow01', 'blacky', 'cow', 'jersey', '2009-01-02', 'brown'),
    ('bird01', 'creepy', 'bird', 'parrot', '2009-08-07', 'green'),
    ('cow02', 'chippy', 'cow', 'holstein', '2009-02-05', 'brown'),
    ('bird02', 'dafy', 'bird', 'parakeet', '2009-03-05', 'blue'),
    ('dog04', 'figo', 'dog', 'german shepherd', '2009-03-05', 'grey');
   
-- 1. count the number of different dog breeds.
SELECT COUNT(*) AS 'DOG BREED COUNT'
FROM (
    SELECT DISTINCT breed
    FROM animal
    WHERE category LIKE 'dog'
) breeds;


-- 2. find the names of the customers who have birds
SELECT name
FROM customer
INNER JOIN owner ON customer.customer_id = owner.customer_id
WHERE animal_id LIKE '%bird%';

-- 3. find the name of rudolfs owner
SELECT name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM owner
    INNER JOIN animal ON owner.animal_id = animal.animal_id
    WHERE animal.name LIKE 'rudolf'
);


-- 4. find the owners of all brown dogs of the same breed.
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM owner
    INNER JOIN animal ON owner.animal_id = animal.animal_id
    WHERE animal.category LIKE 'dog' AND animal.color LIKE 'brown'
);

-- 5. find the names of pets that was owned by satheesh

SELECT name
FROM animal
WHERE animal_id IN (
    SELECT animal_id
    FROM owner
    INNER JOIN customer ON customer.customer_id = owner.customer_id
    WHERE name LIKE 'satheesh' 
);

-- 6. find the name and age of the oldest pet.

SELECT name, (YEAR(SYSDATE()) - MIN(YEAR(dob))) AS age
FROM animal
WHERE YEAR(dob) = (
	SELECT MIN(YEAR(dob))
	FROM animal
);

-- 7. find the pets whose vaccination date falls in the next month
SELECT *
FROM animal
INNER JOIN owner ON owner.animal_id = animal.animal_id
WHERE MONTH(date_of_vaccination) = (MONTH(SYSDATE()+1));

-- 8. find the name of customers who have only dogs as pets.
SELECT name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM owner
	INNER JOIN animal ON owner.animal_id = animal.animal_id
	WHERE animal.category LIKE 'dog'
);
