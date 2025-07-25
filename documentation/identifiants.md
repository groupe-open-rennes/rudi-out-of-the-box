# Identifiants de connexion

Vous trouverez dans cette page les identifiants (login/mot de passe) préconfigurés dans ROOB, afin d'en exploiter pleinement les possibilités.

Il est bien sûr fortement recommandé de modifier les différents mots de passe ou clés de connexion dans votre propre environnement ; pour cela la documentation [Rudi-platform](https://github.com/rudi-platform) contient un ensemble de procédures de modification des mots de passe pour vous y aider point par point.


## Utilisateurs fonctionnels (Rudi)

| Identifiant | Mot de passe | Type d'utilisateur |
| ----------- | ------------ | ------------------ |
| animateur@rennesmetropole.fr | Rud1R00B-animateur | Animateur |
| reutilisateur@rennesmetropole.fr | Rud1R00B-reutilisateur | Porteur de projet / Membre de l'organisation "Ville de Rudi" |
| participant1@rennesmetropole.fr | Rud1R00B-participant1 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant2@rennesmetropole.fr | Rud1R00B-participant2 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant3@rennesmetropole.fr | Rud1R00B-participant3 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant4@rennesmetropole.fr | Rud1R00B-participant4 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant5@rennesmetropole.fr | Rud1R00B-participant5 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant6@rennesmetropole.fr | Rud1R00B-participant6 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant7@rennesmetropole.fr | Rud1R00B-participant7 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant8@rennesmetropole.fr | Rud1R00B-participant8 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant9@rennesmetropole.fr | Rud1R00B-participant9 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant10@rennesmetropole.fr | Rud1R00B-participant10 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| participant11@rennesmetropole.fr | Rud1R00B-participant11 | Utilisateur / Membre de l'organisation "Ville de Rudi" |
| rudi | Rud1R00B-admin | Super Utilisateur / Administrateur |
| d7ffa7cc-8410-4b39-aa6b-c915079f4383 | Rud1R00B-NP-sib | Noeud sib |
| 5596b5b2-b227-4c74-a9a1-719e7c1008c7 | Rud1R00B-NP-nodestub | Noeud nodestub |
| d343dd99-fec6-443a-9293-a37fe8cdd1ad | Rud1R00B-NP-irisa | Noeud irisa |

## Utilisateurs fonctionnels (autres services)

TODO 

| Identifiant | Mot de passe | Service/type d'utilisateur | Informations de connexion (moteur de BDD, URI) |
| ----------- | ------------ | --------------- | ---------------------------------------------- |
||| Dataverse/administrateur | |
||| Mailhog | |
||| Magnolia/administrateur | |

## Utilisateurs techniques (microservices)

| Identifiant | Mot de passe |
| ----------- | ------------ |
| apigateway | microservice-apigateway |
| projekt | microservice-projekt |
| selfdata | microservice-selfdata |
| strukture | microservice-strukture |
| konsent | microservice-konsent |
| selfdata-wso2-user | microservice-selfdata-wso2-user |
| acl | microservice-acl |
| kalim | microservice-kalim |
| konsult | microservice-konsult |
| kos | microservice-kos |

## Identifiants de connexion aux bases de données

| Identifiant | Mot de passe | Base de données/role | Informations de connexion (moteur de BDD, port) |
| ----------- | ------------ | --------------- | ---------------------------------------------- |
||| Magnolia | |
||| Dataverse | |
| rudi | Rud1R00B-db-rudi | RUDI/super utilisateur | postgres / port 35432 |
| acl | Rud1R00B-db-acl | RUDI/ACL | postgres / utilisateur dédié au microservice ACL sur le schéma acl_data |
| kalim | Rud1R00B-db-kalim | RUDI/KALIM | postgres / utilisateur dédié au microservice KALIM sur le schéma kalim_data |
| konsent | Rud1R00B-db-konsent | RUDI/KONSENT | postgres / utilisateur dédié au microservice KONSENT sur le schéma konsent_data |
| kos | Rud1R00B-db-kos | RUDI/KOS | postgres / utilisateur dédié au microservice KOS sur le schéma kos_data |
| selfdata | Rud1R00B-db-selfdata | RUDI/SELFDATA | postgres / utilisateur dédié au microservice SELFDATA sur le schéma selfdata_data |
| strukture | Rud1R00B-db-strukture | RUDI/STRUKTURE | postgres / utilisateur dédié au microservice STRUKTURE sur le schéma strukture_data |
| template | Rud1R00B-db-template | RUDI/TEMPLATE | postgres / utilisateur non utilisé, sur le schéma template_data |
| apigateway | Rud1R00B-db-apigateway | RUDI/APIGATEWAY | postgres / utilisateur dédié au microservice APIGATEWAY sur le schéma apigateway_data |
| projekt | Rud1R00B-db-projekt | RUDI/PROJEKT | postgres / utilisateur dédié au microservice PROJEKT sur le schéma projekt_data |

## Clés et token


| Clé | Description | 
| ----------- | ------------ |
|| API Dataverse |

