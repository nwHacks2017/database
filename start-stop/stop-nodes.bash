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
--certs-dir=$COCKROACH_CERTS

# Stop node 2:
cockroach quit \
--host=localhost \
--port=26258 \
--certs-dir=$COCKROACH_CERTS

# Stop node 3:
cockroach quit \
--host=localhost \
--port=26259 \
--certs-dir=$COCKROACH_CERTS
