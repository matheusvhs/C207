-- Limpar as tabelas existentes para evitar conflitos
DROP TABLE IF EXISTS `projeto`.`cursa`;
DROP TABLE IF EXISTS `projeto`.`matricula`;
DROP TABLE IF EXISTS `projeto`.`disciplina`;
DROP TABLE IF EXISTS `projeto`.`aluno`;
DROP TABLE IF EXISTS `projeto`.`professor`;

-- Criar o esquema e usar
CREATE SCHEMA IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8;
USE `projeto`;

-- Table `professor`
CREATE TABLE IF NOT EXISTS `projeto`.`professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_professor`)
);

-- Table `disciplina`
CREATE TABLE IF NOT EXISTS `projeto`.`disciplina` (
  `id_disciplina` VARCHAR(5) NOT NULL,
  `nome_disciplina` VARCHAR(45) NOT NULL,
  `carga_horaria` varchar(45) NOT NULL,
  `professor_id_professor` INT NULL,
  PRIMARY KEY (`id_disciplina`),
  CONSTRAINT `fk_disciplina_professor`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `projeto`.`professor` (`id_professor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- Table `aluno`
CREATE TABLE IF NOT EXISTS `projeto`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_aluno`)
);

-- Table `matricula` (1 para 1 com aluno)
CREATE TABLE IF NOT EXISTS `projeto`.`matricula` (
  `id_matricula` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NOT NULL,
  `data_matricula` VARCHAR(45) NOT NULL,
  `semestre` VARCHAR(20) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `aluno_id_aluno` INT NOT NULL UNIQUE,
  PRIMARY KEY (`id_matricula`),
  CONSTRAINT `fk_matricula_aluno`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `projeto`.`aluno` (`id_aluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Table `cursa` (N para M entre matricula e disciplina)
CREATE TABLE IF NOT EXISTS `projeto`.`cursa` (
  `disciplina_id_disciplina` VARCHAR(5) NOT NULL,
  `matricula_id_matricula` INT NOT NULL,
  `NP1` DECIMAL(5,2) NOT NULL,
  `NP2` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`disciplina_id_disciplina`, `matricula_id_matricula`),
  CONSTRAINT `fk_cursa_disciplina`
    FOREIGN KEY (`disciplina_id_disciplina`)
    REFERENCES `projeto`.`disciplina` (`id_disciplina`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cursa_matricula`
    FOREIGN KEY (`matricula_id_matricula`)
    REFERENCES `projeto`.`matricula` (`id_matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



