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
        && rm -rf /var/cache/apt \
        && pip install --upgrade pip \
        && pip install honcho

# Blinktrade and Requirements
# && git clone https://github.com/blinktrade/bitex.git bitex \
RUN cd /opt \
        && git clone https://github.com/bzero/bitex.git bitex \
        && cd /opt/bitex \
        && pip install -r requirements.txt

# SSL cert (for Nginx)
# http://blog.justin.kelly.org.au/how-to-create-a-self-sign-ssl-cert-with-no-pa/
RUN cd /opt/bitex \
        && mkdir ssl && cd ssl \
        && openssl genrsa -out server.key 1024 \
        && openssl req -new -key server.key -out server.csr -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Blue Wall Japan/OU=IT Department/CN=192.168.0.62" \
        && cp server.key server.key.org \
        && openssl rsa -in server.key.org -out server.key \
        && openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

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
# Nginx
COPY etc/nginx/conf.d/bitex.conf /etc/nginx/conf.d/

WORKDIR /opt/bitex
CMD ["./start.sh"]