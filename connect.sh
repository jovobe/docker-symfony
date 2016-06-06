#!/bin/bash

name=$(docker-compose ps | grep "php5-fpm -F" | awk '{print $1}')

docker exec -it -u www-data $name bash
