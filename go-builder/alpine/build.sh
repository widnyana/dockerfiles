#!/usr/bin/env bash
set -euo pipefail

BUILD_TARGET=(
    "1.19-alpine3.18"
    "1.20-alpine3.18"
    "1.21-alpine3.18"
)


echo "::group::docker build alpine"

for t in ${BUILD_TARGET[@]}; do
    RNDM=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-20} | head -n 1)

    TAGNAME="widnyana/go-builder:$t"
    echo -e "----building ${TAGNAME}\n"
    mkdir -p "/tmp/docker-build-${RNDM}"
    /usr/bin/docker buildx build \
        --iidfile /tmp/docker-build-${RNDM}/iidfile \
        --metadata-file /tmp/docker-build-${RNDM}/metadata-file \
        --provenance false \
        --push \
        --progress=plain \
        --build-arg BASE=${t} \
        --tag ${TAGNAME} \
        .

    /usr/bin/docker push "${TAGNAME}" && /usr/bin/docker rmi --force "${TAGNAME}" || true
done

echo "::endgroup::"
