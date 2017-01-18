#!/bin/bash

# Running Bitcoind
#./bitcoind/run.sh

# Running Bitex
docker run --rm -it \
    --net=host \
    bitex
