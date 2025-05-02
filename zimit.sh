#!/usr/bin/env bash
URL=$1
NAME=$2
dt=$(date +%m%d%Y)
file="$NAME-$dt"
shift 2
#docker run --rm --name atsdr-cdc-gov -v ./atsdr-cdc-gov:/output ghcr.io/openzim/zimit zimit --seeds https://atsdr.cdc.gov/ --name atsdr-cdc-gov-05022025 --pageLimit 3
mkdir -p "$NAME"
existing=$(docker ps -a --filter "name=$NAME" -q)
if [ "$existing" ]; then
  docker rm "$NAME"
fi
docker run --rm -d \
  --name "$NAME" \
  -v ./"$NAME":/output \
  ghcr.io/openzim/zimit \
  zimit \
  --seeds "$URL" \
  --name "$file" \
  "$@"
