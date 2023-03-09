#!/bin/bash


sudo docker-compose -f reactjs-dev-docker-compose.yml up -d

sleep 10

docker cp default.conf react_app:/etc/nginx/conf.d/

docker exec react_app nginx -s reload
