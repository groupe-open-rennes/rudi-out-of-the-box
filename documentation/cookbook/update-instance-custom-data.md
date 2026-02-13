# Mettre à jour une instance RUDI ROOB - Cas avec des données personnalisées

_Cas d'usage_ : j'ai déjà déployé une instance RUDI ROOB, mais je souhaite la mettre à jour avec la dernière version disponible. J'ai déployé mon instance à partir du code source disponible dans ce dépôt Git, **puis j'ai fait des opérations que je souhaite conserver (par exemple création d'utilisateur, création de réutilisation, publication de jeu de données, modification d'articles sur Magnolia)**.

## Prérequis
Si ca n'est pas encore fait, suivre la procédure indiquée ici pour faire persister vos données : [Comment faire persister mes données (RUDI, Dataverse, Magnolia) ?](./data-persistence.md)

A la fin de cette procédure, vous devez avoir des répertoires ``database-data/rudi``, ``database-data/dataverse`` et ``database-data/magnolia`` contenant les données à conserver.

Veillez à bien conserver ces répertoires tout au long de la procédure de mise à jour.

Vous pouvez les sauvegarder ailleurs si besoin, et les restaurer avant le redémarrage de la solution.

## Instructions
1. Arrêter les containers Docker en cours d'exécution :

```bash
docker compose -f docker-compose-magnolia.yml \
    -f docker-compose-rudi.yml \
    -f docker-compose-dataverse.yml \
    -f docker-compose-network.yml \
    --profile "*" \
    down
```

2. Sauvegarder vos fichiers de configuration 

```bash
cp .env .env.backup
cp docker-compose-rudi.yml docker-compose-rudi.backup.yml
cp docker-compose-dataverse.yml docker-compose-dataverse.backup.yml
cp docker-compose-magnolia.yml docker-compose-magnolia.backup.yml   
```

3. Mettre à jour le code source de RUDI ROOB en récupérant les dernières modifications depuis le dépôt Git :

```bash
git pull origin main
git lfs pull
```

4. Remplacer la valeur de la variable ``base_dn`` dans votre fichier de configuration ``.env`` avec la valeur sauvegardée dans ``.env.backup``.

5. Reporter les modifications que vous avez faites dans les fichiers ``docker-compose-<module>.yml`` (sauvegardés dans les fichiers ``docker-compose-<module>.backup.yml``).

6. Si besoin, restaurer les répertoires ``database-data/rudi``, ``database-data/dataverse`` et ``database-data/magnolia`` contenant les données à conserver.

7. Relancer les containers Docker avec la nouvelle version du code :

```bash
docker compose -f docker-compose-magnolia.yml \
    -f docker-compose-rudi.yml \
    -f docker-compose-dataverse.yml \
    -f docker-compose-network.yml \
    --profile "*" \
    up -d
```
