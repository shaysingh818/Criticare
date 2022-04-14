import unittest
import procedure as pi
from datetime import date

class TestCriticareProcedureMethods(unittest.TestCase):

	def test_create_procedure(self):
		
		# dictionary as input
		dict_input = {	
			"patient_id": 1, 
			"room_id": 1, 
			"cost": 180, 
			"notes": "Singh is cool",
            "name": "vasectomy"
		}

		result = pi.create_procedure(dict_input)
		if result:
			print("# PASSED CREATE procedure: ")


	def test_view_procedures(self):	
		# retrieve procedures
		procedures = pi.view_procedures()
		for procedure in procedures:
			print(procedure.test_print())


	def test_delete_procedure(self):	
		# retrieve procedures
		test_procedure_id = 2
		result = pi.delete_procedure(test_procedure_id)	
		if result:
			print("# PASSED DELETE procedure BY ID: ")
		else:	
			print("# FAILED DELETE procedure BY ID: ")
		
		
	def test_delete_all_procedures(self):	
		# retrieve procedures	
		result = pi.delete_all_procedures()	
		if result:
			print("# PASSED DELETE ALL procedureS: ")
		else:	
			print("# FAILED DELETE ALL procedureS: ")


if __name__ == '__main__':
    unittest.main()
