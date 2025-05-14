CREATE DATABASE Activite;
USE Activite;

-- Table utilisateur centralisée
CREATE TABLE UTILISATEUR (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(255),
    role ENUM('conseillere', 'stagiaire', 'direction') NOT NULL
);

-- Détails spécifiques pour chaque type d'utilisateur
CREATE TABLE CONSEILLERE (
    id_conseillere INT PRIMARY KEY,
    FOREIGN KEY (id_conseillere) REFERENCES UTILISATEUR(id_utilisateur)
);

CREATE TABLE STAGIAIRE (
    id_stagiaire INT PRIMARY KEY,
    FOREIGN KEY (id_stagiaire) REFERENCES UTILISATEUR(id_utilisateur)
);

CREATE TABLE DIRECTION (
    id_direction INT PRIMARY KEY,
    FOREIGN KEY (id_direction) REFERENCES UTILISATEUR(id_utilisateur)
);

-- Intervenants
CREATE TABLE INTERVENANT (
     id_intervenant INT AUTO_INCREMENT PRIMARY KEY,,
    nom VARCHAR(100),
    specialite VARCHAR(100)
);

-- Activités
CREATE TABLE ACTIVITE (
    id_activite INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255),
    description TEXT,
    date DATE,
    heure_debut TIME,
    heure_fin TIME,
    etat ENUM('en cours', 'terminée', 'annulée') NOT NULL,
    id_conseillere INT,
    id_intervenant INT,
    FOREIGN KEY (id_conseillere) REFERENCES CONSEILLERE(id_conseillere),
    FOREIGN KEY (id_intervenant) REFERENCES INTERVENANT(id_intervenant)
);

-- Rapports
CREATE TABLE RAPPORT (
    id_rapport INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    date_soumission DATE,
    etat_validation VARCHAR(50),
    fichier_pdf VARCHAR(255),
    id_activite INT,
    FOREIGN KEY (id_activite) REFERENCES ACTIVITE(id_activite)
);

-- Médias
CREATE TABLE MEDIA (
    id_media INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50),
    chemin_fichier VARCHAR(255),
    description TEXT,
    id_activite INT,
    FOREIGN KEY (id_activite) REFERENCES ACTIVITE(id_activite)
);

-- Commentaires des stagiaires
CREATE TABLE COMMENTAIRE (
    id_commentaire INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    date_commentaire DATE,
    id_stagiaire INT,
    id_activite INT,
    FOREIGN KEY (id_stagiaire) REFERENCES STAGIAIRE(id_stagiaire),
    FOREIGN KEY (id_activite) REFERENCES ACTIVITE(id_activite)
);

-- Notifications
CREATE TABLE NOTIFICATION (
    id_notification INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    type VARCHAR(50),
    date_envoi DATETIME,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR(id_utilisateur)
);
