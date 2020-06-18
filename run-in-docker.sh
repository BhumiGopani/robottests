#!/bin/bash

set -euxo pipefail

# Clean previous test results
rm -rf reports/
mkdir -m 777 reports

GID=`id -g`

# Execute e2e using docker
docker run --rm \
    -v `pwd`/:/opt/robotframework/reports:Z \
    -v `pwd`/:/opt/robotframework/tests:Z \
    -v /dev/shm:/dev/shm \
    -e ROBOT_THREADS=1 \
    ppodgorsek/robot-framework:latest