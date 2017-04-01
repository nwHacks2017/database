#!/bin/bash
#
# This Bash script adds mock patient data to the CockroachDB database.

cd $(dirname $0)

../runsql < sql-mock-data/Healthcare.sql
../runsql < sql-mock-data/Patient.sql
../runsql < sql-mock-data/EmergencyContact.sql
