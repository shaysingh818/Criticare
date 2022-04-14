from flask import Flask
from flask_restful import Resource, Api, request
from pprint import pprint
from datetime import date
import json

# go to desired directory
import sys
sys.path.append("../")

import db_repo.intake as pi
import db_repo.medication as med
import db_repo.medical_condition as cond
import db_repo.procedure as proc
import db_repo.employee as emp

class Intake(Resource):

	def __init__(self):
		pass

	# get intake patients
	def get(self):
		intake_patient_list = []
		intake_patients = pi.view_intake_patients()
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return intake_patient_list

	# input fields into form
	def to_form_fields(self, request):	
		ambulance = request.form.get('ambulance')
		blood_pressure = request.form.get('blood_pressure')	
		notes = request.form.get('notes')
		patient_id = request.args.get('patient', default=1, type=int)

		# create patient in database
		dict_input = {	
			"patient_id": patient_id,
			"blood_pressure": blood_pressure,	
			"notes": notes,
			"date_posted": date.today(),
		}

		return dict_input

	# update patient notes
	def put(self):	
		intake_patient_id = request.args.get('patient', default=1, type=int)		
		notes = request.form.get('notes')
		result = pi.update_patient_notes(notes, intake_patient_id)
		
		if result:
			return {
				"message": "created intake patient"
			}
		else:
			return {
				"error": "Could not update patient notes"
			}
		
	# create intake patient
	def post(self):
		if request.method == 'POST':
			data = json.loads(request.data)
			print("all data: ")
			pprint(data)	
			result = pi.create_intake_patient(data)
			if result:
				return {
					"message": "created intake patient"
				}

			return {
				"error": "Could not create patient"
			}
		else:
			return {
				"error": "Not a post request"
			}



class PrescribeMedication(Resource):

	def __init__(self):
		pass

	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		intake_patient_list = []
		intake_patients = med.view_intake_medications(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_medications": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields
			data = json.loads(request.data)
			result = pi.prescribe_medication_to_patient(data["patient_id"], data["medication_id"] )
			# check if creating patient worked
			if result:
				return {
					"message": "prescribed medication to patient"
				}

			return {
				"error": "Could not assign medication to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}




class AssignPatientProcedure(Resource):

	def __init__(self):
		pass

	# view patient procedures
	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		intake_patient_list = []
		intake_patients = proc.view_intake_procedures(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_procedures": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields
			data = json.loads(request.data)
			pprint(data)
			result = pi.assign_procedure_to_patient(data["intake_id"], data["procedure_id"] )
			# check if creating patient worked
			if result:
				return {
					"message": "assigned procedure to patient"
				}

			return {
				"error": "Could not assign procedure to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}


# diagnose patient with medical condition
class DiagnosePatient(Resource):

	def __init__(self):
		pass

	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)
		intake_patient_list = []
		intake_patients = cond.view_intake_conditions(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_conditions": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields	
			data = json.loads(request.data)
			result = pi.diagnose_condition(data["patient_id"], data["condition_id"] )

			# check if creating patient worked
			if result:
				return {
					"message": "assigned condition to patient"
				}

			return {
				"error": "Could not assign condition to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}



class AssignStaffToPatient(Resource):

	def __init__(self):
		pass

	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		intake_patient_list = []
		intake_patients = emp.view_patient_staff(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_staff": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields
			intake_patient_id = request.args.get('patient', default=1, type=int)	
			employee_id = request.form.get('employee_id')
			result = pi.assign_staff_to_patient(intake_patient_id, employee_id)

			# check if creating patient worked
			if result:
				return {
					"message": "assigned staff to patient"
				}

			return {
				"error": "Could not assign staff to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}

	# delete method (Mike F )
	def delete(self):
		# grab intake patient id	
		intake_patient_id = request.args.get('intake patient', default=1, type=int)
		# delete intake patient using db repo  
		result = pi.delete_intake_patient(intake_patient_id)
		if result:
			return { "message": "deleted intake patient" }
		# if result is not true
		return {"message": "Could not delete intake patient"}



class GeneratePatientBill(Resource):

	def __init__(self):
		pass

	def total_medication_cost(self, intake_id) -> int:
		# view patients medications from intake
		result = med.view_intake_medications(intake_id)
		# calculate total cost of medication
		total_cost = 0
		for re in result:
			med_id = re["medication_id"]
			medication = med.view_medication_by_id(med_id)
			pprint(medication)
			total_cost += medication["price"]

		return total_cost


	def total_procedure_cost(self, intake_id) -> int:
		# view pateient's procedures from intake
		result = proc.view_intake_procedures(intake_id)
		# calculate total cost of procedures
		total_cost = 0
		for re in result:
			procedure_id = re["procedure_id"]
			procedure = proc.view_procedure_by_id(procedure_id)
			pprint(procedure)
			total_cost += procedure["cost"]

		return total_cost


	# view patient procedures
	def get(self):	
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		med_cost = self.total_medication_cost(intake_patient_id)
		procedure_cost = self.total_procedure_cost(intake_patient_id)

		return {
			"medications_cost": med_cost,
			"procedures_cost": procedure_cost,
			"overnight_charge": 60.00
		}





