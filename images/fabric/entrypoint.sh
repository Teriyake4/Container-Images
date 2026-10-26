#!/bin/sh
set -eu

cd /data

echo "eula=true" > /data/eula.txt

exec java ${JAVA_OPTS:-} \
    -jar /opt/fabric/fabric-server-launch.jar \
    --nogui \
    "$@"
