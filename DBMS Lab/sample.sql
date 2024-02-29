USE app;

SHOW TABLES;

CREATE TABLE systems(
	vendor VARCHAR(24), 
	machinename VARCHAR(24),
	processor VARCHAR(20),
    memory INT,
    storage INT, 
    graphics CHAR,
    gmem INT, 
    os VARCHAR(16),
 	storage_type VARCHAR(20)
);

-- Inserting values...

INSERT INTO systems VALUES("Lenovo", "Legion 15ACH6", "Ryzen 7 5800H", 8, 512, 'D', 4, "Windows 11", "SSD");

INSERT INTO systems VALUES
	("HP", "Pavilion x360", "Intel i5 1200U", 16, 512, 'I', 1, "Windows 11", "SSD"),
	("HP", "Victus Gaming", "Ryzen 5 4800H", 8, 512, 'D', 4, "Linux Kali", "SSD+HDD");						

SELECT * FROM systems;