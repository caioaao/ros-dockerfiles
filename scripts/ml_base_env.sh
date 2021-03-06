#!/bin/bash

set -euo pipefail

if [[ -n "${WITH_GPU:-}" ]]; then
    DOCKER=nvidia-docker
    DOCKERIMAGE="${DOCKERIMAGE:-caioaao/ml-base-gpu:5.4.0}"
else
    DOCKER=docker
    DOCKERIMAGE="${DOCKERIMAGE:-caioaao/ml-base:5.4.0}"
fi

[[ -n "${CONTAINER_NAME:-}" ]] && NAME_PARAM="--name=${CONTAINER_NAME}"

$DOCKER run -it --rm ${NAME_PARAM:-}  ${EXTRA_ARGS:-}   \
        -v "$(pwd):/project"                            \
        -v "${DATASETS_DIR:-$(pwd)/datasets}:/datasets" \
        -p "${JUPYTER_PORT:-8888}:8888"                 \
        -p "${TENSORBOARD_PORT:-6006}:6006"             \
        $DOCKERIMAGE "${@:1}"
