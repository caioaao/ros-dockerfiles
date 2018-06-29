#!/usr/bin/env bash

VERSION=3.0.0

if [[ "$*" = "gpu" ]]; then
    BASE_IMAGE=tensorflow/tensorflow:1.7.1-gpu-py3
    IMAGE_NAME=caioaao/ml-base-gpu
elif [[ "$*" = "no-gpu" ]]; then
    BASE_IMAGE=tensorflow/tensorflow:1.7.1-py3
    IMAGE_NAME=caioaao/ml-base
else
    echo "Usage: ./build.sh [gpu|no-gpu]"
    exit 1
fi

set -x
docker build -t "${IMAGE_NAME}:${VERSION}" --build-arg BASE_IMAGE=$BASE_IMAGE .
