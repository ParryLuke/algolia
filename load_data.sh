#!/bin/bash

APPLICATION_ID="494CB4DJ46"
SOURCE_FILE="expected algolia payload.json"
IMPORT_FILE="payload.ndjson"
INDEX_NAME="prod_luke"
ALGOLIA_VERSION="1.5.0"
ARCHITECTURE="linux_amd64"

echo "Checking for Algolia install..."

if ! command -v algolia
then
    echo "Installing Algolia CLI version $ALGOLIA_VERSION for $ARCHITECTURE systems..."

    rm -r algolia_*

    # Download and export Algolia CLI
    wget https://github.com/algolia/cli/releases/download/v$ALGOLIA_VERSION/algolia_"$ALGOLIA_VERSION"_$ARCHITECTURE.tar.gz
    tar -xf algolia_*.tar.gz

    # Install CLI
    sudo mv algolia_"$ALGOLIA_VERSION"_$ARCHITECTURE/algolia /usr/local/bin
fi

echo "Enter the admin API key for Algolia CLI: https://dashboard.algolia.com/account/api-keys/all?applicationId=$APPLICATION_ID"
echo

read ADMIN_API_KEY

if ! test -f $IMPORT_FILE; then
    echo "Converting $SOURCE_FILE to $IMPORT_FILE"
    jq -c '.[]' "$SOURCE_FILE" > $IMPORT_FILE
fi

echo "Loading data from $IMPORT_FILE..."

algolia objects import prod_luke -F $IMPORT_FILE --application-id $APPLICATION_ID --admin-api-key $ADMIN_API_KEY