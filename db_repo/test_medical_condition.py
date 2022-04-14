import unittest
import medical_condition as mc
from datetime import date
from pprint import pprint

class TestCriticareMedicalConditionMethods(unittest.TestCase):

	def test_create_medical_condition(self):
		
		# create a couple medical conditions
		test_input = [
			{
				"name": "Diabetes",
				"code": 366
			},
			{
				"name": "Hypertension",
				"code": 367
			},
			{
				"name": "Asthma",
				"code": 369
			}
		]

		# go through all tests and create medication in db
		insert_count = 0 
		for item in test_input:
			result = mc.create_medical_condition(item)
			if result:
				print("# PASSED CREATE medical_condition: ")
			else:	
				print("# FAILED DELETE medical_condition: ")
				
			insert_count += 1


	def test_view_medical_conditions(self):	
		# retrieve medical_conditions
		medical_conditions = mc.view_medical_conditions()
		for item in medical_conditions:
			pprint(item)


	def test_delete_medical_condition(self):	
		# retrieve medical_conditions
		test_medical_condition_id = 2
		result = mc.delete_medical_condition(test_medical_condition_id)	
		if result:
			print("# PASSED DELETE medical_condition BY ID: ")
		else:	
			print("# FAILED DELETE medical_condition BY ID: ")
		
		
	def test_delete_all_medical_conditions(self):	
		# retrieve medical_conditions	
		result = mc.delete_all_medical_conditions()	
		if result:
			print("# PASSED DELETE ALL medical_conditionS: ")
		else:	
			print("# FAILED DELETE ALL medical_conditionS: ")


if __name__ == '__main__':
	unittest.main()
