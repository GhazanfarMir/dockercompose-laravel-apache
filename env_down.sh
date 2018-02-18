#!/usr/bin/env bash

echo 'Terminating applications...'

# Setup Environment Variables
export APP_PATH=${APP_PORT:-"${PWD}/app"}
export APP_PORT=${APP_PORT:-9000}
export DOCUMENT_ROOT=${DOCUMENT_ROOT:-"/var/www/html"}
export DB_PORT=${DB_PORT:-13306}
export DB_NAME=${DB_NAME:-dockerphp}
export DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD:-dockerphp}

docker-compose down
