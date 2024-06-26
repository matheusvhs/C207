CREATE TABLE Mundo(
	id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao varchar(45) NOT NULL
);

CREATE TABLE Pagina(
	id INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(45) NOT NULL,
    descricao varchar(45) NOT NULL,
    mundo INT NOT NULL,
    FOREIGN KEY (`mundo`)
    REFERENCES `Mundo` (`id`)
);

INSERT INTO Mundo(id,nome,descricao) VALUES
(1,'Maygïk','Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.');
INSERT INTO Mundo(id,nome,descricao) VALUES
(2,'Lucinera','O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?');


INSERT INTO Pagina(id,titulo,descricao,mundo) VALUES
(1,'O Culto do Heroi','Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.',1);
INSERT INTO Pagina(id,titulo,descricao,mundo) VALUES
(2,'Uanteji','Uma organização secreta de mercenários, espiões e assassinos.',1);

SELECT p.titulo, p.descricao, m.nome AS nome_do_mundo
FROM Pagina p
JOIN Mundo m ON p.mundo = m.id;

