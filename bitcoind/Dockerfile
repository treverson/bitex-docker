# Forked from
FROM kylemanna/bitcoind

MAINTAINER Siriwat K.
# Extracted (bitcoind) from 
# step.5 - https://github.com/peatio/peatio/blob/db0667ab2788fd7c3ca75b4fb024ef90e818afac/doc/setup-local-ubuntu.md
# bitcoind install - https://github.com/blinktrade/bitex/wiki/HOW-TO-INSTALL-API-RECEIVE
# bitcoind apt-key from
# https://hub.docker.com/r/kylemanna/bitcoind/~/dockerfile/

# Curl
RUN apt-get update \
        && apt-get install -y curl \
        && rm -rf /var/cache/apt

# Configuration
COPY .bitcoin/bitcoin.conf /bitcoin/.bitcoin/

# bitcoind
# realmode 8332
# testnet 18332
#
EXPOSE 18332