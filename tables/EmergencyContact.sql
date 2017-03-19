CREATE TABLE NWHACKS.emergency_contacts (
	id varchar(255) PRIMARY KEY,
	pid varchar(255) REFERENCES NWHACKS.patients(id),
	name varchar(255),
	phone varchar(40)
) 