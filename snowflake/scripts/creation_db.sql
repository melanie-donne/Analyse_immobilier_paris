------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATION DES TABLES DANS SNOWFLAKE
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table VALEURS_FONCIERES
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."VALEURS_FONCIERES" ( DATE_MUTATION DATE , NATURE_MUTATION VARCHAR , VALEUR_FONCIERE NUMBER(38, 1) , ADRESSE_NUMERO NUMBER(38, 1) , ADRESSE_NOM_VOIE VARCHAR , Voie VARCHAR , CODE_POSTAL NUMBER(38, 1) , COMMUNE VARCHAR , Code_departement NUMBER(38, 0) , Code_commune NUMBER(38, 0) , SURFACE_CARREZ VARCHAR , TYPE_LOCAL VARCHAR , SURFACE_REELLE_BATI NUMBER(38, 1) , NOMBRE_PIECES_PRINCIPALES NUMBER(38, 1) , SURFACE_TERRAIN NUMBER(38, 1) ); 

CREATE TEMP FILE FORMAT "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T09:53:02.537Z"
	TYPE=CSV
    SKIP_HEADER=1
    FIELD_DELIMITER=','
    TRIM_SPACE=TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    REPLACE_INVALID_CHARACTERS=TRUE
    DATE_FORMAT=AUTO
    TIME_FORMAT=AUTO
    TIMESTAMP_FORMAT=AUTO; 

COPY INTO "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."VALEURS_FONCIERES" 
FROM (SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15
	FROM '@"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."__snowflake_temp_import_files__"') 
FILES = ('2024-04-29T09:52:52.767Z/valeurs_foncieres_paris_2022.csv') 
FILE_FORMAT = '"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T09:53:02.537Z"' 
ON_ERROR=ABORT_STATEMENT 

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table ARRONDISSEMENTS
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."ARRONDISSEMENTS" ( IDENTIFIANT_SEQUENTIEL NUMBER(38, 0) , NUMERO_ARRONDISSEMENT NUMBER(38, 0) , NUMERO_ARRONDISSEMENT_INSEE NUMBER(38, 0) , NOM_ARRONDISSEMENT VARCHAR , NOM_OFFICIEL_ARRONDISSEMENT VARCHAR , NUMERO_SEQUENTIEL_COMMUNE NUMBER(38, 0) , SURFACE NUMBER(38, 8) , PERIMETRE NUMBER(38, 8) , GEOM_Y_X VARCHAR ); 

CREATE TEMP FILE FORMAT "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:23:44.054Z"
	TYPE=CSV
    SKIP_HEADER=1
    FIELD_DELIMITER=';'
    TRIM_SPACE=TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    REPLACE_INVALID_CHARACTERS=TRUE
    DATE_FORMAT=AUTO
    TIME_FORMAT=AUTO
    TIMESTAMP_FORMAT=AUTO; 

COPY INTO "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."ARRONDISSEMENTS" 
FROM (SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9
	FROM '@"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."__snowflake_temp_import_files__"') 
FILES = ('2024-04-29T10:23:02.689Z/arrondissements.csv') 
FILE_FORMAT = '"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:23:44.054Z"' 
ON_ERROR=ABORT_STATEMENT 

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table ENCADREMENT_DES_LOYERS
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."ENCADREMENT_DES_LOYERS" ( ANNEE NUMBER(38, 0) , SECTEURS_GEOGRAPHIQUES NUMBER(38, 0) , NUMERO_DU_QUARTIER NUMBER(38, 0) , NOM_DU_QUARTIER VARCHAR , NOMBRE_DE_PIECES_PRINCIPALES NUMBER(38, 0) , EPOQUE_DE_CONSTRUCTION VARCHAR , TYPE_DE_LOCATION VARCHAR , LOYERS_DE_REFERENCE NUMBER(38, 1) , LOYERS_DE_REFERENCE_MAJORES NUMBER(38, 2) , LOYERS_DE_REFERENCE_MINORES NUMBER(38, 2) , VILLE VARCHAR , NUMERO_INSEE_DU_QUARTIER NUMBER(38, 0) , GEO_SHAPE VARCHAR , GEO_POINT_2D VARCHAR ); 

CREATE TEMP FILE FORMAT "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:29:56.628Z"
	TYPE=CSV
    SKIP_HEADER=1
    FIELD_DELIMITER=';'
    TRIM_SPACE=TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    REPLACE_INVALID_CHARACTERS=TRUE
    DATE_FORMAT=AUTO
    TIME_FORMAT=AUTO
    TIMESTAMP_FORMAT=AUTO; 

COPY INTO "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."ENCADREMENT_DES_LOYERS" 
FROM (SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14
	FROM '@"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."__snowflake_temp_import_files__"') 
FILES = ('2024-04-29T10:29:40.878Z/logement_encadrement_des_loyers.csv') 
FILE_FORMAT = '"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:29:56.628Z"' 
ON_ERROR=ABORT_STATEMENT 

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table QUARTIERS_ADMINISTRATIFS
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."QUARTIERS_ADMINISTRATIFS" ( NUMERO_SEQUENTIEL_QUARTIER NUMBER(38, 0) , NUMERO_QUARTIER NUMBER(38, 0) , NUMERO_QUARTIER_INSEE NUMBER(38, 0) , NOM_QUARTIER VARCHAR , NUMERO_ARRONDISSEMENT NUMBER(38, 0) , NUMERO_SEQUENTIEL_ARRONDISSEMENT NUMBER(38, 0) , PERIMETRE NUMBER(38, 8) , SURFACE NUMBER(38, 8) , GEOMETRY_X_Y VARCHAR , ST_AREA_SHAPE NUMBER(38, 11) , ST_PERIMETER_SHAPE NUMBER(38, 13) ); 

CREATE TEMP FILE FORMAT "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:31:54.579Z"
	TYPE=CSV
    SKIP_HEADER=1
    FIELD_DELIMITER=';'
    TRIM_SPACE=TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    REPLACE_INVALID_CHARACTERS=TRUE
    DATE_FORMAT=AUTO
    TIME_FORMAT=AUTO
    TIMESTAMP_FORMAT=AUTO; 

COPY INTO "ANALYSE_IMMO_PARIS_2022"."PUBLIC"."QUARTIERS_ADMINISTRATIFS" 
FROM (SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
	FROM '@"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."__snowflake_temp_import_files__"') 
FILES = ('2024-04-29T10:31:50.929Z/quartiers_administratifs.csv') 
FILE_FORMAT = '"ANALYSE_IMMO_PARIS_2022"."PUBLIC"."temp_file_format_2024-04-29T10:31:54.579Z"' 
ON_ERROR=ABORT_STATEMENT 