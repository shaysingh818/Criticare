import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models


# Keep fields in array so we can populate employee_dict
PERMISSION_FIELDS = [
	"permission_id",
    "name",
]


INSERT_PERMISSION_QUERY = "INSERT INTO PERMISSION (name) values(?);"
VIEW_PERMISSION_QUERY = "SELECT * FROM PERMISSION;"; 
DELETE_PERMISSION_QUERY = "DELETE  FROM PERMISSION where permission_id=?"; 
DELETE_ALL_PERMISSION_QUERY = "DELETE  FROM PERMISSION;";



# Create permission
def create_permission(permission_fields: dict) -> bool:
	"""
		Since there's alot of fields. employee_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in permission_fields:
		values.append(permission_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_PERMISSION_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating permission: {}".format(e))
		db.rollback()

	db.close()
	return result



def view_permissions():
	permissions = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_PERMISSION_QUERY)
		for i in cur:
			# render row entry into employee class model
			temp_dict = {}	
			count = 0 
			for field in PERMISSION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			permissions.append(temp_dict)	
	except Exception as e:
		print("Error in viewing permissions: {}".format(e))
		db.rollback()
	db.close()

	return permissions


def delete_permission(permission_id):
	result = False
	db = sqlite3.connect("data/criticare.db")

	try:
		print("permission ID: ", permission_id)
		cur = db.cursor()
		cur.execute(DELETE_PERMISSION_QUERY, (permission_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting permission: {}".format(e))
		db.rollback()

	db.close()

	return result


def delete_all_permissions():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_PERMISSION_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting permission: {}".format(e))
		db.rollback()

	db.close()

	return result

 
