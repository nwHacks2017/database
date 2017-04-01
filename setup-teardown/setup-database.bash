#!/bin/bash
#
# This Bash script generates the database users and tables for CockroachDB.

cd $(dirname $0)

../runsql < sql-setup/DbUsers.sql

../runsql < sql-setup/Patient.sql
../runsql < sql-setup/Healthcare.sql
../runsql < sql-setup/PatientHealthcare.sql
../runsql < sql-setup/EmergencyContact.sql
