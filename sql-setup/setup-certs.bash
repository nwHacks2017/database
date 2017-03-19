#!/bin/bash

# Create a certs directory:
mkdir /home/ec2-user/certs

# Create the CA key pair:
cockroach cert create-ca \
--ca-cert=/home/ec2-user/certs/ca.cert \
--ca-key=/home/ec2-user/certs/ca.key

# Create a client key pair for the root user:
cockroach cert create-client \
root \
--ca-cert=/home/ec2-user/certs/ca.cert \
--ca-key=/home/ec2-user/certs/ca.key \
--cert=/home/ec2-user/certs/root.cert \
--key=/home/ec2-user/certs/root.key

# Create a client key pair for the dev user:
cockroach cert create-client \
janitor_dev \
--ca-cert=/home/ec2-user/certs/ca.cert \
--ca-key=/home/ec2-user/certs/ca.key \
--cert=/home/ec2-user/certs/janitor_dev.cert \
--key=/home/ec2-user/certs/janitor_dev.key

# Create a client key pair for the prod user:
cockroach cert create-client \
janitor \
--ca-cert=/home/ec2-user/certs/ca.cert \
--ca-key=/home/ec2-user/certs/ca.key \
--cert=/home/ec2-user/certs/janitor.cert \
--key=/home/ec2-user/certs/janitor.key

# Create a key pair for the nodes:
cockroach cert create-node \
localhost \
$(hostname) \
--ca-cert=/home/ec2-user/certs/ca.cert \
--ca-key=/home/ec2-user/certs/ca.key \
--cert=/home/ec2-user/certs/node.cert \
--key=/home/ec2-user/certs/node.key