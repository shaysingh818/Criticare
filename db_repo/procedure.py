import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
#import models

# Keep fields in array so we can populate intake_dict
PROCEDURE_FIELDS = [
	"procedure_id",
	"room_id",	
	"cost",
    "notes",	
    "name"
]

INTAKE_PROCEDURE_FIELDS = [
	"patient_intake_id",
    "procedure_id"
]

# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_PROCEDURE_QUERY = "INSERT INTO PROCEDURE (room_id, cost, notes, name) values (?,?,?,?);"
VIEW_PROCEDURES_QUERY = "SELECT * FROM PROCEDURE;"; 
VIEW_PROCEDURE_QUERY = "SELECT * FROM PROCEDURE WHERE procedure_id=?;"; 
DELETE_PROCEDURE_QUERY = "DELETE FROM PROCEDURE where procedure_id=?"; 
DELETE_ALL_PROCEDURES_QUERY = "DELETE  FROM PROCEDURE;"; 

VIEW_INTAKE_PROCEDURES_QUERY = "SELECT * FROM INTAKE_PATIENT_PROCEDURE where patient_intake_id=?"

# Create Patient
def create_procedure(procedure_fields: dict) -> bool:
	"""
		Since there's alot of fields. procedure_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	last_insert_id = None
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in procedure_fields:
		values.append(procedure_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_PROCEDURE_QUERY, values)
		last_insert_id = cur.lastrowid 
		db.commit()
	except Exception as e:
		print("Error in creating procedure: {}".format(e))
		db.rollback()

	db.close()
	return last_insert_id


def view_procedures():
	procedures = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_PROCEDURES_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in PROCEDURE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			procedures.append(temp_dict)
	
	except Exception as e:
		print("Error in viewing intake patient: {}".format(e))
		db.rollback()
	db.close()

	return procedures



def view_procedure_by_id(procedure_id):
	temp_dict = {}
	db = sqlite3.connect("data/criticare.db")	
	try:
		cur = db.cursor()
		cur.execute(VIEW_PROCEDURE_QUERY, (procedure_id,))
		for i in cur:
			count = 0
			for field in PROCEDURE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
		db.commit()
	except Exception as e:
		print("Error in deleting patient: {}".format(e))
		db.rollback()

	db.close()
	return temp_dict


def delete_procedure(procedure_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("INTAKE PATIENT ID: ", procedure_id)
		cur = db.cursor()
		cur.execute(DELETE_PROCEDURE_QUERY, (procedure_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_procedures():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_PROCEDURES_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result



def view_intake_procedures(intake_patient_id):	
	# other format
	intake_patients = [] 	
	values = (intake_patient_id,)
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_INTAKE_PROCEDURES_QUERY, values)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			# generate temp dict
			for field in INTAKE_PROCEDURE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			intake_patients.append(temp_dict)
            
	except Exception as e:
		print("Error in viewing patient procedures: {}".format(e))
		db.rollback()
	db.close()

	return intake_patients
        
