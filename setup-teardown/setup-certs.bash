#!/bin/bash
#
# This Bash script generates certificates for CockroachDB before initialization.

CERTS_DIR=~/cockroach/certs

mkdir -p ${CERTS_DIR}

# Create the CA key pair:
cockroach cert create-ca \
--certs-dir=${CERTS_DIR} \
--ca-key=${CERTS_DIR}/ca.key

# Create a client key pair for the root user:
cockroach cert create-client \
root \
--certs-dir=${CERTS_DIR} \
--ca-key=${CERTS_DIR}/ca.key

# Create a client key pair for the dev user:
cockroach cert create-client \
janitor_dev \
--certs-dir=${CERTS_DIR} \
--ca-key=${CERTS_DIR}/ca.key

# Create a client key pair for the prod user:
cockroach cert create-client \
janitor \
--certs-dir=${CERTS_DIR} \
--ca-key=${CERTS_DIR}/ca.key

# Create a key pair for the nodes:
cockroach cert create-node \
localhost \
$(hostname) \
--certs-dir=${CERTS_DIR} \
--ca-key=${CERTS_DIR}/ca.key
