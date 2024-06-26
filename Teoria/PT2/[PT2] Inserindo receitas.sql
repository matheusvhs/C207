CREATE TABLE Ingredientes(
	id INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

INSERT INTO Ingredientes(id,nome) VALUES
(1, "Banana"),
(2,	"Leite"),
(3,	"Ovo"),
(4,	"Açúcar"),
(5,	"Farinha de trigo"),
(6,	 "Manteiga"),
(7,	 "Baunilha"),
(8,	 "Jaca"),
(9,	 "Barracuda"),
(10, "Sal"),
(11, "Pimenta"),
(12, "Cebola")
;

CREATE TABLE Receitas(
	id INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    modo_de_preparo VARCHAR(200)
);

CREATE TABLE Composicoes(
	receita INT,
    ingrediente INT,
    quantidade INT,
    FOREIGN KEY (receita) REFERENCES Receitas(id),
    FOREIGN KEY (ingrediente) REFERENCES Ingredientes(id)
);

INSERT INTO Receitas(id, nome, modo_de_preparo) VALUES 
(1,"Bolo de Banana", "Misture tudo coloque na forma e asse por 30 min."),
(2,"Batida de Banana", "Bata tudo no liquidificador e aproveite!"),
(3,"Tarte jacquier poisson", "Cozinhe a jaca em pressão por 20 min. Refogue a barracuda em pedaços pequenos, com a jaca cozida, manteiga, cebola, sal e pimenta. Faça a massa com farinha, manteiga e uma pitada de sal. Forre uma forma com a massa e coloque o recheio. Cubra com outra parte da massa e leve ao forno por 20 min ou até dourar.")
;

INSERT INTO Composicoes(receita,ingrediente, quantidade) VALUES
(1,	1,	 150),
(1,	3,	 80),
(1,	4,	100),
(1,	5,	150),
(1,	6,	50),
(2,	1,	100),
(2,	2,	150),
(3,	5,	200),
(3,	6,	100),
(3,	8,	300),
(3,	9,	200),
(3,	10,	10),
(3,	11,	10),
(3,	12,	200)
;

SELECT 
    r.nome,
    COUNT(c.ingrediente) AS quantidade_itens
FROM 
    Receitas r
Join 
    Composicoes c ON r.id = c.receita
GROUP BY r.nome
;

