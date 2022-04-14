"""
	Equivalent models component of an MVC
"""

class Employee:

	def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.first_name = attribute_dict["first_name"]	
        self.last_name = attribute_dict["last_name"]	
        self.middle_name = attribute_dict["middle_name"]
        self.permission_id = attribute_dict["permission_id"]	
	
	# example methods
	def check_permission_id(self):
		pass

	def check_last_name(self):
		pass
		
	def test_print(self):
		print("============================")	
        print("EMPLOYEE: ")
		print("First Name: {}".format(self.first_name))
		print("Middle Name: {}".format(self.middle_name))
        print("Last Name: {}".format(self.middle_name))
		print("Permission_ID: {}".format(self.permission_id))	
		print("============================")