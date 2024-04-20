-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`aeronave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aeronave` (
  `id_aeronave` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `capacidade` INT NOT NULL,
  `ano_de_fabricacao` INT NOT NULL,
  PRIMARY KEY (`id_aeronave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`companhia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`companhia` (
  `id_companhia` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `pais_de_origem` VARCHAR(45) NOT NULL,
  `ano_fundacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_companhia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`voo` (
  `numero` INT NOT NULL,
  `origem` VARCHAR(45) NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `data_de_chegada` DATE NOT NULL,
  `assentos` INT NOT NULL,
  `aeronave_id_aeronave` INT NOT NULL,
  `companhia_id_companhia` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_voo_aeronave1_idx` (`aeronave_id_aeronave` ASC) VISIBLE,
  INDEX `fk_voo_companhia1_idx` (`companhia_id_companhia` ASC) VISIBLE,
  CONSTRAINT `fk_voo_aeronave1`
    FOREIGN KEY (`aeronave_id_aeronave`)
    REFERENCES `mydb`.`aeronave` (`id_aeronave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voo_companhia1`
    FOREIGN KEY (`companhia_id_companhia`)
    REFERENCES `mydb`.`companhia` (`id_companhia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`passaporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passaporte` (
  `num_passaporte` INT NOT NULL,
  `data_expedicao` DATE NOT NULL,
  `data_validade` DATE NOT NULL,
  PRIMARY KEY (`num_passaporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`passageiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passageiros` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `data_de_nascimento` DATE NOT NULL,
  `passaporte_num_passaporte` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_passageiros_passaporte1_idx` (`passaporte_num_passaporte` ASC) VISIBLE,
  CONSTRAINT `fk_passageiros_passaporte1`
    FOREIGN KEY (`passaporte_num_passaporte`)
    REFERENCES `mydb`.`passaporte` (`num_passaporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`passageiros_has_voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passageiros_has_voo` (
  `passageiros_cpf` INT NOT NULL,
  `voo_numero` INT NOT NULL,
  PRIMARY KEY (`passageiros_cpf`, `voo_numero`),
  INDEX `fk_passageiros_has_voo_voo1_idx` (`voo_numero` ASC) VISIBLE,
  INDEX `fk_passageiros_has_voo_passageiros1_idx` (`passageiros_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_passageiros_has_voo_passageiros1`
    FOREIGN KEY (`passageiros_cpf`)
    REFERENCES `mydb`.`passageiros` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passageiros_has_voo_voo1`
    FOREIGN KEY (`voo_numero`)
    REFERENCES `mydb`.`voo` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
