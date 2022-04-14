from flask import Flask
from flask_restful import Resource, Api, request
import json

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.medical_condition as me


class MedicalCondtion(Resource):

	def __init__(self):
		pass
	
	# get medical conditions list
	def get(self):
		conditions_list = []
		results = me.view_conditions()
		for result in results:
		  conditions_list.append(result)

		return conditions_list


	def to_form_fields(self):
		# capturing from postman
		name = request.form.get('name')
		code  = request.form.get('code')


		# create employee in database
		dict_input = {
			"name": name,
			"code": code
		} 


		return dict_input

	def post(self):
		if request.method == 'POST':	
			data = json.loads(request.data)
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = me.create_medical_condition(data)
			if result:
				print("# PASSED CREATE RESULT: ")

			return {
				"message": "created medical condition for database"
			}
			return {
				"error": "Could not create medical condition"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab medical condition id	
		medical_condition_id = request.args.get('medidcal condition', default=1, type=int)
		# delete medical condition using db repo  
		result = me.delete_medical_condition(medical_condition_id)
		if result:
			return { "message": "deleted medical condition" }
		# if result is not true
		return {"message": "Could not delete medical condition"}
