from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.results as re


class Result(Resource):
	
	def __init__(self):
		pass

	# get results list
	def get(self):
		result_list = []
		results = re.view_results()
		for result in results:
			result_list.append(result)

		return {
			"results": result_list
		}

	def to_form_fields(self):
		# capturing from postman
		notes = request.form.get('notes')

		# create employee in database
		dict_input = {
			"notes": notes,
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = re.create_result(capture_fields)
			if result:
				print("# PASSED CREATE RESULT: ")

				return {
					"message": "created test result for procedure"
				}
			return {
				"error": "Could not create patient"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}

	def delete(self):
		# grab result id	
		result_id = request.args.get('result', default=1, type=int)
		# delete result using db repo  
		result = re.delete_result(result_id)
		if result:
			return { "message": "deleted result" }
		# if result is not true
		return {"message": "Could not delete result"}
