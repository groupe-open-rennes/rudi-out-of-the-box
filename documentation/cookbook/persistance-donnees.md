# Comment faire persister mes données ?

_Cas d'usage_ : lorsque je fais des opérations sur mon environnement ROOB, je veux qu'elles persistent même si je supprime les containers de ROOB.

## Services concernés

Les données sont présentes dans les bases de données suivantes :

* RUDI (service `database`)
* Dataverse (service `dataverse-database`)
* Magnolia (service `magnolia-database`)

Les données initiales sont issues des scripts d'initialisation dans les répertoires `config/rudi-init/`, `config/dataverse-init` et `config/magnolia-init`. 

> Attention : l'externalisation des données peut avoir des impacts sur le bon fonctionnement de l'application en cas de montée de version.


## Prérequis

Les services des bases de données à persister doivent déjà avoir été lancés avant de faire les opérations suivantes.
Les services doivent ensuite être arrêtés (stop et pas down).

## Création des répertoires pour les volumes

Pour chacun des services de base de données pour lesquels vous souhaitez persister les données, créer un répertoire `postgresql_data_<module>`.

Par exemple : 

```bash
mkdir postgresql_data_rudi 
mkdir postgresql_data_dataverse 
mkdir postgresql_data_magnolia
```

## Modification de la configuration docker-compose

1. Dans la section `volumes` de docker-compose, déclarer un volume :

```docker
volumes:
  postgresql_data_<module>:
```

Pour chaque service de base de données concerné, dans la section `volumes` du service , en remplaçant `<module>` par le module concerné :

2. Supprimer ou commenter la ligne de chargement des données préconfigurées dans le service de base de données du module :

```docker
services:
  database:
    ...
    volumes:
      #- ./config/<module>-init/:/docker-entrypoint-initdb.d/
```

3. Ajouter une ligne  dans la section volumes, en remplaçant `<module>` par le module concerné :

```docker
services:
  database:
    ...
    volumes:
      - ./postgresql_data_<module>:/var/lib/postgresql/data
```

Avec l'exemple de noms de répertoire ci-dessus, cela donne :
* Pour les données de Dataverse :

```docker
volumes:
  postgresql_data_dataverse:
[...]
services:
  dataverse-database:
    ...
    volumes:
      #- ./config/dataverse-init/:/docker-entrypoint-initdb.d/
      - ./postgresql_data_dataverse:/var/lib/postgresql/data
```

* Pour les données de Magnolia :

```docker
volumes:
  postgresql_data_magnolia:
[...]
services:
  magnolia-database:
    ...
    volumes:
      #- ./config/magnolia-init/:/docker-entrypoint-initdb.d/
      - ./postgresql_data_magnolia:/var/lib/postgresql/data
```

* Pour les données de Rudi :

```docker
volumes:
  postgresql_data_rudi:
[...]
services:
  database:
    ...
    volumes:
      #- ./config/rudi-init/:/docker-entrypoint-initdb.d/
      - ./postgresql_data_rudi:/var/lib/postgresql/data
```

## Prise en compte de la modification

Redémarrer tous les services.

Vos prochaines opérations seront ainsi persistées dans les répertoires créés.