#!/bin/bash
#
# This Bash script starts up CockroachDB on 3 nodes (ports 26257, 26258,
# and 26259).
#
# Usage: ./start-nodes.bash
#
# Certificates must be created beforehand by the script setup-certs.bash,
# And are used for secure authentication.

COCKROACH_DIR=~/cockroach
mkdir -p ${COCKROACH_DIR}

COCKROACH_CERTS=${COCKROACH_DIR}/certs
mkdir -p ${COCKROACH_CERTS}

echo "Starting node 1"
cockroach start --background \
--store=$COCKROACH_DIR/node1 \
--http-host=0.0.0.0 \
--certs-dir=$COCKROACH_CERTS

echo "Starting node 2"
cockroach start --background \
--store=$COCKROACH_DIR/node2 \
--port=26258 \
--http-port=8081 \
--http-host=0.0.0.0 \
--certs-dir=$COCKROACH_CERTS \
--join=localhost:26257

echo "Starting node 3"
cockroach start --background \
--store=$COCKROACH_DIR/node3 \
--port=26259 \
--http-port=8082 \
--http-host=0.0.0.0 \
--certs-dir=$COCKROACH_CERTS \
--join=localhost:26257
