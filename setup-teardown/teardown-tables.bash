#!/bin/bash

cd $(dirname $0)

../runsql < sql/DropTables.sql
