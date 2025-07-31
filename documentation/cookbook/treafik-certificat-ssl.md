# Comment mettre en place un certificat SSL pour traefik ?

- Créer dans le répertoire *rudi-out-of-the-box* un sous-répertoires *certs*

- Déposer dans ce répertoire les fichiers CRT et KEY de votre certificat (dans l'exemple ci-après rudi.crt et rudi.key)

- Créer dans le répertoire *rudi-out-of-the-box* un fichier *treafik.yml* avec pour contenu :

```
api:
  dashboard: true
  insecure: true

log:
  filePath: "/etc/traefik/logs/applog.log"
  format: json
  level: "DEBUG"

providers:
  docker:
    endpoint: unix:///var/run/docker.sock
    exposedByDefault: false
    watch: true
    swarmMode: false
    network: traefik
  file:
    filename: "/etc/traefik/traefik.yml"
    watch: true

entryPoints:
  web:
    address: ":80"
    http:
      redirections:
        entryPoint:
          to: websecure
          scheme: https
          permanent: true
  websecure:
    address: ":443"
    http:
      tls: true

tls:
  stores:
    default:
      defaultCertificate:
        certFile: /etc/certs/rudi.crt
        keyFile: /etc/certs/rudi.key
  certificates:
    - certFile: /etc/certs/rudi.crt
      keyFile: /etc/certs/rudi.key
```

**Note :** 

> Les chemins indiqués sont ceux relatifs au conteneur traefik.

- Editer le fichier *docker-compose-network.yml*

- Modifier le section *reverse-proxy* comme suit :

```
services:
  reverse-proxy:
    image: traefik:v2.2
    # le port HTTP, le port HTTPS et celui de la console
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080" 
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./certs:/etc/certs
      - ./traefik.yml:/etc/traefik/traefik.yml:ro
      - ./logs:/etc/traefik/logs:ro      
```

**Notes :** 

> Les éléments importants sont :
> - le volume **./certs** qui permet au container d'accéder au certificat
> - le volume **./traefik.yml** qui permet container d'accéder à la configuration Traefik

- Pour chaque section correspondant à un container ajouter les éléments suivants :

```
- traefik.enable=true
- traefik.http.services.<service>-service.loadbalancer.server.port=8983
- traefik.http.routers.<service>.entrypoints=websecure
- traefik.http.routers.<service>.tls=true
- traefik.http.routers.<service>.rule=Host(`<nom-du-container>.${base_dn}`)
```

**Exemple :**

```
  solr:
    labels:
      - "traefik.enable=true"
      - "traefik.http.services.solr-service.loadbalancer.server.port=8983"
      - "traefik.http.routers.solr.entrypoints=websecure"
      - "traefik.http.routers.solr.tls=true"
      - "traefik.http.routers.solr.rule=Host(`solr.${base_dn}`)"
```


