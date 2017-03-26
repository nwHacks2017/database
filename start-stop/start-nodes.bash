#!/bin/bash

COCKROACH_CERTS=~/cockroach/certs

echo "Starting node 1"
cockroach start --background \
--http-host=0.0.0.0 \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/node.cert \
--key=$COCKROACH_CERTS/node.key

echo "Starting node 2"
cockroach start --background \
--store=node2 \
--port=26258 \
--http-port=8081 \
--http-host=0.0.0.0 \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/node.cert \
--key=$COCKROACH_CERTS/node.key \
--join=localhost:26257

echo "Starting node 3"
cockroach start --background \
--store=node3 \
--port=26259 \
--http-port=8082 \
--http-host=0.0.0.0 \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/node.cert \
--key=$COCKROACH_CERTS/node.key \
--join=localhost:26257
