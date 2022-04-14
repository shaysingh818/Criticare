import unittest
import intake as pi
import patient as pat
from datetime import date

class TestCriticareIntakeMethods(unittest.TestCase):

	def test_patient_intake(self):
		# create a dummy paitient
		dict_input = {
            "ssn": 000000,
            "first_name": "singh",
            "middle_name": "test",
            "last_name": "shay",
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

		# Intake the patient
		patient_test_id = 1

		dict_input = {
			"patient_id": patient_test_id, 
			"blood_pressure": 180, 
			"notes": "Singh is cool",
			"admitted": True, 
            "date_created": date.today()
		}

		result = pi.create_intake_patient(dict_input)
		if result:
			print("# PASSED CREATE intake_patient: ")

        # Nurse Checks Patient Vitals
        
		



		


if __name__ == '__main__':
    unittest.main()
