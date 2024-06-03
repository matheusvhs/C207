### QUESTÃO 1

DROP DATABASE IF EXISTS AV2_C207;
CREATE DATABASE AV2_C207; 
USE AV2_C207;

CREATE TABLE IF NOT EXISTS Amigo( 
cpf VARCHAR(14) NOT NULL PRIMARY KEY, 
nome VARCHAR(45) NOT NULL, 
email VARCHAR(45) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Jogo( 
codigo INT NOT NULL PRIMARY KEY, 
titulo VARCHAR(45) NOT NULL, 
desenvolvedora VARCHAR(45) NOT NULL, 
plataforma VARCHAR(5) NOT NULL, 
ano INT NOT NULL, 
exemplares INT NOT NULL 
);

CREATE TABLE IF NOT EXISTS Emprestimo( 
Amigo_cpf VARCHAR(14) NOT NULL, 
Jogo_codigo INT NOT NULL, 
data_emprestimo DATE NOT NULL, 
PRIMARY KEY (Amigo_cpf, Jogo_codigo), 
CONSTRAINT Amigo_cpf_fk FOREIGN KEY (Amigo_cpf) REFERENCES Amigo(cpf) ON DELETE NO ACTION ON UPDATE CASCADE, 
CONSTRAINT Jogo_codigo_fk FOREIGN KEY (Jogo_codigo) REFERENCES Jogo(codigo) ON DELETE NO ACTION ON UPDATE CASCADE 
);


#1.

ALTER TABLE Jogo
ADD COLUMN genero VARCHAR(20);

ALTER TABLE Jogo
MODIFY COLUMN plataforma VARCHAR(15);

ALTER TABLE Jogo
DROP COLUMN exemplares;

#2.

INSERT INTO Jogo (codigo, titulo, desenvolvedora, genero, plataforma, ano) VALUES
(1000, 'Super Mario Bros.', 'Nintendo', 'Plataforma', 'NES', 1985),
(1001, 'The Legend of Zelda', 'Nintendo', 'Aventura', 'NES', 1986),
(2000, 'Sonic the Hedgehog', 'Sega', 'Plataforma', 'Mega Drive', 1991),
(2001, 'Streets of Rage', 'Sega', 'Luta', 'Mega Drive', 1991),
(3000, 'Final Fantasy VII', 'SquareEnix', 'RPG', 'PlayStation', 1997),
(3001, 'Metal Gear Solid', 'Konami', 'Ação', 'PlayStation', 1998),
(4000, 'Halo: Combat Evolved', 'Bungie', 'FPS', 'Xbox', 2001),
(4001, 'Fable', 'Lionhead Studios', 'RPG', 'Xbox', 2004),
(5000, 'The Last of Us', 'Naughty Dog', 'Aventura', 'PlayStation 3', 2013),
(5001, 'God of War III', 'Santa Monica Studio', 'Ação', 'PlayStation 3', 2010),
(6000, 'The Witcher 3: Wild Hunt', 'CD Projekt Red', 'RPG', 'PC', 2015),
(6001, 'Half-Life 2', 'Valve Corporation', 'FPS', 'PC', 2004);

INSERT INTO Amigo (cpf, nome, email) VALUES
('492.441.760-25', 'Luciano', 'luciano@gmail.com'),
('456.841.862-03', 'Flavio', 'flavio@hotmail.com'),
('192.041.526-14', 'Paola', 'paola@yahoo.com'),
('556.851.862-88', 'Aline', 'aline@outlook.com');

#3.

INSERT INTO Emprestimo (Amigo_cpf, Jogo_codigo, data_emprestimo) VALUES
('492.441.760-25', 5000, '2020-10-15'),
('556.851.862-88', 3000, '2020-11-05'),
('456.841.862-03', 6001, '2020-11-10');

SELECT 
    a.nome AS Nome_Amigo, 
    j.titulo AS Titulo_Jogo, 
    j.desenvolvedora AS Desenvolvedora_Jogo, 
    e.data_emprestimo AS Data_Emprestimo
FROM 
    Emprestimo e
JOIN 
    Amigo a ON e.Amigo_cpf = a.cpf
JOIN 
    Jogo j ON e.Jogo_codigo = j.codigo
ORDER BY 
    e.data_emprestimo;




### QUESTÃO 2

DROP DATABASE IF EXISTS nasa;
CREATE DATABASE nasa;
USE nasa;

SET GLOBAL log_bin_trust_function_creators = 1;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE galaxia(
	id_galaxia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    tipo VARCHAR(20)
);

CREATE TABLE estrela(
	id_estrela INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    luminosidade FLOAT,
    id_galaxia int,
    CONSTRAINT fk_galaxia
    FOREIGN KEY (id_galaxia) REFERENCES galaxia(id_galaxia) ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE planeta(
	id_planeta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    habitavel BOOLEAN,
    dist_terra FLOAT,
    id_estrela int,
    CONSTRAINT fk_estrela
    FOREIGN KEY (id_estrela) REFERENCES estrela(id_estrela) ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO galaxia(nome, massa, tamanho, tipo) VALUES 
('Via Lactea', 1.9*POW(10,12), '105700', 'Espiral'),
('Andrômeda', 1.23*POW(10,11), '220000', 'Espiral'), 
('Pequena Nuvem de Magalhães', 6.5*POW(10,9), '7000', 'Irregular');

INSERT INTO estrela(nome, massa, tamanho, luminosidade, id_galaxia) VALUES 
('Sol', 1.989*POW(10,30), 1.392*POW(10,6), 1, 1),
('Kepler-438', 1.082*POW(10,30), 723.84*POW(10,6), 0.044, 1), 
('Gliese 667', 1.372*POW(10,30), 974.4*POW(10,6), 0.0137, 1);

INSERT INTO planeta(nome, massa, tamanho, habitavel, dist_terra, id_estrela) VALUES
('Terra', 5.9722*POW(10,24), 12742, TRUE,0, 1),
('Kepler-438b', NULL, 14271,TRUE,470, 2), 
('Gliese 667 Cc', 2.621*POW(10,25), 19113, TRUE, 22, 3), 
('Marte', 6.4174*POW(10,22), 6779, FALSE, 3.805*POW(10,-5),1);

### QUESTÃO 2

DROP DATABASE IF EXISTS nasa;
CREATE DATABASE nasa;
USE nasa;

SET GLOBAL log_bin_trust_function_creators = 1;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE galaxia(
	id_galaxia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    tipo VARCHAR(20)
);

CREATE TABLE estrela(
	id_estrela INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    luminosidade FLOAT,
    id_galaxia int,
    CONSTRAINT fk_galaxia
    FOREIGN KEY (id_galaxia) REFERENCES galaxia(id_galaxia) ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE planeta(
	id_planeta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    massa DOUBLE,
    tamanho FLOAT,
    habitavel BOOLEAN,
    dist_terra FLOAT,
    id_estrela int,
    CONSTRAINT fk_estrela
    FOREIGN KEY (id_estrela) REFERENCES estrela(id_estrela) ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO galaxia(nome, massa, tamanho, tipo) VALUES 
('Via Lactea', 1.9*POW(10,12), '105700', 'Espiral'),
('Andrômeda', 1.23*POW(10,11), '220000', 'Espiral'), 
('Pequena Nuvem de Magalhães', 6.5*POW(10,9), '7000', 'Irregular');

INSERT INTO estrela(nome, massa, tamanho, luminosidade, id_galaxia) VALUES 
('Sol', 1.989*POW(10,30), 1.392*POW(10,6), 1, 1),
('Kepler-438', 1.082*POW(10,30), 723.84*POW(10,6), 0.044, 1), 
('Gliese 667', 1.372*POW(10,30), 974.4*POW(10,6), 0.0137, 1);

INSERT INTO planeta(nome, massa, tamanho, habitavel, dist_terra, id_estrela) VALUES
('Terra', 5.9722*POW(10,24), 12742, TRUE,0, 1),
('Kepler-438b', NULL, 14271,TRUE,470, 2), 
('Gliese 667 Cc', 2.621*POW(10,25), 19113, TRUE, 22, 3), 
('Marte', 6.4174*POW(10,22), 6779, FALSE, 3.805*POW(10,-5),1);

#4.
CREATE VIEW vw_galaxia_estrela_planeta AS
SELECT 
    g.nome AS nome_galaxia,
    e.nome AS nome_estrela,
    p.nome AS nome_planeta
FROM 
    galaxia g
JOIN 
    estrela e ON g.id_galaxia = e.id_galaxia
JOIN 
    planeta p ON e.id_estrela = p.id_estrela;

SELECT * FROM vw_galaxia_estrela_planeta;

#5.

DELIMITER //

CREATE FUNCTION encontra_planeta(habitavel_planeta BOOLEAN, dist_terra FLOAT) 
RETURNS VARCHAR(20)
BEGIN
    DECLARE resultado VARCHAR(20);

    IF habitavel_planeta = FALSE AND dist_terra > 30 THEN
        SET resultado = 'Inabitável e longe';
    ELSEIF habitavel_planeta = FALSE AND dist_terra <= 30 THEN
        SET resultado = 'Inabitável';
    ELSEIF habitavel_planeta = TRUE AND dist_terra > 30 THEN
        SET resultado = 'Habitável e longe';
    ELSEIF habitavel_planeta = TRUE AND dist_terra <= 30 THEN
        SET resultado = 'Habitável e Perto';
    END IF;

    RETURN resultado;
END //

DELIMITER ;

SELECT 
    nome,
    encontra_planeta(habitavel, dist_terra) AS status_planeta
FROM 
    planeta;

