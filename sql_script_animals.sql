-- 7
CREATE DATABASE Human_friends;
-- 8
USE Human_friends;
CREATE TABLE animal_classes
(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
	Class_name VARCHAR(20)
); 

CREATE TABLE home_animals
(
	  Id INT AUTO_INCREMENT PRIMARY KEY,
    Genus_name VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_classes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE packed_animals
(
	  Id INT AUTO_INCREMENT PRIMARY KEY,
    Genus_name VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_classes (Id) ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE cats 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dogs 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE hamsters 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horses 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE donkeys 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE camels 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9
INSERT INTO animal_classes (Class_name)
VALUES 
('домашние'),
('вьючные'); 

INSERT INTO home_animals (Genus_name, Class_id)
VALUES 
('Кошки', 1), 
('Собаки', 1), 
('Хомяки', 1); 

INSERT INTO packed_animals (Genus_name, Class_id)
VALUES 
('Лошади', 2),
('Ослы', 2),  
('Верблюды', 2);

INSERT INTO cats (Name, Birthday, Commands, Genus_id)
VALUES ('Фима', '2023-05-10', 'Брысь', 1),
('Барсик', '2022-08-01', "Кушать", 1),  
('Аврора', '2024-01-02', "Сидеть", 1); 

INSERT INTO dogs (Name, Birthday, Commands, Genus_id)
VALUES ('Цезарь', '2022-10-20', 'рядом', 2),
('Злата', '2000-03-10', "сидеть", 2),  
('Барбос', '2023-06-09', "лапу,", 2), 
('Шарик', '2019-03-11', "место", 2);

INSERT INTO hamsters (Name, Birthday, Commands, Genus_id)
VALUES ('Хомя', '2020-10-12', NULL, 3),
('Танк', '2021-03-12', "грызть", 3),  
('Мышь', '2022-07-11', "", 3),;

INSERT INTO horses (Name, Birthday, Commands, Genus_id)
VALUES ('Герцог', '2020-01-12', 'бегом,', 1),
('Чемпион', '2017-03-12', "галоп", 1),  
('Венера', '2016-07-12', "рысь", 1), 
('Граф', '2020-11-10', "стой", 1);

INSERT INTO donkeys (Name, Birthday, Commands, Genus_id)
VALUES ('Красивый', '2019-04-10', NULL, 2),
('Некрасивый', '2020-03-12', "", 2),  
('Ишак', '2021-07-12', "", 2), 
('Осёл', '2022-12-10', NULL, 2);

INSERT INTO camels (Name, Birthday, Commands, Genus_id)
VALUES ('Сигарета', '2022-04-10', 'вернись', 3),
('Естьненадо', '2019-03-12', "пей", 3),  
('Двугорбый', '2015-07-12', "стоп", 3), 
('Сприд', '2022-12-10', "быстрее", 3);

-- 10
SET SQL_SAFE_UPDATES = 0;
DELETE FROM camels;

SELECT * FROM horses
UNION SELECT  * FROM donkeys;

-- 11
CREATE TEMPORARY TABLE animals AS 
SELECT *, 'Собаки' AS genus FROM dogs
UNION SELECT *, 'Кошки' AS genus FROM cats
UNION SELECT *, 'Хомяки' AS genus FROM hamsters
UNION SELECT *, 'Лошади' as genus FROM horses
UNION SELECT *, 'Ослы' AS genus FROM donkeys;

CREATE TABLE young_animal AS
SELECT Name, Birthday, Commands, genus, TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS Age_in_month
FROM animals WHERE Birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);

 -- 12
SELECT * FROM dogs d
LEFT JOIN young_animal ya ON ya.Name = d.Name 
LEFT JOIN home_animals ha ON ha.Id = d.Genus_id
UNION
SELECT * FROM cats c
LEFT JOIN young_animal ya ON ya.Name = c.Name
LEFT JOIN home_animals ha ON ha.Id = c.Genus_id
UNION
SELECT * FROM hamsters hm
LEFT JOIN young_animal ya ON ya.Name = hm.Name
LEFT JOIN home_animals ha ON ha.Id = hm.Genus_id
UNION 
SELECT * FROM hourses h
LEFT JOIN young_animal ya ON ya.Name = h.Name
LEFT JOIN packed_animals pa ON pa.Id = h.Genus_id
UNION 
SELECT * FROM donkeys d 
LEFT JOIN young_animal ya ON ya.Name = d.Name
LEFT JOIN packed_animals pa ON pa.Id = d.Genus_id;