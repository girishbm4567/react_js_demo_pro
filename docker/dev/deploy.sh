#!/bin/bash


sudo docker-compose -f reactjs-dev-docker-compose.yml up -d

# docker cp default.conf react_app:/etc/nginx/conf.d/
