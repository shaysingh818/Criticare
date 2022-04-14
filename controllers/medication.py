from flask import Flask
from flask_restful import Resource, Api, request
import json

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.medication as me


class Medication(Resource):
	
	def __init__(self):
		pass

	# get medication list
	def get(self):
		medication_list = []
		results = me.view_medications()
		for result in results:
		  medication_list.append(result)

		return medication_list


	def to_form_fields(self):
		# capturing from postman	
		name = request.form.get('name')
		code  = request.form.get('code')
		price = request.form.get('price')
  
		# create employee in database
		dict_input = {
			"name": name,
			"code": code, 
			"price": price
		} 
			

		return dict_input

	def post(self):
		if request.method == 'POST':	
			data = json.loads(request.data)
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = me.create_medication(data)
			if result:
				print("# PASSED CREATE RESULT: ")

			return {
				"message": "created medication for database"
			}
			return {
				"error": "Could not create medication"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab medication id	
		medication_id = request.args.get('medication', default=1, type=int)
		# delete medication using db repo  
		result = me.delete_medication(medication_id)
		if result:
			return { "message": "deleted medication" }
		# if result is not true
		return {"message": "Could not delete medication"}
