#!/usr/bin/env bash

# Up DBMS
greptime standalone start --http-addr 0.0.0.0:4000 --rpc-addr 0.0.0.0:4001 \
--mysql-addr 0.0.0.0:4002 --postgres-addr 0.0.0.0:4003

# Create DB
psql -h 127.0.0.1 -p 4003 -d public -c "CREATE DATABASE promdb;"

# keep up container
tail -f /dev/null