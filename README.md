# Luminescence: Lifeband Database (nwhacks 2017)


[![Build Status](https://travis-ci.org/nwHacks2017/database.svg?branch=master)](https://travis-ci.org/nwHacks2017/database)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/nwHacks2017/database/blob/master/LICENCE)

CockroachDB triple-node database for storing medical patient information.

This repository contains the setup, configuration, and scripts to automate operation and usage of the database for the Lifeband project.

## Setup

Install [CockroachDB](https://www.cockroachlabs.com/).

Create encryption certificates prior to startup for secure access to the database:
```
./setup-teardown/setup-certs.bash
```

Start up the 3 database nodes on ports 26257, 26258, and 26259:
```
./start-stop/start-nodes.bash
```

Set up the database users and tables, and initialize some mock data:
```
./setup-teardown/setup-database.bash
./setup-teardown/create-mock-data.bash
```

## Usage

To open the database shell and execute CockroachDB-compliant SQL commands (using the generated certificates), run:
```
./runsql
```

You can also pass in the name of a SQL file to execute - for example:
```
$ echo "SHOW USERS;" > test.sql
$ ./runsql test.sql
0 rows
username
```

To connect the database to an application, use:
* The user `janitor_dev` with the SSL cert `~/cockroach/certs/janitor_dev.cert` and the SSL key `~/cockroach/certs/janitor_dev.key` (for the development environment), or
* The user `janitor` with the SSL cert `~/cockroach/certs/janitor.cert` and the SSL key `~/cockroach/certs/janitor.key` (for the production environment)

## Teardown

If you want to remove the tables, make sure the nodes are running and execute:
```
./setup-teardown/teardown-tables.bash
```

When you want to shut down the nodes, run:
```
./start-stop/stop-nodes.bash
```

If you want to permanently remove the nodes, storage, and certs, make sure the nodes are not running and execute:
```
./setup-teardown/teardown-nodes-and-certs.bash
```
