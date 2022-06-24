#!/usr/bin/env bash

echo "Cleaning up existing files..."
rm -Rf .dockerignore .gitignore Dockerfile bin docker docker-compose.yml helm src

echo "Installing source files..."
docker run -t --rm -e MAGENTO_VERSION=${MAGENTO_VERSION} -v $(pwd):/var/www/html -v $(pwd)/.composer:/root/.composer phoenixmedia/nginx-php:8.1 bash -c "./install.sh"
