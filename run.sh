#!/bin/bash

docker run -it \
    --net=host \
    -v /home/stylix/codes/mxchg_docker/etc/nginx/conf.d/bitex.conf:/etc/nginx/conf.d/bitex.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/config/api_receive.conf:/opt/bitex/config/api_receive.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/logs:/opt/bitex/logs \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/mailer.conf:/opt/bitex/mailer.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/trade.conf:/opt/bitex/trade.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/ws_gateway.conf:/opt/bitex/ws_gateway.conf \
    -v /home/stylix/codes/mxchg_docker/opt/bitex/start.sh:/opt/bitex/start.sh \
    -v /home/stylix/codes/mxchg_docker/opt/cryptos/Procfile:/opt/cryptos/Procfile \
    mxchg