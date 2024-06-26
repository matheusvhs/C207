CREATE TABLE Mundo (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
);

CREATE TABLE Pagina (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    descricao TEXT,
    id_mundo INT,
    FOREIGN KEY (id_mundo) REFERENCES Mundo(id)
);

CREATE TABLE Item (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(5, 2),
    peso DECIMAL(5, 2),
    volume DECIMAL(5, 2)
);

CREATE TABLE Item_Magico (
    id_item INT PRIMARY KEY,
    efeito TEXT,
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

CREATE TABLE Item_Inventario (
    id_item INT PRIMARY KEY,
    cap_peso DECIMAL(5, 2),
    cap_volume DECIMAL(5, 2),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

CREATE TABLE Item_Arma (
    id_item INT PRIMARY KEY,
    classe VARCHAR(255),
    dano VARCHAR(255),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

CREATE TABLE Habilidade (
    id INT PRIMARY KEY,
    descricao VARCHAR(255),
    atributo_base VARCHAR(255)
);

CREATE TABLE Personagem (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INTEGER NOT NULL,
    profissao VARCHAR(50),
    data_criacao DATE NOT NULL,
    id_mundo INTEGER NOT NULL,
    FOREIGN KEY (id_mundo) REFERENCES Mundo(id)
);

CREATE TABLE Personagem_Habilidade (
    id_personagem INT,
    id_habilidade INT,
    modificador INT,
    PRIMARY KEY (id_personagem, id_habilidade),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id)
);

CREATE TABLE Personagem_Item (
    id_personagem INT,
    id_item INT,
    quantidade INT,
    PRIMARY KEY (id_personagem, id_item),
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_item) REFERENCES Item(id)
);

CREATE TABLE Conhecedores (
    id_pagina INT,
    profissao VARCHAR(255),
    FOREIGN KEY (id_pagina) REFERENCES Pagina(id)
);

-- Inserção de dados nas tabelas

INSERT INTO Pagina (id, titulo, descricao, id_mundo) VALUES
(1, 'O Culto do Heroi', 'Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.', 1),
(2, 'Uanteji', 'Uma organização secreta de mercenários, espiões e assassinos.', 1);

INSERT INTO Conhecedores (id_pagina, profissao) VALUES (1, 'Clérigo(a)');
INSERT INTO Conhecedores (id_pagina, profissao) VALUES (1, 'Acólito(a)');
INSERT INTO Conhecedores (id_pagina, profissao) VALUES (1, 'Paladino(a)');
INSERT INTO Conhecedores (id_pagina, profissao) VALUES (1, 'Diplomata');
INSERT INTO Conhecedores (id_pagina, profissao) VALUES (2, 'Ladino(a)');
INSERT INTO Conhecedores (id_pagina, profissao) VALUES (2, 'Diplomata');

INSERT INTO Personagem (id, nome, idade, profissao, data_criacao, id_mundo) VALUES 
(1, 'Ann`aurora', 21, 'Clérigo(a)', '2024-06-05', 1),
(2, 'Zurendownr Narrwack', 652, 'Diplomata', '2024-06-05', 1);

-- Consulta para exibir o nome dos personagens e os títulos das páginas que eles conhecem

SELECT 
    Personagem.nome AS personagem_nome,
    GROUP_CONCAT(Pagina.titulo) AS paginas_conhecidas
FROM 
    Personagem
JOIN 
    Conhecedores ON Personagem.profissao = Conhecedores.profissao
JOIN 
    Pagina ON Conhecedores.id_pagina = Pagina.id
GROUP BY 
    Personagem.nome;
