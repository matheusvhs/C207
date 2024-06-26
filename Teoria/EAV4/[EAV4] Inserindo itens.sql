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


INSERT INTO Item (id, nome, preco, peso, vol, efeito, cap_peso, cap_vol, classe, dano) VALUES
(1, 'Ungento restaurador', 80.0, 0.2, 0.25, '-', NULL, NULL, '-', '-'),
(2, 'Poção de regeneração', 200.0, 0.2, 0.35, 'Cicatriza ferimentos profundos (1d4+2 PV)', NULL, NULL, '-', '-'),
(3, 'Bolsa de explorador', 20.0, 0.6, 1.2, '-', 50.0, 23.6, '-', '-'),
(4, 'Bolsa encantada', 500.0, 0.7, 1.1, 'Tem uma dimensão de bolso para armazenar itens', 1850.0, 1020.0, '-', '-'),
(5, 'Machado de guerra', 50.0, 15.5, 10.1, '-', NULL, NULL, 'Corpo-a-corpo pesada', '1d8');

SELECT id, nome, preco, peso, vol 
FROM Item 
WHERE id = 1;
SELECT id, nome, preco, peso, vol, id, efeito 
FROM Item 
WHERE efeito <> '-';
SELECT id, nome, preco, peso, vol, id, cap_peso, cap_vol 
FROM Item 
WHERE cap_peso IS NOT NULL OR cap_vol IS NOT NULL;
SELECT id, nome, preco, peso, vol, id, dano, classe 
FROM Item 
WHERE classe <> '-';

