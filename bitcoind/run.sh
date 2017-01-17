#!/bin/bash

# Forked from https://github.com/kylemanna/docker-bitcoind
# With added a configuration for bitex

docker volume create --name=bitcoind-data &&
docker run -v bitcoind-data:/bitcoin --rm -it --name=bitcoind-node \
    --net=host \
    -p 8333:8333 \
    -p 8332:8332 \
    -p 18332:18332 \
    -p 18333:18333 \
    -v `pwd`/.bitcoin:/bitcoin/.bitcoin \
    kylemanna/bitcoind bitcoind