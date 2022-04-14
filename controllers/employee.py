from flask import Flask
from flask_restful import Resource, Api, request
import json
from pprint import pprint
# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.employee as emp


class Employee(Resource):

	def __init__(self):
		pass
	
	# view employees
	def get(self):
		employee_list = []
		employees = emp.view_employees()
		for employee in employees:
			employee_list.append(employee)

		return employee_list


	def to_form_fields(self, request):	
		# postman fields
		first_name = request.form.get('first_name')
		last_name = request.form.get('last_name')
		middle_name = request.form.get('middle_name')
		permission_id = request.form.get('permission_id')

		dict_input = {
			"first_name": first_name,
			"last_name": last_name,
			"middle_name": middle_name,
			"permission_id": permission_id
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capture fields	
			data = json.loads(request.data)
			capture_fields = self.to_form_fields(request)
			result = emp.create_employee(data)

			# check if creating patient worked
			if result:
				return {
					"message": "created employee"
				}

			return {
				"error": "could not create employee"
			}
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab employee id	
		employee_id = request.args.get('employee', default=1, type=int)
		# delete employee using db repo  
		result = emp.delete_employee(employee_id)
		if result:
			return { "message": "deleted employee" }
		# if result is not true
		return {"message": "Could not delete employee"}


	
class EmployeeLogin(Resource):

	def __init__(self):
		pass

	def post(self):
		if request.method == 'POST':
			# capture fields
			data = json.loads(request.data)
			pprint(data)
			result = emp.retrieve_permission_id(data["first_name"], data["last_name"] )
			if result:
				return {
					"permission_id": result
				}

			return {
				"permission_id": 0
			}
		else:
			return {
				"error": "Not a post request"
			}
