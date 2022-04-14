import unittest
import employee as pat
from datetime import date
from pprint import pprint

class TestCriticareEmployeeMethods(unittest.TestCase):

	"""
	def test_create_employee(self):
		
		# dictionary as input
		dict_input = {
			"first_name": "Shalin", 
			"middle_name": "Indel", 
			"last_name": "Singh",
            "permission_id": 1 # 1 is doctor
		}

		result = pat.create_employee(dict_input)
		if result:
			print("# PASSED CREATE employee: ")
	"""

	def test_view_employees(self):	
		# retrieve employees
		employees = pat.view_employees()
		for employee in employees:
			pprint(employee)


	"""
	def test_delete_employee(self):	
		# retrieve employees
		test_employee_id = 2
		result = pat.delete_employee(test_employee_id)	
		if result:
			print("# PASSED DELETE employee BY ID: ")
		else:	
			print("# FAILED DELETE employee BY ID: ")
		
		
	def test_delete_all_employees(self):	
		# retrieve employees	
		result = pat.delete_all_employees()	
		if result:
			print("# PASSED DELETE ALL employeeS: ")
		else:	
			print("# FAILED DELETE ALL employeeS: ")
	"""

	def test_login_system(self):
		perm_id = pat.retrieve_permission_id("Shalin", "Singh")
		print("Permission Id", perm_id)
	


if __name__ == '__main__':
    unittest.main()
