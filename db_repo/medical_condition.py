import sqlite3
from pprint import pprint
import models

# Keep fields in array so we can populate intake_dict
MEDICAL_CONDITION_FIELDS = [
	"condition_id",	
    "name",
    "code"
]


INTAKE_CONDITION_FIELDS = [
    "patient_intake_id",
    "medical_condition_id"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_MEDICAL_CONDITION_QUERY = "INSERT INTO MEDICAL_CONDITION (name, code) values(?,?);"
VIEW_MEDICAL_CONDITIONS_QUERY = "SELECT * FROM MEDICAL_CONDITION;"; 
DELETE_MEDICAL_CONDITION_QUERY = "DELETE FROM MEDICAL_CONDITION where condition_id=?"; 
DELETE_ALL_MEDICAL_CONDITIONS_QUERY = "DELETE  FROM MEDICAL_CONDITION;"; 

VIEW_CONDITIONS_QUERY = "SELECT * FROM INTAKE_PATIENT_MEDICAL_CONDITION where patient_intake_id=?"



# Create Patient
def create_medical_condition(medical_condition_fields: dict) -> bool:
	"""
		Since there's alot of fields. medical_condition_fields is a dictionary that can be
		passed to this method for testing. 
	"""
    # bind values, by automatically appending dict vals to tuple
	result = False
	values = []
	for val in medical_condition_fields:
		values.append(medical_condition_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_MEDICAL_CONDITION_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating medical_condition: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_conditions():
	result = []
	medical_conditions = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_MEDICAL_CONDITIONS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in MEDICAL_CONDITION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			result.append(temp_dict)
            
			#medical_condition = models.IntakePatient(temp_dict)
			#medical_conditions.append(patient)
	
	except Exception as e:
		print("Error in viewing medical_conditions: {}".format(e))
		db.rollback()
	db.close()

	return result


def delete_medical_condition(medical_condition_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("medical_condition ID: ", medical_condition_id)
		cur = db.cursor()
		cur.execute(DELETE_MEDICAL_CONDITION_QUERY, (medical_condition_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medical_condition: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_medical_conditions():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_MEDICAL_CONDITIONS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medical_conditions: {}".format(e))
		db.rollback()

	db.close()

	return result


def view_intake_conditions(intake_patient_id):
    # other format
    intake_patients = []
    values = (intake_patient_id,)
    # open db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(VIEW_CONDITIONS_QUERY, values)
        for i in cur:
            # render row entry into patient class model
            temp_dict = {}
            count = 0
            # generate temp dict
            for field in INTAKE_CONDITION_FIELDS:
                temp_dict[field] = i[count]
                count += 1
            pprint(temp_dict)
            intake_patients.append(temp_dict)

    except Exception as e:
        print("Error in viewing patient conditions: {}".format(e))
        db.rollback()
    db.close()

    return intake_patients


