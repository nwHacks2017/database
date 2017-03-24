#!/bin/bash

cd $(dirname $0)
cd sql/

cockroach sql < DbUsers.sql

cockroach sql < Patient.sql
cockroach sql < Healthcare.sql
cockroach sql < PatientHealthcare.sql
cockroach sql < EmergencyContact.sql
