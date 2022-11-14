
CREATE DATABASE etudiant;

USE etudiant;

CREATE TABLE programme(
 noProgramme CHAR (5) PRIMARY KEY,
 programme varchar(100)
 );
CREATE TABLE etudidant(
 noEtudiant INT PRIMARY KEY,
 nom VARCHAR(50) ,
 prenom VARCHAR(50),
 noProgramme CHAR(5),
 CONSTRAINT fk_Programme FOREIGN KEY REFERENCES programme(noProgramme)
 index NomPrenom (nom, prenom),
 index programme (noProgramme)
 );
 