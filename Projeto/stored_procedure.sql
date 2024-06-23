-- Stored Procedure para inserir novo aluno
DELIMITER //
CREATE PROCEDURE `inserir_aluno` (
    IN `p_nome` VARCHAR(45),
    IN `p_data_nascimento` DATE,
    IN `p_sexo` CHAR(1),
    IN `p_endereco` VARCHAR(45),
    IN `p_email` VARCHAR(45),
    IN `p_telefone` VARCHAR(15)
)
BEGIN
    INSERT INTO `projeto`.`aluno` (`nome`, `data_nascimento`, `sexo`, `endereco`, `email`, `telefone`)
    VALUES (p_nome, p_data_nascimento, p_sexo, p_endereco, p_email, p_telefone);
END //
DELIMITER ;


