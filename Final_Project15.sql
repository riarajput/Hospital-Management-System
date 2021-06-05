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
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `idAddress` INT NOT NULL AUTO_INCREMENT,
  `AddressLine1` VARCHAR(100) NOT NULL,
  `AddressLine2` VARCHAR(50) NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `ZipCode` INT NOT NULL,
  PRIMARY KEY (`idAddress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contact` (
  `idContact` INT NOT NULL AUTO_INCREMENT,
  `PhoneNumber` VARCHAR(10) NOT NULL,
  `PhoneNumberType` ENUM("Home", "Office", "Mobile") NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idContact`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `MiddleName` VARCHAR(50) NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Gender` VARCHAR(20) NOT NULL,
  `Age` INT NOT NULL,
  `Addressid` INT NOT NULL,
  `Contactid` INT NOT NULL,
  PRIMARY KEY (`idPerson`),
  INDEX `Addressid_idx` (`Addressid` ASC) VISIBLE,
  INDEX `Contactid_idx` (`Contactid` ASC) VISIBLE,
  CONSTRAINT `Addressid`
    FOREIGN KEY (`Addressid`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contactid`
    FOREIGN KEY (`Contactid`)
    REFERENCES `mydb`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `idDepartment` INT NOT NULL AUTO_INCREMENT,
  `DepartmentName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idDepartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `idRole` INT NOT NULL AUTO_INCREMENT,
  `Role_Type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `Person_id` INT NOT NULL,
  `Address_id` INT NOT NULL,
  `Contact_id` INT NOT NULL,
  `Department_id` INT NOT NULL,
  `Role_id` INT NOT NULL,
  PRIMARY KEY (`idEmployee`),
  INDEX `Person_id_idx` (`Person_id` ASC) VISIBLE,
  INDEX `Address_id_idx` (`Address_id` ASC) VISIBLE,
  INDEX `Contact_id_idx` (`Contact_id` ASC) VISIBLE,
  INDEX `Department_id_idx` (`Department_id` ASC) VISIBLE,
  INDEX `Role_id_idx` (`Role_id` ASC) VISIBLE,
  CONSTRAINT `Person_id`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address_id`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contact_id`
    FOREIGN KEY (`Contact_id`)
    REFERENCES `mydb`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Department_id`
    FOREIGN KEY (`Department_id`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Role_id`
    FOREIGN KEY (`Role_id`)
    REFERENCES `mydb`.`Role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `PatientType` VARCHAR(50) NOT NULL,
  `Height` VARCHAR(20) NOT NULL,
  `Weight` VARCHAR(20) NOT NULL,
  `Blood Group` VARCHAR(10) NOT NULL,
  `Disease` VARCHAR(50) NOT NULL,
  `Personid` INT NOT NULL,
  `idaddress` INT NOT NULL,
  `idcontact` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `Person_id_idx` (`Personid` ASC) VISIBLE,
  INDEX `Address_id_idx` (`idaddress` ASC) VISIBLE,
  INDEX `Contact_id_idx` (`idcontact` ASC) VISIBLE,
  CONSTRAINT `Personid`
    FOREIGN KEY (`Personid`)
    REFERENCES `mydb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idaddress`
    FOREIGN KEY (`idaddress`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcontact`
    FOREIGN KEY (`idcontact`)
    REFERENCES `mydb`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab` (
  `Lab_No` INT NOT NULL AUTO_INCREMENT,
  `Patient_id` INT NOT NULL,
  `Employee_id` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Category_id` INT NOT NULL,
  `Amount` INT NOT NULL,
  PRIMARY KEY (`Lab_No`),
  INDEX `Patient_id_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `Employee_id_idx` (`Employee_id` ASC) VISIBLE,
  INDEX `Category_id_idx` (`Category_id` ASC) VISIBLE,
  CONSTRAINT `Patient_id`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Employee_id`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `mydb`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Category_id`
    FOREIGN KEY (`Category_id`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Outpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Outpatient` (
  `idOutpatient` INT NOT NULL AUTO_INCREMENT,
  `Patientid` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Lab_No` INT NOT NULL,
  PRIMARY KEY (`idOutpatient`),
  INDEX `Patient_id_idx` (`Patientid` ASC) VISIBLE,
  INDEX `Lab_No_idx` (`Lab_No` ASC) VISIBLE,
  CONSTRAINT `Patientid`
    FOREIGN KEY (`Patientid`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Lab_No`
    FOREIGN KEY (`Lab_No`)
    REFERENCES `mydb`.`Lab` (`Lab_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill Table` (
  `Bill_No` INT NOT NULL AUTO_INCREMENT,
  `patientid` INT NOT NULL,
  `DoctorCharges` INT NOT NULL,
  `MedicineCharges` INT NOT NULL,
  `RoomCharges` INT NULL,
  `OperationCharges` INT NULL,
  `NumberOfDays` INT NULL,
  `LabTestCharges` INT NOT NULL,
  `NursingCharges` INT NULL,
  `Advance` INT NOT NULL,
  `Bill` INT NOT NULL,
  PRIMARY KEY (`Bill_No`),
  INDEX `Patient_id_idx` (`patientid` ASC) VISIBLE,
  CONSTRAINT `patientid`
    FOREIGN KEY (`patientid`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room_Table` (
  `Room_No` INT NOT NULL AUTO_INCREMENT,
  `Room_Type` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Room_No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipment_Maintenance_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipment_Maintenance_Table` (
  `Medical_Equipment_id` INT NOT NULL AUTO_INCREMENT,
  `Medical_Equipment` VARCHAR(50) NOT NULL,
  `Availability` VARCHAR(10) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Department_id` INT NOT NULL,
  PRIMARY KEY (`Medical_Equipment_id`),
  INDEX `Department_id_idx` (`Department_id` ASC) VISIBLE,
  CONSTRAINT `Department_id`
    FOREIGN KEY (`Department_id`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EngineeringorInfra_Equipment_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EngineeringorInfra_Equipment_Table` (
  `Equipment_Id` INT NOT NULL AUTO_INCREMENT,
  `Engineering_Equipment` VARCHAR(50) NOT NULL,
  `Availability` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Department_id` INT NOT NULL,
  PRIMARY KEY (`Equipment_Id`),
  INDEX `Department_id_idx` (`Department_id` ASC) VISIBLE,
  CONSTRAINT `Department_id`
    FOREIGN KEY (`Department_id`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inpatient` (
  `idInpatient` INT NOT NULL AUTO_INCREMENT,
  `Patient_id` INT NOT NULL,
  `RoomNo` INT NOT NULL,
  `DateofAdmission` DATETIME NOT NULL,
  `DateofDischarge` DATETIME NOT NULL,
  `Advance` INT NOT NULL,
  `Lab_Number` INT NOT NULL,
  PRIMARY KEY (`idInpatient`),
  INDEX `Patient_id_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `RoomNo_idx` (`RoomNo` ASC) VISIBLE,
  INDEX `Lab_Number_idx` (`Lab_Number` ASC) VISIBLE,
  CONSTRAINT `Patient_id`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RoomNo`
    FOREIGN KEY (`RoomNo`)
    REFERENCES `mydb`.`Room_Table` (`Room_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Lab_Number`
    FOREIGN KEY (`Lab_Number`)
    REFERENCES `mydb`.`Lab` (`Lab_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
