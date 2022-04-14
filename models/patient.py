"""
	Equivalent models component of an MVC
"""

class Patient:

	def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
		self.allergies = attribute_dict["allergies"]	
		self.blood_type = attribute_dict["blood_type"]	
		self.date_of_birth = attribute_dict["date_of_birth"]	
		self.drugs_alchohol = attribute_dict["drugs_alchohol"]	
		self.first_name = attribute_dict["first_name"]	
		self.health_insurance = attribute_dict["health_insurance"]	
		self.height = attribute_dict["height"]	
		self.home_phone = attribute_dict["home_phone"]	
		self.last_name = attribute_dict["last_name"]
		self.middle_name = attribute_dict["middle_name"]	
		self.next_of_kin = attribute_dict["next_of_kin"]
		self.ssn = attribute_dict["ssn"]	
		self.vaccination = attribute_dict["vaccination"]
		self.vaccination_date = attribute_dict["vaccination_date"]
		self.sexually_active = attribute_dict["sexually_active"]
		self.weight = attribute_dict["weight"]
		self.work_phone = attribute_dict["work_phone"]

	# example methods
	def check_dob(self):
		pass

	
	def check_symptoms(self):
		pass

	def test_print(self):
		print("============================")	
		print("SSN: {}".format(self.ssn))
		print("First Name: {}".format(self.first_name))
		print("Middle Name: {}".format(self.middle_name))
		print("Last Name: {}".format(self.last_name))	
		print("============================")
