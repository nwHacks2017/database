#!/bin/bash

cd $(dirname $0)

../runsql < sql/DbUsers.sql

../runsql < sql/Patient.sql
../runsql < sql/Healthcare.sql
../runsql < sql/PatientHealthcare.sql
../runsql < sql/EmergencyContact.sql
