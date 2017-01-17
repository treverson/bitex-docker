#!/bin/bash

docker run --rm -it \
    --net=host \
    -v /home/stylix/codes/mxchg_docker/etc/nginx/conf.d/bitex.conf:/etc/nginx/conf.d/bitex.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/config:/opt/bitex/config \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/logs:/opt/bitex/logs \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/start.sh:/opt/bitex/start.sh \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/Procfile:/opt/bitex/Procfile \
    bitex
