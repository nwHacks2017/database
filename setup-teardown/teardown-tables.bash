#!/bin/bash

cd $(dirname $0)

../runsql < sql-teardown/DropTables.sql
