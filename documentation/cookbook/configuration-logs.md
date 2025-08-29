# Comment configurer les logs ?

## Logs des services RUDI

### Configuration 

Rudi utilise [Log4j](https://logging.apache.org/log4j/2.x/) pour la génération des logs. 
Les fichiers de configuration sont situés dans les répertoires de configuration de chaque microservice `rudi-out-of-the-box/config/<nom du microservice>/log4j2.xml`.

### Exposition des logs

Pour chacun des microservices *registry*, *gateway*, *acl*, *apigateway*, *strukture*, *kalim*, *kos*, *projekt*, *selfdata*, *konsent* :

* Créer dans le répertoire *rudi-out-of-the-box* un sous-répertoire `` ./logs/rudi/<nom du microservice>``

* Copier le contenu du répertoire du conteneur ``/var/log/rudi/<nom du microservice>`` dans le répertoire ``./logs/rudi/<nom du microservice>``.

    > ```bash 
    > docker compose cp <nom du microservice>:/var/log/rudi/<nom du microservice>/ ./logs/rudi/<nom du microservice>
    > ```

* Exposer le volume des logs en modifiant la section ``volumes``:

    > ```
    > volumes:
    >  [...]
    >  - ./logs/rudi/<nom du microservice>:/var/log/rudi/<nom du microservice>
    > ```

* Redémarrer le service (option docker compose: up -d) 

## Logs Dataverse

ROOB utilise une version dockerisée de Dataverse. 
Les logs sont accessibles via Docker, comme indiqué dans [la documentation Dataverse sur les logs](https://guides.dataverse.org/en/latest/container/dev-usage.html)

## Logs Magnolia

ROOB utilise une version dockerisée de Magnolia.
Les logs sont donc accessibles via Docker.
Si nécessaire, les logs sont disponibles dans le répertoire `/usr/local/tomcat/webapps/ROOT/logs` du container de *magnolia*. Ce répertoire peut être exposé dans un volume dédié si nécessaire (cf plus haut).
