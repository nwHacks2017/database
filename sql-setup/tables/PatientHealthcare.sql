CREATE TABLE NWHACKS.patient_healthcare (
	id varchar(255) PRIMARY KEY,
	pid varchar(255) REFERENCES NWHACKS.patients(id),
	hid varchar(255) REFERENCES NWHACKS.healthcare(id),
	expiry_date date 
) 