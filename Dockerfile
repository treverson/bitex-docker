FROM ubuntu:xenial

MAINTAINER Siriwat K.
# Extracted from https://github.com/blinktrade/bitex/wiki/HOW-TO-DEPLOY-BLINKTRADE-ON-GOOGLE-COMPUTE-ENGINE

# Git Python
RUN apt-get update \
        && apt-get install -y git python-setuptools python-pip python-dev \
        && rm -rf /var/cache/apt

# ZeroMQ Java Honcho
RUN apt-get update \
        && apt-get install -y pkg-config \
        && apt-get install -y libzmq-dev \
        && rm -rf /var/cache/apt \
        && pip install --upgrade pip \
        && pip install honcho

# Blinktrade and Requirements
# && git clone https://github.com/blinktrade/bitex.git bitex \
RUN cd /opt \
        && git clone https://github.com/bzero/bitex.git bitex \
        && cd /opt/bitex \
        && pip install -r requirements.txt

# Configuration
# Bitex
RUN mkdir /opt/bitex/logs
COPY opt/bitex/config/api_receive.conf /opt/bitex/config/
COPY opt/bitex/config/trade.conf /opt/bitex/config/
COPY opt/bitex/config/ws_gateway.conf /opt/bitex/config/
COPY opt/bitex/config/mailer.conf /opt/bitex/config/
COPY opt/bitex/Procfile /opt/bitex/
# Run command
COPY opt/bitex/start.sh /opt/bitex/

WORKDIR /opt/bitex
CMD ["./start.sh"]