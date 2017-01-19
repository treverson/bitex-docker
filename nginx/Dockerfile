FROM nginx

MAINTAINER Siriwat K.
# Extracted from https://github.com/blinktrade/bitex/wiki/HOW-TO-DEPLOY-BLINKTRADE-ON-GOOGLE-COMPUTE-ENGINE

# Nginx
RUN apt-get update \
        && apt-get install -y openssl \
        && rm -rf /var/cache/apt

# SSL cert
# http://blog.justin.kelly.org.au/how-to-create-a-self-sign-ssl-cert-with-no-pa/
# https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-with-ssl-as-a-reverse-proxy-for-jenkins
# https://www.nginx.com/blog/websocket-nginx/
RUN cd /opt \
        && mkdir ssl && cd ssl \
        && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Blue Wall Japan/OU=IT Department/CN=192.168.0.62" -out server.crt
#        && openssl genrsa -out server.key 1024 \
#        && openssl req -new -key server.key -out server.csr -subj "/C=JP/ST=Tokyo/L=Tokyo/O=Blue Wall Japan/OU=IT Department/CN=192.168.0.62" \
#        && cp server.key server.key.org \
#        && openssl rsa -in server.key.org -out server.key \
#        && openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# Configuration
# Nginx
COPY etc/nginx/conf.d/bitex.conf /etc/nginx/conf.d/

# http 80
# wss https 443
#
EXPOSE 80 443