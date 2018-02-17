#!/bin/bash

#set folder where the repository is located (no trailing slash)
APP_PATH=""

echo 'Starting applications...'

docker-compose down
docker-compose up -d --build
