DROP TABLE IF EXISTS sous_taches;
DROP TABLE IF EXISTS taches;
DROP TABLE IF EXISTS utilisateur;

CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    courriel VARCHAR(255) UNIQUE,
    cle_api VARCHAR(30),
    password VARCHAR(100)
);

CREATE TABLE taches (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateur(id) ON DELETE CASCADE,
    titre VARCHAR(100),
    description VARCHAR(500),
    date_debut DATE,
    date_echeance DATE,
    complete TINYINT 
);

CREATE TABLE sous_taches (
    id SERIAL PRIMARY KEY,
    tache_id INTEGER REFERENCES taches(id) ON DELETE CASCADE,
    titre VARCHAR(100),
    complete TINYINT 
