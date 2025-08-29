# Identifiants de connexion

Vous trouverez dans cette page les identifiants (login/mot de passe) préconfigurés dans ROOB, afin d'en exploiter pleinement les possibilités.

Il est bien sûr fortement recommandé de modifier les différents mots de passe ou clés de connexion dans votre propre environnement ; pour cela la documentation [Rudi-platform](https://github.com/rudi-platform) contient un ensemble de procédures de modification des mots de passe pour vous y aider point par point.


## Utilisateurs fonctionnels (Rudi)

| Identifiant | Mot de passe | Type d'utilisateur |
| ----------- | ------------ | ------------------ |
| animateur@rennesmetropole.fr | Rud1R00B-animateur | Animateur |
| reutilisateur@rennesmetropole.fr | Rud1R00B-reutilisateur | Porteur de projet / Administrateur de l'organisation "Ville de Rudi" |
| participant1@rennesmetropole.fr | Rud1R00B-participant1 | Utilisateur / Administrateur de l'organisation "Ville de Rudi" |
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

| Identifiant | Mot de passe | Service/type d'utilisateur | Informations de connexion (URL du service) |
| ----------- | ------------ | --------------- | ---------------------------------------------- |
| dataverseAdmin | Rud1R00B-dvadmin | Dataverse/administrateur | http://dataverse.${base_dn}/ |
| rudi-mailhog | Rud1R00B-mh | Mailhog | http://rudi.${base_dn}:8025/ |
| superuser | Rud1R00B-mgl-admin | Magnolia/administrateur | http://magnolia.${base_dn}/ |
| Editor | Rud1R00B-mgl-editor | Magnolia/Editeur des news | http://magnolia.${base_dn}/ |
| ProjectValues | Rud1R00B-mgl-pv | Magnolia/Editeur des project values | http://magnolia.${base_dn}/ |
| Terms | Rud1R00B-mgl-terms | Magnolia/Editeur des terms | http://magnolia.${base_dn}/ |
| Super User | Rud1R00B-mgl-su | Magnolia/administrateur | Utilisateur technique Magnolia, sans doit de connexion à l'IHM |

## Clés et token

| Clé | Description | |
| ----------- | ------------ | - |
| 90276ddd-d283-4688-b13d-5aa147efb8b0 | API Dataverse | Validité : 23/07/2050 |

## Identifiants de connexion aux bases de données

| Identifiant | Mot de passe | Role | Informations de connexion (moteur de BDD, base de données, port) |
| ----------- | ------------ | --------------- | ---------------------------------------------- |
| magnolia | Rud1R00B-db-magnolia | Magnolia | postgres / magnolia / port 35434 |
| dataverse | Rud1R00B-db-dataverse | Dataverse | postgres / dataverse / port 35433 |
| rudi | Rud1R00B-db-rudi | super utilisateur | postgres / rudi / port 35432 |

## Utilisateurs techniques (microservices)

| Identifiant | Mot de passe | Mot de passe base de données | Schéma de base de données |
| ----------- | ------------ | ---------------------------- | ------------------------- |
| apigateway | microservice-apigateway | Rud1R00B-db-apigateway | apigateway_data |
| projekt | microservice-projekt | Rud1R00B-db-projekt | projekt_data |
| selfdata | microservice-selfdata | Rud1R00B-db-selfdata | selfdata_data |
| strukture | microservice-strukture | Rud1R00B-db-strukture | strukture_data |
| konsent | microservice-konsent | Rud1R00B-db-konsent | konsent_data |
| acl | microservice-acl | Rud1R00B-db-acl | acl_data |
| kalim | microservice-kalim | Rud1R00B-db-kalim | kalim_data |
| konsult | microservice-konsult | - | - |
| kos | microservice-kos | Rud1R00B-db-kos | kos_data |
| template | | Rud1R00B-db-template | postgres / utilisateur non utilisé, sur le schéma template_data |

