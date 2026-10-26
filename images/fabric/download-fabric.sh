#!/bin/sh
set -eu

: "${MC_VERSION:?MC_VERSION must be set}"

loader_version="${FABRIC_LOADER_VERSION:-$(curl -fsSL "https://meta.fabricmc.net/v2/versions/loader/${MC_VERSION}" | jq -er '.[0].loader.version')}"
installer_version="${FABRIC_INSTALLER_VERSION:-$(curl -fsSL https://meta.fabricmc.net/v2/versions/installer | jq -er '.[0].version')}"
launcher_url="https://meta.fabricmc.net/v2/versions/loader/${MC_VERSION}/${loader_version}/${installer_version}/server/jar"

mkdir -p /opt/fabric
curl -fsSL "${launcher_url}" -o /opt/fabric/fabric-server-launch.jar
test -s /opt/fabric/fabric-server-launch.jar
