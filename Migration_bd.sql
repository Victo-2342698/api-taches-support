-- Supprimer les tables si elles existent déjà (ordre inverse des dépendances)
DROP TABLE IF EXISTS sous_taches;
DROP TABLE IF EXISTS taches;
DROP TABLE IF EXISTS utilisateurs;

-- Table des utilisateurs
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    courriel VARCHAR(150) UNIQUE,
    mot_de_passe_hash VARCHAR(255),
    cle_api VARCHAR(255)
);

-- Table des tâches
CREATE TABLE taches (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id) ON DELETE CASCADE,
    titre VARCHAR(150),
    description TEXT,
    date_debut DATE,
    date_echeance DATE,
    statut VARCHAR(20) DEFAULT 'en cours' CHECK (statut IN ('en cours', 'terminée'))
);

-- Table des sous-tâches
CREATE TABLE sous_taches (
    id SERIAL PRIMARY KEY,
    tache_id INTEGER REFERENCES taches(id) ON DELETE CASCADE,
    titre VARCHAR(150),
    statut VARCHAR(20) DEFAULT 'en cours' CHECK (statut IN ('en cours', 'terminée'))
);
