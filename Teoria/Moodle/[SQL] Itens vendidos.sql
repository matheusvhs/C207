CREATE TABLE vendas (
    cod INT PRIMARY KEY,
    data_hora DATETIME,
    email_usuario VARCHAR(255)
);

CREATE TABLE itens_vendidos (
    cod_venda INT,
    cod_item INT,
    quantidade INT,
    FOREIGN KEY (cod_venda) REFERENCES vendas(cod)
);

INSERT INTO vendas (cod, data_hora, email_usuario) VALUES
(1, '2024-05-10 11:22', 'j@g.com'),
(2, '2024-05-12 11:22', 'k@g.com'),
(3, '2024-05-13 11:22', 'a@g.com'),
(4, '2024-05-13 11:22', 'r@g.com'),
(5, '2024-05-13 11:22', 'r@g.com'),
(6, '2024-05-14 11:22', 'f@g.com'),
(7, '2024-05-15 11:22', 'r@g.com');

INSERT INTO itens_vendidos (cod_venda, cod_item, quantidade) VALUES
(1, 1, 15),
(1, 3, 5),
(2, 2, 2),
(3, 5, 2),
(4, 8, 3),
(4, 6, 2),
(4, 1, 1),
(5, 3, 6),
(6, 4, 7),
(6, 3, 5),
(7, 7, 10);

SELECT FLOOR(AVG(itens_por_venda)) AS quantidade_media_itens_vendidos
FROM (
    SELECT v.cod, SUM(iv.quantidade) AS itens_por_venda
    FROM vendas v
    JOIN itens_vendidos iv ON v.cod = iv.cod_venda
    GROUP BY v.cod
);

SELECT cod_item
FROM (
    SELECT cod_item, SUM(quantidade) AS total_vendido
    FROM itens_vendidos
    GROUP BY cod_item
    ORDER BY total_vendido DESC
    LIMIT 5
);
