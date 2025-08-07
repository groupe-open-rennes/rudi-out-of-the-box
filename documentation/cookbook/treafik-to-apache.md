# Comment passer de traefik à Apache ?

## Mettre en place un Apache externe 

Pour mettre en place un Apache externe à docker, les opérations à réaliser sont les suivantes :

### Installation d'Apache2

Installation du paquet apache2 sur le système en utilisant les paquets associés à l'OS (Ubunto, Debian, ...)

### Activation des modules Apache nécessaires

Activer les modules suivants :
- substitute (substitution de contenu)
- rewrite (réécriture d'URL)
- headers (gestion des en-têtes HTTP)
- proxy et proxy_http (fonctionnalités de proxy)
- ssl (prise en charge du protocole HTTPS)

L'activation des modules se fait avec la commande :

```
a2enmod <nom du module>
```

Lorsque les modules sont activés, il est nécessaire de recharger la configuration apache2 :

```
systemctl reload apache2
```

### Gestion des certificats SSL

- Copier le certificate dans ``/etc/ssl/certs/rudi.crt``
- Copier la clé du certificat dans : ``/etc/ssl/private/rudi.key``
- Optionnel : copie du certificat émetteur pour assurer la validité de la chaîne de certification dans ``/etc/ssl/certs/rudi-issuer.pem``
- Controler les droits d'accès de ces fichiers (lecture seule pour le owner et le groupe)

### Configuration d'Apache

Afin de mettre en place la configuration du site virtuel du portail, il est nécessaire de créer un fichier ``/etc/apache2/site-available/rudi_ssl.conf``.

Le contenu type de ce fichier est le suivant :

```
<VirtualHost *:80>
    ServerName <nom de votre serveur. Exemple rudi.open-dev.com>

    Header set X-Frame-Options SAMEORIGIN
    Header set X-XSS-Protection  "1;mode=block"
    Header set X-Content-Type-Options nosniff
    Header edit Set-Cookie ^(.*)$ $1;Secure

    # On renvoie un 308 plutôt qu'un 301 pour conserver la méthode HTTP utilisée par le client
    Redirect 308 / https://<nom de votre serveur. Exemple rudi.open-dev.com>/
</VirtualHost>

<VirtualHost *:443>
    ServerName <nom de votre serveur. Exemple rudi.open-dev.com>

    Header set X-Frame-Options SAMEORIGIN
    Header set X-XSS-Protection  "1;mode=block"
    Header set X-Content-Type-Options nosniff
    #Header set Content-Security-Policy
    Header edit Set-Cookie ^(.*)$ $1;Secure

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    LogLevel debug

    SSLEngine on
    SSLCertificateFile "/etc/ssl/certs/rudi.crt"
    SSLCertificateKeyFile "/etc/ssl/private/rudi.key"
    SSLCertificateChainFile "/etc/ssl/certs/rudi-issuer.pem"
    
    SSLProxyEngine on
    SSLProxyVerify none
    SSLProxyCheckPeerCN off
    SSLProxyCheckPeerName off
    SSLProxyCheckPeerExpire off

	 # MAGNOLIA
    ProxyPass /.magnolia/admincentral http://localhost:9090/.magnolia/admincentral
    ProxyPassReverse /.magnolia/admincentral http://localhost:9090/.magnolia/admincentral
    ProxyPass /.magnolia http://localhost:9090/.magnolia
    ProxyPassReverse /.magnolia http://localhost:9090/.magnolia
    ProxyPass /VAADIN http://localhost:9090/VAADIN
    ProxyPassReverse /VAADIN http://localhost:9090/VAADIN
    ProxyPass /.imaging http://localhost:9090/.imaging
    ProxyPassReverse /.imaging http://localhost:9090/.imaging
    ProxyPass /.resources http://localhost:9090/.resources
    ProxyPassReverse /.resources http://localhost:9090/.resources
    ProxyPass /rudi/rudi-terms http://localhost:9090/rudi/rudi-terms
    ProxyPassReverse /rudi/rudi-terms http://localhost:9090/rudi/rudi-terms
    ProxyPass /rudi/rudi-news http://localhost:9090/rudi/rudi-news
    ProxyPassReverse /rudi/rudi-news http://localhost:9090/rudi/rudi-news
    ProxyPass /rudi/rudi-project-values http://localhost:9090/rudi/rudi-project-values
    ProxyPassReverse /rudi/rudi-project-values http://localhost:9090/rudi/rudi-project-values

	 # MICROSERVICES
    ProxyPass /anonymous https://localhost:8085/anonymous
    ProxyPassReverse /anonymous https://localhost:8085/anonymous

    ProxyPass /authenticate https://localhost:8085/authenticate
    ProxyPassReverse /authenticate https://localhost:8085/authenticate

    ProxyPass /refresh_token https://localhost:8085/refresh_token
    ProxyPassReverse /refresh_token https://localhost:8085/refresh_token

    ProxyPass /check_credential https://localhost:8085/check_credential
    ProxyPassReverse /check_credential https://localhost:8085/check_credential

    ProxyPreserveHost On

    ProxyPass /apigateway/v1/encryption-key https://localhost:8092/apigateway/v1/encryption-key
    ProxyPassReverse /apigateway/v1/encryption-key https://localhost:8092/apigateway/v1/encryption-key

    ProxyPass /konsult/v1/encryption-key https://localhost:8092/apigateway/v1/encryption-key
    ProxyPassReverse /konsult/v1/encryption-key https://localhost:8092/apigateway/v1/encryption-key

    ProxyPass /robots.txt https://localhost:8087/konsult/v1/robots/robots
    ProxyPassReverse /robots.txt https://localhost:8087/konsult/v1/robots/robots

    ProxyPass /acl https://localhost:8082/acl
    ProxyPassReverse /acl https://localhost:8082/acl

    ProxyPass /kalim https://localhost:8082/kalim
    ProxyPassReverse /kalim https://localhost:8082/kalim

    ProxyPass /konsent https://localhost:8082/konsent
    ProxyPassReverse /konsent https://localhost:8082/konsent

    ProxyPass /konsult https://localhost:8082/konsult
    ProxyPassReverse /konsult https://localhost:8082/konsult

    ProxyPass /kos https://localhost:8082/kos
    ProxyPassReverse /kos https://localhost:8082/kos

    ProxyPass /projekt https://localhost:8082/projekt
    ProxyPassReverse /projekt https://localhost:8082/projekt

    ProxyPass /selfdata https://localhost:8082/selfdata
    ProxyPassReverse /selfdata https://localhost:8082/selfdata

    ProxyPass /strukture https://localhost:8082/strukture
    ProxyPassReverse /strukture https://localhost:8082/strukture

    ProxyPass /nodestub https://localhost:28001/nodestub
    ProxyPassReverse /nodestub https://localhost:28001/nodestub

    ProxyPass /oauth https://localhost:8085/oauth2
    ProxyPassReverse /oauth https://localhost:8085/oauth2

    ProxyPass /oauth2 https://localhost:8085/oauth2
    ProxyPassReverse /oauth2 https://localhost:8085/oauth2

    ProxyPass /medias https://localhost:8092/apigateway/datasets
    ProxyPassReverse /medias https://localhost:8092/apigateway/datasets

    ProxyPass /node/v1/linked-producers/request https://localhost:8084/strukture/v1/linked-producers/request
    ProxyPassReverse /node/v1/linked-producers/request https://localhost:8084/strukture/v1/linked-producers/request

    ProxyPass /node/v1/organizations/request https://localhost:8084/strukture/v1/organizations/request
    ProxyPassReverse /node/v1/organizations/request https://localhost:8084/strukture/v1/organizations/request

    # FRONT
    ProxyPass / https://localhost:8088
    ProxyPassReverse / https://localhost:8088

    SSLProxyEngine on
    SSLProxyVerify none
    SSLProxyCheckPeerCN off
    SSLProxyCheckPeerName off
    SSLProxyCheckPeerExpire off
    SSLProtocol TLSv1.2 TLSv1.3
    SSLCipherSuite HIGH:!aNULL:!MD5:!3DES
    SSLHonorCipherOrder on

</VirtualHost>
```

### Exposition des services Docker

Il est nécessaire dans cette configuration Apache de permettre l'accès aux services docker depuis Apache2.
En conséquence, il est nécessaire d'exposer le port 8080 (port interne) des différents containers (microservice et magnolia) sur un port externe (tous les ports doivent être différents) dans les fichiers ``docker-compose-rudi.yml`` et ``docker-compose-magnolia.yml``.
Vous pouvez vous reporter au fichier ``rudi_ssl.conf`` ci-dessous pour les différents ports.

### Gestion des sites actifs

Désactiver les sites suivants :
- Désactivation du site par défaut (000-default)

```
a2dissite default
```

Activation des sites configurés :
- rudi_ssl

```
a2ensite rudi_ssl
```

Lorsque les sites sont activés, il est nécessaire de recharger la configuration apache2 :

```
systemctl reload apache2
```

**Remarques :**
Lors du démarrage du portail la commande ``docker compose`` n'est plus :

``` docker compose -f ./docker-compose-magnolia.yml -f ./docker-compose-rudi.yml -f ./docker-compose-dataverse.yml -f ./docker-compose-network.yml up -d```

Mais

```docker compose -f ./docker-compose-magnolia.yml -f ./docker-compose-rudi.yml -f ./docker-compose-dataverse.yml up -d```


## Mettre en place Apache2 dans la structure docker compose

Les opérations à réaliser pour remplacer Traefik par Apache2 sont les suivantes :

### Création des répertoires de configuration

- Créer dans le répertoire *rudi-out-of-the-box* un sous-répertoire ``certs``

- Déposer dans ce répertoire les fichiers CRT et KEY de votre certificat (dans l'exemple ci-après rudi.crt et rudi.key)

- Créer dans le répertoire *rudi-out-of-the-box* les sous-repértoires :
  - ``apache``
  - ``apache/extra``
  - ``apache/log``

### Modification du fichier docker-compose-network.yml

Remplacer le contenu du fichier ``docker-compose-network.yml`` part :

```
---
name: rudiplatform

services:
  apache:
    image: httpd:2.4
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./apache/httpd.conf:/usr/local/apache2/conf/httpd.conf
      - ./apache/extra:/usr/local/apache2/conf/extra
      - ./certs:/usr/local/apache2/certs
      - ./apache/logs:/usr/local/apache2/logs
    networks:
      - rudi-network

  # Services existants sans les labels Traefik
  solr:
    networks:
      - rudi-network

  dataverse:
    networks:
      - rudi-network

  magnolia:
    networks:
      - rudi-network

  gateway:
    networks:
      - rudi-network

  apigateway:
    networks:
      - rudi-network

  strukture:
    networks:
      - rudi-network

  acl:
    networks:
      - rudi-network

  konsult:
    networks:
      - rudi-network

  kalim:
    networks:
      - rudi-network

  kos:
    networks:
      - rudi-network

  konsent:
    networks:
      - rudi-network

  projekt:
    networks:
      - rudi-network

  selfdata:
    networks:
      - rudi-network

  portail:
    networks:
      - rudi-network

networks:
  rudi-network:
    driver: bridge
```

### Fichier de configuration Apache2

Créez un fichier ``apache/httpd.conf`` qui charge les modules nécessaires et inclut les configurations additionnelles:

```
# Modules nécessaires
LoadModule ssl_module modules/mod_ssl.so
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
LoadModule rewrite_module modules/mod_rewrite.so
LoadModule headers_module modules/mod_headers.so

# Inclure les configurations SSL et virtualhost
Include conf/extra/httpd-ssl.conf
Include conf/extra/httpd-vhosts.conf
```

Créez un fichier ``apache/extra/httpd-ssl.conf`` pour la configuration SSL:

```
Listen 443
SSLCipherSuite HIGH:MEDIUM:!MD5:!RC4:!3DES
SSLProxyCipherSuite HIGH:MEDIUM:!MD5:!RC4:!3DES
SSLHonorCipherOrder on
SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1
SSLProxyProtocol all -SSLv3 -TLSv1 -TLSv1.1
SSLPassPhraseDialog  builtin
SSLSessionCache        "shmcb:/usr/local/apache2/logs/ssl_scache(512000)"
SSLSessionCacheTimeout  300
```

Créez un fichier ``apache/extra/httpd-vhosts.conf`` pour configurer les règles de routage similaires à celles de Traefik:

```
<VirtualHost *:80>
    ServerName rudi.${base_dn}
    Redirect permanent / https://rudi.${base_dn}/
</VirtualHost>

<VirtualHost *:443>
    ServerName rudi.${base_dn}
    SSLEngine on
    SSLCertificateFile "/usr/local/apache2/certs/server.crt"
    SSLCertificateKeyFile "/usr/local/apache2/certs/server.key"

    # Règle par défaut pour portail
    ProxyPass / http://portail:8080/
    ProxyPassReverse / http://portail:8080/

    # Gateway
    ProxyPass /gateway https://gateway:8443/gateway
    ProxyPassReverse /gateway https://gateway:8443/gateway

    # APIGateway
    ProxyPass /apigateway https://apigateway:8443/apigateway
    ProxyPassReverse /apigateway https://apigateway:8443/apigateway

    # Medias -> APIGateway rewrite
    RewriteEngine On
    RewriteRule ^/medias/(.*) /apigateway/datasets/$1 [P]
    ProxyPassReverse /medias/ https://apigateway:8443/apigateway/datasets/

    # Autres services
    ProxyPass /strukture https://strukture:8443/strukture
    ProxyPassReverse /strukture https://strukture:8443/strukture

    # Rewrite pour strukture/node
    RewriteRule ^/node/(.*) /strukture/$1 [P]
    ProxyPassReverse /node/ https://strukture:8443/strukture/

    # ACL
    ProxyPass /acl https://acl:8443/acl
    ProxyPassReverse /acl https://acl:8443/acl
    ProxyPass /anonymous https://acl:8443/anonymous
    ProxyPassReverse /anonymous https://acl:8443/anonymous
    ProxyPass /authenticate https://acl:8443/authenticate
    ProxyPassReverse /authenticate https://acl:8443/authenticate
    ProxyPass /refresh_token https://acl:8443/refresh_token
    ProxyPassReverse /refresh_token https://acl:8443/refresh_token
    ProxyPass /check_credential https://acl:8443/check_credential
    ProxyPassReverse /check_credential https://acl:8443/check_credential
    ProxyPass /oauth https://acl:8443/oauth
    ProxyPassReverse /oauth https://acl:8443/oauth

    # Autres services
    ProxyPass /konsult https://konsult:8443/konsult
    ProxyPassReverse /konsult https://konsult:8443/konsult

    # Rewrite pour robots.txt
    RewriteRule ^/robots\.txt /konsult/v1/robots/robots [P]

    # Services restants
    ProxyPass /kalim https://kalim:8443/kalim
    ProxyPassReverse /kalim https://kalim:8443/kalim
    ProxyPass /kos https://kos:8443/kos
    ProxyPassReverse /kos https://kos:8443/kos
    ProxyPass /konsent https://konsent:8443/konsent
    ProxyPassReverse /konsent https://konsent:8443/konsent
    ProxyPass /projekt https://projekt:8443/projekt
    ProxyPassReverse /projekt https://projekt:8443/projekt
    ProxyPass /selfdata https://selfdata:8443/selfdata
    ProxyPassReverse /selfdata https://selfdata:8443/selfdata
</VirtualHost>

<VirtualHost *:443>
    ServerName solr.${base_dn}
    SSLEngine on
    SSLCertificateFile "/usr/local/apache2/certs/server.crt"
    SSLCertificateKeyFile "/usr/local/apache2/certs/server.key"

    ProxyPass / http://solr:8983/
    ProxyPassReverse / http://solr:8983/
</VirtualHost>

<VirtualHost *:443>
    ServerName dataverse.${base_dn}
    SSLEngine on
    SSLCertificateFile "/usr/local/apache2/certs/server.crt"
    SSLCertificateKeyFile "/usr/local/apache2/certs/server.key"

    ProxyPass / http://dataverse:8080/
    ProxyPassReverse / http://dataverse:8080/
</VirtualHost>

<VirtualHost *:443>
    ServerName magnolia.${base_dn}
    SSLEngine on
    SSLCertificateFile "/usr/local/apache2/certs/server.crt"
    SSLCertificateKeyFile "/usr/local/apache2/certs/server.key"

    ProxyPass / http://magnolia:8080/
    ProxyPassReverse / http://magnolia:8080/
</VirtualHost>
```

**Remarques :**
N'oubliez pas de remplacer ${base_dn} par votre nom de domaine réel dans les fichiers de configuration, ou de configurer cette variable d'environnement dans votre système.
