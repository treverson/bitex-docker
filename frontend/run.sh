#!/bin/bash

docker run --rm -it \
    --net=host \
    -p 4000:4000 \
    exchange