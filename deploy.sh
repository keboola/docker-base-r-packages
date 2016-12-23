#!/bin/bash

docker login -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
docker tag keboola/docker-base-r-packages quay.io/keboola/docker-base-r-packages:$TRAVIS_TAG
docker tag keboola/docker-base-r-packages quay.io/keboola/docker-base-r-packages:latest
docker images
docker push quay.io/keboola/docker-base-r-packages:$TRAVIS_TAG
docker push quay.io/keboola/docker-base-r-packages:latest
