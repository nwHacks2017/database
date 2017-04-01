#!/bin/bash
#
# This Bash script generates certificates for CockroachDB before initialization.

CERTS_DIR=~/cockroach/certs

mkdir -p ${CERTS_DIR}

# Create the CA key pair:
cockroach cert create-ca \
--ca-cert=${CERTS_DIR}/ca.cert \
--ca-key=${CERTS_DIR}/ca.key

# Create a client key pair for the root user:
cockroach cert create-client \
root \
--ca-cert=${CERTS_DIR}/ca.cert \
--ca-key=${CERTS_DIR}/ca.key \
--cert=${CERTS_DIR}/root.cert \
--key=${CERTS_DIR}/root.key

# Create a client key pair for the dev user:
cockroach cert create-client \
janitor_dev \
--ca-cert=${CERTS_DIR}/ca.cert \
--ca-key=${CERTS_DIR}/ca.key \
--cert=${CERTS_DIR}/janitor_dev.cert \
--key=${CERTS_DIR}/janitor_dev.key

# Create a client key pair for the prod user:
cockroach cert create-client \
janitor \
--ca-cert=${CERTS_DIR}/ca.cert \
--ca-key=${CERTS_DIR}/ca.key \
--cert=${CERTS_DIR}/janitor.cert \
--key=${CERTS_DIR}/janitor.key

# Create a key pair for the nodes:
cockroach cert create-node \
localhost \
$(hostname) \
--ca-cert=${CERTS_DIR}/ca.cert \
--ca-key=${CERTS_DIR}/ca.key \
--cert=${CERTS_DIR}/node.cert \
--key=${CERTS_DIR}/node.key
