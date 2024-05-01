import pandas as pd

# Charger les données de 2022
vf2022 = pd.read_csv("data_cleaning/valeursfoncieres-2022.txt", sep="|", low_memory=False)

# Nettoyage des colonnes avec des données manquantes
# Supprimer les colonnes inutiles
useless_columns = ['Identifiant de document', 'No disposition', 'Code type local', 'Prefixe de section',
                   'Section', 'No plan', 'No Volume', '2eme lot', 'Surface Carrez du 2eme lot', '3eme lot', 
                   'Surface Carrez du 3eme lot', '4eme lot', 'Surface Carrez du 4eme lot', '5eme lot', 
                   'Surface Carrez du 5eme lot', 'Nombre de lots', 'Nature culture', 'Nature culture speciale',
                   'Reference document', '1 Articles CGI', '2 Articles CGI', '3 Articles CGI', '4 Articles CGI', '5 Articles CGI',
                   'Identifiant local', 'B/T/Q', '1er lot'] 
vf2022.drop(useless_columns, axis=1, inplace=True, errors='ignore')

# Remplacer les virgules par des points dans la colonne "Valeur fonciere"
vf2022["Valeur fonciere"] = vf2022["Valeur fonciere"].str.replace(',', '.')

# Convertir certaines colonnes en types appropriés
vf2022["Valeur fonciere"] = pd.to_numeric(vf2022["Valeur fonciere"], errors='coerce')
vf2022["Date mutation"] = pd.to_datetime(vf2022["Date mutation"], format='%d/%m/%Y')

# Supprimer les lignes avec des valeurs manquantes dans la colonne 'valeur_fonciere'
vf2022.dropna(subset=['Valeur fonciere'], inplace=True)

# Déterminer les codes postaux de Paris
paris_postal_codes = [75001, 75002, 75003, 75004, 75005, 75006, 75007, 75008, 75009, 75010, 
                      75011, 75012, 75013, 75014, 75015, 75016, 75017, 75018, 75019, 75020]

# Filtrer les données pour n'inclure que les codes postaux de Paris et les communes commençant par "PARIS"
vf_paris2022 = vf2022[(vf2022['Code postal'].isin(paris_postal_codes)) & (vf2022['Commune'].str.contains('^PARIS', regex=True))]

# Liste des colonnes à conserver et à renommer
columns_to_keep_rename = {
    'Date mutation': 'DATE_MUTATION',
    'Nature mutation': 'NATURE_MUTATION',
    'Valeur fonciere': 'VALEUR_FONCIERE',
    'No voie': 'ADRESSE_NUMERO',
    'Type de voie': 'ADRESSE_NOM_VOIE',
    'Code postal': 'CODE_POSTAL',
    'Commune': 'COMMUNE',
    'NUMERO_ARRONDISSEMENT_INSEE': 'CODE_DEPARTEMENT_COMMUNE',  # Utiliser la nouvelle colonne fusionnée
    'Surface Carrez du 1er lot': 'SURFACE_CARREZ',  
    'Type local': 'TYPE_LOCAL',
    'Surface reelle bati': 'SURFACE_REELLE_BATI',
    'Nombre pieces principales': 'NOMBRE_PIECES_PRINCIPALES',
    'Surface terrain': 'SURFACE_TERRAIN'
}

# Sélectionner et renommer les colonnes
vf_paris2022 = vf_paris2022.rename(columns=columns_to_keep_rename)

# Enregistrer les données organisées dans un fichier CSV
vf_paris2022.to_csv("data_cleaning/valeurs_foncieres_paris_2022.csv", index=False, float_format='%.1f', sep=',', line_terminator='\n')

# Afficher les cinq premières lignes des données de Paris
print(vf_paris2022.head())
