#!/bin/bash

bash ./setup_env.sh

WORKING_DIR="$(dirname $(readlink -f $0))"
export WORKING_DIR="${WORKING_DIR/\/Deployment*/}"
export CONF_FILE="${WORKING_DIR}/Deployment/scripts/variables.conf"

set -a
source ${CONF_FILE}
set +a

cd ${WORKING_DIR}

docker build . -t ${IMAGE_NAME}:latest

# TODO
# Docker push command to push to a registry