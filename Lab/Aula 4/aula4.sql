-- Matheus Vieira Honorio de Souza - 525 - GES 

CREATE DATABASE aula4;

USE aula04;

-- EX.1

/*
Uma chave primária é um campo ou conjunto de campos que identifica exclusivamente cada registro em uma tabela. 
Sua função principal é garantir a integridade dos dados, evitando a duplicação de registros 
e garantindo a unicidade de cada linha na tabela.

*/

-- EX.2

CREATE TABLE Usuario(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45),
    cargo VARCHAR(45)
);

-- Insira três novos registros;

INSERT INTO Usuario() VALUES (default,'Matheus','Rua 1','Programador');
INSERT INTO Usuario() VALUES (default,'Lucas','Rua 13','Biólogo');
INSERT INTO Usuario() VALUES (default,'Kaique','Rua dos Bobos','Pesquisador');

-- Atualize o endereço do segundo registro

UPDATE Usuario SET endereco = 'Rua 7' WHERE id = 2;

-- Realize uma consulta na tabela e mostre somente o nome e o cargo de todos os registros

SELECT nome, cargo FROM aula4.usuario;

-- Exclua o último registro realizado.

DELETE FROM usuario WHERE id = '3';

drop table usuario;

-- EX.3

CREATE TABLE Empresa(
	Matrícula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProj INT 
);

/* Demonstre como os dados podem ter sido inseridos na tabela considerando que o id é gerado 
automaticamente e a tabela se chama empresa. (Faça apenas um comando de exemplo) */

INSERT INTO Empresa() VALUES (default,'Alexandre','000.000.000-00','GP',2);
INSERT INTO Empresa() VALUES (default,'Natanael','111.111.111-11','Desenvolvedor',4);
INSERT INTO Empresa() VALUES (default,'Rochelle','222.222.222-22','Tester',3);
INSERT INTO Empresa() VALUES (default,'Jane','333.333.333-33 ','Desenvolvedor',5);

/* ) Buscar os dados dos funcionários com o maior e menor número de projetos, respectivamente.
(pode ser necessária mais de uma busca para cada) */

SELECT Matrícula, nome, cpf, cargo, (nProj) FROM Empresa WHERE nProj = (SELECT MAX(nProj) FROM Empresa);
SELECT Matrícula, nome, cpf, cargo, (nProj) FROM Empresa WHERE nProj = (SELECT MIN(nProj) FROM Empresa);

/* Busque a média aritmética do número de projetos dos funcionários que não são do cargo Gerente 
de Projetos “GP” */

SELECT AVG(nProj) FROM Empresa WHERE cargo != 'GP';

--  Realize uma busca que mostre quais os funcionários têm 4 ou mais projetos.

SELECT Matrícula, nome, cpf, cargo, (nProj) FROM Empresa WHERE nProj > 3;

-- Busque uma lista dos cargos da empresa, sem repeti-los.

SELECT distinct cargo FROM Empresa;

-- Busque nome, cpf e número de projetos apenas dos desenvolvedores.

SELECT nome, cpf, (nProj) FROM Empresa WHERE cargo = 'Desenvolvedor';

drop table empresa;

-- EX.4

-- As inserções corretas são as letras a) e b) pois são as únicas com chave primaria valida e única.
INSERT INTO aluno(nome, matricula, endereco, ano_nasc, curso) VALUES (‘Janaina’, ‘123’, ‘Rua 1’, ‘1998’, ‘GEB’);
INSERT INTO aluno(nome, matricula, endereco, ano_nasc, curso) VALUES (‘Pedro’, default, ‘Rua 2’, ‘2000’, ‘GES’);


