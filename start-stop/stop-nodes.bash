#!/bin/bash
#
# This Bash script stops 3 instances of CockroachDB (on ports 26257, 26258,
# and 26259).
#
# Usage: ./stop-nodes.bash

COCKROACH_CERTS=~/cockroach/certs

# Stop node 1:
cockroach quit \
--host=localhost \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/root.cert \
--key=$COCKROACH_CERTS/root.key

# Stop node 2:
cockroach quit \
--host=localhost \
--port=26258 \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/root.cert \
--key=$COCKROACH_CERTS/root.key

# Stop node 3:
cockroach quit \
--host=localhost \
--port=26259 \
--ca-cert=$COCKROACH_CERTS/ca.cert \
--cert=$COCKROACH_CERTS/root.cert \
--key=$COCKROACH_CERTS/root.key
