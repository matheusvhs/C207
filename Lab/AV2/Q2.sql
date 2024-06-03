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


