CREATE TABLE Mundo(
	id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao varchar(45) NOT NULL
);

INSERT INTO Mundo(id,nome,descricao) VALUES
(1,'Maygïk','Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.');
INSERT INTO Mundo(id,nome,descricao) VALUES
(2,'Lucinera','O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?');


CREATE TABLE Personagem (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    profissão VARCHAR(45) NOT NULL,
    data_criação DATE NOT NULL,
    mundo INT NOT NULL,
    FOREIGN KEY (mundo) REFERENCES Mundo(id)
);

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

SELECT 
    p.id,
    p.nome,
    p.profissão,
    p.idade,
    m.id AS mundo,
    p.data_criação,
    COALESCE(SUM(pi.quantidade), 0) AS quantidade_itens,
    COUNT(DISTINCT ph.id_habilidade) AS quantidade_habilidades
FROM 
    Personagem p
JOIN 
    Mundo m ON p.mundo = m.id
LEFT JOIN 
    Personagem_Item pi ON p.id = pi.id_personagem
LEFT JOIN 
    Habilidades_Personagem ph ON p.id = ph.id_personagem
GROUP BY 
    p.id, p.nome, p.profissão, p.idade,  p.data_criação, m.nome;