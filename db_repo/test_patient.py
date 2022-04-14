import unittest
import patient as pat
from pprint import pprint
from datetime import date

class TestCriticarePatientMethods(unittest.TestCase):

	def test_create_patient(self):
		
		# dictionary as input
		dict_input = {
			"ssn": 3244102, 
			"first_name": "b", 
			"middle_name": "test", 
			"last_name": "bernard",
			"date_of_birth": "05/12/1998", 
			"height": "5 6",
			"weight": "155",
			"next_of_kin": "usha singh",
			"home_phone": "6306999717",	 
			"work_phone": "6306999717", 
			"symptoms": "idk", 
			"health_insurance": "etna", 
			"vaccination": True, 
			"vaccination_date": date.today(), 
			"drugs_alchohol": True, 
			"sexually_active": True, 
			"allergies": False, 
			"blood_type": "O", 
			"notes": "idk"
		}

		result = pat.create_patient(dict_input)
		if result:
			print("# PASSED CREATE PATIENT: ")


	def test_view_patients(self):	
		# retrieve patients
		patients = pat.view_patients()
		for patient in patients:
			pprint(patient)

	
	def test_delete_patient(self):	
		# retrieve patients
		test_patient_id = 2
		result = pat.delete_patient(test_patient_id)	
		if result:
			print("# PASSED DELETE PATIENT BY ID: ")
		else:	
			print("# FAILED DELETE PATIENT BY ID: ")
		
		
	def test_delete_all_patients(self):	
		# retrieve patients	
		result = pat.delete_all_patients()	
		if result:
			print("# PASSED DELETE ALL PATIENTS: ")
		else:	
			print("# FAILED DELETE ALL PATIENTS: ")



if __name__ == '__main__':
    unittest.main()
