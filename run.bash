#!/bin/bash

docker run -i -t --rm -p "$CLIENT_PORT:$CLIENT_PORT/udp" -p "$RAW_PORT:$RAW_PORT/udp" -p "$QUERY_PORT:$QUERY_PORT/udp" \
    --name "ark-$MAP" -e MAP -e CLIENT_PORT -e RAW_PORT -e QUERY_PORT \
    -v /opt/ark-data/server:/ark/server -v /opt/ark-data/cluster:/ark/cluster -v "$HOME/ark-data/save/$MAP:/ark/save" -v "/opt/ark-data/config:/ark/config" \
    ark
