FROM ubuntu:xenial

MAINTAINER Siriwat K.
# Extracted from https://github.com/blinktrade/bitex/wiki/HOW-TO-DEPLOY-BLINKTRADE-ON-GOOGLE-COMPUTE-ENGINE

# Nginx
RUN apt-get update \
        && apt-get install -y openssl nginx \
        && rm -rf /var/cache/apt

# SSL cert
# http://blog.justin.kelly.org.au/how-to-create-a-self-sign-ssl-cert-with-no-pa/
RUN cd /opt \
        && mkdir nginx && cd nginx \
        && openssl genrsa -out server.key 1024 \
        && openssl req -new -key server.key -out server.csr -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Blue Wall Japan/OU=IT Department/CN=192.168.0.62" \
        && cp server.key server.key.org \
        && openssl rsa -in server.key.org -out server.key \
        && openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# Configuration
# Run command
COPY start.sh /opt/nginx/
# Nginx
COPY etc/nginx/conf.d/bitex.conf /etc/nginx/conf.d/

WORKDIR /opt/nginx
CMD ["./start.sh"]