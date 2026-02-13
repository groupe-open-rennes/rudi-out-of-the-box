# Mettre à jour une instance RUDI ROOB - Cas avec une configuration personnalisée

_Cas d'usage_ : j'ai déjà déployé une instance RUDI ROOB, mais je souhaite la mettre à jour avec la dernière version disponible. J'ai déployé mon instance à partir du code source disponible dans ce dépôt Git, **puis j'ai fait des modifications de configuration que je souhaite conserver**.

## Prérequis

* Sauvegarder vos fichiers de configuration
* Pour identifier les fichiers que vous avez modifiés, vous pouvez utiliser la commande suivante dans le répertoire racine du dépôt Git :

```bash
git status
```

Vous pouvez utiliser la commande ``git stash`` pour sauvegarder temporairement vos modifications avant de faire la mise à jour, et les restaurer ensuite avec ``git stash pop``. Cependant, cette méthode peut entraîner des conflits si les mêmes lignes de code ont été modifiées à la fois dans votre configuration locale et dans la nouvelle version du dépôt Git.

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

2. Mettre à jour le code source de RUDI ROOB en récupérant les dernières modifications depuis le dépôt Git :

```bash
git pull origin main
git lfs pull
```

3. Remplacer la valeur de la variable ``base_dn`` dans votre fichier de configuration ``.env`` avec la valeur précédente.

4. Reporter l'ensemble des modifications que vous avez faites dans les fichiers sauvegardés.

5. Relancer les containers Docker avec la nouvelle version du code :

```bash
docker compose -f docker-compose-magnolia.yml \
    -f docker-compose-rudi.yml \
    -f docker-compose-dataverse.yml \
    -f docker-compose-network.yml \
    --profile "*" \
    up -d
```
