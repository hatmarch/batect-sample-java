#! /usr/bin/env sh

set -euo pipefail

TAG=$(git rev-parse HEAD)

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USER --password-stdin
docker build -t $DOCKER_USER/batect-sample-java:latest .batect/international-transfers-service
docker tag $DOCKER_USER/batect-sample-java:latest $DOCKER_USER/batect-sample-java:$TAG
docker push $DOCKER_USER/batect-sample-java:latest
docker push $DOCKER_USER/batect-sample-java:$TAG
