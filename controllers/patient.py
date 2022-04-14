from flask import Flask
from flask_restful import Resource, Api, request
from pprint import pprint
import json

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.patient as pat



class Patient(Resource):
	
	def __init__(self):
		pass

	# get patient list
	def get(self):
		patient_list = []
		patients = pat.view_patients()
		for patient in patients:
			patient_list.append(patient)
		return patient_list


	def to_form_fields(self):
		# wrapper for form fields of model
		first_name = request.form.get('first_name')
		middle_name = request.form.get('middle_name')
		last_name = request.form.get('last_name')	
		ssn = request.form.get('ssn')
		next_of_kin = request.form.get('next_of_kin')
		home_phone = request.form.get('home_phone')
		work_phone = request.form.get('work_phone')
		symptoms = request.form.get("idk")
		health_insurance = request.form.get("health_insurance")
		vaccination = request.form.get("vaccination")
		vaccination_date = request.form.get("vaccination_date")
		drugs_alcohol = request.form.get("drugs_alchohol")
		sexually_active = request.form.get("sexually_active")
		allergies = request.form.get("allergies")
		blood_type = request.form.get("blood_type")
		notes = request.form.get("notes")
		date_of_birth = request.form.get("date_of_birth")
		height = request.form.get('height')
		weight = request.form.get('weight')
		

		# create patient in database
		dict_input = {
        	"ssn": ssn,
        	"first_name": first_name,
        	"middle_name": middle_name,
        	"last_name": last_name,
        	"date_of_birth": date_of_birth,
        	"height": height,
        	"weight": weight,
        	"next_of_kin": next_of_kin,
        	"home_phone": home_phone,
        	"work_phone": work_phone,
        	"symptoms": symptoms,
        	"health_insurance": health_insurance,
        	"vaccination": vaccination,
        	"vaccination_date": vaccination_date,
        	"drugs_alchohol": drugs_alcohol,
        	"sexually_active": sexually_active,
        	"allergies": allergies,
        	"blood_type": blood_type,
        	"notes": notes
    	}

		return dict_input
		

	def post(self):
		if request.method == 'POST':
			data = json.loads(request.data)
			pprint(data)
			#capture_fields = self.to_form_fields()
			#pprint(capture_fields)
			result = pat.create_patient(data)

			# check if creating patient worked
			if result:
				return {
					"message": "created patient"
				}

			return {
				"error": "Could not create patient"
			}
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab patient id	
		patient_id = request.args.get('patient', default=1, type=int)
		# delete patient using db repo  
		result = pat.delete_patient(patient_id)
		if result:
			return { "message": "deleted patient" }
		# if result is not true
		return {"message": "Could not delete patient"}


class ViewPatient(Resource):
	
	def get(self):
		# view medications prescribed to patient	
		patient_id = request.args.get('patient', default=1, type=int)
		patient = pat.view_patient_by_id(patient_id)
		return patient
	
		


# prescribe medication to patient
class PrescribeMedicationToPatient(Resource):
	
	def __init__(self):
		pass

	def get(self):
		# view medications prescribed to patient
	
		return {
			"patients": patient_list
		}

	def post(self):
		if request.method == 'POST':
			medication_id = request.args.get('medication', default=1, type=int)	
			intake_id = request.args.get('intake_patient', default=1, type=int)

			# check if creating patient worked
			if result:
				return {
					"message": "created patient"
				}

			return {
				"error": "Could not create patient"
			}
		else:
			return {
				"error": "Not a post request"
			}
