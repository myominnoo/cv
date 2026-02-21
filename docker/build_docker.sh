#!/bin/bash

echo "Build the docker"

docker buildx build . --progress=plain \
               --platform linux/amd64,linux/arm64 \
               --build-arg QUARTO_VERSION=1.2.335 \
               --build-arg CONDA_ENV=flex_dashboard \
               --build-arg PYTHON_VER=3.8 \
               -t myominnoo/cv:dev.0.0.0.9000

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push myominnoo/cv:dev.0.0.0.9000
else
echo "Docker build failed"
fi