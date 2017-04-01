#!/bin/bash
#
# This Bash script removes all the tables created by the script
# setup-database.bash.

cd $(dirname $0)

../runsql < sql-teardown/DropTables.sql
