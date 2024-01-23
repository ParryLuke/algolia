#!/bin/bash

APPLICATION_ID="494CB4DJ46"
FILE="expected algolia payload.json"
INDEX_NAME="prod_luke"
ALGOLIA_VERSION="1.5.0"

echo "Checking for Algolia install..."

if ! command -v algolia
then
    echo "Installing Algolia CLI version $ALGOLIA_VERSION..."
    rm algolia_*.deb
    wget https://github.com/algolia/cli/releases/download/v$ALGOLIA_VERSION/algolia_"$ALGOLIA_VERSION"_linux_amd64.deb
    sudo dpkg -i algolia_*.deb
fi

echo "Enter the admin API key for Algolia CLI: https://dashboard.algolia.com/account/api-keys/all?applicationId=$APPLICATION_ID"
echo

read ADMIN_API_KEY

echo "Loading data from $FILE..."

algolia objects import prod_luke -F "$FILE" --application-id $APPLICATION_ID --admin-api-key $ADMIN_API_KEY