#!/bin/bash

eval $(docker-machine env default)

name=$(docker-compose ps | grep "php5-fpm -F" | awk '{print $1}')

docker exec -it -u www-data $name bash -c 'cd /var/www/symfony; exec "${SHELL:-sh}"'
