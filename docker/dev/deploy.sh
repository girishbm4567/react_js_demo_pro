#!/bin/bash


sudo docker-compose -f reactjs-dev-docker-compose.yml up -d

sleep 10

sudo docker cp default.conf react_app:/etc/nginx/conf.d/

sudo docker exec react_app nginx -s reload
