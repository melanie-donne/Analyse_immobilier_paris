import os
import pandas as pd
import re

# Chemin du fichier CSV des arrondissements
arrondissements_csv_path = 'fetching_api_data/api_data/arrondissements.csv'

# Vérifier si le fichier des arrondissements existe
if os.path.exists(arrondissements_csv_path):
    print("Le fichier des arrondissements existe.")
else:
    print("Le fichier des arrondissements n'existe pas.")

# Vérifier si le fichier des arrondissements existe
if os.path.isfile(arrondissements_csv_path):
    # Charger le fichier CSV des arrondissements
    arrondissements_df = pd.read_csv(arrondissements_csv_path, delimiter=',')

    # Renommer les colonnes des arrondissements
    arrondissements_df.rename(columns={
        'n_sq_ar': 'IDENTIFIANT_SEQUENTIEL',
        'c_ar': 'NUMERO_ARRONDISSEMENT',
        'c_arinsee': 'NUMERO_ARRONDISSEMENT_INSEE',
        'l_ar': 'NOM_ARRONDISSEMENT',
        'l_aroff': 'NOM_OFFICIEL_ARRONDISSEMENT',
        'n_sq_co': 'N_SQ_CO',
        'surface': 'SURFACE',
        'perimetre': 'PERIMETRE',
        'geom_x_y': 'GEOMETRY_X_Y',
        'geom': 'GEOMETRY'
    }, inplace=True)

    # Enregistrer le fichier CSV des arrondissements avec les nouveaux noms d'en-têtes
    arrondissements_df.to_csv(arrondissements_csv_path, sep=';', index=False)

    print("Les noms des en-têtes du fichier des arrondissements ont été modifiés avec succès.")
else:
    print("Le fichier 'arrondissements.csv' n'a pas été trouvé dans 'api_data'. Veuillez vérifier que le téléchargement a réussi.")

###################################################################################################################################################################
# Chemin du fichier CSV des données sur les logements encadrés des loyers
logement_encadrement_des_loyers_csv_path = 'fetching_api_data/api_data/logement_encadrement_des_loyers.csv'

# Vérifier si le fichier des données sur les logements encadrés des loyers existe
if os.path.exists(logement_encadrement_des_loyers_csv_path):
    print("Le fichier des données sur les logements encadrés des loyers existe.")
else:
    print("Le fichier des données sur les logements encadrés des loyers n'existe pas.")

# Vérifier si le fichier des données sur les logements encadrés des loyers existe
if os.path.isfile(logement_encadrement_des_loyers_csv_path):
    # Charger le fichier CSV des données sur les logements encadrés des loyers
    logement_encadrement_des_loyers_df = pd.read_csv(logement_encadrement_des_loyers_csv_path, delimiter=';')

    # Renommer les colonnes des données sur les logements encadrés des loyers
    logement_encadrement_des_loyers_df.rename(columns={
        'Année': 'ANNEE',
        'Secteurs géographiques': 'SECTEURS_GEOGRAPHIQUES',
        'Numéro du quartier': 'NUMERO_DU_QUARTIER',
        'Nom du quartier': 'NOM_DU_QUARTIER',
        'Nombre de pièces principales': 'NOMBRE_DE_PIECES_PRINCIPALES',
        'Epoque de construction': 'EPOQUE_DE_CONSTRUCTION',
        'Type de location': 'TYPE_DE_LOCATION',
        'Loyers de référence': 'LOYERS_DE_REFERENCE',
        'Loyers de référence majorés': 'LOYERS_DE_REFERENCE_MAJORES',
        'Loyers de référence minorés': 'LOYERS_DE_REFERENCE_MINORES',
        'Ville': 'VILLE',
        'Numéro INSEE du quartier': 'NUMERO_INSEE_DU_QUARTIER',
        'geo_shape': 'GEO_SHAPE',
        'geo_point_2d': 'GEO_POINT_2D'
    }, inplace=True)

    # Enregistrer le fichier CSV des données sur les logements encadrés des loyers avec les nouveaux noms d'en-têtes
    logement_encadrement_des_loyers_df.to_csv(logement_encadrement_des_loyers_csv_path, sep=';', index=False)

    print("Les noms des en-têtes du fichier des données sur les logements encadrés des loyers ont été modifiés avec succès.")
else:
    print("Le fichier 'logement_encadrement_des_loyers.csv' n'a pas été trouvé dans 'api_data'. Veuillez vérifier que le téléchargement a réussi.")

###################################################################################################################################################################
# Chemin du fichier CSV des quartiers administratifs
quartiers_administratifs_csv_path = 'fetching_api_data/api_data/quartiers_administratifs.csv'

# Vérifier si le fichier des quartiers administratifs existe
if os.path.exists(quartiers_administratifs_csv_path):
    print("Le fichier des quartiers administratifs existe.")
else:
    print("Le fichier des quartiers administratifs n'existe pas.")

# Vérifier si le fichier des quartiers administratifs existe
if os.path.isfile(quartiers_administratifs_csv_path):
    # Charger le fichier CSV des quartiers administratifs
    quartiers_administratifs_df = pd.read_csv(quartiers_administratifs_csv_path, delimiter=',')

    # Renommer les colonnes des quartiers administratifs
    quartiers_administratifs_df.rename(columns={
        'n_sq_qu': 'NUMERO_SEQUENTIEL_QUARTIER',
        'c_qu': 'NUMERO_QUARTIER',
        'c_quinsee': 'NUMERO_QUARTIER_INSEE',
        'l_qu': 'NOM_QUARTIER',
        'c_ar': 'NUMERO_ARRONDISSEMENT',
        'n_sq_ar': 'NUMERO_SEQUENTIEL_ARRONDISSEMENT',
        'perimetre': 'PERIMETRE',
        'surface': 'SURFACE',
        'geom_x_y': 'GEOMETRY_X_Y',
        'st_area_shape': 'ST_AREA_SHAPE',
        'st_perimeter_shape': 'ST_PERIMETER_SHAPE'
    }, inplace=True)

    # Enregistrer le fichier CSV des quartiers administratifs avec les nouveaux noms d'en-têtes
    quartiers_administratifs_df.to_csv(quartiers_administratifs_csv_path, sep=';', index=False)

    print("Les noms des en-têtes du fichier des quartiers administratifs ont été modifiés avec succès.")
else:
    print("Le fichier 'quartier_administratifs.csv' n'a pas été trouvé dans 'api_data'. Veuillez vérifier que le téléchargement a réussi.")


