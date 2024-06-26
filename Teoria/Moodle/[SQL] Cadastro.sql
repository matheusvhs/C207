CREATE TABLE item(
	cod_item INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    preco DOUBLE NOT NULL,
    quantidade INT NOT NULL
);

INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (1,"Arco",20.0,22);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (2,"Flecha",2.0,43);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (3,"Espada",35.0,16);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (4,"Escudo",20.0,20);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (5,"Maça",23.0,19);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (6,"Mangual",56.0,16);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (7,"Lança",21.0,18);
INSERT INTO item(cod_item,nome,preco,quantidade) VALUES (8,"Machado",20.0,21);

SELECT * FROM item;