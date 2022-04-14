import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models

# Keep fields in array so we can populate patient_dict
PATIENT_FIELDS = [
	"patient_id",	
	"ssn", 
	"first_name",
	"middle_name",
	"last_name",
	"date_of_birth",
	"height",
	"weight",
	"next_of_kin",
	"home_phone",
	"work_phone",
	"health_insurance",	
	"vaccination",	
	"vaccination_date",
	"drugs_alchohol",	
	"sexually_active",	
	"allergies",	
	"blood_type",	
	"notes"
]


# QUERIES NEEDED FOR PATIENTS (FLUSH OUT)
INSERT_QUERY = "INSERT INTO PATIENT (ssn, first_name,middle_name,last_name,date_of_birth, height, weight, next_of_kin, home_phone, work_phone, symptoms, health_insurance, vaccination, vaccination_date, drugs_alchohol, sexually_active, allergies, blood_type, notes) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
VIEW_PATIENTS_QUERY = "SELECT * FROM PATIENT where patient_id NOT IN (SELECT patient_id FROM INTAKE_PATIENT);" 
VIEW_PATIENT_QUERY = "SELECT * FROM PATIENT WHERE patient_id=?;"; 
DELETE_ALL_PATIENTS_QUERY = "DELETE  FROM PATIENT;"; 


# Create Patient
def create_patient(patient_fields: dict) -> bool:
	pprint(patient_fields)
	"""
		Since there's alot of fields. patient_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in patient_fields:
		values.append(patient_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating patient: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_patients():
	result = []
	patients = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_PATIENTS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in PATIENT_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			result.append(temp_dict)

	
	except Exception as e:
		print("Error in viewing patient: {}".format(e))
		db.rollback()
	db.close()

	return result


def view_patient_by_id(patient_id):
	result = False
	temp_dict = {}
	db = sqlite3.connect("data/criticare.db")	
	try:
		cur = db.cursor()
		cur.execute(VIEW_PATIENT_QUERY, (patient_id,))
		for i in cur:
			count = 0
			for field in PATIENT_FIELDS:
				temp_dict[field] = i[count]
				count += 1
		db.commit()
	except Exception as e:
		print("Error in deleting patient: {}".format(e))
		db.rollback()

	db.close()
	return temp_dict


def delete_patient(patient_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	DELETE_PATIENT_QUERY = "DELETE FROM PATIENT WHERE patient_id=?;"; 
	
	try:
		print("PATIENT ID: ", patient_id)
		cur = db.cursor()
		cur.execute(DELETE_PATIENT_QUERY, (patient_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_patients():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_PATIENTS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting patient: {}".format(e))
		db.rollback()

	db.close()

	return result
        
	
