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


