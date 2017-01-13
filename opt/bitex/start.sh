#!/bin/bash

/etc/init.d/nginx start &
honcho -f /opt/cryptos/Procfile start
