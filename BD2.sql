-- MySQL Workbench Synchronization
-- Generated: 2023-12-05 04:45
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Flavio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`nome_aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeAluno` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `turma` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`nome_turma` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `serie` INT(11) GENERATED ALWAYS AS () VIRTUAL,
  `turma` VARCHAR(1) NOT NULL,
  `turno` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nome_aluno`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`nome_aluno` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nome_turma`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`nome_turma` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`periodo` (
  `id` INT(11) NOT NULL,
  `ano` INT(11) NOT NULL,
  `id_nomeAluno` INT(11) NOT NULL,
  `id_cadastroTurma` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nomeAluno_idx` (`id_nomeAluno` ASC) VISIBLE,
  INDEX `fk_cadastroTurma_idx` (`id_cadastroTurma` ASC) VISIBLE,
  CONSTRAINT `fk_nomeAluno`
    FOREIGN KEY (`id_nomeAluno`)
    REFERENCES `mydb`.`nome_aluno` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cadastroTurma`
    FOREIGN KEY (`id_cadastroTurma`)
    REFERENCES `mydb`.`nome_turma` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
