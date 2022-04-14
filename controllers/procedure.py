from flask import Flask
from flask_restful import Resource, Api, request
import json

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.procedure as proc


class Procedure(Resource):

	def __init__(self):
		pass

	# get procedure list
	def get(self):
		procedure_list = []
		results = proc.view_procedures()
		for procedure in results:
			procedure_list.append(procedure)

		return procedure_list


	def to_form_fields(self):
		# capturing from postman	
		room_id = request.form.get('room_id')
		cost = request.form.get('cost')
		name = request.form.get('name')
		notes = request.form.get('notes')

		# dictionary as input
		dict_input = {
			"room_id": room_id, 
			"cost": cost, 
			"notes": notes,
			"name": name
		}


		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			data = json.loads(request.data)
			# capturing from postman
			result_id = proc.create_procedure(data)

			return {
				"insert_id": result_id
			}
			return {
				"error": "Could not create patient"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab procedure id	
		procedure_id = request.args.get('procedure', default=1, type=int)
		# delete procedure using db repo  
		result = proc.delete_procedure(procedure_id)
		if result:
			return { "message": "deleted procedure" }
		# if result is not true
		return {"message": "Could not delete procedure"}


class ProcedureDetail(Resource):
	
	def get(self):
		# view medications prescribed to patient	
		procedure_id = request.args.get('procedure', default=1, type=int)
		procedure = proc.view_procedure_by_id(procedure_id)
		return procedure


