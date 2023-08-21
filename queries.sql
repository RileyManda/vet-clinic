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
ROLLBACK;

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

/* delete all records in the animals table, then roll back the transaction.*/
BEGIN;
DELETE FROM animals;

ROLLBACK;

/* delete all animals born after Jan 1st, 2022*/

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
COMMIT;

/* transaction savepoint animals > '2022-01-01'  */
BEGIN;
SAVEPOINT transaction_savepoint;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
COMMIT;

/* Update all animals' weight to be their weight multiplied by -1. */

BEGIN;
UPDATE animals
SET weight_kg = weight_kg * -1;
COMMIT;

/* rollback transaction */
ROLLBACK TO SAVEPOINT transaction_savepoint;
COMMIT;

/* Update all animals' weights that are negative to be their weight multiplied by -1. */
BEGIN;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

-- count the number of animals

SELECT COUNT(*) FROM animals;
