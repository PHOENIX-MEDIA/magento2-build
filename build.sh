#!/usr/bin/env bash

echo "Cleaning up existing files..."
rm -Rf .dockerignore .gitignore Dockerfile bin docker docker-compose.yml helm src
mkdir .composer || true

[[ -z "${COMPOSER_AUTH_USERNAME}" ]] && { echo "ERROR: Environment variable COMPOSER_AUTH_USERNAME must not be empty."; exit 1; }
[[ -z "${COMPOSER_AUTH_PASSWORD}" ]] && { echo "ERROR: Environment variable COMPOSER_AUTH_PASSWORD must not be empty."; exit 1; }

# create tmp composer auth.json
    echo -e "{
    \"http-basic\": {
        \"repo.magento.com\": {
            \"username\": \"${COMPOSER_AUTH_USERNAME}\",
            \"password\": \"${COMPOSER_AUTH_PASSWORD}\"
        }
    }
}" > .composer/auth.json

DOCKER_CMD="docker run -ti --rm -v $(pwd):/var/www/html -v $(pwd)/.composer:/root/.composer phoenixmedia/nginx-php:8.1"


echo "Installing source files..."
${DOCKER_CMD} bash -c './install.sh'
cd src; vendor/bin/px-cloud-build-install; cd ..

docker build .
