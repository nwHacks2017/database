#!/bin/bash

cd $(dirname $0)

../runsql < sql-mock-data/Healthcare.sql
../runsql < sql-mock-data/Patient.sql
../runsql < sql-mock-data/EmergencyContact.sql
