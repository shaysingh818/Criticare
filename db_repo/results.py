import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models

# Keep fields in array so we can populate intake_dict
RESULT_FIELDS =  [
	"result_id",	
    "notes",
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_RESULT_QUERY = "INSERT INTO result (notes) values(?);"
VIEW_RESULTS_QUERY = "SELECT * FROM result;"; 
DELETE_RESULT_QUERY = "DELETE FROM result where result_id=?"; 
DELETE_ALL_RESULTS_QUERY = "DELETE  FROM result;"; 


# Create Patient
def create_result(result_fields: dict) -> bool:
	"""
		Since there's alot of fields. result_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	db = sqlite3.connect("data/criticare.db")
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in result_fields:
		values.append(result_fields[val])

	# convert to tuple
	values = tuple(values)
	# bind values, by automatically appending dict vals to tuple
	try:
		cur = db.cursor()
		cur.execute(INSERT_RESULT_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating result: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_results():
	results = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_RESULTS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in RESULT_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			results.append(temp_dict)
            
			#result = models.IntakePatient(temp_dict)
			#results.append(patient)
	
	except Exception as e:
		print("Error in viewing results: {}".format(e))
		db.rollback()
	db.close()

	return results


def delete_result(result_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("result ID: ", result_id)
		cur = db.cursor()
		cur.execute(DELETE_RESULT_QUERY, (result_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_results():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_RESULTS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting results: {}".format(e))
		db.rollback()

	db.close()

	return result
