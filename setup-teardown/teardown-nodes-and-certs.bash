#!/bin/bash
#
# This Bash script removes the nodes, storage, and certificates for the
# CockroachDB instances..

COCKROACH_DIR=~/cockroach
mkdir -p "${COCKROACH_DIR}"
rm -r "${COCKROACH_DIR}"
