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
# Original https://github.com/blinktrade/bitex.git \
# Bzero https://github.com/bzero/bitex.git \
RUN cd /opt \
        && git clone https://github.com/blinktrade/bitex.git bitex \
        && cd /opt/bitex \
        && pip install -r requirements.txt

# Pyblinktrade (use with original bitex)
RUN cd /opt \
        && git clone https://github.com/blinktrade/pyblinktrade.git pyblinktrade \
        && cd /opt/pyblinktrade \
        && chmod +x setup.py \
        && ./setup.py install

# blinktrade_api_receive (use with original bitex)
# https://github.com/blinktrade/blinktrade_api_receive.git
RUN cd /opt/bitex/apps \
        && git clone https://github.com/blinktrade/blinktrade_api_receive.git api_receive \
        && cd /opt/bitex/apps/api_receive \
        && chmod +x setup.py \
        && ./setup.py install

# Configuration
# Bitex
RUN mkdir -p /opt/bitex/logs
#Original
COPY opt/bitex/config/api_receive.ini /opt/bitex/config/api_receive.conf
COPY opt/bitex/config/bitex.ini /opt/bitex/config/bitex.conf
COPY opt/bitex/Procfile /opt/bitex/
#Bzero
#COPY opt/bitex/config/api_receive.conf /opt/bitex/config/
#COPY opt/bitex/config/trade.conf /opt/bitex/config/
#COPY opt/bitex/config/ws_gateway.conf /opt/bitex/config/
#COPY opt/bitex/config/mailer.conf /opt/bitex/config/
# Bootstrap configuration
COPY opt/bitex/config/bootstrap/bootstrap.ini /opt/bitex/config/bootstrap/
COPY opt/bitex/config/bootstrap/demo.ini /opt/bitex/config/bootstrap/
RUN cd /opt/bitex/config/bootstrap \
        && python2.7 bootstrap.py demo.ini
# Run command
COPY opt/bitex/start.sh /opt/bitex/

WORKDIR /opt/bitex

# api_receive 9943
# zmq 5757 5758
# ws_gateway 8445
#
EXPOSE 9943 5757 5758 8445

CMD ["./start.sh"]