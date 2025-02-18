#!/usr/bin/env bash

# Up DBMS like background process
(greptime standalone start --http-addr 0.0.0.0:4000 --rpc-addr 0.0.0.0:4001 \
--mysql-addr 0.0.0.0:4002 --postgres-addr 0.0.0.0:4003 1>/tmp/stdout) &

# Wait to finish up DBMS
sleep 5

# Create a DB
psql -h 127.0.0.1 -p 4003 -d public -c "CREATE DATABASE promdb;"

# read file that cointain the standard output from background process
tail -f /tmp/stdout