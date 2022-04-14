import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
#import models


# Keep fields in array so we can populate employee_dict
EMPLOYEE_FIELDS = [
	"employee_id", 
	"first_name",
	"middle_name",
	"last_name",
	"permission_id"
]

INTAKE_STAFF_FIELDS = [
	"patient_intake_id",
	"employee_id"
]

# QUERIES NEEDED FOR employeeS (FLUSH OUT)
INSERT_EMPLOYEE_QUERY = "INSERT INTO EMPLOYEE (first_name,middle_name,last_name,permission_id) values(?,?,?,?);"
VIEW_EMPLOYEE_QUERY = "SELECT * FROM EMPLOYEE;"; 
DELETE_EMPLOYEE_QUERY = "DELETE  FROM EMPLOYEE where employee_id=?"; 
DELETE_ALL_EMPLOYEE_QUERY = "DELETE  FROM EMPLOYEE;"; 
LOGIN_QUERY = "SELECT * FROM EMPLOYEE WHERE first_name=? AND last_name=?;"
PERMISSION_ID = "SELECT permission_id FROM EMPLOYEE WHERE first_name=? AND last_name=?;"

# view staff to work on patient
VIEW_STAFF_ASSIGNED_QUERY = "SELECT * FROM INTAKE_PATIENT_EMPLOYEE where patient_intake_id=?"


# Create employee
def create_employee(employee_fields: dict) -> bool:
	"""
		Since there's alot of fields. employee_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in employee_fields:
		values.append(employee_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_EMPLOYEE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating employee: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_employees():
	employees = []	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_EMPLOYEE_QUERY)
		for i in cur:
			# render row entry into employee class model
			temp_dict = {}	
			count = 0 
			for field in EMPLOYEE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			#employee = models.Employee(temp_dict)
			#employees.append(employee)
			employees.append(temp_dict)	
	except Exception as e:
		print("Error in viewing employee: {}".format(e))
		db.rollback()
	db.close()

	return employees

# delete employee from database
def delete_employee(employee_id):
	result = False
	db = sqlite3.connect("data/criticare.db")

	try:
		print("employee ID: ", employee_id)
		cur = db.cursor()
		cur.execute(DELETE_EMPLOYEE_QUERY, (employee_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting employee: {}".format(e))
		db.rollback()

	db.close()

	return result

	
# delete all employees from database
def delete_all_employees():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_EMPLOYEE_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting employee: {}".format(e))
		db.rollback()

	db.close()

	return result


def view_patient_staff(intake_patient_id):
	# other format
	staff = []
	values = (intake_patient_id,)
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_STAFF_ASSIGNED_QUERY, values)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}
			count = 0
			# generate temp dict
			for field in INTAKE_STAFF_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			staff.append(temp_dict)

	except Exception as e:
		print("Error in viewing patient medications: {}".format(e))
		db.rollback()
	db.close()

	return staff


# Admin/Employee Login Part
def employee_login(first_name, last_name):

	login_result = True	
	values = (first_name, last_name)
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(LOGIN_QUERY, values)
		if not cur.fetchone():
			login_result = False

	except Exception as e:
		print("Error in performing login query: {}".format(e))
		db.rollback()
	db.close()

	return login_result


def retrieve_permission_id(first_name, last_name):	
	db = sqlite3.connect("data/criticare.db")
	permission_id = 0 # default permission id
	if employee_login(first_name, last_name):
		try:
			cur = db.cursor()
			cur.execute(PERMISSION_ID, (first_name, last_name))
			value = cur.fetchone()
			permission_id = value[0]
		except Exception as e:
			print("Error in fetching permission id: {}".format(e))
			db.rollback()
		# return permission id
		return permission_id
	else:
		return "Could not fetch permission id"


