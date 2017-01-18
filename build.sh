#!/bin/bash

# Bitex
echo "=========== Bitcoind ===========" &&
cd bitcoind &&
docker build -t bitcoind . &&

# Bitex
cd .. &&
echo "=========== Nginx ===========" &&
cd nginx &&
docker build -t nginx . &&

# Bitex
cd .. &&
echo "=========== Bitex ===========" &&
docker build -t bitex . &&

# Frontend
echo "=========== Frontend ===========" &&
cd frontend &&
docker build -t exchange .