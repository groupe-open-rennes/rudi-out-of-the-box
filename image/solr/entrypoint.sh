#!/bin/bash
# Fail on any error
set -e

if [ -z "$DATAVERSE_HOST" ]; then
    echo "DATAVERSE_HOST not set defaulted to \"dataverse\""
    DATAVERSE_HOST=dataverse
fi
DATAVERSE_URL="http://$DATAVERSE_HOST:8080"
echo "Dataverse URL: $DATAVERSE_URL"

solr start -v
echo "Starting Solr...."
if [ -f /tmp/updateSchemaMDB.sh ]; then
    sleep 25;
    solr stop -v
    unzip -o -qq /tmp/collection1.zip -d /var/solr/data/
    solr start -v
    echo "Checking Dataverse....";
    sleep 10;
    until curl -sS -f "$DATAVERSE_URL/robots.txt" -m 2 2>&1 > /dev/null;
    do echo ">>>>>>>> Waiting for Dataverse...."; echo "---- Dataverse is not ready...."; sleep 20; done;
    echo "Dataverse is running...";
    echo "Trying to update scheme...";
    echo "Updating";
    /tmp/updateSchemaMDB.sh -d $DATAVERSE_URL -t /var/solr/data//collection1/conf
    sleep 5;
    echo "-----Scheme updated------";
    rm /tmp/updateSchemaMDB.sh
else
    echo ":) :) :)"
fi

tail -f /dev/null

