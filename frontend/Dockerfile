FROM ubuntu:xenial

MAINTAINER Siriwat K.
# Extracted from https://github.com/blinktrade/frontend

# Git Ruby Java Jekyll python-pip(libffi) and Jekyll-plugin
RUN apt-get update \
        && apt-get install -y git ruby-full ruby-dev python-pip openjdk-8-jre \
        && gem install jekyll \
        && gem install jekyll-multiple-languages-plugin \
        && gem install jekyll-paginate \
        && rm -rf /var/cache/apt

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Build Blinktrade frontend
RUN cd /opt \
        && git clone https://github.com/blinktrade/frontend.git frontend

# Configuration
# main Configuration and transalation
COPY config.yml /opt/frontend/_config.yml
COPY en_US.UTF-8.xtb.xml /opt/frontend/jsdev/translations/

# Compiling frontend
RUN cd /opt/frontend/jsdev \
        && THEME=default ./build_release.sh

# Configuration
# Run command
COPY start.sh /opt/frontend/
# Already specify the plugins in _config.yml, so there are no need here.
RUN rm -rf /opt/frontend/_plugins/ext.rb

WORKDIR /opt/frontend
CMD ["./start.sh"]