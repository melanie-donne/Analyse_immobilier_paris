------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Création des clés primaires
------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".ARRONDISSEMENTS ADD CONSTRAINT ARRONDISSEMENTS_PK PRIMARY KEY (IDENTIFIANT_SEQUENTIEL);
ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".QUARTIERS_ADMINISTRATIFS ADD CONSTRAINT QUARTIERS_ADMINISTRATIFS_PK PRIMARY KEY (NUMERO_SEQUENTIEL_QUARTIER);

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ajout d'une colonne ID sur Snowflake
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Créer une séquence
CREATE SEQUENCE encadrement_des_loyers_seq;
-- Ajouter une colonne à la table
ALTER TABLE ENCADREMENT_DES_LOYERS 
ADD COLUMN ID_ENCADREMENT_DES_LOYERS INT;
-- Mettre à jour les valeurs de la colonne avec les valeurs de la séquence
UPDATE ENCADREMENT_DES_LOYERS 
SET ID_ENCADREMENT_DES_LOYERS = encadrement_des_loyers_seq.NEXTVAL;
-- Définir la colonne comme clé primaire si nécessaire
ALTER TABLE ENCADREMENT_DES_LOYERS 
ADD CONSTRAINT PK_ENCADREMENT_DES_LOYERS PRIMARY KEY (ID_ENCADREMENT_DES_LOYERS);

-- Ajouter la colonne d'index à la table sans valeur par défaut
ALTER TABLE VALEURS_FONCIERES
ADD COLUMN ID_VALEURS_FONCIERES INT;
-- Créer une séquence pour générer les valeurs d'index
CREATE SEQUENCE VALEURS_FONCIERES_seq;
-- Mettre à jour les valeurs de la colonne ID_ETABLISSEMENT
UPDATE VALEURS_FONCIERES
SET ID_VALEURS_FONCIERES = VALEURS_FONCIERES_seq.NEXTVAL;
-- Définir la colonne comme clé primaire
ALTER TABLE VALEURS_FONCIERES
ADD CONSTRAINT VALEURS_FONCIERES_PK PRIMARY KEY (ID_EVALEURS_FONCIERES);

ALTER TABLE DIM_ENCADREMENT_DES_LOYERS
ADD COLUMN ID_ENCADREMENT_DES_LOYERS INT;
CREATE SEQUENCE ENCADREMENT_DES_LOYERS_seq;
UPDATE DIM_ENCADREMENT_DES_LOYERS
SET ID_ENCADREMENT_DES_LOYERS = ENCADREMENT_DES_LOYERS_seq.NEXTVAL;
ALTER TABLE DIM_ENCADREMENT_DES_LOYERS
ADD CONSTRAINT ENCADREMENT_DES_LOYERS_PK PRIMARY KEY (ID_ENCADREMENT_DES_LOYERS);

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Supression de colonnes inutiles
------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".ENCADREMENT_DES_LOYERS DROP COLUMN GEO_SHAPE;

ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".QUARTIERS_ADMINISTRATIFS DROP COLUMN ST_AREA_SHAPE;
ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".QUARTIERS_ADMINISTRATIFS DROP COLUMN ST_PERIMETER_SHAPE;

ALTER TABLE ANALYSE_IMMO_PARIS_2022."PUBLIC".VALEURS_FONCIERES DROP COLUMN COMMUNE;

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fusion de colonnes
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ajouter une nouvelle colonne pour stocker le code départemental et communal fusionné
ALTER TABLE VALEURS_FONCIERES
ADD COLUMN NUMERO_ARRONDISSEMENT_INSEE VARCHAR(5);

-- Mettre à jour la nouvelle colonne avec la concaténation de CODE_DEPARTEMENT et CODE_COMMUNE
UPDATE VALEURS_FONCIERES
SET NUMERO_ARRONDISSEMENT_INSEE = CONCAT(CODE_DEPARTEMENT, CODE_COMMUNE);

-- Supprimer les colonnes CODE_DEPARTEMENT et CODE_COMMUNE si vous ne souhaitez pas les conserver
ALTER TABLE VALEURS_FONCIERES
DROP COLUMN CODE_DEPARTEMENT,
DROP COLUMN CODE_COMMUNE;


ALTER TABLE ANALYSE_IMMO_PARIS_2022.PUBLIC.ARRONDISSEMENTS
ADD CODE_POSTAL VARCHAR(5);
UPDATE ANALYSE_IMMO_PARIS_2022.PUBLIC.ARRONDISSEMENTS
SET CODE_POSTAL = CONCAT('750', LPAD(NUMERO_ARRONDISSEMENT, 2, '0'));

ALTER TABLE ENCADREMENT_DES_LOYERS
ADD (NUMERO_ARRONDISSEMENT NUMBER(2));
UPDATE ENCADREMENT_DES_LOYERS
SET NUMERO_ARRONDISSEMENT = TO_NUMBER(SUBSTR(NUMERO_INSEE_DU_QUARTIER, 3, 2));
