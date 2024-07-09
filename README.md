# Projet : Analyse de l'immobilier à Paris

### Description détaillée :
Le gouvernement français et la ville de Paris publient régulièrement des données sur les biens immobiliers. Quelques exemples sont les prix de vente, les limites légales de prix de location, le risque d'inondation, la localisation des écoles maternelles et bien d'autres choses encore. L'objectif de ce projet est d'exploiter plusieurs de ces sources pour analyser le prix de l'immobilier à Paris.

<div align="justify">

| Etape | Description | Objectif | Modules / Masterclass / Templates | Conditions de validation du projet |
|-------|-------------|----------|------------------------------------|------------------------------------|
| 1 | Exploration de données non structurées | Télécharger le jeu de données des valeurs foncières déclarées pour l’année 2022 sur [data.gouv.fr](https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres/#/information). Cet ensemble de données doit être nettoyé, à cet effet vous allez : <br/><br/> - Conserver uniquement les données de Paris <br/> - Supprimer les colonnes contenant plus de 50 % de données manquantes. <br/> - Après l'étape précédente, supprimer toutes les lignes contenant des données manquantes. <br/><br/> Passer par l’API de [opendata.paris](https://opendata.paris.fr/pages/home/) pour récupérer des données pertinentes pour le potentiel commercial d’un bien immobilier. <br/> Quelques exemples : [secteurs de risques](https://opendata.paris.fr/explore/dataset/plu-secteurs-de-risques-delimites-par-le-ppri/information/?disjunctive.zonage&sort=-n_sq_pprizone), [encadrement des loyers](https://opendata.paris.fr/explore/dataset/logement-encadrement-des-loyers/information/?disjunctive.annee&disjunctive.id_zone&disjunctive.nom_quartier&disjunctive.piece&disjunctive.epoque&disjunctive.meuble_txt&sort=-id_quartier), [espaces libres à végétaliser](https://opendata.paris.fr/explore/dataset/plu-espaces-libres-a-vegetaliser-elv/information/?disjunctive.n_sq_ca), etc. <br/><br/> Cette étape est importante, vous devez comprendre les données que vous pouvez récupérer et faire un choix des routes à utiliser. | 103 - Introduction aux APIs de données | Un fichier explicatif du traitement et des différentes données accessibles (doc / pdf) <br/> Un exemple de données collectées. |
| 2 | Modélisation des données | Concevoir un schéma de base de données respectant la troisième forme normale (3NF) ou en **appliquant les principes de la dénormalisation**. | 145 - Fondamentaux de l'intégration de données <br/> 142 - SQL | Données stockées dans une base de données relationnelle (PostgreSQL/MySQL) <br/> **Diagramme UML** <br/> Un fichier de requêtes SQL pour montrer que la base est fonctionnelle |
| 3 | Construction du pipeline ETL/ELT | Créer un pipeline ETL/ELT pour remplir la base de données : <br/><br/> - **Extraction** : charger les données à partir des sources d'origine <br/> - **Chargement** : dénormaliser (schéma en étoile) et charger les données dans le système cible (SQL Database) <br/> - **Transformation** : Fusion, Encodage, <br/><br/> Exécuter le pipeline pour intégrer autant de données que possible à partir de l'ensemble de données d'origine | Snowflake <br/> BigQuery <br/> Snaplogic <br/> 144 - ETL avec pyspark <br/> Démo du DataWarehouse <br/> Schéma en étoiles |
| 4 | Dashboard final | Création du Dashboard Power BI | 181 - Power BI <br/><br/> 182 - Tableau <br/><br/> 185 - Looker Studio<br/> | Soutenance <br/><br/> Rapport |

</div>

## Rapport

### Rapport Etape 1 : [ICI](https://github.com/melanie-donne/Analyse_immobilier_paris/blob/main/rapports/rapport%20-%20Analyse%20de%20l'immobilier%20%C3%A0%20Paris%20-%20M%C3%A9lanie%20Donne.pdf)

