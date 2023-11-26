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
CREATE SCHEMA IF NOT EXISTS `xdumbr00` DEFAULT CHARACTER SET utf8 ;
USE `xdumbr00` ;
-- -----------------------------------------------------
-- Table `mydb`.`Vozidlo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xdumbr00`.`spoj` ;
DROP TABLE IF EXISTS `xdumbr00`.`Udrzba` ;
DROP TABLE IF EXISTS `xdumbr00`.`uzivatel` ;
DROP TABLE IF EXISTS `xdumbr00`.`Vozidlo` ;
DROP TABLE IF EXISTS `xdumbr00`.`linka_has_cas_jizdy` ;
DROP TABLE IF EXISTS `xdumbr00`.`cas_jizdy` ;
DROP TABLE IF EXISTS `xdumbr00`.`linka` ;
DROP TABLE IF EXISTS `xdumbr00`.`zastavka` ;
CREATE TABLE IF NOT EXISTS `xdumbr00`.`Vozidlo` (
  `SPZ` VARCHAR(10) NOT NULL,
  `nazev` VARCHAR(255) NOT NULL,
  `druh_vozidla` VARCHAR(255) NULL,
  `znacka` VARCHAR(45) NULL,
  `fotka` BLOB NULL,
  `typ_paliva` VARCHAR(45) NULL,
  `potrebuje_udrzbu` ENUM("ano", "ne") NULL,
  PRIMARY KEY (`SPZ`));


-- -----------------------------------------------------
-- Table `mydb`.`zastavka`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `xdumbr00`.`zastavka` (
  `idzastavka` INT NOT NULL AUTO_INCREMENT,
  `jmeno_zastavky` VARCHAR(45) NULL,
  PRIMARY KEY (`idzastavka`));


-- -----------------------------------------------------
-- Table `mydb`.`linka`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `xdumbr00`.`linka` (
  `cislo_linky` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cislo_linky`));


-- -----------------------------------------------------
-- Table `mydb`.`uzivatel`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `xdumbr00`.`uzivatel` (
  `jmeno` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `heslo` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `opravneni` VARCHAR(45) NULL,
  PRIMARY KEY (`jmeno`));


-- -----------------------------------------------------
-- Table `mydb`.`spoj`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `xdumbr00`.`spoj` (
  `id_spoj` INT NOT NULL,
  `cas_odjezdu` VARCHAR(45) NULL,
  `smer_jizdy` ENUM("tam", "zpatky") NULL,
  `den_jizdy` SET("pondeli", "utery", "streda", "ctvrtek", "patek", "sobota", "nedele") NULL,
  `linka_cislo_linky` INT NOT NULL,
  `Vozidlo_SPZ` VARCHAR(10) NOT NULL,
  `uzivatel_jmeno` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id_spoj`, `linka_cislo_linky`, `Vozidlo_SPZ`, `uzivatel_jmeno`),
  CONSTRAINT `fk_linka_cislo_linky`
    FOREIGN KEY (`linka_cislo_linky`)
    REFERENCES `xdumbr00`.`linka` (`cislo_linky`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Vozidlo_SPZ`
    FOREIGN KEY (`Vozidlo_SPZ`)
    REFERENCES `xdumbr00`.`Vozidlo` (`SPZ`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_uzivatel_jmeno`
    FOREIGN KEY (`uzivatel_jmeno`)
    REFERENCES `xdumbr00`.`uzivatel` (`jmeno`)
    ON DELETE CASCADE
  );


-- -----------------------------------------------------
-- Table `mydb`.`cas_jizdy`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `xdumbr00`.`cas_jizdy` (
  `idcas_jizdy` INT NOT NULL AUTO_INCREMENT,
  `cas` INT NULL,
  `zastavka_idzastavka` INT NOT NULL,
  `zastavka_idzastavka1` INT NOT NULL,
  PRIMARY KEY (`idcas_jizdy`, `zastavka_idzastavka`, `zastavka_idzastavka1`),
  CONSTRAINT `fk_zastavka_idzastavka`
    FOREIGN KEY (`zastavka_idzastavka`)
    REFERENCES `xdumbr00`.`zastavka` (`idzastavka`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_zastavka_idzastavka1`
    FOREIGN KEY (`zastavka_idzastavka1`)
    REFERENCES `xdumbr00`.`zastavka` (`idzastavka`)
    ON DELETE CASCADE
  );


-- -----------------------------------------------------
-- Table `mydb`.`linka_has_cas_jizdy`
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `xdumbr00`.`linka_has_cas_jizdy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xdumbr00`.`linka_has_cas_jizdy` (
  `linka_cislo_linky` INT NOT NULL,
  `cas_jizdy_idcas_jizdy` INT NOT NULL,
  PRIMARY KEY (`linka_cislo_linky`, `cas_jizdy_idcas_jizdy`),
    FOREIGN KEY (`linka_cislo_linky`)
    REFERENCES `xdumbr00`.`linka` (`cislo_linky`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_cas_jizdy_idcas_jizdy`
    FOREIGN KEY (`cas_jizdy_idcas_jizdy`)
    REFERENCES `xdumbr00`.`cas_jizdy` (`idcas_jizdy`)
    ON DELETE CASCADE
);



-- -----------------------------------------------------
-- Table `mydb`.`Udrzba`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `xdumbr00`.`Udrzba` (
  `idUdrzba` INT NOT NULL AUTO_INCREMENT,
  `Datum` DATETIME NULL,
  `Zaznam` TEXT NULL,
  `Vozidlo_SPZ` VARCHAR(10) NOT NULL,
  `uzivatel_jmeno` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idUdrzba`, `Vozidlo_SPZ`, `uzivatel_jmeno`),
  CONSTRAINT `fk_Udrzba_Vozidlo1`
    FOREIGN KEY (`Vozidlo_SPZ`)
    REFERENCES `xdumbr00`.`Vozidlo` (`SPZ`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Udrzba_uzivatel1`
    FOREIGN KEY (`uzivatel_jmeno`)
    REFERENCES `xdumbr00`.`uzivatel` (`jmeno`)
    ON DELETE CASCADE
  );


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
