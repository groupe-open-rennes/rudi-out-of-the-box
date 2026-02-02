# Mettre à jour une instance RUDI ROOB - Cas général

_Cas d'usage_ : j'ai déjà déployé une instance RUDI ROOB, mais je souhaite la mettre à jour avec la dernière version disponible. J'ai déployé mon instance à partir du code source disponible dans ce dépôt Git, **sans modifications de configuration autre que le fichier ``.env``**.

## Instructions

Pour mettre à jour votre instance RUDI ROOB existante, il faut suivre les étapes suivantes :
1. Arrêter les containers Docker en cours d'exécution :

```bash
docker compose -f docker-compose-magnolia.yml \
    -f docker-compose-rudi.yml \
    -f docker-compose-dataverse.yml \
    -f docker-compose-network.yml \
    --profile "*" \
    down
```

2. Sauvegarder votre fichier de configuration ``.env``

```bash
cp .env .env.backup
```

3. Mettre à jour le code source de RUDI ROOB en récupérant les dernières modifications depuis le dépôt Git :

```bash
git pull origin main
git lfs pull
```

4. Remplacer la valeur de la variable ``base_dn`` dans votre fichier de configuration ``.env`` avec la valeur sauvegardée dans ``.env.backup``.

5. Relancer les containers Docker avec la nouvelle version du code :

```bash
docker compose -f docker-compose-magnolia.yml \
    -f docker-compose-rudi.yml \
    -f docker-compose-dataverse.yml \
    -f docker-compose-network.yml \
    --profile "*" \
    up -d
```
