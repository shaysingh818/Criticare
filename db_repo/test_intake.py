import unittest
import intake as pi
from datetime import date

class TestCriticareIntakeMethods(unittest.TestCase):

	def test_create_intake_patient(self):
		
		# dictionary as input
		dict_input = {
			"patient_id": 2, 
			"blood_pressure": 180, 
			"notes": "heart attack 2",
            "date_created": date.today()
		}

		result = pi.create_intake_patient(dict_input)
		if result:
			print("# PASSED CREATE intake_patient: ")


	def test_view_intake_patients(self):	
		# retrieve intake_patients
		intake_patients = pi.view_intake_patients()
		for intake_patient in intake_patients:
			print(intake_patient.test_print())

	
	def test_prescribe_medication(self):
		
		# dictionary as input
		dict_input = {
			"intake_id": 2, 
			"blood_pressure": 180, 
			"notes": "heart attack 2",
            "date_created": date.today()
		}

		result = pi.create_intake_patient(dict_input)
		if result:
			print("# PASSED CREATE intake_patient: ")


	"""
	def test_delete_intake_patient(self):	
		# retrieve intake_patients
		test_intake_patient_id = 2
		result = pi.delete_intake_patient(test_intake_patient_id)	
		if result:
			print("# PASSED DELETE intake_patient BY ID: ")
		else:	
			print("# FAILED DELETE intake_patient BY ID: ")
		
		
	def test_delete_all_intake_patients(self):	
		# retrieve intake_patients	
		result = pi.delete_all_intake_patients()	
		if result:
			print("# PASSED DELETE ALL intake_patientS: ")
		else:	
			print("# FAILED DELETE ALL intake_patientS: ")

	"""


if __name__ == '__main__':
    unittest.main()
