FROM ubuntu:xenial

MAINTAINER Siriwat K.
# Extracted (bitcoind) from 
# step.5 - https://github.com/peatio/peatio/blob/db0667ab2788fd7c3ca75b4fb024ef90e818afac/doc/setup-local-ubuntu.md
# bitcoind install - https://github.com/blinktrade/bitex/wiki/HOW-TO-INSTALL-API-RECEIVE
# bitcoind apt-key from
# https://hub.docker.com/r/kylemanna/bitcoind/~/dockerfile/

# APT common and Bitcoind
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e \
        && echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu xenial main" > /etc/apt/sources.list.d/bitcoin.list \
        && apt-get update \
        && apt-get install -y curl bitcoind \
        && rm -rf /var/cache/apt

COPY .bitcoin/bitcoin.conf /root/.bitcoin/

EXPOSE 8332 8333 18332 18333
CMD ["bitcoind"]