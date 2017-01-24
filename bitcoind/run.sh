#!/bin/bash

# Forked from https://github.com/kylemanna/docker-bitcoind
# With added a configuration for bitex

docker volume rm bitcoind-data
docker volume create --name=bitcoind-data &&
docker run -v bitcoind-data:/bitcoin --rm -it \
    --net=host \
    -p 8333:8333 \
    -p 8332:8332 \
    -p 18332:18332 \
    -p 18333:18333 \
    bitcoind bitcoind

#-v `pwd`/.bitcoin/bitcoin.conf:/bitcoin/.bitcoin/bitcoin.conf \
#kylemanna/bitcoind bitcoind