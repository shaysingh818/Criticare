import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models

# Keep fields in array so we can populate intake_dict
INTAKE_FIELDS = [
	"intake_id",	
	"patient_id", 
    "blood_pressure",	
    "notes"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_INTAKE_QUERY = "INSERT INTO INTAKE_PATIENT (patient_id, blood_pressure, notes) values(?,?,?);"
UPDATE_INTAKE_NOTES = "UPDATE INTAKE_PATIENT SET notes=? where intake_id=?"
VIEW_INTAKE_PATIENTS_QUERY = "SELECT * FROM INTAKE_PATIENT;"; 
DELETE_INTAKE_PATIENT_QUERY = "DELETE FROM INTAKE_PATIENT where intake_id=?"; 
DELETE_ALL_INTAKE_PATIENTS_QUERY = "DELETE  FROM INTAKE_PATIENT;"; 


# Example many to many query
PRESCRIBE_MEDICATION_QUERY = "INSERT INTO INTAKE_PATIENT_MEDICATION (patient_intake_id, medication_id) values(?,?);"

# Create procedure for patient
ASSIGN_PROCEDURE_QUERY = "INSERT INTO INTAKE_PATIENT_PROCEDURE (patient_intake_id, procedure_id) values(?,?);"

INTAKE_PATIENT_MEDICAL_CONDITION_QUERY = "INSERT INTO INTAKE_PATIENT_MEDICAL_CONDITION (patient_intake_id, medical_condition_id) values(?,?)";

# assign employee to patient
ASSIGN_STAFF_PATIENT_QUERY = "INSERT INTO INTAKE_PATIENT_EMPLOYEE (patient_intake_id, employee_id) values(?,?);"


# Create Patient
def create_intake_patient(intake_patient_fields: dict) -> bool:
	"""
		Since there's alot of fields. intake_patient_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	print("FIELDS :")
	pprint(intake_patient_fields)
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in intake_patient_fields:
		values.append(intake_patient_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_INTAKE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating intake patient: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_intake_patients():
	intake_patients = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_INTAKE_PATIENTS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			# generate temp dict
			for field in INTAKE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			intake_patients.append(temp_dict)
            
	
	except Exception as e:
		print("Error in viewing intake patient: {}".format(e))
		db.rollback()
	db.close()

	return intake_patients

# delete intake patient from database
def delete_intake_patient(intake_patient_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	DELETE_PATIENT_QUERY = "DELETE FROM INTAKE_PATIENT WHERE intake_id=?;"; 
	
	try:
		print("INTAKE PATIENT ID: ", intake_patient_id)
		cur = db.cursor()
		cur.execute(DELETE_INTAKE_PATIENT_QUERY, (intake_patient_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
# delete all intake patients from database
def delete_all_intake_patients():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_INTAKE_PATIENTS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result
    

# use case functions 
def prescribe_medication_to_patient(intake_patient_id, medication_id):	
	result = False
	# bind values, by automatically appending dict vals to tuple

	# convert to tuple
	values = (intake_patient_id, medication_id)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(PRESCRIBE_MEDICATION_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating intake-patient medication: {}".format(e))
		db.rollback()

	db.close()
	return result
	

def assign_procedure_to_patient(intake_patient_id, procedure_id):	
	result = False
	# bind values, by automatically appending dict vals to tuple

	# convert to tuple
	values = (intake_patient_id, procedure_id)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(ASSIGN_PROCEDURE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating intake-patient procedure: {}".format(e))
		db.rollback()

	db.close()
	return result


def diagnose_condition(patient_intake_id, medical_condition):
    result= False
    # bind values, by automatically appending dict vals to tuple

    # convert to tuple
    values = (patient_intake_id, medical_condition)

    # insert to db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(INTAKE_PATIENT_MEDICAL_CONDITION_QUERY, values)
        db.commit()
        result = True
    except Exception as e:
        print("Error in diagnosing patient: {}".format(e))
        db.rollback()

    db.close()
    return result


def assign_staff_to_patient(intake_patient_id, employee_id):
    result = False
    # bind values, by automatically appending dict vals to tuple

    # convert to tuple
    values = (intake_patient_id, employee_id)

    # insert to db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(ASSIGN_STAFF_PATIENT_QUERY, values)
        db.commit()
        result = True
    except Exception as e:
        print("Error in assigning staff to patient: {}".format(e))
        db.rollback()

    db.close()
    return result


	
# Update patient notes
def update_patient_notes(new_patient_note, intake_patient_id) -> bool:
	"""
		Since there's alot of fields. intake_patient_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	
	# convert to tuple
	values = (new_patient_note, intake_patient_id)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(UPDATE_INTAKE_NOTES, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in updating patient notes: {}".format(e))
		db.rollback()

	db.close()
	return result
