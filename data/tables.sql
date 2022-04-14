
/** Patient data model for emergency room  */
CREATE TABLE PATIENT (
	patient_id INTEGER PRIMARY KEY, 
	ssn INT, 
	first_name VARCHAR(255), 
	middle_name VARCHAR(255), 
	last_name VARCHAR(255), 
	date_of_birth VARCHAR(255), 
	height VARCHAR(255), 
	weight VARCHAR(255),
	next_of_kin VARCHAR(255),
	home_phone VARCHAR(255),
	work_phone VARCHAR(255),
	symptoms VARCHAR(255),
	health_insurance VARCHAR(255),
	vaccination BOOLEAN, 
	vaccination_date DATETIME,
	drugs_alchohol BOOLEAN, 
	sexually_active BOOLEAN, 
	allergies BOOLEAN, 
	blood_type VARCHAR(255),
	notes VARCHAR(255)
);


/** Discharge information for patient intake/outtake  */
CREATE TABLE DISCHARGE (
	discharge_id INTEGER PRIMARY KEY,
	medication_cost INT, 
	procedure_cost INT, 
	overnight_rate INT, 
	doctor_notes VARCHAR(1000)
); 

/** Information stored with patient on intake  */
CREATE TABLE INTAKE_PATIENT (
	intake_id INTEGER PRIMARY KEY,
	patient_id INTEGER,
	blood_pressure INTEGER,
	notes VARCHAR(1000), 
	FOREIGN KEY(patient_id) REFERENCES PATIENT(patient_id)
); 


/** Permission Entity for Employees  */
CREATE TABLE PERMISSION (
	permission_id INTEGER PRIMARY KEY, 
	name VARCHAR(255) 
); 


/** Employee data model for emergency room  */
CREATE TABLE EMPLOYEE (	
	employee_id INTEGER PRIMARY KEY,
	first_name VARCHAR(255) UNIQUE, 
	middle_name VARCHAR(255), 
	last_name VARCHAR(255) UNIQUE, 
	permission_id INT
);


/** Room data model for emergency room procedures  */
CREATE TABLE ROOM (	
	room_id INTEGER PRIMARY KEY,
	room_number INT, 
	cost INT
);


/** Test results for a procedure  */
CREATE TABLE RESULT (	
	result_id INTEGER PRIMARY KEY,
	notes VARCHAR(255)
);
 
/** Procedure Entity for the emergency room  */
CREATE TABLE PROCEDURE (	
	procedure_id INTEGER PRIMARY KEY,
	room_id INT, 
	cost INT, 
	notes VARCHAR(1000),
	name VARCHAR(255), 
	FOREIGN KEY(room_id) REFERENCES ROOM(room_id) 
);



/** Medication data model for emergency room  */
CREATE TABLE MEDICATION (
	medication_id INTEGER PRIMARY KEY, 
	code INT, 
	name VARCHAR(255), 
	price INT
); 



/** Information stored with patient on intake  */
CREATE TABLE MEDICAL_CONDITION (
	condition_id INTEGER PRIMARY KEY, 
	name VARCHAR(255), 
	code INT
); 



/**
	ONE TO MANY RELATIONSHIPS: For patient intake model

	For the patient intake model, it has multiple entities associated with it. A patient can have multiple medication, procedures or staff assigned to them. Down below is the SQL code for creating the ONE TO MANY relationships. 
*/

/**
* Procedure -> Multiple Staff Assigned
* Relate procedure to multiple staff assigned
*/
CREATE TABLE PROCEDURE_STAFF (
	procedure_id INT,	
	employee_id INT,	
	FOREIGN KEY(procedure_id) REFERENCES PROCEDURE(procedure_id), 
	FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
); 

 

/**
* Intake Patient -> Multiple Staff assigned
*/
CREATE TABLE INTAKE_PATIENT_EMPLOYEE (
	patient_intake_id INT,	
	employee_id INT,	
	FOREIGN KEY(patient_intake_id) REFERENCES PATIENT_INTAKE(intake_id)
	FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);


 
/**
* Intake Patient -> Multiple Medications
*/
CREATE TABLE INTAKE_PATIENT_MEDICATION (
	patient_intake_id INT,	
	medication_id INT,	
	FOREIGN KEY(patient_intake_id) REFERENCES PATIENT_INTAKE(intake_id)
	FOREIGN KEY(medication_id) REFERENCES EMPLOYEE(employee_id)
); 



/**
* Intake Patient -> Multiple Staff assigned
*/
CREATE TABLE INTAKE_PATIENT_MEDICAL_CONDITION (
	patient_intake_id INT,	
	medical_condition_id INT,	
	FOREIGN KEY(patient_intake_id) REFERENCES PATIENT_INTAKE(intake_id)
	FOREIGN KEY(medical_condition_id) REFERENCES MEDICAL_CONDITION(condition_id)
); 


/**
* Intake Patient -> Multiple Staff assigned
*/
CREATE TABLE INTAKE_PATIENT_PROCEDURE (
	patient_intake_id INT,	
	procedure_id INT,	
	FOREIGN KEY(patient_intake_id) REFERENCES PATIENT_INTAKE(intake_id)
	FOREIGN KEY(procedure_id) REFERENCES PROCEDURE(procedure_id)
); 




