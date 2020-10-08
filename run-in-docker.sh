#!/bin/bash

set -euxo pipefail

# Clean previous test results
sudo rm -rf tests/reports/
mkdir -m 777 tests/reports/

GID=`id -g`

# Execute e2e using docker
docker run --rm \
    -v `pwd`/:/opt/robotframework/tests/reports/:Z \
    -v `pwd`/:/opt/robotframework/tests:Z \
    -v /dev/shm:/dev/shm \
    -e ROBOT_THREADS=1 \
    ppodgorsek/robot-framework:latest