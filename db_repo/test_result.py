import unittest
import procedure as pi
from datetime import date

class TestCriticareResultMethods(unittest.TestCase):

	def test_create_result(self):
		
		# dictionary as input
		dict_input = {
			"notes": "random shit", 
		}

		result = pi.create_result(dict_input)
		if result:
			print("# PASSED CREATE results: ")


	def test_view_results(self):	
		# retrieve procedures
		results = pi.view_results()
		for result in results:
			print(result.test_print())


	def test_delete_result(self):	
		# retrieve procedures
		test_result_id = 1
		result = pi.delete_result(test_result_id)	
		if result:
			print("# PASSED DELETE results: ")
		else:	
			print("# FAILED DELETE results: ")
		
		
	def test_delete_all_results(self):	
		# retrieve procedures	
		result = pi.delete_all_results()	
		if result:
			print("# PASSED DELETE ALL results: ")
		else:	
			print("# FAILED DELETE ALL results: ")


if __name__ == '__main__':
    unittest.main()
