# Comment changer de host dans Magnolia ?

## Prérequis

- Instance Magnolia démarrée
- Identifiants de l'administrateur Magnolia connus (cf [la page avec les identifiants par défaut de ROOB](../identifiants.md))
- Host à utiliser connu (variable `base_dn` dans le fichier `.env`)

## Etapes

- Se connecter à l'IHM d'administration de Magnolia avec les identifiants de l'administrateur 
- Dans la section `Configuration`, rechercher le noeud de contenu `magnoliaPublic8080`. Modifier la propriété `url` pour remplacer par le host que vous souhaitez utiliser
- Publier la modification
