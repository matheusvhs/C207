CREATE TABLE Mundo(
	id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao varchar(45) NOT NULL
);

INSERT INTO Mundo(id,nome,descricao) VALUES
(1,'Maygïk','Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.');
INSERT INTO Mundo(id,nome,descricao) VALUES
(2,'Lucinera','O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?');

CREATE TABLE Pagina(
	id INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(45) NOT NULL,
    descricao varchar(45) NOT NULL,
    mundo INT NOT NULL,
    FOREIGN KEY (`mundo`)
    REFERENCES `Mundo` (`id`)
);

INSERT INTO Pagina(id,titulo,descricao,mundo) VALUES
(1,'O Culto do Heroi','Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.',1);
INSERT INTO Pagina(id,titulo,descricao,mundo) VALUES
(2,'Uanteji','Uma organização secreta de mercenários, espiões e assassinos.',1);

CREATE TABLE Personagem (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    profissão VARCHAR(45) NOT NULL,
    data_criação DATE NOT NULL,
    mundo INT NOT NULL,
    FOREIGN KEY (mundo) REFERENCES Mundo(id)
);

CREATE TABLE Item(
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco FLOAT(10, 2),
    peso FLOAT(10, 2),
    vol FLOAT(10, 2),
    efeito TEXT,
    cap_peso FLOAT(10, 2),
    cap_vol FLOAT(10, 2),
    classe FLOAT(255),
    dano VARCHAR(255)
);

CREATE TABLE Habilidades (
    id INT NOT NULL PRIMARY KEY,
    descrição VARCHAR(100) NOT NULL,
    atributo_base VARCHAR(50) NOT NULL
);

INSERT INTO Habilidades (id, descrição, atributo_base) VALUES
(1, 'Corrida longa', 'Constituição'),
(2, 'Corrida de arrancada', 'Força'),
(3, 'Acrobacia', 'Destreza'),
(4, 'Tiro com arco', 'Destreza');

INSERT INTO Item (id, nome, preco, peso, vol, efeito, cap_peso, cap_vol, classe, dano) VALUES
(1, 'Ungento restaurador', 80.0, 0.2, 0.25, '-', NULL, NULL, '-', '-'),
(2, 'Poção de regeneração', 200.0, 0.2, 0.35, 'Cicatriza ferimentos profundos (1d4+2 PV)', NULL, NULL, '-', '-'),
(3, 'Bolsa de explorador', 20.0, 0.6, 1.2, '-', 50.0, 23.6, '-', '-'),
(4, 'Bolsa encantada', 500.0, 0.7, 1.1, 'Tem uma dimensão de bolso para armazenar itens', 1850.0, 1020.0, '-', '-'),
(5, 'Machado de guerra', 50.0, 15.5, 10.1, '-', NULL, NULL, 'Corpo-a-corpo pesada', '1d8');

INSERT INTO Personagem (id, nome, idade, profissão, data_criação, mundo) VALUES
(1, 'Ann`aurora', 21, 'Clérigo(a)', '2024-06-05', 1),
(2, 'Zurendownr Narrwack', 652, 'Diplomata', '2024-06-05', 1);

CREATE TABLE Habilidades_Personagem (
    id_personagem INT NOT NULL,
    id_habilidade INT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id)
);


CREATE TABLE Personagem_Item (
    id_personagem INT NOT NULL,
    id_item INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

INSERT INTO Habilidades_Personagem (id_personagem, id_habilidade) VALUES
(1, 2), -- Corrida de arrancada
(1, 1); -- Corrida longa

-- Atribuição dos itens para Ann'aurora
INSERT INTO Personagem_Item (id_personagem, id_item, quantidade) VALUES
(1, 1, 3), -- 3 unidades do item 1
(1, 2, 2), -- 2 unidades do item 2
(1, 3, 1); -- 1 unidade do item 3

-- Remoção da habilidade de Corrida longa
DELETE FROM Habilidades_Personagem WHERE id_personagem = 1 AND id_habilidade = 1;

-- Atribuição das habilidades para Zurendownr Narrwack
INSERT INTO Habilidades_Personagem (id_personagem, id_habilidade) VALUES
(2, 3); -- Acrobacia

CREATE TABLE Personagem_Pagina (
    id_personagem INT NOT NULL,
    id_pagina INT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_pagina) REFERENCES Pagina(id),
    PRIMARY KEY (id_personagem, id_pagina)
);

-- Consulta de personagens com profissões específicas
SELECT id, nome
FROM Personagem
WHERE profissão IN ('Acólito(a)', 'Paladino(a)', 'Clérigo(a)');

-- Inserção da página 1 para esses personagens
INSERT INTO Personagem_Pagina (id_personagem, id_pagina)
SELECT id, 1
FROM Personagem
WHERE profissão IN ('Acólito(a)', 'Paladino(a)', 'Clérigo(a)');

-- Listagem dos nomes dos personagens que conhecem a página 1
SELECT p.nome
FROM Personagem p
JOIN Personagem_Pagina pp ON p.id = pp.id_personagem
WHERE pp.id_pagina = 1;

