
from flask import Flask
from flask_restful import Resource, Api, request
from pprint import pprint
import json

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.room as rom


class Room(Resource):

	def __init__(self):
		pass

	# get room list
	def get(self):
		room_list = []
		results = rom.view_rooms()
		for room in results:
			room_list.append(room)

		return room_list


	def to_form_fields(self):
		# capturing from postman
			
		number = request.form.get('number')
		cost = request.form.get('cost')

		# dictionary as input
		dict_input = {	
			"number": number,
			"cost": cost, 
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			data = json.loads(request.data)
			pprint(data)
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = rom.create_room(data)
			if result:
				print("# PASSED CREATE PROCEDURE: ")

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

	# delete method (Mike F )
	def delete(self):
		# grab room id	
		room_id = request.args.get('room', default=1, type=int)
		# delete room using db repo  
		result = rom.delete_room(room_id)
		if result:
			return { "message": "deleted room" }
		# if result is not true
		return {"message": "Could not delete room"}
