#!/bin/bash

echo "Building Docker image for Dev environment"

docker build -t girishbm4567/react_app_dev:${env.BUILD_ID} .

echo "Docker image building is successfull" 
