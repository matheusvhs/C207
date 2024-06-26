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

SELECT 
    atributo_base,
    COUNT(*) AS quantidade_de_habilidades
FROM 
    Habilidades
GROUP BY 
    atributo_base;
