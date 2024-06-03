-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8 ;
USE `projeto` ;

-- -----------------------------------------------------
-- Table `projeto`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(5) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_professor`))
;


-- -----------------------------------------------------
-- Table `projeto`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`disciplina` (
  `id_disciplina` VARCHAR(5) NOT NULL,
  `nome_disciplina` VARCHAR(45) NOT NULL,
  `carga_horaria` VARCHAR(45) NOT NULL,
  `professor_id_professor` INT NULL,
  PRIMARY KEY (`id_disciplina`),
  CONSTRAINT `fk_disciplina_professor`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `projeto`.`professor` (`id_professor`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `projeto`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(5) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_aluno`))
;


-- -----------------------------------------------------
-- Table `projeto`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`matricula` (
  `id_matricula` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NOT NULL,
  `data_matricula` VARCHAR(45) NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `aluno_id_aluno` INT NULL,
  PRIMARY KEY (`id_matricula`),
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `projeto`.`aluno` (`id_aluno`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `projeto`.`cursa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`cursa` (
  `disciplina_id_disciplina` VARCHAR(5) NOT NULL,
  `matricula_id_matricula` INT NOT NULL,
  `NP1` VARCHAR(45) NOT NULL,
  `NP2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`disciplina_id_disciplina`, `matricula_id_matricula`),
  CONSTRAINT `fk_cursa_disciplina1`
    FOREIGN KEY (`disciplina_id_disciplina`)
    REFERENCES `projeto`.`disciplina` (`id_disciplina`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursa_matricula1`
    FOREIGN KEY (`matricula_id_matricula`)
    REFERENCES `projeto`.`matricula` (`id_matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
;
