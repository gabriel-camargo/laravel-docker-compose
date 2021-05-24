#!/bin/bash

repo=${repo:-"https://github.com/laravel/laravel"}

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
        # echo $1 $2 // Optional to see the parameter:value result
   fi

  shift
done

git clone $repo apps/laravel

docker-compose build
docker-compose up -d

cd apps/laravel
cp .env.example .env

chmod -R 777 bootstrap
chmod -R 777 storage
chmod -R 777 public

docker-compose exec app composer self-update --2
docker-compose exec app composer install
docker-compose exec app php artisan key:generate

bold=$(tput bold)
normal=$(tput sgr0)
NC='tput sgr0' # No Color
GREEN='tput setaf 2'

echo "$(${GREEN}) Setup completo. $(${NC})"
