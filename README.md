# Luminescence: Lifeband Database (nwhacks 2017)

CockroachDB triple-node database for storing medical patient information.

This repository contains the setup, configuration, and scripts to automate operation and usage of the database for the Lifeband project.

## Setup

Install [CockroachDB](https://www.cockroachlabs.com/).

Create encryption certificates for secure access to the database:
```
./setup/certs.bash
```

Start up the 3 database nodes on ports 26257, 26258, and 26259:
```
./start-stop/start-nodes.bash
```

## Usage

To open the database shell and execute CockroachDB-compliant SQL commands (using the generated certificates), run:
```
./runsql
```
