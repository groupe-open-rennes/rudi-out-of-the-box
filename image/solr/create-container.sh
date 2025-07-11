#/bin/bash

docker run -p 8984:8983 --env "DATAVERSE_HOST=dataverse2" --env "SOLR_HOST=solr2" --env "SOLR_PORT=8983" --env "SOLR_JAVA_MEM=-Xms1g -Xmx1g" --env "SOLR_OPTS=-Dlog4j2.formatMsgNoLookups=true -Dsolr.jetty.request.header.size=65535" --volume "/opt/dataverse/v6.5/instance1/solr-data:/var/solr/data" rudi/dataverse-solr-65
