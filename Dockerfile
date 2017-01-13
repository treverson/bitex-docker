FROM ubuntu:xenial

MAINTAINER Siriwat K.
# Extracted from https://github.com/blinktrade/bitex/wiki/HOW-TO-DEPLOY-BLINKTRADE-ON-GOOGLE-COMPUTE-ENGINE

# Nginx Git Python
RUN apt-get update \
        && apt-get install -y nginx git python-setuptools python-pip python-dev \
        && rm -rf /var/cache/apt

# ZeroMQ Java Honcho
RUN apt-get update \
        && apt-get install -y pkg-config \
        && apt-get install -y libzmq-dev libzmq-dev \
        && apt-get install -y openjdk-8-jre \
        && rm -rf /var/cache/apt \
        && pip install --upgrade pip \
        && pip install honcho

# Blinktrade and Requirements
# && git clone https://github.com/blinktrade/bitex.git bitex \
RUN cd /opt \
        && git clone https://github.com/bzero/bitex.git bitex \
        && cd /opt/bitex \
        && pip install -r requirements.txt

# Blinktrade frontend
RUN cd /opt \
        && git clone https://github.com/blinktrade/frontend.git frontend \
        && cd ./frontend/jsdev \
        && ./build_release.sh

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# SSL cert
RUN cd /opt/bitex \
        && mkdir ssl && cd ssl \
        && openssl genrsa -out server.key 1024 \
        && openssl req -new -key server.key -out server.csr -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Blue Wall Japan/OU=IT Department/CN=bluewall.jpn.com" \
        && cp server.key server.key.org \
        && openssl rsa -in server.key.org -out server.key \
        && openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

WORKDIR /opt/bitex
CMD ["./start.sh"]