#!/bin/bash

echo "Building Docker image for Dev environment"

docker build -t $1 .

echo "Docker image building is successfull" 
