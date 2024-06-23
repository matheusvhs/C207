-- CRUD Completo para a tabela `aluno`

-- Chamar a stored procedure para inserir um novo aluno
CALL `projeto`.`inserir_aluno`('Maria Oliveira', '2001-08-20', 'F', 'Av. C, 789', 'maria.oliveira@example.com', '987654321');

-- Read (Selecionar todos os alunos)
SELECT * FROM `projeto`.`aluno`;

-- Update (Atualizar informações de um aluno)
UPDATE  aluno
SET nome = 'Ana Flávia Catela', endereco = 'Rua dos Cavalos, 746'
WHERE id_aluno = 2;

-- Delete (Deletar um aluno)
DELETE FROM aluno
WHERE id_aluno = 1;