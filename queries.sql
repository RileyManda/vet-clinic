/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*Transactions.*/
/*update the animals table by setting the species column to unspecified*/
BEGIN;
UPDATE animals SET species = 'unspecified';
/*roll back changes to species column.*/
ROLLBACK

/*Update the animals table by setting the species column to digimon.*/
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

COMMIT;

/*Set the species column to pokemon for all animals that don't have species already set.*/
BEGIN;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

