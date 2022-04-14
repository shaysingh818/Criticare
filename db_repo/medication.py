import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
#import models

# Keep fields in array so we can populate intake_dict
MEDICATION_FIELDS = [
	"medication_id",	
	"name",
    "code",
    "price"
]


INTAKE_MEDICATION_FIELDS = [
	"patient_intake_id",
    "medication_id"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_MEDICATION_QUERY = "INSERT INTO MEDICATION (code, name, price) values(?,?,?);"
VIEW_MEDICATION_QUERY = "SELECT * FROM MEDICATION;"; 
VIEW_MEDICATION = "SELECT * FROM MEDICATION WHERE medication_id=?"; 
DELETE_MEDICATION_QUERY = "DELETE FROM MEDICATION where medication_id=?"; 
DELETE_ALL_MEDICATION_QUERY = "DELETE  FROM MEDICATION;"; 

VIEW_MEDICATIONS_QUERY = "SELECT * FROM INTAKE_PATIENT_MEDICATION where patient_intake_id=?"

# Create Patient
def create_medication(medication_fields: dict) -> bool:
	"""
		Since there's alot of fields. medication_fields is a dictionary that can be
		passed to this method for testing. 
	"""
    # bind values, by automatically appending dict vals to tuple
	result = False
	values = []
	for val in medication_fields:
		values.append(medication_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_MEDICATION_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating medication: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_medications():
	medications = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_MEDICATION_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in MEDICATION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			medications.append(temp_dict)
	
	except Exception as e:
		print("Error in viewing medications: {}".format(e))
		db.rollback()
	db.close()

	return medications



def view_medication_by_id(medication_id):
	result = False
	temp_dict = {}
	db = sqlite3.connect("data/criticare.db")	
	try:
		cur = db.cursor()
		cur.execute(VIEW_MEDICATION, (medication_id,))
		for i in cur:
			count = 0
			for field in MEDICATION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
		db.commit()
	except Exception as e:
		print("Error in deleting patient: {}".format(e))
		db.rollback()

	db.close()
	return temp_dict



def delete_medication(medication_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("medication ID: ", medication_id)
		cur = db.cursor()
		cur.execute(DELETE_MEDICATION_QUERY, (medication_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medication: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_medications():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_MEDICATIONS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medications: {}".format(e))
		db.rollback()

	db.close()

	return result



def view_intake_medications(intake_patient_id):	
	# other format
	intake_patients = [] 	
	values = (intake_patient_id,)
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_MEDICATIONS_QUERY, values)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			# generate temp dict
			for field in INTAKE_MEDICATION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			intake_patients.append(temp_dict)
            
	except Exception as e:
		print("Error in viewing patient medications: {}".format(e))
		db.rollback()
	db.close()

	return intake_patients



