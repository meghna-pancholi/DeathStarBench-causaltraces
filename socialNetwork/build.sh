#!/bin/bash

DOCKER_REGISTRY="meghnapancholi/dsb-social"

docker build -t thrift-microservice-deps -f docker/thrift-microservice-deps/cpp/Dockerfile . 
docker build -t social -f Dockerfile . 
SOCIAL_IMAGE_ID=$(docker images --format="{{.Repository}} {{.ID}}" | grep "^social " | cut -d' ' -f2)
docker tag $SOCIAL_IMAGE_ID $DOCKER_REGISTRY:causaltracing
docker push $DOCKER_REGISTRY:causaltracing
