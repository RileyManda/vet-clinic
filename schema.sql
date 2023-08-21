/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- Create table owners
CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255),
    age integer
);

-- create table species
CREATE TABLE species (
    id serial PRIMARY KEY,
    name varchar(255)
);

-- remove species column in animal table

ALTER TABLE animals
DROP COLUMN species;

-- add column  species_id  in animal table
ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);

-- add column  species_id  in animal table
ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);

