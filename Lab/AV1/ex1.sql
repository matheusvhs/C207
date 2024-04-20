CREATE DATABASE av1ex1;

USE av1ex1;

CREATE TABLE Jogador(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    nacionalidade VARCHAR(45),
    posicao VARCHAR(45),
    clube VARCHAR(45)
);

INSERT INTO Jogador() VALUES (default,'Cristiano Ronaldo', 39, 'Portugal', 'Atacante', 'Al-Nassr');
INSERT INTO Jogador() VALUES (default,'Lionel Messi', 36, 'Argentina', 'Meio-Campista', 'Inter Miami');
INSERT INTO Jogador() VALUES (default,'Neymar', 32, 'Brasil', 'Atacante', 'Al-Hilal');
INSERT INTO Jogador() VALUES (default,'Van Dijk', 32, 'Holanda', 'Defensor', 'Liverpool');
INSERT INTO Jogador() VALUES (default,'Ederson', 30, 'Brasil', 'Goleiro', 'Manchester City');

UPDATE Jogador SET idade = 33 WHERE id = 3;

INSERT INTO Jogador() VALUES (default,'Yuri Alberto', 23, 'Brasil', 'Atacante', 'Corinthians');

SELECT * FROM av1ex1.jogador WHERE nacionalidade = 'Brasil';

UPDATE Jogador SET clube = "Barcelona" WHERE id = 2;

SELECT AVG(idade) FROM av1ex1.jogador;

SELECT * FROM av1ex1.jogador WHERE posicao = 'Atacante';

DELETE FROM av1ex1.jogador WHERE id = '1';

SELECT max(idade) FROM av1ex1.jogador;